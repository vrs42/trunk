/*---------------------------------------------------------------------------

MKIOBROM

This program reads the .bin file for the extension ROM and the FPGA bitfile,
formats them, and outputs them as a text file to be downloaded using the
FL command of BTS6120 (rev 220 and later).

   The download image file has three sections.

      The first section is the executable portion; 32768 bytes are
   reserved for it, corresponding to up to 21845 12-bit words.
   It's a little more complicated than that, though, because the
   8-bit ROM is converted to words by the routine that handles the
   ramdisk, and this only works on 4KB fields.  A field in this format
   holds 21*256=2688 words, so the maximum code size is 8 times that,
   or 21504 words.  Note also that the extension ROM bootstrap only
   reads the first field's worth; code longer than this must read
   its remaining parts itself in its first field chunk.

      The second section is the FPGA bitfile data.  96K bytes are
   reserved for it.  It is basically just copied, since both it and
   the ROM are byte oriented.  The one wrinkle here is that the FPGA
   considers dx11 (d0) the most significant bit, but the file is stored
   'normally', so the bits must be flipped during the copy.

      The third section is an image of a SBC6120 RAM disk (a ROM disk
   in this instance!) which can be read using BTS6120 and the OS/8
   Flash ROM driver.  Since a normal SBC6120 RAM disk holds 512K bytes
   and only 384K are available here, the final 128K bytes are truncated
   from the image.  The code checks to ensure that all truncated blocks
   contain only zeros.

BUGS: not very parameterized

---------------------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*-------------------------------------------------------------------------*/

const int BINFLD = 0;	/* starting field (4KB block) of code */
const int BITFLD = 8;	/* starting field (4KB block) of bitfile */
const int ENDFLD = 32;	/* starting field (4KB block) of unused ROM */
const int ROMSIZ =128;	/* total number of 4K blocks in this ROM */

const unsigned CODEBASE = 030000;	/* code address base */


typedef int BOOL;
#define FALSE ((BOOL) 0)
#define TRUE ((BOOL) (~FALSE))

/*-------------------------------------------------------------------------*/

/*
   writeDL() - the output file is in conventional DL/RL/FL format with a
   record size of 256 bytes
*/
static FILE* out;
//char outbuf[BUFSIZ];
static unsigned long pos = 0;
static unsigned short chk = 0;

void writeDL(unsigned char v)
{
	/* if at start of line, write address */
	if (!(pos & 7))
		{
		fprintf(out, "%04o.%03o/ ",
		  (unsigned) (pos >> 8), (unsigned) (pos & 255));
		}

        /* write data, update block checksum */
	fprintf(out, "%03o ", v);
	chk = (chk + v) & 07777;

        /* end the line after 8 bytes */
	++pos;
	if (!(pos & 7))
		fprintf(out, "\r\n");

        /* end the block after 256 bytes */
	if (!(pos & 255))
		{
		fprintf(out, "%04o\r\n", chk);
		chk = 0;
		}
}

/*
   flush() - make sure that the last block is complete
*/
void flush(void)
{
	while (pos & 255)
        	writeDL(0);
}

