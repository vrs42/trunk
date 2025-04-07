// To get these to print the fine features created
// by the "text" command, I set "Outer wall" to
// 0.22mm. (Not really needed here, as the size of
// the text is quite large.)

inch = 25.4; // mm
$fn=50;
thick = 0.5; // mm
size = inch/2; 

module label(text) {
// The basic decal without the text.
color ("black") cube ([inch, inch, thick]);

// Put a bird on it.
color ("white")
  translate ([inch/2, inch/2, thick])
  linear_extrude(height=thick)
  text (text=text, font=":style=Bold", size=size, valign="center", halign="center");
}

translate ([1.1*inch*0, 0, 0]) label("1");
translate ([1.1*inch*1, 0, 0]) label("2");
translate ([1.1*inch*2, 0, 0]) label("3");