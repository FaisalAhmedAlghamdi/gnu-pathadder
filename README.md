# Libre Path Adder

Libre Path Adder is a GUI utility designed to simplify the process of adding paths for the Bash shell (zsh coming soon). It provides an efficient way to manage your environment variables, making it easier to access your favorite tools and applications from your command line.

## Looking for binaries?
We provide Appimages through our CI [here](https://github.com/FaisalAhmedAlghamdi/Libre-pathadder/actions). (Arm builds are **untested** due to the lack of hardware support i have. You can test it yourself and tell us what bugs you encounter (unlikely).


## Prerequisites
Before you can use Libre Path Adder, you need to ensure you have the following dependencies installed:
- GTK 4
- Owlkettle library
- Nim 2.0.0
## Installing Dependencies
GTK 4 (Ubuntu-based distros)
You can install GTK 4 on Ubuntu-based Linux distributions using the following command:
```bash
sudo apt install libgtk-4-1
```
Owlkettle
To install the Owlkettle library, you can use the Nim package manager, Nimble. Run the following command to install Owlkettle:
```bash
nimble install owlkettle@#head
```

## Building
Follow these steps to build Libre Path Adder:

Clone the repository:
```
git clone <repository_url>
cd Libre-pathadder
```
Set up the project:
```
make setup
```
Build a release version:
```
make release
```
This will compile the program with optimizations for a release build and also bundle it in an appimage.

OR

Build with debug information (requires Valgrind for debugging):
```
make debug
```
The debug build includes additional information to help diagnose issues during development.

That's it! You now have Libre Path Adder built and ready to use.
