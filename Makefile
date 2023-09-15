release:
	nim c -d:release -d:lto --outdir:Libre-path-adder --out:Release/Libre-Path-Adder src/main.nim
debug:
	nim c -d:useMalloc --debuginfo --linedir:on --outdir:Libre-path-adder.AppDir --out:Debug/debugbin src/main.nim

setup:
	mkdir Debug

appimage:
	nim c -d:release -d:lto --outdir:Libre-path-adder --out:Libre-Path-Adder.AppDir/AppRun src/main.nim
	appimagetool Libre-Path-Adder.AppDir/