/*
   readBIN() - read the code file.  This is in DEC binload format
   and it not necessarily in order, so we read into a buffer, then
   convert that into a 2-into-3 format that the BTS6120 UNPACK
   function understands, and write it out.  This routine also
   blocks the output into fields to match the way PACK and UNPACK
   work, and inserts a checksum at reserved location 0200.
*/
void readBIN(FILE* in, unsigned max)
{
	unsigned short* code;
	unsigned short maxaddr = 0, addr = 0200;
	unsigned short n, m, chksum = 0;

	code = (unsigned short*) calloc((size_t) max, sizeof(unsigned short));

	/* skip header, if any */
	while (fgetc(in) != 0200) {}

	while (!feof(in))
		{
		/* read a frame */
		int c2, c1 = fgetc(in);
		switch (c1 & 0300)
			{
		case 0200:	/* leader/trailer */
			break;

		case 0300:	/* field */
			addr = (addr & 07777) | ((c1 & 0070) << 9);
			break;

		default:
			c2 = (c1 << 6) | fgetc(in);
			if ((c1 & 0300) == 0100)	/* offset */
				{
				addr = (addr & 070000) | (c2 & 07777);
				}
			else if (addr < max + CODEBASE)
				{
				if (addr < CODEBASE)
					{
					fprintf(stderr, "Fatal: BIN has code"
							" before field 2!\r\n");
					exit(7);
					}
				else
					{
					if (addr > maxaddr)
						maxaddr = addr;
					code[addr - CODEBASE] = c2;
					++addr;
					}
				}
			else
				{
				fprintf(stderr, "Fatal: BIN exceeds max size"
						" of %u words!\r\n", max);
				exit(5);
				}
			}
		}

	/* calculate a checksum for the initial ROM field and put it
	   in location 0200 */
	code[0200] = 0;
	for (m = 0; m < 2688; ++m)
		chksum += code[m];
	code[0200] = (~chksum + 1) & 07777;

	/* now emit it in 2-in-3 format, accounting for field boundaries.
           output in full fields so that checksum works */

	n = 0;
        for (;;)
		{
		/* put the word out in 2-into-3 format */
		writeDL((unsigned char) (code[n+0] & 0377));
		writeDL((unsigned char) (code[n+1] & 0377));
		writeDL((unsigned char) (((code[n+0] >> 8) & 0017) | ((code[n+1] >> 4) & 0360)) );
                n += 2;

                if ((pos & 4095) == 4032)	/* last 12-bit word in field */
                	{
			while (pos & 4095)
                        	writeDL(0);
                        /* any more fields? */
                        if (n >= maxaddr - CODEBASE)
                        	break;
                        }
		}

	while (pos & 255)
		writeDL(0);

	printf("BIN written - %2u ROM fields\r\n", ((maxaddr - CODEBASE) / 2688) + 1);
}

/*
   readBIT() - read the FPGA bitfile.  This is just a byte stream, and
   all that has to be done is to reverse the bits in each byte.
*/
void readBIT(FILE* in, unsigned long max)
{
        static const size_t FPGA_BUF_SIZE = 32768;
	unsigned long total = 0;  size_t n;
	unsigned char *pbuf;
	unsigned char rev[256];

	pbuf = (char*) malloc(FPGA_BUF_SIZE);
	if (pbuf == NULL) {
	  fprintf(stderr, "unable to allocate FPGA buffer\n");
	  exit(1);
	}
	
        /* build a bit-reversing array.  This is required because
           the FPGA expects the bitfile with b0 as msb. */
	for (n = 0; n < 256; ++n)
		{
		unsigned j = n;
		j = ((j & 0xAA) >> 1) | ((j & 0x55) << 1);
		j = ((j & 0xCC) >> 2) | ((j & 0x33) << 2);
		j = ((j & 0xF0) >> 4) | ((j & 0x0F) << 4);
		rev[n] = (unsigned char) j;
            	}

	while (!feof(in))
		{
		size_t read = fread(pbuf, 1, FPGA_BUF_SIZE, in);
		if (total + read > max)
			{
			fprintf(stderr, "Fatal: BIT exceeds max size"
					" of %u bytes!\r\n", max);
			exit(6);
			}

		for (n = 0; n < read; ++n)
			writeDL(rev[pbuf[n]]);
		total += read;
		if (read < FPGA_BUF_SIZE)
			break;
		}

	printf("BIT written - %2u ROM fields\r\n", (total / 4096) + 1);
}


