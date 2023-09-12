release:
	nim c -d:release -d:lto --outdir:GNU-path-adder.AppDir --out:GNU-path-adder.AppDir/AppRun src/main.nim
	appimagetool GNU-path-adder.AppDir ./Release

debug:
	nim c -d:useMalloc --outdir:GNU-path-adder.AppDir --out:Debug/debugbin src/main.nim
	valgrind ./Debug/debugbin

setup:
	mkdir Debug
	mkdir Release