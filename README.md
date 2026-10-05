# trunk

This is the main repo which supports www.so-much-stuff.com.

It includes the web pages, but also the extensive reference
material archive which the web pages reference into.

To package the reference materials conveniently, and to get
around various github repo size limits, git submodules are
used.

## Requirements

* Perl (most scripts are in Perl)
* Make
* C compiler

## Installation

* git clone --recurse-submodules https://github.com/vrs42/8tools.git

Note that since modules are used --recurse-submodules is required if
you want to get everything.

## Building the web pages

* cd so-much-stuff.com
* make

Various checks are made, and pages are built to describe our collections
and to refer to whatever is in the reference areas.

## Reference Areas

### Fashion Dolls

My wife's extensive collection of fashion doll images.

### PDP-8 Stuff

My collection of all things PDP-8 related:

* Engineering Drawings
* Software
* Forensic Tools
* My version of the PDP-8 SIMH
* Other cool stuff
