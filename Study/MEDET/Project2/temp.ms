.lf 1 /home/sudarson/Study/MEDET/Project2/5R_Diagram.ms
.EQ 0
delim $$
.EN 0
.nr no-head-numbering 1 \" Uncomment to disable equation/figure/table numbering based on heading
.so /home/sudarson/.config/groff/opening_macros.ms
\#.so /home/sudarson/.config/groff/macros.ms
.
.PS 2.5
r = 0.07
O: circle rad r at (0,0) fill 1 "" "$O$" below
O1: circle rad r at (-2,0) fill 1 "$O sub 1$  " rjust
O2: circle rad r at (2,0) fill 1 "  $O sub 2$" ljust
A: circle rad r at (-3,2.7) fill 1 "$A$   " rjust
B: circle rad r at (3,2.7) fill 1 "   $B$" ljust
P: circle rad r at (0,5.5) fill 1 "$P(x,y)$" "" "" above
H: circle invis rad r at (0,2.7)
line from O1 to A "$l sub 1$   " rjust
line from O2 to B "   $l sub 1$" ljust
line from A to P "$l sub 2$      " rjust
line from B to P "      $l sub 2$" ljust
line dashed 0.2 from H to B "a" below
line dashed 0.2 from H to P "h  " rjust
line <-> from (-2,-1) to (2,-1) "$d$" below

line from O1 down 0.5 right 0.25
line left 0.5
line up 0.5 right 0.25
line invis from end of 3rd last line left 0.03
line down 0.15 left 0.10
line invis up 0.15
line down 0.15 left 0.10
line invis up 0.15
line down 0.15 left 0.10
line invis up 0.15
line down 0.15 left 0.10
line invis up 0.15
line down 0.15 left 0.10

line from O2 down 0.5 right 0.25
line left 0.5
line up 0.5 right 0.25
line invis from end of 3rd last line left 0.03
line down 0.15 left 0.10
line invis up 0.15
line down 0.15 left 0.10
line invis up 0.15
line down 0.15 left 0.10
line invis up 0.15
line down 0.15 left 0.10
line invis up 0.15
line down 0.15 left 0.10

arrow right 1.5 from O "$e under sub x$" below
arrow up 1.5 from O "$e under sub y$ " rjust

line dashed 0.1 right 1 from O1
line invis left 0.5
<- arc rad 0.3
.PE
.so /home/sudarson/.config/groff/closing_macros.ms
.ds CH
.ds CF
.if '\*[.T]'pdf' \X'pdf: switchtopage before here'
.TC
