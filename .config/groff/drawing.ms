.defcolor cyan rgb #7D8FA3
.defcolor sea rgb #1D7E74

.PS
h = 0.4
w = 1.5i
d = 1.8i
l = 0.2i
c = 3.3
circle rad 0 at (0,0)
MBOX: box rad 0.07 "\m[white]Pipe Inspection Robots\m[]" shaded "sea" ht h  wid 3 at (c,0)

CBOX: box rad 0.07 ht 0 wid 0 at (c,-h)
move down l from bottom of last box; box rad 0.07 "\m[white]Without Wheel Type\m[]" shaded "sea" ht h wid w
line from bottom of 2nd last box to top of last box
move down l from bottom of last box; box "\m[white]Leg Type\m[]" same shaded "sea"
line from bottom of 2nd last box to top of last box
move down l from bottom of last box; box rad 0.07 "\m[white]Inchworm Type\m[]" shaded "sea" ht h wid w
line from bottom of 2nd last box to top of last box
move down l from bottom of last box; box rad 0.07 "\m[white]Snake Type\m[]" shaded "sea" ht h wid w
line from bottom of 2nd last box to top of last box

move left d from left of CBOX; LBOX: box rad 0.07 ht 0 wid 0
move down l from bottom of last box; box rad 0.07 "\m[white]Wheel Type\m[]" shaded "sea"  ht h wid w
line from bottom of 2nd last box to top of last box
move down l from bottom of last box; box rad 0.07 "\m[white]Simple Structure\m[]" shaded "sea" ht h wid w
line from bottom of 2nd last box to top of last box
move down l from bottom of last box; box rad 0.07 "\m[white]Wall Pressed\m[]" shaded "sea" ht h wid w
line from bottom of 2nd last box to top of last box
move down l from bottom of last box; box rad 0.07 "\m[white]Screw Drive\m[]" shaded "sea" ht h wid w
line from bottom of 2nd last box to top of last box

move right d from right of CBOX; RBOX: box rad 0.07 ht 0 wid 0
move down l from bottom of last box; box rad 0.07 "\m[white]Caterpillar Type\m[]" shaded "sea" ht h wid w
line from bottom of 2nd last box to top of last box
move down l from bottom of last box; box rad 0.07 "\m[white]Simple Structure\m[]" shaded "sea" ht h wid w
line from bottom of 2nd last box to top of last box
move down l from bottom of last box; box rad 0.07 "\m[white]Wall Pressed\m[]" shaded "sea" ht h wid w
line from bottom of 2nd last box to top of last box

line from center of CBOX to center of LBOX
line from center of CBOX to center of RBOX
line from bottom of 1st box to center of CBOX

.PE

.PS 2
circle rad .5 at (0,0)
circle rad .5 at (0,3)
circle rad .5 at (3,0)
circle rad .5 at (3,3)
circle rad .5 at (4,1)
circle rad .5 at (4,4)
circle rad .5 at (1,4)
circle rad .5 dashed 0.1  at (1,1)
line from 0,0 to 0,3 then to 3,3 then to 3,0 then to 0,0
line from 3,0 to 4,1 then to 4,4 then to 1,4 then to 0,3
line from 3,3 to 4,4
line dashed .15 from (0,0) to (1,1) then to (1,4)
line dashed .15 from (1,1) to (4,1)
.PE


.EQ
delim $$
.EN
.PS
a = 0.38051
tana = sin(a)/cos(a)
box ht 0 wid 0 at (0,0) "B      "
line from (0,0) to (2,0) thickness 0.9
box ht 0.4 wid 0.15
move right 0.1
box invis ht 0 wid 0.1 "C"
line down 0.2 from bottom of 2nd last box
box fill 0.4 outline "white" ht 0.25 wid 0.5
line up 0.2 from top of 3rd last box
line from (0,0) to (2,0.8)
arrow down 0.8 from (2,0.8)
arrow down 0.4 from last line.center
arrow from (0.5,0.5*tana) to (0.5,0)
arrow from (1.5,1.5*tana) to (1.5,0)
box invis "$q(x) = - alpha x e sub x$" at (1,0.8)
line from (0,0) to (0,-2) thickness 0.9
box ht 0.15 wid 0.4
box invis ht 0.3 wid 0.2 "A"
line right 0.2 from right of 2nd last box
box fill 0.4 outline "white" ht 0.5 wid 0.25
line left 0.2 from left of 3rd last box
move left 0.2
arrow <-> up 2 "L  " rjust
line dashed from (2.2,-2) to (1.2,-2)
line dashed from (2.062,-2.2) to (2.062,-1.2)
arrow <-> from (0,-2.5) to (2.062,-2.5) "L" below
arrow from (2.8,-2) to (3.5,-2)
box invis ht 0.3 "$e sub {x bar}$"
arrow from (2.8,-2) to (2.8,-1.3)
move left 0.1
box invis wid 0.1 "$e sub {y bar}$"
.PE

.PS
m = 0.3
w = 1
h = w*m
n = 4
l = w/(n+1)

for i = 0 to n do {
    x1 = i*l
    y1 = -h/2
    x2 = l+i*l
    y2 = h/2

    line from (x1,y1) to (x2,y2)
}

line from (0,h/2) to (w+l/2.5,h/2)

w1 = w/1.5

r = 0.1
circle rad r at (w/2-l,h/2+r)
circle rad r at (w/2+l,h/2+r)
line from (w/2-2*l,h/2+2*r) to (w/2+2*l,h/2+2*r)
line from (w/2+2*l,h/2+2*r) to (w/2,h/2+2*r+0.866*4*l)
line from (w/2-2*l,h/2+2*r) to (w/2,h/2+2*r+0.866*4*l)
.PE

.PS
m = 1/0.4
w = 0.4
h = w*m
n = 4
l = h/(n+1)

box ht h wid w
for i = -1 to n-1 do {
x1 = 0
y1 = -h/2 + l+i*l
x2 = w
y2 = -h/2 + 2*l + i*l


line from (x1,y1) to (x2,y2)
}
.PE

.cstart
CH3
bond
CH3
bond
R1: benzene pointing right
R2: benzene pointing right with .V6 at R1.V2
bond
OH
.cend

.cstart
CH3
bond
C
double bond up
O
bond right from C
CH3
.cend
