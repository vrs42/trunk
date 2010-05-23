Hello, and welcome to my tape archive.

The various sub-directories have various tape images in them, using what I hope
is a fairly obvious system.

The actual tape images themselves come as a set of related files:

        The tape image itself generally has no extension.  File names that end
        in "-pb" should be in BIN format, "-pm" is for RIM format, "-pa" is
        for PAL source code, and "-ft" is for FORTRAN source code.

.od     There will always be a .od for every tape image, which contains a human
	readable octal dump of the tape image.

.lbl	The .lbl file contains the file name of the associated binary,followed
        by the text from the label of the tape.  The last line of a .lbl file
        has a lone "." on it (for use as a separator).  The file "labels.txt"
        contains the concatenated information for the collection

.txt    If the file looks like it most likely contains text, there will be a
        .txt file, which contains the ASCII text, with nulls stripped out, and
        the eighth bit forced off, which is usually necessary for the text to
        display properly with modern equipment.


Vince Slyngstad
