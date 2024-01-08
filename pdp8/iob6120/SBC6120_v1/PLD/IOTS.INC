/*   This one file defines the opcodes for all the SBC6120 IOTs.  It's	*/
/* included by the PLD files for both IOT GALS, and allows the opcodes	*/
/* to be defined in a single place.  Since the address inputs to the	*/
/* two GALs aren't the same, all IOT codes are defined in terms of base	*/
/* device codes (e.g. IOT_603X) and each IOT GAL source file can then	*/
/* define these as appropriate.						*/

/* Console terminal IOTs (codes 603x and 604x) ... */
KSF = (IOT_603X & !MA9 & !MA10 &  MA11);	/* 6031 */
KCC = (IOT_603X & !MA9 &  MA10 & !MA11);	/* 6032 */
KRS = (IOT_603X &  MA9 & !MA10 & !MA11);	/* 6034 */
KRB = (IOT_603X &  MA9 &  MA10 & !MA11);	/* 6036 */
TSF = (IOT_604X & !MA9 & !MA10 &  MA11);	/* 6041 */
TCF = (IOT_604X & !MA9 &  MA10 & !MA11);	/* 6042 */
TPL = (IOT_604X &  MA9 & !MA10 & !MA11);	/* 6044 */
TLS = (IOT_604X &  MA9 &  MA10 & !MA11);	/* 6046 */

/* System IOTs (codes 641x) ... */
LDAR = (IOT_641X & !MA9 & !MA10 & !MA11);	/* 6410 */
SDRQ = (IOT_641X & !MA9 & !MA10 &  MA11);	/* 6411 */

