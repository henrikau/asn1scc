-- Code automatically generated by asn1scc tool
WITH Ada.Text_IO;
WITH adaasn1rtl; use type adaasn1rtl.Asn1UInt; use type adaasn1rtl.Asn1Int;use type adaasn1rtl.BIT;

WITH MYMODULE; USE MYMODULE;
WITH mymodule_auto_tcs; USE mymodule_auto_tcs;

use type adaasn1rtl.OctetBuffer;
use type adaasn1rtl.BitArray;
use type adaasn1rtl.Asn1UInt;
use type adaasn1rtl.Asn1Int;
use type adaasn1rtl.BIT;


PACKAGE BODY test_case_001 IS

procedure test_case_ACN_000001( totalErrors : in out integer)
is
    use Ada.Text_IO;
    result      : adaasn1rtl.test_case_result;

    i1:Integer;
    tc_data : PacketHeader;
begin
    -- dummy statement used for calling init functions
    
    declare
       dummy : constant PacketHeader_version := PacketHeader_version_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketHeader_release := PacketHeader_release_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketHeader_varSizeArray_elem := PacketHeader_varSizeArray_elem_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketHeader_varSizeArray := PacketHeader_varSizeArray_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketHeader := PacketHeader_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    --the actual initialization with the test case data is made here.
    --set version 
    tc_data.version := 1;
    --set release 
    tc_data.release := 1;
    --set varSizeArray 
    i1 := 1;
    while i1<= 20 loop
        pragma Loop_Invariant (i1 >=1 and i1<=20);
        if (i1-1) mod 2 = 0  then
            tc_data.varSizeArray.Data(i1) := 1;
        else
            tc_data.varSizeArray.Data(i1) := 20;
           
        end if;
    
        i1 := i1 + 1;
    end loop;
    tc_data.varSizeArray.Length := 20;

    result := PacketHeader_ACN_enc_dec(tc_data,"test_case_ACN_000001");
    if NOT result.Success THEN
        case result.Step IS
            when adaasn1rtl.TC_VALIDATE =>
                Put_Line ("Test case 'test_case_ACN_000001' failed in validation"); 
            when adaasn1rtl.TC_ENCODE =>
                Put_Line ("Test case 'test_case_ACN_000001' failed in encoding");
            when adaasn1rtl.TC_DECODE =>
                Put_Line ("Test case 'test_case_ACN_000001' failed in decoding");
            when adaasn1rtl.TC_VALIDATE_DECODED =>
                Put_Line ("Test case 'test_case_ACN_000001' failed in the validation of the decoded message");
            when adaasn1rtl.TC_EQUAL =>
                Put_Line ("Test case 'test_case_ACN_000001' failed. Encoded and decoded messages are different");
        end case;
        Put_Line ("========================================");
        totalErrors := totalErrors + 1;
    end if;
    
end test_case_ACN_000001;

procedure test_case_ACN_000002( totalErrors : in out integer)
is
    use Ada.Text_IO;
    result      : adaasn1rtl.test_case_result;

    i1:Integer;
    tc_data : PacketHeader;
begin
    -- dummy statement used for calling init functions
    
    declare
       dummy : constant PacketHeader_version := PacketHeader_version_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketHeader_release := PacketHeader_release_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketHeader_varSizeArray_elem := PacketHeader_varSizeArray_elem_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketHeader_varSizeArray := PacketHeader_varSizeArray_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketHeader := PacketHeader_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    --the actual initialization with the test case data is made here.
    --set version 
    tc_data.version := 100;
    --set release 
    tc_data.release := 100;
    --set varSizeArray 
    i1 := 1;
    while i1<= 1 loop
        pragma Loop_Invariant (i1 >=1 and i1<=1);
        if (i1-1) mod 2 = 0  then
            tc_data.varSizeArray.Data(i1) := 1;
        else
            tc_data.varSizeArray.Data(i1) := 20;
           
        end if;
    
        i1 := i1 + 1;
    end loop;
    tc_data.varSizeArray.Length := 1;

    result := PacketHeader_ACN_enc_dec(tc_data,"test_case_ACN_000002");
    if NOT result.Success THEN
        case result.Step IS
            when adaasn1rtl.TC_VALIDATE =>
                Put_Line ("Test case 'test_case_ACN_000002' failed in validation"); 
            when adaasn1rtl.TC_ENCODE =>
                Put_Line ("Test case 'test_case_ACN_000002' failed in encoding");
            when adaasn1rtl.TC_DECODE =>
                Put_Line ("Test case 'test_case_ACN_000002' failed in decoding");
            when adaasn1rtl.TC_VALIDATE_DECODED =>
                Put_Line ("Test case 'test_case_ACN_000002' failed in the validation of the decoded message");
            when adaasn1rtl.TC_EQUAL =>
                Put_Line ("Test case 'test_case_ACN_000002' failed. Encoded and decoded messages are different");
        end case;
        Put_Line ("========================================");
        totalErrors := totalErrors + 1;
    end if;
    
