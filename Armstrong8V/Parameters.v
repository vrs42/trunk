//++
//parameters.v - PDP-8/V Parameters
//
//                   PDP-8/V PARAMETER DEFINITIONS
//  CONFIDENTIAL - CONTAINS TRADE SECRETS OF SPARE TIME GIZMOS, INC.
//   COPYRIGHT (C) 2007 BY SPARE TIME GIZMOS.  ALL RIGHTS RESERVED.
//
// REVISION HISTORY:
// 30-Jun-07  RLA  New file.
//  8-Jul-07  RLA  Add LEFT_SR and LEFT_FLAGS 
//--
//000000011111111112222222222333333333344444444445555555555666666666677777777778
//345678901234567890123456789012345678901234567890123456789012345678901234567890
`timescale 1ns / 1ps


// General parameters ...
`define ADDRESS_WIDTH		0:11	// width of the address bus
`define FIELD_WIDTH		0:2	// width of the EMA address extension
`define DATA_WIDTH		0:11	//   "   "   "  data bus


// ALU function codes ...
`define ALU_LEFT		3'O0	// the output equals the left input
`define ALU_LEFT_PLUS_ONE	3'O1	//  ... the left input plus one 
`define ALU_RIGHT		3'O2	//  ... the right input
`define ALU_RIGHT_PLUS_ONE	3'O3	//  ... the right input plus one
`define ALU_LEFT_AND_RIGHT	3'O4	//  ... bitwise AND of left and right
`define ALU_LEFT_OR_RIGHT	3'O5	//  ... bitwise OR of left and right
`define ALU_LEFT_PLUS_RIGHT	3'O6	//  ... arithmetic sum of left and right
`define ALU_FUNCTION_WIDTH	0:2	// width of the ALU control bus


// Shift/Rotate function codes ...
//   These MUST correspond EXACTLY to bits 8:10 of the OPR1 micro instruction!
`define BYTE_SWAP		3'B001	// swap left and right six bit bytes
`define ROTATE_LEFT		3'B010	// rotate {AC,LINK} one bit left
`define ROTATE_LEFT_TWICE	3'B011	//  ... two bits
`define ROTATE_RIGHT		3'B100	// rotate {AC,LINK} one bit right
`define ROTATE_RIGHT_TWICE	3'B101	//  ... two bits
`define ROTATE_THREE_LEFT	3'B110	// rotate AC only 3 bits left
`define ROTATE_FUNCTION_WIDTH	0:2	// width of the ROTATE control bus


// AC/Link function codes ...
//   These MUST correspond EXACTLY to bits 4:7 of the OPR1 micro instruction!
`define CLEAR_AC		4'B1000	// clear the AC
`define CLEAR_LINK		4'B0100	// clear the link
`define COMPLEMENT_AC		4'B0010	// complement the AC
`define COMPLEMENT_LINK		4'B0001	// complement the link
`define AC_FUNCTION_WIDTH	0:3	// width of the AC FUNCTION bus


