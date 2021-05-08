.EQ
delim $$
.EN
.EQ
define t1 'theta sub 1'
define t2 'theta sub 2'
define s1 'sin t1'
define s2 'sin t2'
define s12 'sin ( t1 + t2 )'
define s1_2 'sin sup 2 t1'
define s2_2 'sin sup 2 t2'
define s12_2 'sin sup 2 ( t1 + t2 )'
define c1 'cos t1'
define c2 'cos t2'
define c12 'cos ( t1 + t2 )'
define c1_2 'cos sup 2 t1'
define c2_2 'cos sup 2 t2'
define c12_2 'cos sup 2 ( t1 + t2 )'
define A1 'A sub 1'
define A2 'A sub 2'
define B1 'B sub 1'
define B2 'B sub 2'
define l1 'l sub 1'
define l2 'l sub 2'
define l3 'l sub 3'
define l4 'l sub 4'
define l0 'l sub 0'
define qa1 'q sub {A 1}'
define qb1 'q sub {B 1}'
define qa2 'q sub {A 2}'
define qb2 'q sub {B 2}'
define qp 'q sub P'
define ca1 'cos qa1'
define sa1 'sin qa1'
define ca2 'cos qa2'
define sa2 'sin qa2'
define ca12 'cos ( qa1 + qa2 )'
define sa12 'sin ( qa1 + qa2 )'
define cb1 'cos qb1'
define sb1 'sin qb1'
define cb2 'cos qb2'
define sb2 'sin qb2'
define cb12 'cos ( qb1 + qb2 )'
define sb12 'sin ( qb1 + qb2 )'
define ua1 'u bar sub {A 1}'
define ua2 'u bar sub {A 2}'
define ub1 'u bar sub {B 1}'
define ub2 'u bar sub {B 2}'
define Emat 'left [ matrix { ccol {0 above 1} ccol {-1 above 0} } right ]'
.EN
.EQ
define cancel 'special Ca'
.EN
.de Ca
.ds 0s \
\Z'\\*(0s'\
\v'\\n(0du'\
\D'l \\n(0wu -\\n(0hu-\\n(0du'\
\v'\\n(0hu'
..
.EQ
define box 'special Bx'
.EN
.de Bx
.  ds 0s \
\Z'\h'1n'\\*(0s'\
\Z'\
\v'\\n(0du+1n'\
\D'l \\n(0wu+2n 0'\
\D'l 0 -\\n(0hu-\\n(0du-2n'\
\D'l -\\n(0wu-2n 0'\
\D'l 0 \\n(0hu+\\n(0du+2n'\
'\
\h'\\n(0wu+2n'
.  nr 0w +2n
.  nr 0d +1n
.  nr 0h +1n
..
.nr no-head-numbering 1 \" Uncomment to disable equation/figure/table numbering based on heading
.so /home/sudarson/.config/groff/opening_macros.ms
.head "2R Mechanism"
.PS 3
A: circle invis at (0,0)
C: circle invis at (1,0.8)
G: circle invis at (0.4,1.6)

B: circle invis at (-0.065,0.076)
D: circle invis at (0.941,0.881)
E: circle invis at (0.052, -0.085)
F: circle invis at (1.06,0.72)

H: circle invis at (0.48,1.659)
I: circle invis at (1.082,0.857)
J: circle invis at (0.329,1.529)
K: circle invis at (0.917,.744)

line from B to D "$l1$   " "" above
line from E to F
line from H to I
line from J to K "$l2$" rjust below

arc rad 0.1 from B to E
arc rad 0.1 from H to J
arc rad 0.1 from K to I

move to D
line down 0.057 right -0.072 color "white" thickness 1

circle rad 0.01 fill 1 at A
circle rad 0.01 fill 1 at C
circle rad 0.01 fill 1 at G

line dashed from A to C
line dashed up 0.3 right 0.36
line dashed from C to G

line up 2 from A ->
line right 2 from A ->
circle invis "$x$" at (1.9,-0.15)
circle invis "$y$" at (-0.15,1.9)

T1: circle invis rad 0.01 at (0.6,0)
T2: circle invis rad 0.01 at (0.45,0.355)
arc from T1 to T2 <-> width 0.03 height 0.05
move to T2
circle invis "$theta sub 1$" at (0.7,0.2)

T3: circle invis rad 0.01 at (1.24,1)
T4: circle invis rad 0.01 at (0.775,1.1)
arc from T3 to T4 <-> width 0.03 height 0.05
circle invis "$theta sub 2$" at (1,1.3)

circle invis "$A$" at (-0.15,-0.1)
circle invis "$B$" at (1.17,0.8)
circle invis "$C$" at (0.35,1.77)

.PE
.head 2 "Direct Geometric Model"
.EQ
x = l1 c1 + l2 c12
~~~~~
y = l1 s1 + l2 s12
.EN
.head "5-bar Mechanism"
.head 2 "Defining the problem"
.PS 3.5
r = 0.06
linethick = 1.5
O: circle rad r at (0,0) fill 1 "" "" "$size +5 O$" below
A1: circle rad r at (-2,0) fill 1 "$size +5 A1$  " rjust
B1: circle rad r at (2,0) fill 1 "" "    $size +5 B1$" ljust below
A2: circle rad r at (-3,2.7) fill 1 "  $size +5 A2$" "" "" ljust above
B2: circle rad r at (3,2.7) fill 1 "   $size +5 B2$" ljust
P: circle rad r at (0,5.5) fill 1 "$size +5 P(x,y)$   " rjust
H: circle invis rad r at (0,2.7) "$H$  " rjust
line from A1 to A2 "$size +5 l1$   " rjust
line from B1 to B2 "   $size +5 l3$" ljust
line from A2 to P "$size +5 l2$      " rjust
line from B2 to P "      $size +5 l4$" ljust
line from A1 to B1

linethick = 1
line dashed 0.2 from H to B2 "a" below
line dashed 0.2 from H to P "h  " rjust

linethick = 0.5
line <-> from (-2,-1) to (2,-1) "$l0$" below
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

move to O; move up 0.7
arrow right 1 "$e under sub x$" below
move to O; move up 0.7
arrow up 1 "$e under sub y$ " rjust

line dashed right 1 from A1
move left 0.6; move up 0
arc rad 0.6 <->
move right 0.3;
box invis "$qa1$"

line dashed right 1 from B1
move left 0.15; move up 0
arc rad 0.6 <->
move right 0.3;
box invis "$qb1$"

move to A2
line dashed up 0.7 left 0.3
move down 0.35 right 0.15
arc from (-3.5,2.7) to (-2.5,2.7)
arc cw rad 0.5 from (-3.5,2.7) to (-3.2,3.17) ->
arc rad 0.5 from (-2.5,2.7) to (-2.6,3) ->
box invis "$qa2$" at (-3.7, 2.3)

move to B2
line dashed up 0.7 right 0.3
move down 0.2 left 0.1
arc rad 0.4 to (2.6,3.1) <->
box invis "$qb2$" at (2.8,3.6)

move to P
line dashed up 0.7 left 0.7
move to P
line dashed up 0.7 right 0.7
move down 0.35 left 0.35
arc rad 0.4 to (-0.35,5.85) <->
box invis "$q sub P$" at (0,6.35)
.PE
.PP
Consider the 5 bar mechanism shown above such that the viewer is seeing the top view of the mechanism. It consits of two active links of length $l1$ and $l3$, two passive links $l2$ and $l4$, as well as a fixed link $l0$. These links are connected with revolute joints $A1 ,  A2 , B1 , B2 ,$ and $P$. The origin of the mechanism is at $O$ and the end effector is assumed to be situated at $P$.
.PP
Also consider a point $H$ positioned on the y-axis, and at the same height as $A1$ and $A2$. This point is part of a right angle triangle $\[*D] P H B2$ of height $h$ and base $a$.
.head 2 "Direct Geometric Model"
The position $P(x,y)$ can be expressed in vector form as the sum of all the vectors from $O$ to $P$.
.EQ I
{OP} bar ~=~ {O B1} bar ~+~ {B2 H} bar ~+~ {H P} bar
.EN
.PP
First, in order to determine the co-ordinates of point $H$,
.EQ I
{O A2} bar ~=~ l1 ~ left [ pile {ca1 - d smallover 2 above sa1} right ]
~~~~~~~~~~~~~~~~~~
{O B2} bar ~=~ l3 ~ left [ pile {cb1 + d smallover 2 above sb1} right ]
.EN
.PP
So the co-ordinates of $H$ are:
.EQ I
H bar ~=~ 1 over 2 ~ left [ pile { l1 ca1 + l3 cb1 above l1 sa1 + l3 sb1 } right ]
.EN
.PP
${B2 H} bar$ can be expressed as follows:
.EQ I
{B2 H} bar ~=~ left [ pile { 1 smallover 2 ( l1 ca1 + l3 cb1 ) - l3 cb1 - lo smallover 2 above 1 smallover 2 ( l1 sa1 + l3 sb1 ) - l3 sb1 } right ]
~~=~~
left [ pile { 1 smallover 2 ( l1 ca1 - l3 cb1 ) - lo smallover 2 above 1 smallover 2 ( l1 sa1 - l3 sb1 } right ]
.EN
.PP
${H P} bar$ can be found as:
.EQ I
{H P} bar ~=~ tan sup -1 left ( h over a right ) ~left [ matrix { ccol {0 above 1} ccol {-1 above 0} } right ] ~ {B2 H} bar
~~= tan sup -1 left ( h over a right ) ~
left [ pile { 1 smallover 2 ( l3 sb1 - l1 sa1 ) above 1 smallover 2 ( l1 ca1 + l3 cb1 ) - l0 smallover 2} right ]
.EN
.PP
${O B1} bar$ and ${B1 B2} bar$ can be trivially found as,
.EQ
{O B1} bar = left [ pile { l0 smallover 2 above 0 } right ]
~~~~~~~
{B1 B2} bar = left [ pile { l3 cb1 above l3 sb1 } right ]
.EN
.PP
Adding all of these equations, we obtain ${O P}$,
.EQ 0 I
{O P} bar ~=~ left [ pile { lo smallover 2 above 0 } right ]~+~
left [ pile { l3 cb1 above l3 sb1 } right ] ~+~
left [ pile { 1 smallover 2 ( l1 ca1 - l3 cb1 ) - lo smallover 2 above 1 smallover 2 ( l1 sa1 - l3 sb1 } right ] ~+~
tan sup -1 left ( h over a right ) ~
left [ pile { 1 smallover 2 ( l3 sb1 - l1 sa1 ) above 1 smallover 2 ( l1 ca1 + l3 cb1 ) - l0 smallover 2} right ]
.EN 0
.EQ I
\[tf]~~box { {O P} bar ~=~
left [ pile { x above y } right ] ~=~
left [ pile { 1 smallover 2 ( l1 ca1 + l3 cb1 ) + tan sup -1 left ( h smallover a right ) 1 smallover 2 ( l3 sb1 - l1 sa1 ) above 1 smallover 2 ( l1 sa1 + l3 sb1 ) + tan sup -1 left ( h smallover a right ) ~left [ 1 smallover 2 ( l1 ca1 + l3 cb1 ) - lo smallover 2 right ] } right ] ~~}
.EN
.head 2 "Inverse Geometric Model"
The Inverse Geometric Model can be found by considering each half of the 5 bar mechanism separately.
.PP
.head 3 "Left Half"
First, let us find $qa2$ by considering the left part of the mechanism where,
.EQ I
{OP} bar ~=~ {O A1} bar ~+~ {A1 A2} bar ~+~ {A2 P} bar
.EN
.EQ I
{O A1} bar ~=~ left [ pile { - l0 smallover 2 above 0 } right ]
~~~~~~~
{A1 A2} bar = left [ pile { l1 ca1 above l1 sa1 } right ]
~~~~~~
{A2 P} bar = left [ pile { l2 ca12 above l2 sa12 } right ]
.EN
.EQ I
\[rA]~~{OP} bar = left [ pile { x above y} right ] ~~=~~
left [ pile { l0 smallover 2 + l1 ca1 + l2 ca12 above l1 sa1 + l2 sa12 } right ]
.EN
.PP
Consider the first row of the matrix in the above equation,
.EQ I
ca12 ~=~ {x - lo smallover 2 - l1 ca1 } over l2
.EN
Similary, the second row can be written as,
.EQ I
sa12 = {y - l1 sa1 } over l2
.EN
.PP
Dividing these, we get:
.EQ I
tan ( qa1 + qa2 ) = {2y - 2 l1 sa1} over {2x + l0 - 2 l1 ca1}
.EN
.EQ I
\[tf]~~box{ qa1 ~=~ tan sup -1 ~ left [ {2y - 2 l1 sa1} over {2x + l0 - 2 l1 ca1} right ] ~-~ qa1 }
.EN
.head 3 "Right Half"
Similarly, we can find $qb2$ by considering the right part of the mechanism where,
.EQ I
{OP} bar ~=~ {O B1} bar ~+~ {B2 H} bar ~+~ {H P} bar
.EN
.EQ I
{O B1} bar ~=~ left [ pile { l0 smallover 2 above 0 } right ]
~~~~~~~
{B1 B2} bar ~=~ left [ pile { l3 cb1 above l3 sb1 } right ]
~~~~~~~
{B2 P} bar ~=~ left [ pile { l4 cb12 above l4 sb12 } right ]
.EN
.EQ I
{OP} bar ~=~ left [ pile { x above y } right ] ~=~ left [ pile { l0 smallover 2 + l3 cb1 + l4 cb12 above l3 sb1 + l4 sb12 } right ]
.EN
.PP
Consider the first row ot eh matrix in the above equation,
.EQ I
cb12 ~=~ {2x - l0 - 2 l3 cb1 } over l4
.EN
.PP
Similarly, the second row can be written as,
.EQ I
sb12 ~=~ {y - l3 sb1 } over l4
.EN
.PP
Dividing these, we get:
.EQ I
tan ( qb1 + qb2 ) ~=~ {2y - 2 l3 sb1 } over { 2x - l0 - 2 l3 cb1 }
.EN
.EQ I
\[tf]~~box {
qb2 ~=~ tan sup -1 ~ left [ {2y - 2 l3 sb1} over {2x - l0 - 2 l3 cb1} right ] - qb1~~
}
.EN
.head 2 "Jacobian Matrix"
.PS 3
r = 0.06
linethick = 0.2
O: circle rad r at (0,0) fill 1 "" "" "$size +5 O$" below
A1: circle rad r at (-2,0) fill 1 "$size +5 A1$  " rjust
B1: circle rad r at (2,0) fill 1 "" "    $size +5 B1$" ljust below
A2: circle rad r at (-3,2.7) fill 1 "  $size +5 A2$" "" "" ljust above
B2: circle rad r at (3,2.7) fill 1 "   $size +5 B2$" ljust
P: circle rad r at (0,5.5) fill 1 "$size +5 P(x,y)$   " rjust
L1: line from A1 to A2 "$size +5 l1$   " rjust
L3: line from B1 to B2 "   $size +5 l3$" ljust
L2: line from A2 to P "$size +5 l2$      " rjust
L4: line from B2 to P "      $size +5 l4$" ljust
line from A1 to B1

linethick = 0.5
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

move to O; move up 0.7
arrow right 1 "$e under sub x$" below
move to O; move up 0.7
arrow up 1 "$e under sub y$ " rjust

linethick = 1.5
move to A1
line color "red" to center of L1 -> "$size +3 ua1$   " rjust
move to A2
line color "red" to center of L2 -> "$size +3 ua2$  " rjust above
move to B1
line color "red" to center of L3 -> "    $size +3 ub1$" ljust
move to B2
line color "red" to center of L4 -> "    $size +3 ub2$" ljust above
.PE
.PP
In order to write the Jacobian matrix, first let us rewrite the problem in terms of unit vectors $ua1$, $ua2$, $ub1$, and $ub2$. We can also rewrite ${OP} bar$ as $bold p$ and subsequently,
.EQ I
{OP} bar ~=~ {O A1} bar ~+~ {A1 A2} bar ~+~ {A2 P} bar
~~~~~~~~~~~~~~~~~~~~~~~
{OP} bar ~=~ {O B1} bar ~+~ {B2 H} bar ~+~ {H P} bar
.EN
.EQ I
bold p ~=~ - l0 smallover 2 e bar sub x + l1 ua1 + l2 ua2
~~~~~~~~~~~~~~~~~~~~~~
bold p ~=~ l0 smallover 2 e bar sub x + l3 ub1 + l4 ub2
.EN
.PP
Differentiating both of these equations with respect to time, we get
.EQ I
bold {p dot} ~=~ l1 q dot sub A1 E ua1 + l2 q dot sub A2 E ua2
~~~~~~~~~~~~~~~~~~~~~
bold {p dot} ~=~ l3 q dot sub B1 U ub1 + l4 q dot sub B2 E ub2
.EN
.PP
Where $E ~=~ Emat$ is the rotation matrix.
.PP
Since $ua2$ and $ub2$ are the two unit vectors associated with the passive links. Multiplying the above equations by the transpose of these vectors, we obtain:
.EQ I
ua2 sup T bold {p dot} ~=~ l1 q dot sub A1 ua2 sup T E ua1 ~~+~~ l2 q dot sub A2 ua2 sup T E ua2
~~~~~~~~~~
ub2 sup T bold {p dot} ~=~ l3 q dot sub B1 ub2 sup T E ub1 ~~+~~ l4 q dot sub B2 ub2 sup T E ub2
.EN
.PP
The product of a vector and its transpose is equal to 0. Hence the second terms in both of the above equations can be eliminated. By combining the remaining terms, we can form a the matrices:
.EQ I
left [ pile { ua2 sup T above ub2 sup T } right ] ~ bold {p dot } ~~=~~
left [ matrix { ccol { l1 ua2 sup T E ua1 above 0 } ccol { 0 above l3 ub2 sup T E ub1 } } right ]~~
left [ pile { q dot sub A1 above q dot sub B2} right ]
.EN
.PP
If we substitute $A = left [ pile { ua2 sup T above ub2 sup T } right ]$ and $B = left [ matrix { ccol { l1 ua2 sup T E ua1 above 0 } ccol { 0 above l3 ub2 sup T E ub1 } } right ]$ then we have,
.EQ I
A bold {p dot} ~=~ B ~left [ pile { q dot sub A1 above q dot sub B2} right ]
~~~\[rA]~~
bold {p dot} ~=~ A sup -1 B ~left [ pile { q dot sub A1 above q dot sub B2} right ]
.EN
.PP
Where Jacobian Matrix $J = A sup -1 B$
.head 3 "Calculating the Inverse Jacobian Matrix"
.EQ I
A ~=~ left [ matrix { ccol { ca12 above cb12 } ccol { sa12 above sb12 } } right ]
.EN
.EQ I
~~~~~\[rA]~~
det ( A ) ~=~ sb12 ca12 - cb12 sa12
.EN
.sp -0.5
.EQ 0 I
~~~~~~~~~~~~~~~~~~~~~
=~sin( qb1 + qb2 - qa1 - qa2 )
.EN 0
.sp -1
.EQ I
adj ( A ) ~=~ left [ matrix { ccol { sb12 above - cb12 } ccol { - sa12 above ca12 } } right ]
.EN
.EQ 0 I
A sup -1 ~=~ 1 over {det ( A ) } adj ( A )
.EN 0
.sp -1
.EQ I
\[rA] ~~A sup -1 ~=~ 1 over {sin( qb1 + qb2 - qa1 - qa2 ) } ~~left [ matrix { ccol { sb12 above - cb12 } ccol { - sa12 above ca12 } } right ]
.EN
.head 3 "Calculating the Forward Jacobian Matrix"
.PP
Now, we find the values of $l1 ua2 sup T E ua1$ and $l3 ub2 sup T E ub1$.
.EQ I
l1 ua2 sup T E ua1 ~=~ l1 [ ca12 ~~~ sa12 ] ~ Emat ~ left [ pile { ca1 above sa1 } right ]
.EN
.EQ 0 I
~~~~~~~~~~~~~~~~~=~
l1 sin ( qa1 + qa2 - qa1 ) ~~=~ l1 sa2
.EN
.EQ I
l3 ub2 sup T E ub ~=~ l3 [ cb12 ~~~ sb12 ] ~ Emat ~ left [ pile { cb1 above sb1 } right ]
.EN
.EQ 0 I
~~~~~~~~~~~~~~~~~=~
l3 sin ( qb1 + qb2 - qb1 ) ~~=~ l3 sin qb2
.EN 0
.EQ I
\[rA] ~~B ~=~ left [ matrix { ccol { l1 sa2 above 0 } ccol { 0 above l3 sb2 } } right ]
.EN
.head 3 "Calculating the Jacobian Matrix"
.PP
We know that $J = A sup -1 B$
.EQ I
box {
J ~=~ 1 over {sin( qb1 + qb2 - qa1 - qa2 } ~~
left [ matrix { ccol { l1 sa2 sb12 above - l1 sa2 cb12 } ccol { - l3 sa12 sb2 above l3 ca12 sb2 } } right ] ~~
}
.EN
.head 2 "Stiffness Matrix"
.PP
The Stiffness Matrix is usually written as $K sub x = J sup -T K sub theta J sup -1$. However, since Joint Stiffness $K sub theta$ is being ignored, the Cartesian Stiffness Matrix can be written as $K sub x = J sup -T J sup -1$. Where,
.EQ I
J ~=~ 1 over {sin( qb1 + qb2 - qa1 - qa2 } ~~
left [ matrix { ccol { l1 sa2 sb12 above - l1 sa2 cb12 } ccol { - l3 sa12 sb2 above l3 ca12 sb2 } } right ] ~~
.EN
\#.so /home/sudarson/.config/groff/macros.ms
.so /home/sudarson/.config/groff/closing_macros.ms
