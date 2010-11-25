     1 | 2 | 3 
    ---+---+---
     4 | 5 | 6
    ---+---+---
     7 | 8 | 9

## Requirements

* GNU Smalltalk (used 3.2.2)
* homebrew (optional)

## Easy Setup

If you have homebrew, installing GNU Smalltalk is as easy as executing <code>brew install gnu-smalltalk</code>.  Otherwise, you'll need to build it manually using the instructions [here](http://smalltalk.gnu.org/download/cvs).

After building GNU Smalltalk, you'll need to create a Smalltalk package using *TicTacToe\-Core*.  I have provided a shell script that creates the package, runs the SUnit tests, and places the package in your <code>~/.st</code> directory.  The <code>~/.st</code> directory is one of several places GNU Smalltalk looks to find packages.  If the package built successfully, you should see the new directory in your home path and <code>TicTacToe-Core.star</code>.  <code>\*.star</code> packages are nothing more than <code>\*.gz</code> files. 

To execute the <code>run\_tests.sh</code> shell script (you may need the chmod it), type the following:   

    ./run_tests.sh

## Running the Game

Work in progress...

## Running SUnit Tests

Simply run the same shell script used to build the package.
