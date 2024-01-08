
all: cflash.dl fflash.dl flash.dl BTS6120\BTS6120.bin

BTS6120\BTS6120.bin: BTS6120\BTS6120.PLX
	make -C BTS6120

dl: BTS6120\BTS6120.PLX
	make -C BTS6120 dl

ROM\IOB6120.bin: ROM\IOB6120.PLX
	make -C ROM

cflash.dl: ROM\iob6120.bin
	mkdlrom\mkdlrom ROM\iob6120.bin - - cflash.dl

fflash.dl: FPGA\iob.bit
	mkdlrom\mkdlrom - FPGA\iob.bit - fflash.dl

flash.dl: ROM\iob6120.bin FPGA\iob.bit
	mkdlrom\mkdlrom ROM\iob6120.bin FPGA\iob.bit - flash.dl
