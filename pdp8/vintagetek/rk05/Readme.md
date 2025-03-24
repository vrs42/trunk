This directory is where the RK05 disk image is built, and a copy of it
is where the image is loaded from.

The "build" sub-directory is where the build scripts are. Make the desired
changes to the ".0" aned ".1" directories there, and type "make". (You will
need to install "8tools" first.)

This top level directory must contain exactly one image, with extension
".rk05". Select the desired image from "build/*.rk05" and copy it here,
being sure to delecte any others from this top directory.
