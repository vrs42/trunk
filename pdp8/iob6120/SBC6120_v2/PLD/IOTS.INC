/*   This one file defines the opcodes for all the SBC6120 IOTs.  It's	*/
/* included by the PLD files for both IOT GALS, and allows the opcodes	*/
/* to be defined in a single place.  Since the address inputs to the	*/
/* two GALs aren't the same, all IOT codes are defined in terms of base	*/
/* device codes (e.g. IOT_603X) and each IOT GAL source file can then	*/
/* define these as appropriate.						*/

/* Console terminal IOTs (codes 603x/636x and 604x/637x) ... */
KSF = (IOT_SLU_IN  & !MA9 & !MA10 &  MA11);	/* 6031/6361 */
KCC = (IOT_SLU_IN  & !MA9 &  MA10 & !MA11);	/* 6032/6362 */
KRS = (IOT_SLU_IN  &  MA9 & !MA10 & !MA11);	/* 6034/6364 */
KRB = (IOT_SLU_IN  &  MA9 &  MA10 & !MA11);	/* 6036/6366 */
TSF = (IOT_SLU_OUT & !MA9 & !MA10 &  MA11);	/* 6041/6371 */
TCF = (IOT_SLU_OUT & !MA9 &  MA10 & !MA11);	/* 6042/6372 */
TPL = (IOT_SLU_OUT &  MA9 & !MA10 & !MA11);	/* 6044/6374 */
TLS = (IOT_SLU_OUT &  MA9 &  MA10 & !MA11);	/* 6046/6376 */

/* System IOTs (codes 641x) ... */
LDAR   = (IOT_641X & !MA9 & !MA10 & !MA11);	/* 6410 */
SDASP  = (IOT_641X & !MA9 & !MA10 &  MA11);	/* 6411 */
/*PRISLU = (IOT_641X & !MA9 &  MA10 & !MA11);*/	/* 6412 */
/*SECSLU = (IOT_641X & !MA9 &  MA10 &  MA11);*/	/* 6413 */
SBBLO  = (IOT_641X &  MA9 & !MA10 &  MA11);	/* 6415 */