// To get these to print the fine features created
// by the "text" command, I set "Outer wall" to
// 0.22mm. (Not really needed here, as the size of
// the text is quite large.)

inch = 25.4; // mm
$fn=50;
thick = 0.5; // mm
size = inch/2; 

// The basic decal without text.
color ("black") cube ([inch, inch, thick]);

// Put a bird on it.
color ("white")
  translate ([inch/2, inch/2, thick])
  linear_extrude(height=thick)
  text ("2", font=":style=Bold", size=size, valign="center", halign="center");
