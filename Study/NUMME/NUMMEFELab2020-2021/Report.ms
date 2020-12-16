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
must satisfy the condition that they are equal to 1 at
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
First, seperate functions to compute the area of an element and constants c\*<k\*>, c\*<l\*>, and c\*<m\*> were written to cleanup the code and make these values available anywhere in the script. The
.I "getConstants()"
function takes arguements for the coordinates of elemental nodes and finds the coefficients of the interpolation functions by solving the linear system of equations. The
.I "getArea()"
function finds area of the triangular element using its coordinates. This function takes advantage of the fact that area of a triangle is half the determinant of its coordinates.

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

.NH 2
Compute Volumic Force Vector
.LP
The equation to compute Volumic Force Vector and its function definition are:
.EQ I
[F sub e sup v ] = r over 3 A sub e~
left [ matrix{
ccol {1 above 1 above 1}
} right ]
.EN
.B1
.ft CW
def computeFve(xyzVerts, sourceTerm, physElt):
    N = 3
    area = getArea(xyzVerts)
    Fve = np.zeros(N)
    one = np.ones(N)

    Fve = sourceTerm(xyzVerts,physElt) * area * one / 3

    return Fve
.sp
.ft
.B2
.NH 2
Compute Neumann Force Vector
.SH
WHAT TO WRITE HERE??
.ft CW
.B1
def computeFNe(xyzVerts, flux):
    x1 = xyzVerts[0][0]
    x2 = xyzVerts[1][0]
    y1 = xyzVerts[0][1]
    y2 = xyzVerts[1][1]
    Le = np.sqrt( (x2-x1)**2 + (y2-y1)**2)

    FNe = [flux*Le/2, flux*Le/2]

    return FNe

