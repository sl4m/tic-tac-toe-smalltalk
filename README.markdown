     1 | 2 | 3 
    ---+---+---
     4 | 5 | 6
    ---+---+---
     7 | 8 | 9

## Requirements

* GNU Smalltalk version 3.2.2

## Easy Setup

If you have homebrew, installing GNU Smalltalk is as easy as executing <code>brew install gnu-smalltalk</code>.  Otherwise, you'll need to build it manually using the instructions [here](http://smalltalk.gnu.org/download/cvs).

After building GNU Smalltalk, you'll need to package up the TicTacToe library.  I have provided a shell script that creates the package, runs the SUnit tests, and places the package in your <code>~/.st</code> directory.  The <code>~/.st</code> directory is one of several places GNU Smalltalk looks to find packages.  If the package built successfully, you should see the new directory in your home path and <code>TicTacToe.star</code>.  <code>\*.star</code> packages are nothing more than <code>\*.gz</code> files. 

To execute the shell script, type the following:   

    ./build

## Running the Game

To run the game, type the following:

    gst play.st

## Running SUnit Tests

Simply run the same shell script used to build the package.

## Credits

Thanks to bonzini and gnu\-smalltalk IRC members for the help!