//   readVMD() reads a SBC6120 RAM disk image (a .VMD file) created by
// WinEight and loads it into the remaining 384K of the flash eprom.
// There are two small issues here - first, although only 384K bytes are
// available a standard OS/8 RAMdisk holds 512K bytes.  This means that
// the final 128K bytes of the VMD image must be truncated - this code
// checks these bytes to ensure that they are all zero and issues a
// warning message if they are not.  The second issue is that of 12 bit
// to 8 bit conversions.  Fortunately we can completely ignore that
// problem here because the WinEight RAM disk emulation has packed the
// bytes into the VMD file using exactly the same algorithm used by
// BTS6120 and the SBC6120.  We can just process the RAM disk image
// byte for byte and it will all come out correct on the other end.
void readVMD (FILE *in, unsigned long max_bytes)
{
  static const size_t VMD_BUF_SIZE = 4096;
  unsigned long bytes_read = 0, bytes_written = 0;
  unsigned char *pbuf;
  BOOL block_empty, error_printed = FALSE;

  pbuf = (char*) malloc(VMD_BUF_SIZE);
  if (pbuf == NULL) {
    fprintf(stderr, "Fatal: unable to allocate VMD buffer\n");
    exit(1);
  }

  while (!feof(in)) {
    size_t n, buf_count = fread(pbuf, 1, VMD_BUF_SIZE, in);

    // See if this block has even one non-zero byte...
    for (block_empty = TRUE, n = 0;  block_empty && (n < buf_count);  ++n)
      if (pbuf[n] != 0) block_empty = FALSE;

    //   If this block is not empty, then we have no choice but to write
    // it out, assuming there's still room left in the ROM.  However, if
    // the block IS empty then we simply increment bytes_read without
    // changing bytes_written.  
    if (!block_empty) {
      //   If, when we get here, bytes_written is less than bytes_read,
      // it means that we've skipped over one or more empty blocks
      // that _weren't_ at the end of the VMD image.  We'll just have
      // to catch up now.
      while ((bytes_written < bytes_read) && (bytes_written < max_bytes)) {
        writeDL(0);  ++bytes_written;
      }
      // Write out the real data from this block.
      for (n = 0;  (n < buf_count) && (bytes_written < max_bytes);  ++n) {
        writeDL(pbuf[n]);  ++bytes_written;
      }
      //   At this point, the only way bytes_written can be less than
      // bytes_read is if the output has been truncated by max_bytes..
      bytes_read += buf_count;
      if (bytes_written < bytes_read) {
        if (!error_printed)
          fprintf(stderr,"Fatal: VMD image too large\n");
	error_printed = TRUE;
      }
    } else
      bytes_read += buf_count;
    if (buf_count < VMD_BUF_SIZE) break;
  }

  printf("VMD written - %2u ROM fields\r\n", (bytes_written / 4096) + 1);
}

/*-------------------------------------------------------------------------*/

int main(int argc, char* argv[])
{
	FILE *inbin = NULL, *inbit = NULL, *invmd = NULL;

	if (argc != 5)
		{
		fprintf(stderr, "usage: MKDLROM <code file name> <FPGA file "
				"name> <VMD file name> <output name>\r\n");
		fprintf(stderr, "  replace file name with '-' to omit\r\n");
		exit(1);
		}

	if (strcmp(argv[1], "-"))
		{
		inbin = fopen(argv[1], "rb");
		if (!inbin)
			{
			fprintf(stderr, "fatal: code binfile %s not found\r\n", argv[1]);
			exit(2);
			}
		}

	if (strcmp(argv[2], "-"))
		{
		inbit = fopen(argv[2], "rb");
		if (!inbit)
			{
			fclose(inbin);
			fprintf(stderr, "fatal: FPGA bitfile %s not found\r\n", argv[2]);
			exit(3);
			}
		}

	if (strcmp(argv[3], "-"))
		{
		invmd = fopen(argv[3], "rb");
		if (!invmd)
			{
			fclose(invmd);
			fprintf(stderr, "fatal: VMD file %s not found\r\n", argv[3]);
			exit(4);
			}
		}

	out = fopen(argv[4], "wb");
	if (!out)
		{
		fclose(inbin);
		fclose(inbit);
		fclose(invmd);
		fprintf(stderr, "fatal: output file %s not opened\r\n", argv[3]);
		exit(5);
		}

//	setbuf(out, outbuf);

	if (inbin)
		{
		readBIN(inbin, BITFLD*2688);
		flush();
		}

	if (inbit)
		{
		pos = ((unsigned long) BITFLD) * 4096L;
		readBIT(inbit, (ENDFLD-BITFLD)*4096);
		flush();
		}

	if (invmd)
		{
		pos = ((unsigned long) ENDFLD) * 4096L;
		readVMD(invmd, (unsigned long) ((ROMSIZ-ENDFLD)*4096L));
		flush();
		}


	if (inbin != NULL) fclose(inbin);
	if (inbit != NULL) fclose(inbit);
	if (invmd != NULL) fclose(invmd);

	return 0;
}

/*-------------------------------------------------------------------------*/