end test_case_ACN_000002;

procedure test_case_ACN_000003( totalErrors : in out integer)
is
    use Ada.Text_IO;
    result      : adaasn1rtl.test_case_result;

    tc_data : PacketBody;
begin
    -- dummy statement used for calling init functions
    
    declare
       dummy : constant PacketBody_anInteger := PacketBody_anInteger_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody_anotherSizeArray_elem := PacketBody_anotherSizeArray_elem_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody_anotherSizeArray := PacketBody_anotherSizeArray_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody := PacketBody_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    --the actual initialization with the test case data is made here.
    --set aReal 
    declare
        aReal_tmp:adaasn1rtl.Asn1Real;
    begin
        aReal_tmp := -1.79769313486231570000E+308;
        tc_data := PacketBody'(kind => aReal_PRESENT, aReal => aReal_tmp);
    end;

    result := PacketBody_ACN_enc_dec(tc_data,"test_case_ACN_000003");
    if NOT result.Success THEN
        case result.Step IS
            when adaasn1rtl.TC_VALIDATE =>
                Put_Line ("Test case 'test_case_ACN_000003' failed in validation"); 
            when adaasn1rtl.TC_ENCODE =>
                Put_Line ("Test case 'test_case_ACN_000003' failed in encoding");
            when adaasn1rtl.TC_DECODE =>
                Put_Line ("Test case 'test_case_ACN_000003' failed in decoding");
            when adaasn1rtl.TC_VALIDATE_DECODED =>
                Put_Line ("Test case 'test_case_ACN_000003' failed in the validation of the decoded message");
            when adaasn1rtl.TC_EQUAL =>
                Put_Line ("Test case 'test_case_ACN_000003' failed. Encoded and decoded messages are different");
        end case;
        Put_Line ("========================================");
        totalErrors := totalErrors + 1;
    end if;
    
end test_case_ACN_000003;

procedure test_case_ACN_000004( totalErrors : in out integer)
is
    use Ada.Text_IO;
    result      : adaasn1rtl.test_case_result;

    tc_data : PacketBody;
begin
    -- dummy statement used for calling init functions
    
    declare
       dummy : constant PacketBody_anInteger := PacketBody_anInteger_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody_anotherSizeArray_elem := PacketBody_anotherSizeArray_elem_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody_anotherSizeArray := PacketBody_anotherSizeArray_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody := PacketBody_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    --the actual initialization with the test case data is made here.
    --set aReal 
    declare
        aReal_tmp:adaasn1rtl.Asn1Real;
    begin
        aReal_tmp := 0.00000000000000000000E+000;
        tc_data := PacketBody'(kind => aReal_PRESENT, aReal => aReal_tmp);
    end;

    result := PacketBody_ACN_enc_dec(tc_data,"test_case_ACN_000004");
    if NOT result.Success THEN
        case result.Step IS
            when adaasn1rtl.TC_VALIDATE =>
                Put_Line ("Test case 'test_case_ACN_000004' failed in validation"); 
            when adaasn1rtl.TC_ENCODE =>
                Put_Line ("Test case 'test_case_ACN_000004' failed in encoding");
            when adaasn1rtl.TC_DECODE =>
                Put_Line ("Test case 'test_case_ACN_000004' failed in decoding");
            when adaasn1rtl.TC_VALIDATE_DECODED =>
                Put_Line ("Test case 'test_case_ACN_000004' failed in the validation of the decoded message");
            when adaasn1rtl.TC_EQUAL =>
                Put_Line ("Test case 'test_case_ACN_000004' failed. Encoded and decoded messages are different");
        end case;
        Put_Line ("========================================");
        totalErrors := totalErrors + 1;
    end if;
    
end test_case_ACN_000004;

procedure test_case_ACN_000005( totalErrors : in out integer)
is
    use Ada.Text_IO;
    result      : adaasn1rtl.test_case_result;

    tc_data : PacketBody;
