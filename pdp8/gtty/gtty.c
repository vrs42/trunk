/* "GTTY" Glass TTY + Load paper tape software into a PDP-8,

    Vincent Slyngstad, 10/2018
    Version 2.0 - GCC port

    Lyle Bickley, Bickley Consulting West Inc., 1/2014
    Version 0.97

    Jack Rubin, 9/2014
    Version 0.96a -- added visual printout of BELL 

    Copyright 2006 Lyle Bickley

    No warranties expressed or implied.
    Free license for non-commercial use. Please contact
    Bickley Consulting West Inc. for commercial use:
    http://bickleywest.com
*/

#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include "comm.h"
#include "video.h"

static unsigned baudrate[]={_110, _300, _600, _1200, _2400, _4800, _9600, _19200, _38400};
static char *baudtext[]={"110", "300", "600", "1200", "2400", "4800", "9600", "19200", "38400"};

int
main(int argc, char *argv[])
{
    FILE *fhr, *fhc;

    char *p, *ptxt;
    unsigned baud;
#ifdef __MSDOS__
    int port;
#else
    char *port;
#endif
    int c, d, build, found, i, j, skip, sbits, strip, tcr, tspace;
    int com, kbd, savpos, tabpos, tabsiz, crflag, cflag, ctsflag, morech;
    char fname[40+1], lname[40+1], yn[1+1];

    c=cflag=crflag=0; /* Init flags to default */
    d=42;          /* "*" */
    tspace=32;     /* space */
    tcr=141;       /* TTY CR */
    tabsiz=8;      /* default tab size */

    /* Communication Defaults */
#ifdef __MSDOS__
    port=1;
#else
    port="/dev/com1";
#endif
    ctsflag=1; baud=_9600; sbits=STOP_1;

    for (i=1; i<argc; ++i) {
        p=argv[i];
        j = (toupper((int)*p++)<<8); // VRS - Order these two ++ operators.
        switch(j|toupper((int)*p++)) {

#define DASH(c) (('-'<<8)+(c))
            case DASH('B'):
                if (!*p) p = argv[++i];
                if (!p || !*p) {
                    p = "0";
                }
                ptxt=p;
                found=0;
                for (j=0; j<9; ++j) {
                    if(!strcmp(ptxt, baudtext[j])) {
                        baud=baudrate[j];
                        found=1;
                    }
                }
                if(!found) {
                    fprintf(stderr,"Invalid baud rate specified\n");
                    exit(1);
                }
            /*  printf("debug baud=%d\n",baud); */
                break;

            case DASH('C'):
                crflag=1;
                break;

            case DASH('N'):
                ctsflag=0;
                break;

            case DASH('P'):
                if (!*p) p = argv[++i];
                if (!p || !*p) {
                    p = "/dev/ttyUSB0";
                }
#ifdef __MSDOS__
                port=atoi(p);
#else
                port=p;
#endif
                break;

            case DASH('S'):
                if (!*p) p = argv[++i];
                if (!p || !*p) {
                    p = "0";
                }
                switch (atoi(p)) {
                    case 1:
                        sbits=STOP_1;
                        break;
                    case 2:
                        sbits=STOP_2;
                        break;
                    default:
                    fprintf(stderr,"Number of stop bits must be 1 or 2\n");
                    exit(1);
                }
                break;

            case DASH('T'):
                if (!*p) p = argv[++i];
                if (!p || !*p) {
                    p = "0";
                }
                tabsiz=atoi(argv[i]);
                if(!tabsiz) tabsiz=8;
                break;

            case DASH('H'):
                fprintf(stderr, "Usage: %s [-b baud] [-c] [-h] [-n] [-p port] [-s bits] [-t tabsize]\n", argv[0]);
                exit(0);

            default  :
                fprintf(stderr,"Unknown parameter %s\n", argv[i]);
                fprintf(stderr, "Usage: %s [-b baud] [-c] [-h] [-n] [-p port] [-s bits] [-t tabsize]\n", argv[0]);
                exit(1);
        }
    }


    if (Copen(port, baud, PAR_NO|DATA_8|sbits, SET_RTS|SET_DTR|OUTPUT_2)) {
#ifdef __MSDOS__
        fprintf(stderr,"Cannot open COM port %1d\n",port);
#else
        fprintf(stderr,"Cannot open COM port %s\n",port);
#endif
        exit(1);
    }

    disable();
    Cflags |= TRANSPARENT;
    enable();

    vopen();
    vcursor_line();
    vprintf("GTTY (c) Bickley Consulting West Inc. 2006\n");
    vprintf("$Id$\n\n");
    vupdatexy();

    while (1) {

        /* F1 is Help */
        if((kbd=vtstc())==0xff8d) {
            vprintf("\nF1=Help, F2=Upload, F3=Escape PTR, F4=Capture, F5=End Capture,\n");
            vprintf("F6=Clear Screen, F8=Exit\n");
            vupdatexy();
            }

        /* F2 is Load paper tape file to PDP8 */
        if(kbd==0xff8e) {
            build=skip=0;
            morech=1;
            lname[0]=yn[0]=0;
            savpos=V_XY;
            vgets(5,5,"Name of PT file to upload: ",lname,40);
            vgets(5,5,"Skip to clean leader? [Y/N]: ",yn,1);
            if(toupper((int)yn[0])=='Y') skip=1;
            yn[0]=0;
            vgets(5,5,"Output CR before upload? [Y/N]: ",yn,1);
            if(toupper((int)yn[0])=='Y') build=1;
            vcursor_line();
            vgotoxy(savpos&0xff, savpos>>8);
            if (!(fhr=fopen(lname,"rb"))) {
                vprintf("\nCannot access file '%s'!\n",lname);
                vupdatexy();
                morech=0;
            }
            if (skip & morech) {
                vprintf("\nSkipping to clean leader...\n");
                vupdatexy();
                while (c!=0x80) {
                    if((c=fgetc(fhr)) == EOF) {
                        vprintf("\nNo clean (8 punch only) leader found!\n");
                        vupdatexy();
                        c=0x80;
                        morech=0;
                        fclose(fhr);
                    }
                }  
            }

            if(build) {
                Cputc(tcr); /* CR */
                c=Cgetc();  /* Wait for CR */
                c=Cgetc();  /* Wait for ^ */
                Cputc(tcr); /* Another CR */
            }

            while (morech) {
                if ((c=fgetc(fhr)) != EOF) {
                    if(ctsflag) {
                        /* Spin waiting for RDR RUN to set */
                        while(Csignals() != CTS) {
                            /* test for F3 "escape" key */
                            if(vtstc() == 0xff8f) {
                                vprintf("\nEscaped from 'PT reader' wait\n");
                                vupdatexy();
                                goto ptexit;
                            }
                        }      
                    }
                    Cputc(c);
                    /* Spin waiting for slow Rdr Run FF to say not set */
                    if (ctsflag) while(Csignals() == CTS) j=j+1;
                    vputc(d);
                    vupdatexy();
                }
                else {
                   vprintf("\nEnd of file...\n");
                   vupdatexy();
                   morech=0;
                   fclose(fhr);
                }
            }
        }
        ptexit:

        /* F4 is Open Capture File */
        if(kbd==0xff90) {
            fname[0]=0;
            savpos=V_XY;
            vgets(5,5,"Name of Capture file: ", fname, 40);
            yn[0]=strip=0;
            vgets(5,5,"Strip high order bit? [Y/N]: ",yn,1);
            if(toupper((int)yn[0])=='Y') strip=1;
            vcursor_line();
            vgotoxy(savpos&0xff, savpos>>8);
            fhc=fopen(fname, "wb");
            cflag=1;
            if(!fhc) {
                vprintf("\nError opening capture file!\n");
                vupdatexy();
                cflag=0;
            }
        }

        /* F5 is Close Capture File */

        if(kbd==0xff91) {
            if(cflag) {
                fclose(fhc);
                cflag=0;
                vprintf("\nCapture file closed...\n");
                vupdatexy();
            }
        }

        /*F6 is Clear Screen */

        if(kbd==0xff92) vclscr();

        /* F8 is Exit */

        if(kbd==0xff94) {
            vclscr();
            Cclose();
            printf("\nEnd of GTTY session...\n");
            exit(0);
        }

        if(((kbd&0xff00) == 0) && (kbd > 0)) {
            if (kbd == '\r') {
                if (crflag) Cputc('\n' | 0x80); /* LF for non-OS/8 use */
            }
            Cputc(kbd | 0x80);
        }
        else if ((kbd == 0xff8b)|(kbd == 0xff8c))
                Cputc(0xff);               /* DEL or BS = RUBOUT */

        if((com=Ctestc()) != -1) {
            if(cflag) {
                if(strip) com=com & 0x7f; /* Strip high order bit */
                fputc(com, fhc);      /* COMx to capture file */
            } else {
                if((com & 0x7f) == 9) {  /* Is "tab" character? */
                    tabpos=tabsiz - ((V_XY & 0xFF) % tabsiz);  /* Yes */
                    while (tabpos) {
                        vputc(tspace);
                        tabpos--;
                    }
                    vupdatexy();
                } else if((com & 0x7f) == 7) { /* BELL character */
                    vprintf("-BELL-\n");
                    vupdatexy();
                } else {
                    vputc(com & 0x7f); /* char to screen */
                    vupdatexy();
                }
            }
        }
    }
}
