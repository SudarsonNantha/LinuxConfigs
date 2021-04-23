.EQ
delim $$
.EN
.PS 3.5
r = 0.06
linethick = 1.5
O: circle rad r at (0,0) fill 1 "" "" "$size +5 O$" below
A1: circle rad r at (-2,0) fill 1 "$size +5 A sub 1$  " rjust
B1: circle rad r at (2,0) fill 1 "" "    $size +5 B sub 1$" ljust below
A2: circle rad r at (-3,2.7) fill 1 "  $size +5 A sub 2$" "" "" ljust above
B2: circle rad r at (3,2.7) fill 1 "   $size +5 B sub 2$" ljust
P: circle rad r at (0,5.5) fill 1 "$P(x,y)$   " rjust
H: circle invis rad r at (0,2.7) "$H$  " rjust
line from A1 to A2 "$size +5 l sub 1$   " rjust
line from B1 to B2 "   $size +5 l sub 1$" ljust
line from A2 to P "$size +5 l sub 2$      " rjust
line from B2 to P "      $size +5 l sub 2$" ljust

linethick = 1
line dashed 0.2 from H to B2 "a" below
line dashed 0.2 from H to P "h  " rjust

linethick = 0.5
line <-> from (-2,-1) to (2,-1) "$d$" below
line from A1 down 0.5 right 0.25
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

line from B1 down 0.5 right 0.25
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

line dashed right 1 from A1
move left 0.6; move up 0
arc rad 0.6 <->
move right 0.3;
box invis "$q sub A1$"

line dashed right 1 from B1
move left 0.15; move up 0
arc rad 0.6 <->
move right 0.3;
box invis "$q sub B1$"

move to A2
line dashed up 0.7 left 0.3
move down 0.35 right 0.15
arc from (-3.5,2.7) to (-2.5,2.7)
arc cw rad 0.5 from (-3.5,2.7) to (-3.2,3.17) ->
arc rad 0.5 from (-2.5,2.7) to (-2.6,3) ->
box invis "$q sub A2$" at (-3.7, 2.3)

move to B2
line dashed up 0.7 right 0.3
move down 0.2 left 0.1
arc rad 0.4 to (2.6,3.1) <->
box invis "$q sub B2$" at (2.8,3.6)

move to P
line dashed up 0.7 left 0.7
move to P
line dashed up 0.7 right 0.7
move down 0.35 left 0.35
arc rad 0.4 to (-0.35,5.85) <->
box invis "$q sub P$" at (0,6.35)
.PE