.B2
.ft
.bp
.NH 2
Results
.LP
The following results were obtained by  considering
.I "u = 0"
on the Dirichlet Boundary,
.I "q\*<N\*> = 1"
on the Neumann Boundary, and source term
.I "r = 0."
For group A-03, the conductivity was 3
.I "W/mK."
These results are shown for a 4x4, 10x10, 20x20, and 40x40 mesh.
\#.PSPIC -C /home/sudarson/Study/NUMME/NUMMEFELab2020-2021/outputs/temp-square4x4.eps 6.5
\#.PSPIC -C /home/sudarson/Study/NUMME/NUMMEFELab2020-2021/outputs/temp-square10x10.eps 6.5
\#.PSPIC -C /home/sudarson/Study/NUMME/NUMMEFELab2020-2021/outputs/temp-square20x20.eps 7
\#.PSPIC -C /home/sudarson/Study/NUMME/NUMMEFELab2020-2021/outputs/temp-square40x40.eps 7
.bp
.NH
Analytical Solution
.NH 2
Solving the problem in 1 Dimension
.LP
It can be seen clearly from the FEM results that this problem has the same temperature anywhere along the x-axis. Therefore, the problem can be reduced from a 2D problem into a 1D problem.
.EQ I
(S)~=~~
left { matrix{
lcol {~div({q bar }) - r = 0 above
      ~q bar = -K. del u above
      ~u(x) = u sub D (x)~\[fa]~x~~\[mo]~partial Omega sub D above
      ~-{q bar}.{n bar} = q sub N~~~~\[fa]~x~~\[mo]~partial Omega sub N  }
}
.EN

.EQ I
\[rA]~~~~ div(- Kappa . del bar u ) - r = 0~~~~~~~~~~~
\[rA]~~~- Kappa~ div({del bar} u ) = r~~~~(if~ Kappa~ is~ a~ constant)
.EN
.EQ I
\[rA]~~~~Delta u = -r over Kappa~~~~~~
or~~~~~~
{partial sup 2 u} over {partial x sup 2} + {partial sup 2 u} over {partial y sup 2} = -r over Kappa
.EN
.LP
Since we can simplify our problem into a 1D problem, the derivitave of
.I "x"
is equal to zero.
.EQ I
\[3d]~~~~ {partial sup 2 u} over {partial y sup 2}~=~mark u''~=~-r over K
.EN
.EQ I
lineup u'~=~-ry over Kappa + A
.EN
.EQ I
lineup u~=~{-ry sup 2} over 2K + Ay + B~~~~\[fa]~u~~\[mo]~[-L, L]
.EN
.LP
This is the general solution of the problem. The exact solution can be found by considering boundary conditions.
.LP
.B "Neumann Boundary Condition"
.LP
The Neumann boundary on
.EQ I
From~~q bar = - Kappa . del bar u~~~and~~~~-{q bar}.{n bar} = q sub N~~~~\[fa]~y~~\[mo]~partial Omega sub N
.EN
.EQ I
del bar u~=~u'~= {q sub N} over Kappa~~~~~\[fa]~y~~\[mo]~partial Omega sub N
.EN
.EQ I
\[3d]~~~~~u'(L)~=~{-rL} over Kappa + A~=~{q sub N} over Kappa~~~~~~~~~~~~~~when~y~=~L
.EN
.EQ I
\[rA]~~~~ A~=~{q sub N + r~L} over Kappa
.EN
.LP
.B "Dirichlet Boundary Conditions"
.EQ I
u(-L)~=~{-r (-L) sup 2} over {2 Kappa} + A(-L) + B = 0~~~~~~when~y~\[mo]~-L
.EN
.EQ I
\[rA]~B~=~3 over 2 {r L sup 2} over Kappa + {q sub N L} over Kappa
.EN
.LP
Therefore the exact 1D problem can be written as follows:
.EQ I
u(y)~=~{-ry sup 2} over {2 Kappa} + {(q sub N + rL) y} over Kappa + ~3 over 2 {r L sup 2} over Kappa + {q sub N L} over Kappa
.EN
.LP
When source term
.I "r = 0"
the equation is simplified into the form:
.EQ I
u(y)~={q sub N} over Kappa (y + L)
.EN
.LP
The exact analytical solution represented as a python function
.I "uFunSquare()"
like so:

.ft CW
.B1
def uFunSquare(x,K,qN,r,L):
    return -(r*x**2/(2*K)) + (qN + r*L)*x/K + 3*r*L**2/(2*K) + qN*L/K

.B2
.ft
.NH 2
Getting the FEM Solution
.LP
A seperate file
.I "checkFE.py"
was written to check the FEM results and compare it to the analytical solution (the above mentioned
.I "uFunSquare()"
function is also included in this file). Since the results from the FEM calculation are random and hard to decode, it becomes difficult to find out the temperature at each node. Since this problem can be considered a 1D problem, only one value from each row of nodes is required. The built-in function
.I "numpy.sort()"
was employed to sort the values in order of lowest value to highest values, and then the lowest value from each row was considered the temperature at that particular 1D node. It was noticed from
.I "solveFE.py"
that the the variable
.I "U"
did not store the temperature of the nodes at the Dirichlet Boundary. Hence, a seperate function
.I "getSize()"
was written to get the true size of the mesh as the number of nodes on each side of the square mesh.

.ft CW
.B1
def getApprox1D(U,K,qN,r):
    N = getSize(len(U))
    u = np.zeros(N)
    U = np.sort(U)
    p = np.zeros(N)
    L = 1

    u = U[N-1:N*N-N:N]
    u = np.insert(u,0,0,axis=0)
    x = np.linspace(-L,L,N)

    K1 = K[0]
    p = uFunSquare(np.linspace(-L,L,N),K1,qN,r,L)

    return u, p

def getSize(c):
    a = 1
    b = -1
    c = -c
    d = b**2 - 4*a*c
    size = (-b+math.sqrt(d))/2*a
    return int(size)

.B2
.ft
.NH 2
Comparing FEM Solution to Analytical Solution
.LP
In order to check that our FEM solutions are accurate, it is important to compare them to the analytical solution and plot the error. We expect the errors to reduce as we increase the mesh density, i.e make the mesh finer. It was observed that the FEM solution was very close to the analytical solution when there was no source term present, but the accuracy of the error is more defined if there is a source term.

.ft CW
.B1
    isBimat = 0
    if case == 0:
        newMesh = square
        xex, uex = getExactSoln_Square(K,qN,r)
        newMesh.pop(0)
    if case == 1:
        newMesh = bimat
        isBimat = 1
        xex, uex = getExactSoln_Bimat(K,qN,r)
    N = len(newMesh)
    e = np.zeros(N)
    a = np.zeros(N)

    plt.figure()
    plt.plot(xex,uex,label='Exact Solution',linewidth=3,color='black')

    for i in range(0,len(newMesh)):
        meshName = newMesh[i]
        U = solveFE(meshName, conductivities, BCNs, BCD_lns, BCD_nds, sourceTerm, exportName, useSparse, verboseOutput)
        x, u, v = getApprox1D(U,K,qN,r,isBimat)
        e[i] = max(abs(v-u))
        a[i] = sum(abs(v-u))/len(u)

        print('Max Error = %g, Avg Error = %g\n'%(e[i],a[i]))
        plt.plot(x,u, label=newMesh[i])

    plt.legend()
    plt.grid()
    plt.savefig('Exact-vs-Approx_r=%g.png'%r)
    plt.show()

    plt.figure(num=None, figsize=(8, 6), dpi=80, facecolor='w', edgecolor='k')
    plt.plot(newMesh,e, label='Maximum Error')
    plt.plot(newMesh,a, label='Average Error')
    plt.scatter(newMesh,e)
    plt.scatter(newMesh,a)
    plt.yscale("log")
    plt.xlabel("Meshes")
    plt.ylabel("Error")
    plt.legend()
    plt.grid()
    plt.savefig('ErrorPlot_r=%g.png'%r)
    plt.show()


.B2
.ft
.bp
\#.PSPIC -C /home/sudarson/Study/NUMME/NUMMEFELab2020-2021/Exact-vs-Approx_r=0.eps 5.4
\#.PSPIC -C /home/sudarson/Study/NUMME/NUMMEFELab2020-2021/ErrorPlot_r=0.eps 5.4
.LP
We can see here that when
.I "r = 0"
the errors are extremely small and that the FEM solutions are difficult to distinguish from the analytical solutions.
.bp
\#.PSPIC -C /home/sudarson/Study/NUMME/NUMMEFELab2020-2021/Exact-vs-Approx_r=1.eps 5.4
\#.PSPIC -C /home/sudarson/Study/NUMME/NUMMEFELab2020-2021/ErrorPlot_r=1.eps 5.4
.LP
However, when
.I "r = 1"
the accuracy of the FEM solutions reduce significantly, and they can be distinguished from the analytical solution.
.bp
.NH
Comparing solution with Finite Difference (FD) Lab
.LP
It is relatively simple to redefine our FE problem as the same one from the FD problem. In order to do this, the Dirichelt Boundary Conditions on all 4 corners of the square were set to
.I "u = 0"
, the source term was set as
.I "r = 1"
, and the conductivity was set to a unit value.
Upon doing this, a contour plot very similar to FD lab was obtained.
.LP
It was noted that:
.RS
.BL
For the same number of nodes,
.B "Gmsh seems to display a more accurate ouput which closely resembles the exact solution."
However, the actual error of the FEM solution is not much better than the FD solution. The graphs comparing the errors is shown below.
.BL
.B "FEM was demonstrated to be significantly faster than FD."
The computing time required for FEM solution was much lower than FD solution for the same number of nodes. To compute the temperature across 5 meshes (N = 4, 10, 20, 30, 40), the FEM solution only took around
.I "1.3 seconds"
wherease the FD solution took approximately
.I "5.9 seconds,"
i.e. it was more than four times faster.
.RE
.PSPIC -C /home/sudarson/Study/NUMME/NUMMEFELab2020-2021/outputs/FD20x20.eps 9
.CD
.I "Gmsh temperature output for 20x20 mesh"
.DE
.PSPIC -C /home/sudarson/Study/NUMME/NUMMEFELab2020-2021/outputs/FD40x40.eps 9
.CD
.I "Gmsh temperature output for 40x40 mesh"
.DE

.PSPIC -C /home/sudarson/Study/NUMME/NUMMEFELab2020-2021/FD_Error.eps 5.4

.PSPIC -C /home/sudarson/Study/NUMME/NUMMEFELab2020-2021/2D_ErrorLog.eps 5.4