// Selection codes for the ALU Left Data Bus ...
`define LEFT_IO			4'O00	// Left ALU source is the device I/O bus
`define LEFT_PC			4'O01	//   ... the program counter
`define LEFT_MQ			4'O02	//   ... the multiplier quotient
`define LEFT_EA			4'O03	//   ... effective address calculation
`define LEFT_MA			4'O04	//   ... the memory address register
`define LEFT_MD			4'O05	//   ... the memory data bus
`define LEFT_MB			4'O06	//   ... the memory data buffer
`define LEFT_SR			4'O07	//   ... the switch regiter
`define LEFT_FLAGS		4'O10	//   ... the flags register
`define LEFT_UNUSED		4'O17	// unused
`define LEFT_SOURCE_WIDTH	0:3	// width of the LEFT SOURCE bus 


// State codes for the timing generator ...
`define FETCH_1		17'b00000000000000001	// read the opcode from memory
`define FETCH_1X	17'bxxxxxxxxxxxxxxxx1
`define FETCH_2		17'b00000000000000010	// increment the PC
`define FETCH_2X	17'bxxxxxxxxxxxxxxx1x
`define FETCH_3		17'b00000000000000100	// read the operand for MRIs
`define FETCH_3X	17'bxxxxxxxxxxxxxx1xx
`define DEFER_1		17'b00000000000001000	// fetch an indirect address
`define DEFER_1X	17'bxxxxxxxxxxxxx1xxx
`define AUTOINDEX_1	17'b00000000000010000	// increment an AI location
`define AUTOINDEX_1X	17'bxxxxxxxxxxxx1xxxx
`define AUTOINDEX_2	17'b00000000000100000	// write the AI register back to memory
`define AUTOINDEX_2X	17'bxxxxxxxxxxx1xxxxx
`define AUTOINDEX_3	17'b00000000001000000	// read the operand for MRIs
`define AUTOINDEX_3X	17'bxxxxxxxxxx1xxxxxx
`define EXECUTE_1	17'b00000000010000000	// execute all opcodes, part 1
`define EXECUTE_1X	17'bxxxxxxxxx1xxxxxxx
`define EXECUTE_2	17'b00000000100000000	//  "   "   "   "   "    "   2
`define EXECUTE_2X	17'bxxxxxxxx1xxxxxxxx
`define INTERRUPT_1	17'b00000001000000000	// interrupt acknowledge cycle
`define INTERRUPT_1X	17'bxxxxxxx1xxxxxxxxx
`define HALTED_1	17'b00000010000000000	// CPU halted
`define HALTED_1X	17'bxxxxxx1xxxxxxxxxx
`define START_1		17'b00000100000000000 // "Clear" during START
`define START_1X	17'bxxxxx1xxxxxxxxxxx
`define LADDR_1		17'b00001000000000000 // Load Address, (PC, DF, IF)
`define LADDR_1X	17'bxxxx1xxxxxxxxxxxx
`define EXAM_1		17'b00010000000000000 // Examine Memory part 1
`define EXAM_1X 	17'bxxx1xxxxxxxxxxxxx
`define EXAM_2		17'b00100000000000000 // Examine Memory part 2
`define EXAM_2X 	17'bxx1xxxxxxxxxxxxxx
`define DEP_1		17'b01000000000000000 // Deposit to Memory part 1
`define DEP_1X  	17'bx1xxxxxxxxxxxxxxx
`define DEP_2		17'b10000000000000000 // Deposit to Memory part 2
`define DEP_2X  	17'b1xxxxxxxxxxxxxxxx
`define STATE_CODE_WIDTH	0:16  // width of the current state register


//   Define mnemonics for the bit patterns used by various PDP-8 opcodes and
// addressing modes.  Note that the OP_xyz symbols are three bit values
// intended for direct comparison with Opcode[0:2], and the OPX_xyz symbols
// are 12 bit values with "don't care's" for use in "casex" statements.
//
//   You'd like to be able to say something like "if (Opcode == `OPX_JMP) ..."
// but this generates warnings from synthesis about how "x" values always
// compare as false.  Hence the two separate versions of the constants.
`define OPX_AND	      12'b000xxxxxxxxx	// LOGICAL AND
`define  OP_AND	       3'b000		//  ...
`define OPX_TAD	      12'b001xxxxxxxxx	// BINARY ADD
`define  OP_TAD	       3'b001		//  ...
`define OPX_ISZ	      12'b010xxxxxxxxx	// INCREMENT AND SKIP IF ZERO
`define  OP_ISZ	       3'b010		//  ...
`define OPX_DCA	      12'b011xxxxxxxxx	// DEPOSIT AND CLEAR THE AC
`define  OP_DCA	       3'b011		//  ...
`define OPX_JMS	      12'b100xxxxxxxxx	// JUMP TO SUBROUTINE
`define  OP_JMS	       3'b100		//  ...
`define OPX_JMP	      12'b101xxxxxxxxx	// JUMP
`define  OP_JMP	       3'b101		//  ...
`define OPX_JMPD      12'b1010xxxxxxxx	// JUMP, with direct addressing
`define  OP_JMPD       4'b1010		//  ...
`define OPX_JMPI      12'b1011xxxxxxxx	// JUMP, with indirect address
`define  OP_JMPI       4'b1011		//  ...
`define OPX_IOT	      12'b110xxxxxxxxx	// INPUT/OUTPUT TRANSFER
`define  OP_IOT	       3'b110		//  ...
`define  OP_OPR	       3'b111		// OPERATE
`define OPX_OPR1      12'b1110xxxxxxxx	//  OPERATE, group 1
`define OPX_OPR2      12'b1111xxxxxxx0	//  OPERATE, group 2
`define OPX_OPR3      12'b1111xxxxxxx1	//  OPERATE, group 3
`define OPX_ANY	      12'bxxxxxxxxxxxx	// matches _any_ instruction!


// These IOTs are internal to the -8 CPU ...
`define OP_SKON		12'O6000	// skip if interrupt system is on
`define OP_ION		12'O6001	// turn interrupt system on (enable)
`define OP_IOF		12'O6002	//  "    "    "      "   off (disable)
`define OP_SRQ		12'O6003	// skip if interrupt request
`define OP_GTF		12'O6004	// get current flags to AC
`define OP_RTF		12'O6005	// restore flags from AC
`define OP_SGT		12'O6006	// skip on greater than flag (EAE)
`define OP_CAF		12'O6007	// clear all flags and I/O devices
`define OP_WSR		12'O6246	// load the switch register
