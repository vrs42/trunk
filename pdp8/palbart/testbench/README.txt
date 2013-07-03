This directory contains tests for palbart. To generate OS/8 PAL
bn files
./gen_bin good/*.pa
to test palbart
./check_pal good/*.pa
bad has two files that palbart and OS/8 PAL generate different binaries

To check listings
copy to temp directory and
ls *.pa | xargs -i ../../pal8 '{}'
then make changes, repeat with second directory and diff
