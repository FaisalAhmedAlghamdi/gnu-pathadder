release:
	nim c -d:release -d:lto --outdir:Libre-path-adder.AppDir --out:Libre-path-adder.AppDir/AppRun src/main.nim
	appimagetool Libre-path-adder.AppDir/ Release/Libre-path-adder

debug:
	nim c -d:useMalloc --outdir:Libre-path-adder.AppDir --out:Debug/debugbin src/main.nim
	valgrind ./Debug/debugbin

setup:
	mkdir Debug
	mkdir Release
