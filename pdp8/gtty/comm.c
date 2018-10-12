#include "comm.h"
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <errno.h>
#include <fcntl.h>
#include <stdlib.h>
#include <termios.h>

char Cflags;

static int cfd = -1;	// Current file handle
static struct termios config;

//
// The comm.c module implements functions related to opening 
// and performing I/O on COM ports.
//

int
Copen(port, speed, mode, modem)
int port, speed, mode, modem;
{
  char *fname;
  const int speeds[] = {
    _110,  _300,   _600,   _1200,  _2400,  _4800,
    _9600, _19200, _38400, _57600, _115200 };
  const int bauds[] = {
    B110,  B300,   B600,   B1200,  B2400,  B4800,
    B9600, B19200, B38400, B57600, B115200 };
  int baud, i;

  // Get File Handle
  switch (port) {
    case 1:
      fname = "/dev/com1";
      break;
    case 2:
      fname = "/dev/com2";
      break;
    case 3:
      fname = "/dev/com3";
      break;
    case 4:
      fname = "/dev/com4";
      break;
    default:
      return ERANGE;	// Invalid port number
  }
  cfd = open(fname, O_RDWR|O_NOCTTY);
  if (cfd < 0)
    return errno;
  if (!isatty(cfd))
    return ERANGE;

  // Set Baud Rate
  baud = 0;
  for (i = 0; i < sizeof(speeds)/sizeof(*speeds); i++) {
    if (speeds[i] == speed) {
      baud = bauds[i];
      break;
    }
  }
  if (baud == 0)
    return ERANGE;
  if (tcgetattr(cfd, &config) < 0)
    return errno;
  if (cfsetispeed(&config, baud) < 0)
    return errno;
  if (cfsetospeed(&config, baud) < 0)
    return errno;

  // set mode stuff
  config.c_cflag &= ~PARENB;	// BUGBUG: PAR_NO assumed
  config.c_cflag &= ~CSIZE;	// BUGBUG: DATA_8 assumed
  config.c_cflag |= CS8;
  if (mode & STOP_2)
    config.c_cflag |= CSTOPB;
  else
    config.c_cflag &= ~CSTOPB;
  if (tcsetattr(cfd, TCSANOW, &config) < 0)
    return errno;

  // Set modem stuff
  i = TIOCM_RTS | TIOCM_DTR;	// BUGBUG SET_RTS and SET_DTR assumed
  if (ioctl(cfd, TIOCMBIS, &i) < 0)
    return errno;
  return 0;			// Success!
}

void
Cclose()
{
  close(cfd);
  cfd = -1;
}

int
Cgetc()
{
  char buf;
  if (read(cfd, &buf, 1) < 0)
    return -1;
  return buf;
}

void
Cputc(c)
char c;
{
  if (write(cfd, &c, 1) < 0)
    abort();
}

int
Ctestc()
{
  char buf;
  int flags;

  // Set nodelay.
  if (fcntl(cfd, F_GETFL, &flags) < 0)
    return -1;
  if (fcntl(cfd, F_SETFL, flags|O_NDELAY) < 0)
    return -1;
  // Try to read a character.
  if (read(cfd, &buf, 1) < 0)
    buf = -1;
  // Unset nodelay.
  if (fcntl(cfd, F_SETFL, flags) < 0)
    abort();
  return buf;
}

int
Csignals()
{
  int i;
  // BUGBUG: The caller checks == for CTS, so must 
  //         not return other bits.
  i = 0;
  if (ioctl(cfd, TIOCMGET, &i) < 0)
    return 0;
  if (i & TIOCM_CTS)
    return CTS;
  return 0;
}

void
disable()
{
}

void
enable()
{
  // BUGBUG: Should implement changes to Cflags here!
  // Currently, we just assume that TRANSPARENT is
  // meant to be set.
  // BUGBUG: No way exists yet to unset the effects of TRANSPARENT.
  config.c_lflag = config.c_iflag = config.c_oflag = 0;
  if (tcsetattr(cfd, TCSANOW, &config) < 0)
    abort();
}
