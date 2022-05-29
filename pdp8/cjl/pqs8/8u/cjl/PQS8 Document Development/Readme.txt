README file for the enhanced PDP-8 SIMH package.

This package parcels out the components of SIMH into different directories to
allow additional flexibility in configuration.  A USER environment variable called
PDP-8_Drive must be set to something like J: or whatever drive is desired.  One
level up from this directory is the PDP-8_SETUP directory which will set this for
you assuming the drive it is located on is the desired drive [make it so!].  Once
set, all components will completely work.

The actual SIMH release is a recent one modified by Dave Gesswein to support
DECtapes [in .tu56 files] that exceed the normal size.  This is in part to support
the 3300 octal block tapes that do physically happen [even though the standard is
2702 octal blocks].  [If you are familiar with OS/8 sizes, convert to decimal and
then add 7; the DIR command will thus show 7 less than these numbers].

However, you can fake DECtapes up to 7776 blocks it turns out!  That could come in
handy in some interesting situations.  In any case, it's the usual pdp8.exe which
is in the SIMH_Working_Files directory.

The package link ["PDP-8 SIMH Development"] and all used .ico icon files should be
stored here.  The preferred icon for all packages created by members of the P?S is
the question.ico file placed in this directory.

All links have the read-only and system attributes set to prevent modification by
Windows trying to "help" you.  Should the icon file not be found, ensure the
environment variable PDP-8_DRIVE is properly set before any attempt to change
settings.  In the off chance of something going awry, the attribute bits for any
links must be reset [-R and -S] before making any changes.  The directory where
the icon file is [presumably this directory] can be browsed.  Manually change the
drive letter to %PDP-8_DRIVE% before applying the change.  After confirming proper
functionality, restore the attribute bits [+R and +S] to prevent further change.
[Note: Unless both +R and +S are set, Windows will tend to guess its way into
incorrect settings that will have consequences later.  This could come about if
the package is being moved from one drive to another on the same machine;
incorrectly, reference will be made to the wrong [old] drive otherwise.

Copies of all functional links can then be freely placed on the Desktop or other
convenient links-oriented directory.  [Some configurations have Tools directories
pointed to on the Desktop to avoid clutter.  These directories should be placed in
the root of the drive Windows is installed on with a shortcut to the tool
directory placed on the Desktop [and not the tool directory itself].

Good luck with all your PDP-8 emulations [both P?S/8 and OS/8].

last edit: 22-Jun-2015 cjl
