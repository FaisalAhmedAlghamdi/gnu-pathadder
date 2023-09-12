# gnu-pathadder

The GNU path adder program. It shall add paths for bash.

this requires GTK 4 and the owlkettle library, install them via:
gtk on ubuntu based distros: `sudo apt install libgtk-4-1`

owlkettle: `nimble install owlkettle@#head`

Building:
run `make setup`
then `make release`
for a release build

or run `make debug` to run with debug (requires valgrind)