begin
    -- dummy statement used for calling init functions
    
    declare
       dummy : constant PacketBody_anInteger := PacketBody_anInteger_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody_anotherSizeArray_elem := PacketBody_anotherSizeArray_elem_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody_anotherSizeArray := PacketBody_anotherSizeArray_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody := PacketBody_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    --the actual initialization with the test case data is made here.
    --set aReal 
    declare
        aReal_tmp:adaasn1rtl.Asn1Real;
    begin
        aReal_tmp := 1.79769313486231570000E+308;
        tc_data := PacketBody'(kind => aReal_PRESENT, aReal => aReal_tmp);
    end;

    result := PacketBody_ACN_enc_dec(tc_data,"test_case_ACN_000005");
    if NOT result.Success THEN
        case result.Step IS
            when adaasn1rtl.TC_VALIDATE =>
                Put_Line ("Test case 'test_case_ACN_000005' failed in validation"); 
            when adaasn1rtl.TC_ENCODE =>
                Put_Line ("Test case 'test_case_ACN_000005' failed in encoding");
            when adaasn1rtl.TC_DECODE =>
                Put_Line ("Test case 'test_case_ACN_000005' failed in decoding");
            when adaasn1rtl.TC_VALIDATE_DECODED =>
                Put_Line ("Test case 'test_case_ACN_000005' failed in the validation of the decoded message");
            when adaasn1rtl.TC_EQUAL =>
                Put_Line ("Test case 'test_case_ACN_000005' failed. Encoded and decoded messages are different");
        end case;
        Put_Line ("========================================");
        totalErrors := totalErrors + 1;
    end if;
    
end test_case_ACN_000005;

procedure test_case_ACN_000006( totalErrors : in out integer)
is
    use Ada.Text_IO;
    result      : adaasn1rtl.test_case_result;

    tc_data : PacketBody;
begin
    -- dummy statement used for calling init functions
    
    declare
       dummy : constant PacketBody_anInteger := PacketBody_anInteger_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody_anotherSizeArray_elem := PacketBody_anotherSizeArray_elem_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody_anotherSizeArray := PacketBody_anotherSizeArray_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody := PacketBody_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    --the actual initialization with the test case data is made here.
    --set anInteger 
    declare
        anInteger_tmp:PacketBody_anInteger;
    begin
        anInteger_tmp := 0;
        tc_data := PacketBody'(kind => anInteger_PRESENT, anInteger => anInteger_tmp);
    end;

    result := PacketBody_ACN_enc_dec(tc_data,"test_case_ACN_000006");
    if NOT result.Success THEN
        case result.Step IS
            when adaasn1rtl.TC_VALIDATE =>
                Put_Line ("Test case 'test_case_ACN_000006' failed in validation"); 
            when adaasn1rtl.TC_ENCODE =>
                Put_Line ("Test case 'test_case_ACN_000006' failed in encoding");
            when adaasn1rtl.TC_DECODE =>
                Put_Line ("Test case 'test_case_ACN_000006' failed in decoding");
            when adaasn1rtl.TC_VALIDATE_DECODED =>
                Put_Line ("Test case 'test_case_ACN_000006' failed in the validation of the decoded message");
            when adaasn1rtl.TC_EQUAL =>
                Put_Line ("Test case 'test_case_ACN_000006' failed. Encoded and decoded messages are different");
        end case;
        Put_Line ("========================================");
        totalErrors := totalErrors + 1;
    end if;
    
end test_case_ACN_000006;

procedure test_case_ACN_000007( totalErrors : in out integer)
is
    use Ada.Text_IO;
    result      : adaasn1rtl.test_case_result;

    tc_data : PacketBody;
begin
    -- dummy statement used for calling init functions
    
    declare
       dummy : constant PacketBody_anInteger := PacketBody_anInteger_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody_anotherSizeArray_elem := PacketBody_anotherSizeArray_elem_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody_anotherSizeArray := PacketBody_anotherSizeArray_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody := PacketBody_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    --the actual initialization with the test case data is made here.
    --set anInteger 
    declare
        anInteger_tmp:PacketBody_anInteger;
    begin
        anInteger_tmp := 65535;
        tc_data := PacketBody'(kind => anInteger_PRESENT, anInteger => anInteger_tmp);
    end;

    result := PacketBody_ACN_enc_dec(tc_data,"test_case_ACN_000007");
    if NOT result.Success THEN
        case result.Step IS
            when adaasn1rtl.TC_VALIDATE =>
                Put_Line ("Test case 'test_case_ACN_000007' failed in validation"); 
            when adaasn1rtl.TC_ENCODE =>
                Put_Line ("Test case 'test_case_ACN_000007' failed in encoding");
            when adaasn1rtl.TC_DECODE =>
                Put_Line ("Test case 'test_case_ACN_000007' failed in decoding");
            when adaasn1rtl.TC_VALIDATE_DECODED =>
                Put_Line ("Test case 'test_case_ACN_000007' failed in the validation of the decoded message");
            when adaasn1rtl.TC_EQUAL =>
                Put_Line ("Test case 'test_case_ACN_000007' failed. Encoded and decoded messages are different");
        end case;
        Put_Line ("========================================");
        totalErrors := totalErrors + 1;
    end if;
    
