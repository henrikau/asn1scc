all:
	gnatmake -gnat2012 -P GPS_project.gpr mainprogram.adb --subdirs=debug -cargs -g -O0 -gnatwe
	touch builtWithoutCoverage
	
coverage:
	if [ -f builtWithoutCoverage ] ; then make clean ; fi
	gnatmake -gnat2012 -P GPS_project.gpr mainprogram.adb --subdirs=debug -cargs -g -O0 -gnatwe -fprofile-arcs -ftest-coverage -largs -fprofile-arcs
	cd bin/debug ; ./mainprogram
	cd bin/debug ; gcov adaasn1rtl MYMODULE
	
clean:
	rm -f builtWithoutCoverage ;
	gnat clean -r -P GPS_project.gpr --subdirs=debug	