#include <stdlib.h>
#include <stdarg.h>
#include <curses.h>
#include "video.h"

int V_XY;
#define xy(x, y) (((y)<<8) + x)

void
myexit()
{
  endwin();
}

void
vopen()
{
  initscr();
  keypad(stdscr, 1);
  noecho();
  raw();
  nonl();  // ENTER (or ^M) is different from ^J
  scrollok(stdscr, 1);
  nodelay(stdscr, 1);
  atexit(myexit);
}

void vgotoxy(int x, int y);

void
vclscr()
{
  vgotoxy(0, 0);
  clear();
  refresh();
}

// vprintf() is aliased to v_printf() in the include file.
// (This avoids a naming conflict.)
// BUGBUG: This converts \r\n sequences to \n\r.
//         This works around the newline behavior of printw.
int
v_printf(char *fmt, ...)
{
  int x, y, ret;
  va_list args;
  va_start(args, fmt);

  ret = vw_printw(stdscr, fmt, args);
  getyx(stdscr, y, x);
  V_XY = xy(x, y);
  va_end(args);
  return ret;
}

void
vcursor_line()
{
  curs_set(1);	// Makes sure the cursor is visible.
}

// It turns out we don't need vgetc().

int
vgets(x, y, prompt, field, width)
int x, y, width;
char *prompt, *field;
{
  move(x, y);
  // BUGBUG: Don't bother with box subwindow here.
  //box(stdscr, '|', '-');
  move(x, y); // redundant
  printw(prompt);
  echo();
  noraw();
  nodelay(stdscr, 0);
  if (getnstr(field, width) != OK) {
    noecho();
    raw();
    nodelay(stdscr, 1);
    return 1;
  }
  noecho();
  raw();
  nodelay(stdscr, 1);
  vclscr();
  return 0;
}

void
vputc(chr)
char chr;
{
  int x, y;

  switch (chr) {
    case '\n':
      // Special case to get LF behavior, not NL.
      getyx(stdscr, y, x);
      if (move(y+1, x) == ERR) {
        scroll(stdscr);
        move(y, x);
      }
      break;
    case '\b':
    case '\r':
      addch(chr);
    default:
      if (chr >= ' ')
        addch(chr);
  }
  getyx(stdscr, y, x);
  V_XY = xy(x, y);
}

int
vtstc()
{
  int ch;

  ch = getch();
  if (ch == ERR)
    return 0;

// mvprintw(23, 0, "0%04o", ch); vupdatexy();

  // The keypad is enabled, so recognise and translate the function keys.
  switch (ch) {
    case KEY_UP:
      return _KUA;
    case KEY_DOWN:
      return _KDA;
    case KEY_LEFT:
      return _KLA;
    case KEY_RIGHT:
      return _KRA;
    case KEY_NPAGE:
      return _KPD;
    case KEY_PPAGE:
      return _KPU;
    case KEY_HOME:
      return _KHO;
    case KEY_END:
      return _KEN;
    case KEY_IC:
      return 0200;
    case KEY_DC:
      return _KBS;
    case KEY_BACKSPACE:
      return '\b';
    case KEY_F(1):
      return _K1;
    case KEY_F(2):
      return _K2;
    case KEY_F(3):
      return _K3;
    case KEY_F(4):
      return _K4;
    case KEY_F(5):
      return _K5;
    case KEY_F(6):
      return _K6;
    case KEY_F(7):
      return _K7;
    case KEY_F(8):
      return _K8;
    case KEY_F(9):
      return _K9;
    case KEY_F(10):
      return _K10;
    default:
      return ch;
  }
}


void
vgotoxy(x, y)
int x, y;
{
  move(0, 0);
  V_XY = xy(0, 0);
}

void
vupdatexy()
{
  move(V_XY >> 8, V_XY&0xFF);
  refresh();
}
