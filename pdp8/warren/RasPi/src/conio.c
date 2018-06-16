/**
 Linux (POSIX) implementation of _kbhit().
 Morgan McGuire, morgan@cs.brown.edu
 */
#include <stdio.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <sys/select.h>
#include <termios.h>
#include <stropts.h>

struct termios term;
static const int STDIN = 0;
static int initialized = 0;

void
kbhit_cleanup()
{
    if (initialized) {
        tcgetattr(STDIN, &term);
        term.c_lflag |= ICANON;
        term.c_lflag |= ECHO;
        tcsetattr(STDIN, TCSANOW, &term);
        initialized = 0;
    }
}

int
_kbhit()
{
    if (! initialized) {
        // Use termios to turn off line buffering
        tcgetattr(STDIN, &term);
        term.c_lflag &= ~ICANON;
        tcsetattr(STDIN, TCSANOW, &term);
        setbuf(stdin, NULL);
        atexit(kbhit_cleanup);
        initialized = 1;
    }

    int bytesWaiting;
    ioctl(STDIN, FIONREAD, &bytesWaiting);
    return bytesWaiting;
}

int
_getch()
{
    int ch;

    (void) _kbhit(); /* Force initialization */
    tcgetattr(STDIN, &term);
    term.c_lflag &= ~ECHO;
    tcsetattr(STDIN, TCSANOW, &term);
    ch = getchar();
    tcgetattr(STDIN, &term);
    term.c_lflag |= ECHO;
    tcsetattr(STDIN, TCSANOW, &term);
    return ch;
}