end test_case_ACN_000007;

procedure test_case_ACN_000008( totalErrors : in out integer)
is
    use Ada.Text_IO;
    result      : adaasn1rtl.test_case_result;

    i1:Integer;
    tc_data : PacketBody;
begin
    -- dummy statement used for calling init functions
    
    declare
       dummy : constant PacketBody_anInteger := PacketBody_anInteger_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody_anotherSizeArray_elem := PacketBody_anotherSizeArray_elem_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody_anotherSizeArray := PacketBody_anotherSizeArray_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody := PacketBody_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    --the actual initialization with the test case data is made here.
    --set anotherSizeArray 
    declare
        anotherSizeArray_tmp:PacketBody_anotherSizeArray;
    begin
        i1 := 1;
        while i1<= 100 loop
            pragma Loop_Invariant (i1 >=1 and i1<=100);
            if (i1-1) mod 2 = 0  then
                anotherSizeArray_tmp.Data(i1) := 1;
            else
                anotherSizeArray_tmp.Data(i1) := 200;
               
            end if;
        
            i1 := i1 + 1;
        end loop;
        anotherSizeArray_tmp.Length := 100;
        tc_data := PacketBody'(kind => anotherSizeArray_PRESENT, anotherSizeArray => anotherSizeArray_tmp);
    end;

    result := PacketBody_ACN_enc_dec(tc_data,"test_case_ACN_000008");
    if NOT result.Success THEN
        case result.Step IS
            when adaasn1rtl.TC_VALIDATE =>
                Put_Line ("Test case 'test_case_ACN_000008' failed in validation"); 
            when adaasn1rtl.TC_ENCODE =>
                Put_Line ("Test case 'test_case_ACN_000008' failed in encoding");
            when adaasn1rtl.TC_DECODE =>
                Put_Line ("Test case 'test_case_ACN_000008' failed in decoding");
            when adaasn1rtl.TC_VALIDATE_DECODED =>
                Put_Line ("Test case 'test_case_ACN_000008' failed in the validation of the decoded message");
            when adaasn1rtl.TC_EQUAL =>
                Put_Line ("Test case 'test_case_ACN_000008' failed. Encoded and decoded messages are different");
        end case;
        Put_Line ("========================================");
        totalErrors := totalErrors + 1;
    end if;
    
end test_case_ACN_000008;

procedure test_case_ACN_000009( totalErrors : in out integer)
is
    use Ada.Text_IO;
    result      : adaasn1rtl.test_case_result;

    i1:Integer;
    tc_data : PacketBody;
begin
    -- dummy statement used for calling init functions
    
    declare
       dummy : constant PacketBody_anInteger := PacketBody_anInteger_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody_anotherSizeArray_elem := PacketBody_anotherSizeArray_elem_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody_anotherSizeArray := PacketBody_anotherSizeArray_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    declare
       dummy : constant PacketBody := PacketBody_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    --the actual initialization with the test case data is made here.
    --set anotherSizeArray 
    declare
        anotherSizeArray_tmp:PacketBody_anotherSizeArray;
    begin
        i1 := 1;
        while i1<= 1 loop
            pragma Loop_Invariant (i1 >=1 and i1<=1);
            if (i1-1) mod 2 = 0  then
                anotherSizeArray_tmp.Data(i1) := 1;
            else
                anotherSizeArray_tmp.Data(i1) := 200;
               
            end if;
        
            i1 := i1 + 1;
        end loop;
        anotherSizeArray_tmp.Length := 1;
        tc_data := PacketBody'(kind => anotherSizeArray_PRESENT, anotherSizeArray => anotherSizeArray_tmp);
    end;

    result := PacketBody_ACN_enc_dec(tc_data,"test_case_ACN_000009");
    if NOT result.Success THEN
        case result.Step IS
            when adaasn1rtl.TC_VALIDATE =>
                Put_Line ("Test case 'test_case_ACN_000009' failed in validation"); 
            when adaasn1rtl.TC_ENCODE =>
                Put_Line ("Test case 'test_case_ACN_000009' failed in encoding");
            when adaasn1rtl.TC_DECODE =>
                Put_Line ("Test case 'test_case_ACN_000009' failed in decoding");
            when adaasn1rtl.TC_VALIDATE_DECODED =>
                Put_Line ("Test case 'test_case_ACN_000009' failed in the validation of the decoded message");
            when adaasn1rtl.TC_EQUAL =>
                Put_Line ("Test case 'test_case_ACN_000009' failed. Encoded and decoded messages are different");
        end case;
        Put_Line ("========================================");
        totalErrors := totalErrors + 1;
    end if;
    
