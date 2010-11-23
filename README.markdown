 1 | 2 | 3 
---+---+---
 4 | 5 | 6
---+---+---
 7 | 8 | 9

## Requirements

* GNU Smalltalk (used 3.2.2)
* homebrew (optional)

## Setup

If you have homebrew, installing GNU Smalltalk is as easy as executing <code>brew install gnu-smalltalk</code>.  Otherwise, you'll need to build it manually using the instructions [here](http://smalltalk.gnu.org/download/cvs).

After building GNU Smalltalk, you'll need to build the package to run the game.  Simply navigate to the directory where you cloned this repo and enter <code>gst-package -t ~/.st package.xml</code>.  The <code>~/.st</code> directory is one of several places GNU Smalltalk looks to find packages.  If the package built successfully, you should see the new directory in your home path and <code>TicTacToe-Core.star</code>.  <code>\*.star</code> packages are nothing more than <code>\*.gz</code> files.

## Running the Game

Work in progress...

## Running SUnit Tests

After building the package, run <code>gst-sunit -p TicTacToe-Core</code>.
