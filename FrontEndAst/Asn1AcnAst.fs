﻿module Asn1AcnAst

open System.Numerics
open Antlr.Runtime.Tree
open Antlr.Runtime
open System
open FsUtils
open CommonTypes






/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////// ACN PROPERTIES DEFINITION ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

type RelativePath = 
    | RelativePath of StringLoc list
with
    member this.AsString = 
        match this with  RelativePath p -> p |> Seq.StrJoin "."
    member this.location = 
        match this with  RelativePath p -> p |> List.map(fun z -> z.Location) |> List.head
    override this.ToString() = this.AsString

type AcnEndianness =
    | LittleEndianness
    | BigEndianness            

type AcnAligment = 
    | NextByte
    | NextWord
    | NextDWord

// present when property defintion
// this property is not part of the ACN type itself but part of the AcnChildInfo
type PresenceWhenBool  = 
    | PresenceWhenBool of RelativePath                         

type AcnPresentWhenConditionChoiceChild =
    | PresenceInt   of RelativePath*IntLoc
    | PresenceStr   of RelativePath*StringLoc

// Integer acn properties
type AcnIntSizeProperty =
    | Fixed                 of BigInteger
    | IntNullTerminated     of byte      //termination character when encoding is ASCII

type AcnIntEncoding =
    | PosInt
    | TwosComplement
    | IntAscii
    | BCD

type MappingFunction  = 
    | MappingFunction of StringLoc

type IntegerAcnProperties = {
    encodingProp    : AcnIntEncoding        option
    sizeProp        : AcnIntSizeProperty    option
    endiannessProp  : AcnEndianness         option
    mappingFunction : MappingFunction       option
}




// Real acn properties
type AcnRealEncoding =
    | IEEE754_32
    | IEEE754_64

type RealAcnProperties = {
    encodingProp    : AcnRealEncoding       option
    endiannessProp  : AcnEndianness         option
}

// String acn properties
type AcnStringSizeProperty =
    | StrExternalField   of RelativePath
    | StrNullTerminated  of byte      //termination character when encoding is ASCII

type AcnStringEncoding =
    | StrAscii

type StringAcnProperties = {
    encodingProp    : AcnStringEncoding     option
    sizeProp        : AcnStringSizeProperty option
}


type SizeableAcnProperties = {
    sizeProp        : RelativePath          option
}


type NullTypeAcnProperties = {
    encodingPattern     : StringLoc             option
}

type AcnBooleanEncoding =
    | TrueValue    of StringLoc    
    | FalseValue   of StringLoc

type BooleanAcnProperties = {
    encodingPattern     : AcnBooleanEncoding    option
}