end test_case_ACN_000009;

procedure test_case_ACN_000010( totalErrors : in out integer)
is
    use Ada.Text_IO;
    result      : adaasn1rtl.test_case_result;

    i1:Integer;
    tc_data : Packet;
begin
    -- dummy statement used for calling init functions
    
    declare
       dummy : constant Packet := Packet_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    --the actual initialization with the test case data is made here.
    --set p_header 
    --set version 
    tc_data.p_header.version := 1;
    --set release 
    tc_data.p_header.release := 1;
    --set varSizeArray 
    i1 := 1;
    while i1<= 20 loop
        pragma Loop_Invariant (i1 >=1 and i1<=20);
        if (i1-1) mod 2 = 0  then
            tc_data.p_header.varSizeArray.Data(i1) := 1;
        else
            tc_data.p_header.varSizeArray.Data(i1) := 20;
           
        end if;
    
        i1 := i1 + 1;
    end loop;
    tc_data.p_header.varSizeArray.Length := 20;
    --set p_body 
    --set aReal 
    declare
        aReal_tmp:adaasn1rtl.Asn1Real;
    begin
        aReal_tmp := -1.79769313486231570000E+308;
        tc_data.p_body := PacketBody'(kind => aReal_PRESENT, aReal => aReal_tmp);
    end;

    result := Packet_ACN_enc_dec(tc_data,"test_case_ACN_000010");
    if NOT result.Success THEN
        case result.Step IS
            when adaasn1rtl.TC_VALIDATE =>
                Put_Line ("Test case 'test_case_ACN_000010' failed in validation"); 
            when adaasn1rtl.TC_ENCODE =>
                Put_Line ("Test case 'test_case_ACN_000010' failed in encoding");
            when adaasn1rtl.TC_DECODE =>
                Put_Line ("Test case 'test_case_ACN_000010' failed in decoding");
            when adaasn1rtl.TC_VALIDATE_DECODED =>
                Put_Line ("Test case 'test_case_ACN_000010' failed in the validation of the decoded message");
            when adaasn1rtl.TC_EQUAL =>
                Put_Line ("Test case 'test_case_ACN_000010' failed. Encoded and decoded messages are different");
        end case;
        Put_Line ("========================================");
        totalErrors := totalErrors + 1;
    end if;
    
end test_case_ACN_000010;

procedure test_case_ACN_000011( totalErrors : in out integer)
is
    use Ada.Text_IO;
    result      : adaasn1rtl.test_case_result;

    i1:Integer;
    tc_data : Packet;
