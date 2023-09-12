release:
	nim c -d:release -d:lto --outdir:Libre-path-adder --out:LibrePathAdder/usr/bin/Libre-Path-Adder src/main.nim
	dpkg-deb --build LibrePathAdder
debug:
	nim c -d:useMalloc --outdir:Libre-path-adder.AppDir --out:Debug/debugbin src/main.nim
	valgrind ./Debug/debugbin

setup:
	mkdir Debug