type ChoiceAcnProperties = {
    enumDeterminant     : RelativePath              option
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////// ACN PARAMETERS DEFINITION ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

[<CustomEquality; NoComparison>]
type AcnParamType =
    | AcnPrmInteger    of SrcLoc
    | AcnPrmBoolean    of SrcLoc
    | AcnPrmNullType   of SrcLoc
    | AcnPrmRefType    of StringLoc*StringLoc
with
    override this.ToString() = 
        match this with
        | AcnPrmInteger   _         -> "INTEGER"
        | AcnPrmBoolean   _         -> "BOOLEAN"
        | AcnPrmNullType  _         -> "NULL"
        | AcnPrmRefType    (md,ts)  -> sprintf "%s.%s" md.Value ts.Value
    override x.Equals(yobj) =
        match yobj with
        | :? AcnParamType as other -> 
            match x, other with
            | AcnPrmInteger    _       , AcnPrmInteger    _         -> true
            | AcnPrmBoolean    _       , AcnPrmBoolean    _         -> true
            | AcnPrmNullType   _       , AcnPrmNullType   _         -> true
            | AcnPrmRefType    (md,ts) , AcnPrmRefType    (md2,ts2) -> md=md2 && ts=ts2
            | _                                                     -> false
        | _ -> false
    override x.GetHashCode() = 
        match x with
            | AcnPrmInteger    _       -> 1
            | AcnPrmBoolean    _       -> 2
            | AcnPrmNullType   _       -> 3
            | AcnPrmRefType    (md,ts) -> md.GetHashCode() ^^^ ts.GetHashCode()


 
type AcnParameter = {
    name        : string
    asn1Type    : AcnParamType
    loc         : SrcLoc
    id          : ReferenceToType
}
with 
    member this.c_name = ToC this.name
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////// ASN1 VALUES DEFINITION    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

type IntegerValue         = IntLoc
type RealValue            = DoubleLoc
type StringValue          = StringLoc
type BooleanValue         = BoolLoc
type BitStringValue       = StringLoc
type OctetStringValue     = list<ByteLoc>
type EnumValue            = StringLoc
type NullValue            = unit
type SeqOfValue           = list<Asn1Value>
and SeqValue              = list<NamedValue>
and ChValue               = NamedValue
and RefValue              = ((StringLoc*StringLoc)*Asn1Value)

and NamedValue = {
    name        : StringLoc
    Value       : Asn1Value
}
and Asn1Value = {
    kind : Asn1ValueKind
    loc  : SrcLoc
    id   : ReferenceToValue
}

and Asn1ValueKind =
    | IntegerValue          of IntegerValue    
    | RealValue             of RealValue       
    | StringValue           of StringValue     
    | BooleanValue          of BooleanValue    
    | BitStringValue        of BitStringValue  
    | OctetStringValue      of OctetStringValue
    | EnumValue             of EnumValue       
    | SeqOfValue            of SeqOfValue      
    | SeqValue              of SeqValue        
    | ChValue               of ChValue         
    | NullValue             of NullValue
    | RefValue              of RefValue   


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////// ASN1 CONSTRAINTS DEFINITION    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


type GenericConstraint<'v> =
    | UnionConstraint                   of GenericConstraint<'v>*GenericConstraint<'v>*bool //left,righ, virtual constraint
    | IntersectionConstraint            of GenericConstraint<'v>*GenericConstraint<'v>
    | AllExceptConstraint               of GenericConstraint<'v>
    | ExceptConstraint                  of GenericConstraint<'v>*GenericConstraint<'v>
    | RootConstraint                    of GenericConstraint<'v>
    | RootConstraint2                   of GenericConstraint<'v>*GenericConstraint<'v>
    | SingleValueConstraint             of 'v

type RangeTypeConstraint<'v1,'v2>  = 
    | RangeUnionConstraint               of RangeTypeConstraint<'v1,'v2>*RangeTypeConstraint<'v1,'v2>*bool //left,righ, virtual constraint
    | RangeIntersectionConstraint        of RangeTypeConstraint<'v1,'v2>*RangeTypeConstraint<'v1,'v2>
    | RangeAllExceptConstraint           of RangeTypeConstraint<'v1,'v2>
    | RangeExceptConstraint              of RangeTypeConstraint<'v1,'v2>*RangeTypeConstraint<'v1,'v2>
    | RangeRootConstraint                of RangeTypeConstraint<'v1,'v2>
    | RangeRootConstraint2               of RangeTypeConstraint<'v1,'v2>*RangeTypeConstraint<'v1,'v2>
    | RangeSingleValueConstraint         of 'v2
    | RangeContraint                     of ('v1) *('v1)*bool*bool    //min, max, InclusiveMin(=true), InclusiveMax(=true)
    | RangeContraint_val_MAX             of ('v1) *bool            //min, InclusiveMin(=true)
    | RangeContraint_MIN_val             of ('v1) *bool            //max, InclusiveMax(=true)

type IntegerTypeConstraint  = RangeTypeConstraint<BigInteger, BigInteger>
type PosIntTypeConstraint   = RangeTypeConstraint<UInt32, UInt32>
type CharTypeConstraint     = RangeTypeConstraint<char, string>
    
type RealTypeConstraint     = RangeTypeConstraint<double, double>


type SizableTypeConstraint<'v>  = 
    | SizeUnionConstraint               of SizableTypeConstraint<'v>*SizableTypeConstraint<'v>*bool //left,righ, virtual constraint
    | SizeIntersectionConstraint        of SizableTypeConstraint<'v>*SizableTypeConstraint<'v>
    | SizeAllExceptConstraint           of SizableTypeConstraint<'v>
    | SizeExceptConstraint              of SizableTypeConstraint<'v>*SizableTypeConstraint<'v>
    | SizeRootConstraint                of SizableTypeConstraint<'v>
    | SizeRootConstraint2               of SizableTypeConstraint<'v>*SizableTypeConstraint<'v>
    | SizeSingleValueConstraint         of 'v
    | SizeContraint                     of PosIntTypeConstraint               

type IA5StringConstraint = 
    | StrUnionConstraint               of IA5StringConstraint*IA5StringConstraint*bool //left,righ, virtual constraint
    | StrIntersectionConstraint        of IA5StringConstraint*IA5StringConstraint
    | StrAllExceptConstraint           of IA5StringConstraint
    | StrExceptConstraint              of IA5StringConstraint*IA5StringConstraint
    | StrRootConstraint                of IA5StringConstraint
    | StrRootConstraint2               of IA5StringConstraint*IA5StringConstraint
    | StrSingleValueConstraint         of string
    | StrSizeContraint                 of PosIntTypeConstraint               
    | AlphabetContraint                of CharTypeConstraint           

type OctetStringConstraint  =    SizableTypeConstraint<OctetStringValue*(ReferenceToValue*SrcLoc)>
type BitStringConstraint    =    SizableTypeConstraint<BitStringValue*(ReferenceToValue*SrcLoc)>
type BoolConstraint         =    GenericConstraint<bool>
type EnumConstraint         =    GenericConstraint<string>


type SequenceOfConstraint   =     SizableTypeConstraint<SeqOfValue>
type SequenceConstraint     =     GenericConstraint<SeqValue>
type ChoiceConstraint       =     GenericConstraint<ChValue>


type NamedItem = {
    Name:StringLoc
    c_name:string
    ada_name:string
    definitionValue : BigInteger          // the value in the header file
    
    // the value encoded by ACN. It can (a) the named item index (i.e. like uper), (b) The definition value, (c) The redefined value from acn properties
    acnEncodeValue  : BigInteger                
    Comments: string array
}

type Optional = {
    defaultValue        : Asn1Value option
    acnPresentWhen      : PresenceWhenBool option
}

type Asn1Optionality = 
    | AlwaysAbsent
    | AlwaysPresent
    | Optional          of Optional

type Asn1ChoiceOptionality = 
    | ChoiceAlwaysAbsent
    | ChoiceAlwaysPresent

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////// ACN ENCODING CLASSES    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

type IntEncodingClass =
    |Integer_uPER
    |PositiveInteger_ConstSize_8
    |PositiveInteger_ConstSize_big_endian_16
    |PositiveInteger_ConstSize_little_endian_16
    |PositiveInteger_ConstSize_big_endian_32
    |PositiveInteger_ConstSize_little_endian_32
    |PositiveInteger_ConstSize_big_endian_64
    |PositiveInteger_ConstSize_little_endian_64
    |PositiveInteger_ConstSize of BigInteger
    |TwosComplement_ConstSize_8
    |TwosComplement_ConstSize_big_endian_16
    |TwosComplement_ConstSize_little_endian_16
    |TwosComplement_ConstSize_big_endian_32
    |TwosComplement_ConstSize_little_endian_32
    |TwosComplement_ConstSize_big_endian_64
    |TwosComplement_ConstSize_little_endian_64
    |TwosComplement_ConstSize of BigInteger
    |ASCII_ConstSize of BigInteger
    |ASCII_VarSize_NullTerminated of byte
    |ASCII_UINT_ConstSize of BigInteger
    |ASCII_UINT_VarSize_NullTerminated of byte
    |BCD_ConstSize of BigInteger
    |BCD_VarSize_NullTerminated of byte


type RealEncodingClass =
    | Real_uPER
    | Real_IEEE754_32_big_endian
    | Real_IEEE754_64_big_endian
    | Real_IEEE754_32_little_endian
    | Real_IEEE754_64_little_endian

type StringAcnEncodingClass =
    | Acn_Enc_String_uPER                                   of BigInteger                          //char size in bits, as in uper 
    | Acn_Enc_String_uPER_Ascii                             of BigInteger                          //char size in bits, as in uper but with charset (0..255)
    | Acn_Enc_String_Ascii_Null_Teminated                   of BigInteger*byte                     //char size in bits, byte = the null character
    | Acn_Enc_String_Ascii_External_Field_Determinant       of BigInteger*RelativePath             //char size in bits, encode ascii, size is provided by an external length determinant
    | Acn_Enc_String_CharIndex_External_Field_Determinant   of BigInteger*RelativePath             //char size in bits, encode char index, size is provided by an external length determinant

type SizeableAcnEncodingClass =
    | SZ_EC_uPER
    | SZ_EC_ExternalField    of RelativePath

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////// FRONT END TYPE DEFINITIONS   /////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



type FE_TypeDefinitionKindInternal =
    | FEI_NewTypeDefinition                       //type
    | FEI_NewSubTypeDefinition of ReferenceToType    //subtype
    | FEI_Reference2RTL
    | FEI_Reference2OtherType of ReferenceToType
    override this.ToString() = 
        match this with
        | FEI_NewTypeDefinition                       -> "NewTypeDefinition"
        | FEI_NewSubTypeDefinition subId              -> sprintf "NewSubTypeDefinition %s" subId.AsString
        | FEI_Reference2RTL                           -> "FE_Reference2RTL"
        | FEI_Reference2OtherType otherId             -> sprintf "FE_Reference2OtherType %s" otherId.AsString





type FE_PrimitiveTypeDefinitionKind =
    | PrimitiveNewTypeDefinition                       //type
    | PrimitiveNewSubTypeDefinition of FE_PrimitiveTypeDefinition    //subtype
    | PrimitiveReference2RTL
    | PrimitiveReference2OtherType 
    override this.ToString() = 
        match this with
        | PrimitiveNewTypeDefinition            -> "NewTypeDefinition"
        | PrimitiveNewSubTypeDefinition   sub   -> sprintf "NewSubTypeDefinition %s.%s" sub.programUnit sub.typeName
        | PrimitiveReference2RTL                -> "FE_Reference2RTL"
        | PrimitiveReference2OtherType          -> "FE_Reference2OtherType" 

and FE_PrimitiveTypeDefinition = {
    typeName        : string            //e.g. MyInt, Asn1SccInt, Asn1SccUInt
    programUnit     : string            //the program unit where this type is defined
    kind            : FE_PrimitiveTypeDefinitionKind
}

type FE_NonPrimitiveTypeDefinitionKind<'SUBTYPE> =
    | NonPrimitiveNewTypeDefinition                       //type
    | NonPrimitiveNewSubTypeDefinition of 'SUBTYPE    //subtype
    | NonPrimitiveReference2OtherType 
    override this.ToString() = 
        match this with
        | NonPrimitiveNewTypeDefinition                       -> "NewTypeDefinition"
        | NonPrimitiveNewSubTypeDefinition subId              -> sprintf "NewSubTypeDefinition %s" (subId.ToString())
        | NonPrimitiveReference2OtherType                     -> "FE_Reference2OtherType"


type FE_StringTypeDefinition = {
    programUnit     : string            //the program unit where this type is defined
    typeName        : string            //e.g. MyInt, Asn1SccInt, Asn1SccUInt
    encoding_range  : string
    index           : string
    alpha_set       : string
    kind            : FE_NonPrimitiveTypeDefinitionKind<FE_StringTypeDefinition>
}

type FE_SizeableTypeDefinition = {
    programUnit     : string            //the program unit where this type is defined
    typeName        : string            //e.g. MyInt, Asn1SccInt, Asn1SccUInt
    index           : string
    array           : string
    length          : string
    kind            : FE_NonPrimitiveTypeDefinitionKind<FE_SizeableTypeDefinition>
}


type FE_SequenceTypeDefinition = {
    programUnit     : string            //the program unit where this type is defined
    typeName        : string            //e.g. MyInt, Asn1SccInt, Asn1SccUInt
    exist           : string
    kind            : FE_NonPrimitiveTypeDefinitionKind<FE_SequenceTypeDefinition>
}

type FE_ChoiceTypeDefinition = {
    programUnit     : string            //the program unit where this type is defined
    typeName        : string            //e.g. MyInt, Asn1SccInt, Asn1SccUInt
    index_range     : string
    selection       : string
    kind            : FE_NonPrimitiveTypeDefinitionKind<FE_ChoiceTypeDefinition>
}

type FE_EnumeratedTypeDefinition = {
    programUnit     : string            //the program unit where this type is defined
    typeName        : string            //e.g. MyInt, Asn1SccInt, Asn1SccUInt
    index_range     : string
    kind            : FE_NonPrimitiveTypeDefinitionKind<FE_EnumeratedTypeDefinition>
}



type FE_TypeDefinition = 
    | FE_PrimitiveTypeDefinition   of FE_PrimitiveTypeDefinition
    | FE_SequenceTypeDefinition    of FE_SequenceTypeDefinition
    | FE_StringTypeDefinition      of FE_StringTypeDefinition
    | FE_SizeableTypeDefinition    of FE_SizeableTypeDefinition
    | FE_ChoiceTypeDefinition      of FE_ChoiceTypeDefinition
    | FE_EnumeratedTypeDefinition  of FE_EnumeratedTypeDefinition

    with 
        member this.typeName = 
            match this with
            | FE_PrimitiveTypeDefinition  a    -> a.typeName
            | FE_SequenceTypeDefinition   a    -> a.typeName
            | FE_StringTypeDefinition     a    -> a.typeName
            | FE_SizeableTypeDefinition   a    -> a.typeName
            | FE_ChoiceTypeDefinition     a    -> a.typeName
            | FE_EnumeratedTypeDefinition a    -> a.typeName
        member this.programUnit = 
            match this with
            | FE_PrimitiveTypeDefinition  a    -> a.programUnit
            | FE_SequenceTypeDefinition   a    -> a.programUnit
            | FE_StringTypeDefinition     a    -> a.programUnit
            | FE_SizeableTypeDefinition   a    -> a.programUnit
            | FE_ChoiceTypeDefinition     a    -> a.programUnit
            | FE_EnumeratedTypeDefinition a    -> a.programUnit
        member this.kind = 
            match this with
            | FE_PrimitiveTypeDefinition  a    -> a.kind.ToString()
            | FE_SequenceTypeDefinition   a    -> a.kind.ToString()
            | FE_StringTypeDefinition     a    -> a.kind.ToString()
            | FE_SizeableTypeDefinition   a    -> a.kind.ToString()
            | FE_ChoiceTypeDefinition     a    -> a.kind.ToString()
            | FE_EnumeratedTypeDefinition a    -> a.kind.ToString()




/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////// ASN1 WITH ACN INFORMATION  DEFINITION    /////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


type uperRange<'a> =
    | Concrete      of 'a*'a    // [a, b]
    | NegInf        of 'a       // (-inf, b]
    | PosInf        of 'a       // [a, +inf)
    | Full                      // (-inf, +inf)



type Integer = {
    acnProperties       : IntegerAcnProperties
    cons                : IntegerTypeConstraint list
    withcons            : IntegerTypeConstraint list
    uperMaxSizeInBits   : BigInteger
    uperMinSizeInBits   : BigInteger
    uperRange           : uperRange<BigInteger>

    acnMaxSizeInBits    : BigInteger
    acnMinSizeInBits    : BigInteger
    acnEncodingClass    : IntEncodingClass
    isUnsigned          : bool
    typeDef             : Map<ProgrammingLanguage, FE_PrimitiveTypeDefinition>

}

type Real = {
    acnProperties       : RealAcnProperties
    cons                : RealTypeConstraint list
    withcons            : RealTypeConstraint list
    uperMaxSizeInBits   : BigInteger
    uperMinSizeInBits   : BigInteger
    uperRange           : uperRange<double>

    acnMaxSizeInBits    : BigInteger
    acnMinSizeInBits    : BigInteger
    acnEncodingClass    : RealEncodingClass

    typeDef             : Map<ProgrammingLanguage, FE_PrimitiveTypeDefinition>
}

type StringType = {
    acnProperties       : StringAcnProperties
    cons                : IA5StringConstraint list
    withcons            : IA5StringConstraint list

    minSize             : BigInteger
    maxSize             : BigInteger
    uperMaxSizeInBits   : BigInteger
    uperMinSizeInBits   : BigInteger
    uperCharSet         : char array

    acnMaxSizeInBits    : BigInteger
    acnMinSizeInBits    : BigInteger
    acnEncodingClass    : StringAcnEncodingClass
    isNumeric           : bool
    typeDef             : Map<ProgrammingLanguage, FE_StringTypeDefinition>

}


type OctetString = {
    acnProperties       : SizeableAcnProperties
    cons                : OctetStringConstraint list
    withcons            : OctetStringConstraint list
    minSize             : BigInteger
    maxSize             : BigInteger
    uperMaxSizeInBits   : BigInteger
    uperMinSizeInBits   : BigInteger

    acnMaxSizeInBits    : BigInteger
    acnMinSizeInBits    : BigInteger
    acnEncodingClass    : SizeableAcnEncodingClass
    typeDef             : Map<ProgrammingLanguage, FE_SizeableTypeDefinition>

}

type BitString = {
    acnProperties   : SizeableAcnProperties
    cons                : BitStringConstraint list
    withcons            : BitStringConstraint list
    minSize             : BigInteger
    maxSize             : BigInteger
    uperMaxSizeInBits   : BigInteger
    uperMinSizeInBits   : BigInteger

    acnMaxSizeInBits    : BigInteger
    acnMinSizeInBits    : BigInteger
    acnEncodingClass    : SizeableAcnEncodingClass
    typeDef             : Map<ProgrammingLanguage, FE_SizeableTypeDefinition>

}

type NullType = {
    acnProperties       : NullTypeAcnProperties
    uperMaxSizeInBits   : BigInteger
    uperMinSizeInBits   : BigInteger

    acnMaxSizeInBits    : BigInteger
    acnMinSizeInBits    : BigInteger
    typeDef             : Map<ProgrammingLanguage, FE_PrimitiveTypeDefinition>

}

type Boolean = {    
    acnProperties       : BooleanAcnProperties
    cons                : BoolConstraint list
    withcons            : BoolConstraint list
    uperMaxSizeInBits   : BigInteger
    uperMinSizeInBits   : BigInteger
    acnMaxSizeInBits    : BigInteger
    acnMinSizeInBits    : BigInteger
    typeDef             : Map<ProgrammingLanguage, FE_PrimitiveTypeDefinition>

}

type Enumerated = {
    items               : NamedItem list
    acnProperties       : IntegerAcnProperties
    cons                : EnumConstraint list
    withcons            : EnumConstraint list
    uperMaxSizeInBits   : BigInteger
    uperMinSizeInBits   : BigInteger
    acnMaxSizeInBits    : BigInteger
    acnMinSizeInBits    : BigInteger
    acnEncodingClass    : IntEncodingClass
    encodeValues        : bool
    userDefinedValues   : bool      //if true, the user has associated at least one item with a value
    typeDef             : Map<ProgrammingLanguage, FE_EnumeratedTypeDefinition>

}

type AcnReferenceToEnumerated = {
    modName             : StringLoc
    tasName             : StringLoc
    enumerated          : Enumerated
    acnAligment         : AcnAligment option
}

type AcnReferenceToIA5String = {
    modName             : StringLoc
    tasName             : StringLoc
    str                 : StringType
    acnAligment         : AcnAligment option
}

type AcnInteger = {
    acnProperties       : IntegerAcnProperties
    cons                : IntegerTypeConstraint list
    withcons            : IntegerTypeConstraint list
    acnAligment         : AcnAligment option
    acnMaxSizeInBits    : BigInteger
    acnMinSizeInBits    : BigInteger
    acnEncodingClass    : IntEncodingClass
    Location            : SrcLoc //Line no, Char pos
    uperRange           : uperRange<BigInteger>
    isUnsigned          : bool
    checkIntHasEnoughSpace  : BigInteger -> BigInteger -> unit
}

type AcnBoolean = {
    acnProperties       : BooleanAcnProperties
    acnAligment         : AcnAligment option
    acnMaxSizeInBits    : BigInteger
    acnMinSizeInBits    : BigInteger
    Location            : SrcLoc //Line no, Char pos
}

type AcnNullType = {
    acnProperties       : NullTypeAcnProperties
    acnAligment         : AcnAligment option
    acnMaxSizeInBits    : BigInteger
    acnMinSizeInBits    : BigInteger
    Location            : SrcLoc //Line no, Char pos
}

type  AcnInsertedType = 
    | AcnInteger                of AcnInteger
    | AcnNullType               of AcnNullType
    | AcnBoolean                of AcnBoolean
    | AcnReferenceToEnumerated  of AcnReferenceToEnumerated
    | AcnReferenceToIA5String   of AcnReferenceToIA5String
with
    member this.AsString =
        match this with
        | AcnInteger  _                 -> "INTEGER"
        | AcnNullType _                 -> "NULL"
        | AcnBoolean  _                 -> "BOOLEAN"
        | AcnReferenceToEnumerated o    -> sprintf "%s.%s" o.modName.Value o.tasName.Value
        | AcnReferenceToIA5String  o    -> sprintf "%s.%s" o.modName.Value o.tasName.Value





type Asn1Type = {
    id              : ReferenceToType
    parameterizedTypeInstance : bool
    Kind            : Asn1TypeKind
    acnAligment     : AcnAligment option
    acnParameters   : AcnParameter list
    Location        : SrcLoc //Line no, Char pos

    /// Indicates that this type
    /// is a subclass (or inherits) from referencType
    /// (i.e. this type resolves the reference type)
    inheritInfo     : InheritanceInfo option

    /// it indicates that this type is directly under a type assignment.
    typeAssignmentInfo  : AssignmentInfo option

}


and Asn1TypeKind =
    | Integer           of Integer
    | Real              of Real
    | IA5String         of StringType
    | NumericString     of StringType
    | OctetString       of OctetString
    | NullType          of NullType
    | BitString         of BitString
    | Boolean           of Boolean
    | Enumerated        of Enumerated
    | SequenceOf        of SequenceOf
    | Sequence          of Sequence
    | Choice            of Choice
    | ReferenceType     of ReferenceType

and SequenceOf = {
    child           : Asn1Type
    acnProperties   : SizeableAcnProperties
    cons                : SequenceOfConstraint list
    withcons            : SequenceOfConstraint list
    minSize             : BigInteger
    maxSize             : BigInteger
    uperMaxSizeInBits   : BigInteger
    uperMinSizeInBits   : BigInteger

    acnMaxSizeInBits    : BigInteger
    acnMinSizeInBits    : BigInteger
    acnEncodingClass    : SizeableAcnEncodingClass
    typeDef             : Map<ProgrammingLanguage, FE_SizeableTypeDefinition>

}

and Sequence = {
    children                : SeqChildInfo list
    cons                    : SequenceConstraint list
    withcons                : SequenceConstraint list
    uperMaxSizeInBits       : BigInteger
    uperMinSizeInBits       : BigInteger

    acnMaxSizeInBits        : BigInteger
    acnMinSizeInBits        : BigInteger
    typeDef                 : Map<ProgrammingLanguage, FE_SequenceTypeDefinition>
}

and AcnChild = {
    Name                        : StringLoc
    id                          : ReferenceToType
    Type                        : AcnInsertedType
}

and SeqChildInfo = 
    | Asn1Child of Asn1Child
    | AcnChild  of AcnChild


and Asn1Child = {
    Name                        : StringLoc
    _c_name                     : string
    _ada_name                   : string                     
    Type                        : Asn1Type
    Optionality                 : Asn1Optionality option
    Comments                    : string array
}




and Choice = {
    children            : ChChildInfo list
    acnProperties       : ChoiceAcnProperties
    cons                : ChoiceConstraint list
    withcons            : ChoiceConstraint list
    uperMaxSizeInBits   : BigInteger
    uperMinSizeInBits   : BigInteger

    acnMaxSizeInBits    : BigInteger
    acnMinSizeInBits    : BigInteger
    acnLoc              : SrcLoc option
    typeDef             : Map<ProgrammingLanguage, FE_ChoiceTypeDefinition>

}

and ChChildInfo = {
    Name                        : StringLoc
    _c_name                     : string
    _ada_name                   : string                     
    present_when_name           : string // Does not contain the "_PRESENT". Not to be used directly by backends.
    Type                        : Asn1Type
    acnPresentWhenConditions    : AcnPresentWhenConditionChoiceChild list
    Comments                    : string array
    Optionality                 : Asn1ChoiceOptionality option
}

and ReferenceType = {
    modName     : StringLoc
    tasName     : StringLoc
    tabularized : bool
    acnArguments: RelativePath list
    resolvedType: Asn1Type
    hasConstraints : bool
    typeDef             : Map<ProgrammingLanguage, FE_TypeDefinition>

}


type TypeAssignment = {
    Name:StringLoc
    c_name:string
    ada_name:string
    Type:Asn1Type
    Comments: string array

}

type ValueAssignment = {
    Name:StringLoc
    c_name:string
    ada_name:string
    Type:Asn1Type
    Value:Asn1Value
}


type Asn1Module = {
    Name : StringLoc
    TypeAssignments : list<TypeAssignment>
    ValueAssignments : list<ValueAssignment>
    Imports : list<Asn1Ast.ImportedModule>
    Exports : Asn1Ast.Exports
    Comments : string array
}

type Asn1File = {
    FileName:string;
    Tokens: IToken array
    Modules : list<Asn1Module>
}

type AstRoot = {
    Files: list<Asn1File>
    acnConstants : Map<string, BigInteger>
    args:CommandLineSettings
    acnParseResults:ParameterizedAsn1Ast.AntlrParserResult list //used in ICDs to regenerate with collors the initial ACN input
    stg : AbstractMacros.StgMacros  
}



type ReferenceToEnumerated = {
    modName : string
    tasName : string
    enm     : Enumerated
}

type AcnDependencyKind = 
    | AcnDepIA5StringSizeDeterminant                  // The asn1Type has a size dependency a SEQUENCE OF, BIT STRINT, OCTET STRING etc
    | AcnDepSizeDeterminant                  // The asn1Type has a size dependency a SEQUENCE OF, BIT STRINT, OCTET STRING etc
    | AcnDepRefTypeArgument       of AcnParameter        // string is the param name
    | AcnDepPresenceBool                     // points to a SEQEUNCE or Choice child
    | AcnDepPresence              of (RelativePath*Choice)
    | AcnDepPresenceStr           of (RelativePath*Choice*StringType)
    | AcnDepChoiceDeteterminant   of (ReferenceToEnumerated*Choice)           // points to Enumerated type acting as CHOICE determinant.

type Determinant =
    | AcnChildDeterminant       of AcnChild
    | AcnParameterDeterminant   of AcnParameter
    with 
        member this.id = 
            match this with
            | AcnChildDeterminant       c  -> c.id
            | AcnParameterDeterminant   p  -> p.id

//The following type expresses the dependencies that exists between ASN.1 types and ACNs types and parameters
type AcnDependency = {
    asn1Type        : ReferenceToType      // an ASN.1 type that its decoding depends on the determinant
    determinant     : Determinant          // an ACN inserted type or an ACN parameter that acts as determinant
    dependencyKind  : AcnDependencyKind
}

type AcnInsertedFieldDependencies = {
    acnDependencies                         : AcnDependency list
}



type Asn1AcnMergeState = {
    args:CommandLineSettings    
    allocatedTypeNames          : (ProgrammingLanguage*string*string)  list     //language, program unit, type definition name
    allocatedFE_TypeDefinition  : Map<(ProgrammingLanguage*ReferenceToType), FE_TypeDefinition>
}
