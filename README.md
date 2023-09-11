# gnu-pathadder

The GNU path adder program. It shall add paths for bash.

this requires GTK 4 and the owlkettle library, install them via:
gtk on ubuntu based distros: `sudo apt install libgtk-4-1`
owlkettle: `nimble install owlkettle@#head`

Build via:
relase: `nim c -d:release --mm:orc -d:lto main.nim`
debug: `nim c main.nim`