begin
    -- dummy statement used for calling init functions
    
    declare
       dummy : constant Packet := Packet_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    --the actual initialization with the test case data is made here.
    --set p_header 
    --set version 
    tc_data.p_header.version := 100;
    --set release 
    tc_data.p_header.release := 100;
    --set varSizeArray 
    i1 := 1;
    while i1<= 1 loop
        pragma Loop_Invariant (i1 >=1 and i1<=1);
        if (i1-1) mod 2 = 0  then
            tc_data.p_header.varSizeArray.Data(i1) := 1;
        else
            tc_data.p_header.varSizeArray.Data(i1) := 20;
           
        end if;
    
        i1 := i1 + 1;
    end loop;
    tc_data.p_header.varSizeArray.Length := 1;
    --set p_body 
    --set aReal 
    declare
        aReal_tmp:adaasn1rtl.Asn1Real;
    begin
        aReal_tmp := 0.00000000000000000000E+000;
        tc_data.p_body := PacketBody'(kind => aReal_PRESENT, aReal => aReal_tmp);
    end;

    result := Packet_ACN_enc_dec(tc_data,"test_case_ACN_000011");
    if NOT result.Success THEN
        case result.Step IS
            when adaasn1rtl.TC_VALIDATE =>
                Put_Line ("Test case 'test_case_ACN_000011' failed in validation"); 
            when adaasn1rtl.TC_ENCODE =>
                Put_Line ("Test case 'test_case_ACN_000011' failed in encoding");
            when adaasn1rtl.TC_DECODE =>
                Put_Line ("Test case 'test_case_ACN_000011' failed in decoding");
            when adaasn1rtl.TC_VALIDATE_DECODED =>
                Put_Line ("Test case 'test_case_ACN_000011' failed in the validation of the decoded message");
            when adaasn1rtl.TC_EQUAL =>
                Put_Line ("Test case 'test_case_ACN_000011' failed. Encoded and decoded messages are different");
        end case;
        Put_Line ("========================================");
        totalErrors := totalErrors + 1;
    end if;
    
end test_case_ACN_000011;

procedure test_case_ACN_000012( totalErrors : in out integer)
is
    use Ada.Text_IO;
    result      : adaasn1rtl.test_case_result;

    i1:Integer;
    tc_data : Packet;
begin
    -- dummy statement used for calling init functions
    
    declare
       dummy : constant Packet := Packet_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    --the actual initialization with the test case data is made here.
    --set p_header 
    --set version 
    tc_data.p_header.version := 1;
    --set release 
    tc_data.p_header.release := 1;
    --set varSizeArray 
    i1 := 1;
    while i1<= 20 loop
        pragma Loop_Invariant (i1 >=1 and i1<=20);
        if (i1-1) mod 2 = 0  then
            tc_data.p_header.varSizeArray.Data(i1) := 1;
        else
            tc_data.p_header.varSizeArray.Data(i1) := 20;
           
        end if;
    
        i1 := i1 + 1;
    end loop;
    tc_data.p_header.varSizeArray.Length := 20;
    --set p_body 
    --set aReal 
    declare
        aReal_tmp:adaasn1rtl.Asn1Real;
    begin
        aReal_tmp := 1.79769313486231570000E+308;
        tc_data.p_body := PacketBody'(kind => aReal_PRESENT, aReal => aReal_tmp);
    end;

    result := Packet_ACN_enc_dec(tc_data,"test_case_ACN_000012");
    if NOT result.Success THEN
        case result.Step IS
            when adaasn1rtl.TC_VALIDATE =>
                Put_Line ("Test case 'test_case_ACN_000012' failed in validation"); 
            when adaasn1rtl.TC_ENCODE =>
                Put_Line ("Test case 'test_case_ACN_000012' failed in encoding");
            when adaasn1rtl.TC_DECODE =>
                Put_Line ("Test case 'test_case_ACN_000012' failed in decoding");
            when adaasn1rtl.TC_VALIDATE_DECODED =>
                Put_Line ("Test case 'test_case_ACN_000012' failed in the validation of the decoded message");
            when adaasn1rtl.TC_EQUAL =>
                Put_Line ("Test case 'test_case_ACN_000012' failed. Encoded and decoded messages are different");
        end case;
        Put_Line ("========================================");
        totalErrors := totalErrors + 1;
    end if;
    
end test_case_ACN_000012;

procedure test_case_ACN_000013( totalErrors : in out integer)
is
    use Ada.Text_IO;
    result      : adaasn1rtl.test_case_result;

    i1:Integer;
    tc_data : Packet;
