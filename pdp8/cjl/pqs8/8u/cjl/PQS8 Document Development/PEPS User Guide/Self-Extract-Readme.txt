This file documents the process of creating the PEPS release package using
PowerArchiver.

 1) Select the SFX Wizard from the Tools menu.

 2) Specify the destination file PEPS.exe in whatever working directory is
    convenient, such as the Desktop folder.

 3) Check the "Include subfolders" box.

 4) Click on "Add Folders...".

 5) Navigate to the PDP-8 directory of the package.  This should already be
    in the root of a drive since this is a requirement for the package to
    function properly.  We will assume P:\PDP-8 was chosen.

 6) Press "OK".  This should produce a Name of "PDP-8\*.*" and a Path such as
    "P:\".

 7) Press "Next".

 8) In the interest of minimizing the archive file size, check the circle for
    7-ZIP SFX.  Using ZIP SFX will produce a somewhat larger file in far less
    time, with the additional advantage of much faster extraction during the
    installation.  For general testing the ZIP format is acceptable.  Use the
    maximum compression setting.  We generally do not use passwords, and always
    set "store relative folder information".  The setting for testing is
    optional [but recommended], however, the archive should be tested before
    releasing the package.

 9) Press "Next".

10) The default "Unzip To" folder setting should be left to the TEMP directory
    setting; however, the package will not start properly unless the directory
    is manually changed by the user to such as G:\.  This is a safety feature in
    case the package winds up in the hands of someone who is not familiar with any
    of this.  Better to create something easily deleted than something that might
    be problematic.  The proper settings are documented in the user guide!

11) File conflict should be set to "Overwrite file automatically" since there are
    many files in the package.

12) The Caption should be set to something such as "Extracting PEPS files, please
    wait..."

13) The Run command line after extracting should be set to:

    \PDP-8\SIMH\Links and Support Files\PDP-8_SETUP\STARTUP.BAT

    to setup the proper internal initialization.  This will also call up the
    environment variable management program automatically.  [Note: The environment
    variable management program can be later run manually in case the package is
    directly moved to the root of a different logical drive using Windows
    Explorer.]

14) The "Show success message when complete" should be checked.  All other options
    should be unchecked by default.

15) Press "Next".

16) A screen similar to the following should appear:

#######################################
 PowerArchiver SFX Wizard
 http://www.powerarchiver.com
#######################################

SFX set: 
             H:\Users\user\Desktop\PEPS.exe
             7-ZIP SFX
             Using password protection: No
             Saving relative folder info
             Include system and hidden files: No
SFX Options: 
             Caption : Extracting PEPS files, please wait...
             Command Line : \PDP-8\SIMH\Links and Support Files\PDP-8_SETUP\STARTUP.BAT
             Show sucess message : Yes
             AutoRun SFX : No
Files/Directories:
             P:\PDP-8\

17) If all is correct, press "Make SFX", else press "Back" to fix the problems.
    The process will continue at step 15) above.

18) If required, overwrite any existing archive files, including the final archive
    file.

19) If testing was selected [as recommended], the archive can be tested at this
    time using all of the following steps.

20) Depending on anti-malware programs installed, it may be necessary to exclude the
    archive file from blocking software.

21) The target directory must be set to the desired drive and root directory such
    G:\ .  Use any available drive; it is preferable to use a dedicated drive
    for the PEPS package to facilitate backup procedures.  The directory setting
    *MUST* be the root directory for the package to function properly!

22) The dearchiving operation should successfully complete.

23) Press "OK" to continue.

24) After a brief pause, a blue window should appear for a few seconds; this is
    the initialization of the PEPS package required prior to setting the
    environment variable.  If all is successful, the development drive utility
    should be on the screen including the built-in help file.  After following
    the onscreen directions, the package is ready for use.

At this point, the PEPS.exe archive is complete.

Last edit: 03-Dec-2016 cjl































