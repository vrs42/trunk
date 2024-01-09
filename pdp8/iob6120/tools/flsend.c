#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include <fcntl.h>
#include <termios.h>

int main(int argc, const char **argv)
{   FILE *fp;
    int ifd, ofd;
    static char buf[512];
    static struct termios term, oterm;

    ofd = 1;
    ifd = 0;
    if (argc > 2) {
        // Open a connection to the COM port on ifd and ofd.
        ifd = open(argv[2], O_RDWR | O_NOCTTY | O_NDELAY);
        if (ifd == -1) {
            perror(argv[2]);
            return 2;
        }
        fcntl(ifd, F_SETFL, 0);
        ofd = ifd;
        // Set baud rates and such.
        if (tcgetattr(ifd, &term) < 0) {
            perror("tgetattr: ");
            return 2;
        }
        term.c_cflag &= ~CBAUD;     // 9600 baud
        term.c_cflag |= B9600;
        term.c_cflag &= ~CSIZE;     // 8 bits
        term.c_cflag |= CS8;
        term.c_cflag &= ~CSTOPB;    // 1 Stop bit
        term.c_cflag &= ~PARENB;    // No parity
        term.c_cflag |= CLOCAL;     // No modem control
        term.c_cflag |= CREAD;      // Will want to read it
        if (tcsetattr(ifd, TCSADRAIN, &term) < 0) {
            perror("tgetattr: ");
            return 2;
        }
    }
    // Ignore input parity, character at a time.
    if (tcgetattr(ifd, &term) < 0) {
        perror("tgetattr: ");
        return 2;
    }
    oterm = term;
    term.c_lflag &= ~ICANON;    // Character-at-a-time input.
    term.c_iflag |= ISTRIP;     // Ignore input parity bit
    if (tcsetattr(ifd, TCSADRAIN, &term) < 0) {
        perror("tgetattr: ");
        return 2;
    }

    if (!(fp = fopen(argv[1], "r"))) {
        perror(argv[1]);
        tcsetattr(ifd, TCSANOW, &oterm); // Best effort
        return 2;
    }
    // Sync up with the monitor
    printf("\r");
    // Wait for a ">" prompt.
    while (1) {
        if (read(ifd, &buf, 1) < 1) {
            perror("tty read: ");
            tcsetattr(ifd, TCSANOW, &oterm); // Best effort
            return 2;
        }
        if (*buf == '>')
            break;
    }
    // Send the FL command.
    printf("FL\n");
    // Copy out lines until there aren't any more.
    while (1) {
        // Wait for a ":" prompt.
        while (1) {
            if (read(ifd, &buf, 1) < 1) {
                perror("tty read: ");
                tcsetattr(ifd, TCSANOW, &oterm); // Best effort
                return 2;
            }
            if (*buf == ':')
                break;
        }
        // Now send a line.
        if (!fgets(buf, sizeof(buf), fp))
            break;
        printf("%s", buf);
        fputc(':', stderr);     // Output progress indicator on STDERR.
    }
    printf("\n");       // Terminate the loader.
    tcsetattr(ifd, TCSADRAIN, &oterm); // Best effort
    fprintf(stderr, "$\n");     // Output a done indicator on STDERR.
    return 0;
}