begin
    -- dummy statement used for calling init functions
    
    declare
       dummy : constant Packet := Packet_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    --the actual initialization with the test case data is made here.
    --set p_header 
    --set version 
    tc_data.p_header.version := 100;
    --set release 
    tc_data.p_header.release := 100;
    --set varSizeArray 
    i1 := 1;
    while i1<= 1 loop
        pragma Loop_Invariant (i1 >=1 and i1<=1);
        if (i1-1) mod 2 = 0  then
            tc_data.p_header.varSizeArray.Data(i1) := 1;
        else
            tc_data.p_header.varSizeArray.Data(i1) := 20;
           
        end if;
    
        i1 := i1 + 1;
    end loop;
    tc_data.p_header.varSizeArray.Length := 1;
    --set p_body 
    --set anInteger 
    declare
        anInteger_tmp:PacketBody_anInteger;
    begin
        anInteger_tmp := 0;
        tc_data.p_body := PacketBody'(kind => anInteger_PRESENT, anInteger => anInteger_tmp);
    end;

    result := Packet_ACN_enc_dec(tc_data,"test_case_ACN_000013");
    if NOT result.Success THEN
        case result.Step IS
            when adaasn1rtl.TC_VALIDATE =>
                Put_Line ("Test case 'test_case_ACN_000013' failed in validation"); 
            when adaasn1rtl.TC_ENCODE =>
                Put_Line ("Test case 'test_case_ACN_000013' failed in encoding");
            when adaasn1rtl.TC_DECODE =>
                Put_Line ("Test case 'test_case_ACN_000013' failed in decoding");
            when adaasn1rtl.TC_VALIDATE_DECODED =>
                Put_Line ("Test case 'test_case_ACN_000013' failed in the validation of the decoded message");
            when adaasn1rtl.TC_EQUAL =>
                Put_Line ("Test case 'test_case_ACN_000013' failed. Encoded and decoded messages are different");
        end case;
        Put_Line ("========================================");
        totalErrors := totalErrors + 1;
    end if;
    
end test_case_ACN_000013;

procedure test_case_ACN_000014( totalErrors : in out integer)
is
    use Ada.Text_IO;
    result      : adaasn1rtl.test_case_result;

    i1:Integer;
    tc_data : Packet;
begin
    -- dummy statement used for calling init functions
    
    declare
       dummy : constant Packet := Packet_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    --the actual initialization with the test case data is made here.
    --set p_header 
    --set version 
    tc_data.p_header.version := 1;
    --set release 
    tc_data.p_header.release := 1;
    --set varSizeArray 
    i1 := 1;
    while i1<= 20 loop
        pragma Loop_Invariant (i1 >=1 and i1<=20);
        if (i1-1) mod 2 = 0  then
            tc_data.p_header.varSizeArray.Data(i1) := 1;
        else
            tc_data.p_header.varSizeArray.Data(i1) := 20;
           
        end if;
    
        i1 := i1 + 1;
    end loop;
    tc_data.p_header.varSizeArray.Length := 20;
    --set p_body 
    --set anInteger 
    declare
        anInteger_tmp:PacketBody_anInteger;
    begin
        anInteger_tmp := 65535;
        tc_data.p_body := PacketBody'(kind => anInteger_PRESENT, anInteger => anInteger_tmp);
    end;

    result := Packet_ACN_enc_dec(tc_data,"test_case_ACN_000014");
    if NOT result.Success THEN
        case result.Step IS
            when adaasn1rtl.TC_VALIDATE =>
                Put_Line ("Test case 'test_case_ACN_000014' failed in validation"); 
            when adaasn1rtl.TC_ENCODE =>
                Put_Line ("Test case 'test_case_ACN_000014' failed in encoding");
            when adaasn1rtl.TC_DECODE =>
                Put_Line ("Test case 'test_case_ACN_000014' failed in decoding");
            when adaasn1rtl.TC_VALIDATE_DECODED =>
                Put_Line ("Test case 'test_case_ACN_000014' failed in the validation of the decoded message");
            when adaasn1rtl.TC_EQUAL =>
                Put_Line ("Test case 'test_case_ACN_000014' failed. Encoded and decoded messages are different");
        end case;
        Put_Line ("========================================");
        totalErrors := totalErrors + 1;
    end if;
    
end test_case_ACN_000014;

procedure test_case_ACN_000015( totalErrors : in out integer)
is
    use Ada.Text_IO;
    result      : adaasn1rtl.test_case_result;

    i1:Integer;
    tc_data : Packet;
