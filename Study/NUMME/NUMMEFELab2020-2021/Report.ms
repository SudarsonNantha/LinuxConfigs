\#
\# This is a standard groff template.
\#
\# Use \# to comment the entire line
\# Use \" to add comment after some text
\#
\# Some standard functions:
\# .NH <x> for a numbered section - x denotes the level of the secionl is 0 by default
\# .SH unnumbered section
\# .RS and .RE for extra indentations
\# .B for bold
\# .I for italics
\# .BI for bold italics
\# .UL for underlining
\# .BX for encapsulating text in a box
\# .sp <n> to add lines
\# .B1, B2 to enclose text in a box
\#
\# Text between .EQ <x> and .EN is considered as an equation
\# Equations are automatically indented, use ~ to add space
\# x = C by default (centred), I (indented), L (left aligned)
\#
\# Add images using .PSPIC, all images must be in .eps format
\#
\# Import custom macros
\# .BL creates a bulleted list
.so /home/sudarson/.config/groff/macros
.TL \" Title of the document
NUMME Lab - Finite Elements
.AU \" Authoer of the document
Sudarson Nanthacoumarane
.AI \" Article institution
Group A-03
.LP
.BI "Objective"
- Use Finite Element Methods to find the temperature distribution across a domain given the source term and boundary conditions.
.NH
Problem Statement
.LP
The temperature across a domain can be represented in is strong form as:
.EQ C
(S)~=~~
left { matrix{
lcol {~div({q bar }) - r = 0 above
      ~q bar = -K. del u above
      ~u(x) = u sub D (x)~\[fa]~x~~\[mo]~partial Omega sub D above
      ~-{q bar}.{n bar} = q sub N~~~~\[fa]~x~~\[mo]~partial Omega sub N  }
}
.EN
.NH
Solving the problem
.LP
We solve the problem using the Ritz Method, or by minimizing energy
.I "J"
in a 2-Dimentional space.
\#in a finite dimensional subspace.
.EQ I
J(u sup h )~=~1 over 2 a(u sup h, u sup h )~-~b(u sup h )
.EN
.EQ I
with~J sub a (u sup h ) = ~1 over 2 a(u sup h, u sup h )~and~J sub b (u sup h ) = b(u sup h )
.EN
.EQ I
where~u sup h~=~N sub k (x)~U sub K + N sub l (x)~U sub l + N sub m (x)~U sub m
.EN
.LP
.I "u\*{h\*}"
is the solution in a finite dimentionsal subspace,
.I "N(x)"
are interpolation or shape functions, and
.I "U"
are the displacement functions at each node. There are 3 shape functions and 3 displacement functions because we are using triangluar elements to solve our problem, resulting in each element consisting of 3 vertexes or nodes. Each of the shape functions take the form:
.EQ I
N sub i (x)~=~c sub 0 sup i + c sub 1 sup i x + c sub 2 sup i y~~~~i=k,l,m
.EN
.LP
Each of these interpolation functions
.I "N\*<i\*>"
must satusfy the condition that they are equal to 1 at
.I "x\*<i\*>"
and 0 everywhere else. For example,
.EQ I
left { matrix{
lcol {N sub k (x sub k )= 1 above N sub k (x sub l )=0 above N sub k (x sub m )=0}
}
.EN
.LP
The unknown constants can be found using a linear system of equations. For example,
.I "c\*{k\*}"
can be found by:
.EQ I
left [ matrix{
ccol {1 above 1 above 1}
ccol {x sub k above x sub l above x sub m}
ccol {y sub k above y sub l above y sub m}
} right ]~
left [ matrix{
ccol {c sub 0 sup k above c sub 1 sup k above c sub 2 sup k}
} right ]
=
left [ matrix{
ccol {1 above 0 above 0}
} right ]
.EN
.NH 2
Elemental Stiffness Matrix
.LP
The first term of the energy expression over a single element
.I "n"
can be written as:
\#Since
\#.I "J\*<a\*>"
\#represents the global energy, we write the elemental energy as follows:
.EQ I
J sub a sup {(n)} =~1 over 2 a sup {(a)} (u sup h , u sup h ) = 1 over 2 int from {tau sub n} del bar u sup h Kappa del bar u sup h ~d Omega
.EN
.EQ I
~~~~~~~=~1 over 2  [U sub e ] sup T int from {tau sub n } [B sub e ] sup T [ Kappa ]~[B sub e ]~d Omega~[U sub e ]
.EN
.LP
Where
.I "B\*<e\*>"
is obtained by representing flux over the element in terms of matrices.
.EQ I
q sup h = Kappa del bar u sup h = Kappa [N sub e ] .[ U sub e ] sup T
.EN
.EQ I
q sup h =
left [ matrix{
ccol {c sub 1 sup k above c sub 2 sup k }
ccol {c sub 1 sup l above c sub 2 sup l }
ccol {c sub 1 sup m above c sub 2 sup m }
} right ]
~
left [ matrix{
ccol {U sub k above U sub l above U sub m}
} right ]
~~~where~
[B sub e ]~=
left [ matrix{
ccol {c sub 1 sup k above c sub 2 sup k }
ccol {c sub 1 sup l above c sub 2 sup l }
ccol {c sub 1 sup m above c sub 2 sup m }
} right ]
.EN
.LP
Therefore, elemental energy can be rewritten as:
.EQ I
J sub a sup {(n)}=~1 over 2  [U sub e ] sup T [K sub e ]~[U sub e ]
~~~where~~[K sub e ] = int from {tau sub n } [B sub e ] sup T [ Kappa ]~[B sub e ]~d Omega
.EN
.NH 2
Volumic Force Vector
.LP
The second term in the energy expression can be split into two terms:
.EQ I
J sub b (u sup h ) = J sub {b,v} (u sup h ) + J sub {b,N} (u sup h )
.EN
.EQ I
where~
J sub {b,v} (u sup h ) = int from {Omega sub h} u sup h r~d Omega
~~~and~
J sub {b,N} (u sup h ) = int from {partial Omega sub N} u sup h q sub N ~d Gamma
.EN
.LP
Consider the elementary contributions of the first term mentioned above:
.EQ I
J sub {b,v} sup {(n)} (u sup h ) = int from {Tau sub n} [U sub e ] sup T [N sub e ] r~d Omega~~ =~~ [U sub e ] sup T [F sub e sup v ]
.EN
.EQ I
where~[F sub e sup v ] = int from {Tau sub e} [N sub e ] sup T r~d Omega
.EN
.EQ I
[F sub e sup v ] = int from {Tau sub e} N sub k (x) r~d Omega~~+~~int from {Tau sub e} N sub l (x) r~d Omega~~+~~int from {Tau sub e} N sub m (x) r~d Omega
.EN
.LP
We know that the sum of interpolation functions is equal to 1. Since they are linear, the interpolation functions are also equal to each other.
.EQ I
int from {Tau sub e} N sub k (x) ~d Omega~~+~~int from {Tau sub e} N sub l (x) ~d Omega~~+~~int from {Tau sub e} N sub m (x) ~d Omega~=~1~d Omega~=~Area~A sub e
.EN
.LP
If source term
.I "r"
is a constant, the Volumic Force Vector can be written as:
.EQ I
[F sub e sup v ] = r over 3 A sub e~
left [ matrix{
ccol {1 above 1 above 1}
} right ]
.EN
.NH 2
Neumann Force Vector
.LP
The second contribution to
.I "J\*<b\*>"
represents the Neumann boundary conditions for our problem:
.EQ I
J sub {b,N} (u sup h )= int from {partial Omega sub N} u sup h q sub N ~d Gamma
.EN
.SH
WHAT TO WRITE HERE??
.NH
Complete tri3thermalDirect.py
.NH 2
Compute Elemental Stiffness Matrix Ke
.LP
We know that the Elemental Stiffness Matrix can be represented as an integral of elemental matrices and vectors across the element.
.EQ I
[K sub e ] = int from {T sub e}~[ B sub e ] sup T~. Kappa .~[B sub e ]~~d Omega
.EN
.LP
In the case of isotropic matrial, [K] is a diagonal and:
.EQ I
[K sub e ] = Kappa~A sub e~[B sub e ] sup T [B sub e ]
.EN
.LP
First, seperate functions to compute the area of an element and constants c\*<k\*>, c\*<l\*>, and c\*<m\*> were written to cleanup the code and make these values available to any function.

.ft CW
.B1
# returns constant ck, cl, cm for an element
.br
def getConstants(xyz,N):
    coordinateMatrix = np.ones((N,N))
    c = np.zeros((N,N))
    f = np.eye(N)

    coordinateMatrix[:,1] = xyz[:,0]
    coordinateMatrix[:,2] = xyz[:,1]

    # Find all c values, solution stored row-wise
    inverseMat = np.linalg.inv(coordinateMatrix)
    for i in range (0,N):
        c[i] = np.matmul(inverseMat,f[i])

    return np.transpose(c)

# Find area of element using xyzVerts coordinates
.br
def getArea(xyz):
    xyz[:,2] = 1
    area = 0.5*abs(np.linalg.det(xyz))
    return area


.B2
.bp
.ft
.LP
The computeKe() function uses the above functions to calculate Elemental Stiffness Matrix:

.ft CW
.B1
def computeKe(xyzVerts, conductivity):
    N = 3
    c = getConstants(xyzVerts,N)

    Be = np.zeros((2,3))
    Be[0,:] = c[1,:]        # Assign c values to Be
    Be[1,:] = c[2,:]

    Ke = conductivity * getArea(xyzVerts) * np.matmul(np.transpose(Be),Be)

    return Ke

.B2
.ft


\# Invoke monospace font for code using .ft CW
\# CW stands for constant width
\#
\# Change font size using .ps <n> or .ps +-<n>
\#
\# Code can be put in a box by putting it between .B1 and .B2
.B1
.ft CW
def myfunction(arg):
    arg = arg**2 - arg + 1
    return int(arg)
.sp
.ft
.B2
.PSPIC -I 4 /home/sudarson/.config/groff/pondy.eps