begin
    -- dummy statement used for calling init functions
    
    declare
       dummy : constant Packet := Packet_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    --the actual initialization with the test case data is made here.
    --set p_header 
    --set version 
    tc_data.p_header.version := 100;
    --set release 
    tc_data.p_header.release := 100;
    --set varSizeArray 
    i1 := 1;
    while i1<= 1 loop
        pragma Loop_Invariant (i1 >=1 and i1<=1);
        if (i1-1) mod 2 = 0  then
            tc_data.p_header.varSizeArray.Data(i1) := 1;
        else
            tc_data.p_header.varSizeArray.Data(i1) := 20;
           
        end if;
    
        i1 := i1 + 1;
    end loop;
    tc_data.p_header.varSizeArray.Length := 1;
    --set p_body 
    --set anotherSizeArray 
    declare
        anotherSizeArray_tmp:PacketBody_anotherSizeArray;
    begin
        i1 := 1;
        while i1<= 100 loop
            pragma Loop_Invariant (i1 >=1 and i1<=100);
            if (i1-1) mod 2 = 0  then
                anotherSizeArray_tmp.Data(i1) := 1;
            else
                anotherSizeArray_tmp.Data(i1) := 200;
               
            end if;
        
            i1 := i1 + 1;
        end loop;
        anotherSizeArray_tmp.Length := 100;
        tc_data.p_body := PacketBody'(kind => anotherSizeArray_PRESENT, anotherSizeArray => anotherSizeArray_tmp);
    end;

    result := Packet_ACN_enc_dec(tc_data,"test_case_ACN_000015");
    if NOT result.Success THEN
        case result.Step IS
            when adaasn1rtl.TC_VALIDATE =>
                Put_Line ("Test case 'test_case_ACN_000015' failed in validation"); 
            when adaasn1rtl.TC_ENCODE =>
                Put_Line ("Test case 'test_case_ACN_000015' failed in encoding");
            when adaasn1rtl.TC_DECODE =>
                Put_Line ("Test case 'test_case_ACN_000015' failed in decoding");
            when adaasn1rtl.TC_VALIDATE_DECODED =>
                Put_Line ("Test case 'test_case_ACN_000015' failed in the validation of the decoded message");
            when adaasn1rtl.TC_EQUAL =>
                Put_Line ("Test case 'test_case_ACN_000015' failed. Encoded and decoded messages are different");
        end case;
        Put_Line ("========================================");
        totalErrors := totalErrors + 1;
    end if;
    
end test_case_ACN_000015;

procedure test_case_ACN_000016( totalErrors : in out integer)
is
    use Ada.Text_IO;
    result      : adaasn1rtl.test_case_result;

    i1:Integer;
    tc_data : Packet;
begin
    -- dummy statement used for calling init functions
    
    declare
       dummy : constant Packet := Packet_Init;
       pragma Unreferenced (dummy);
    begin null; end;
    --the actual initialization with the test case data is made here.
    --set p_header 
    --set version 
    tc_data.p_header.version := 1;
    --set release 
    tc_data.p_header.release := 1;
    --set varSizeArray 
    i1 := 1;
    while i1<= 20 loop
        pragma Loop_Invariant (i1 >=1 and i1<=20);
        if (i1-1) mod 2 = 0  then
            tc_data.p_header.varSizeArray.Data(i1) := 1;
        else
            tc_data.p_header.varSizeArray.Data(i1) := 20;
           
        end if;
    
        i1 := i1 + 1;
    end loop;
    tc_data.p_header.varSizeArray.Length := 20;
    --set p_body 
    --set anotherSizeArray 
    declare
        anotherSizeArray_tmp:PacketBody_anotherSizeArray;
    begin
        i1 := 1;
        while i1<= 1 loop
            pragma Loop_Invariant (i1 >=1 and i1<=1);
            if (i1-1) mod 2 = 0  then
                anotherSizeArray_tmp.Data(i1) := 1;
            else
                anotherSizeArray_tmp.Data(i1) := 200;
               
            end if;
        
            i1 := i1 + 1;
        end loop;
        anotherSizeArray_tmp.Length := 1;
        tc_data.p_body := PacketBody'(kind => anotherSizeArray_PRESENT, anotherSizeArray => anotherSizeArray_tmp);
    end;

    result := Packet_ACN_enc_dec(tc_data,"test_case_ACN_000016");
    if NOT result.Success THEN
        case result.Step IS
            when adaasn1rtl.TC_VALIDATE =>
                Put_Line ("Test case 'test_case_ACN_000016' failed in validation"); 
            when adaasn1rtl.TC_ENCODE =>
                Put_Line ("Test case 'test_case_ACN_000016' failed in encoding");
            when adaasn1rtl.TC_DECODE =>
                Put_Line ("Test case 'test_case_ACN_000016' failed in decoding");
            when adaasn1rtl.TC_VALIDATE_DECODED =>
                Put_Line ("Test case 'test_case_ACN_000016' failed in the validation of the decoded message");
            when adaasn1rtl.TC_EQUAL =>
                Put_Line ("Test case 'test_case_ACN_000016' failed. Encoded and decoded messages are different");
        end case;
        Put_Line ("========================================");
        totalErrors := totalErrors + 1;
    end if;
    
end test_case_ACN_000016; 

END test_case_001;
