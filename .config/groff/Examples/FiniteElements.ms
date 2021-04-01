.nr no-head-numbering 1
.so /home/sudarson/.config/groff/opening_macros.ms
.ds CH
.ds LH \\*[SN] \\*[title]
.ds RH NUMME Finite Elements Lab Report
.ds CF - % -
.nr LL 6.3i
.DS C
.ps 12
.B "Group A-03"
.sp
.ps 15
.B "NUMME Lab - Finite Elements"
.
.ps 12
.I "Sudarson Nanthacoumarane"
.DE
.
.LP
.BI "Objective"
- Use Finite Element Methods to find the temperature distribution across a domain given the source term and boundary conditions.
.head "Problem Statement"
.LP
The temperature across a domain can be represented in its strong form as:
.EQ
(S)~=~~
left { matrix{
lcol {~div({q bar }) - r = 0 above
      ~q bar = -K. del u above
      ~u(x) = u sub D (x)~\[fa]~x~~\[mo]~partial Omega sub D above
      ~-{q bar}.{n bar} = q sub N~~~~\[fa]~x~~\[mo]~partial Omega sub N  }
}
.EN "Strong form of temperature distribution"
.head "Solving the problem"
.LP
We solve the problem using the Ritz Method, or by minimizing energy
.I "J"
in a 2-Dimentional space.
.EQ I
J(u sup h )~=~1 over 2 a(u sup h, u sup h )~-~b(u sup h )
.EN "Minimization using Ritz method"
.EQ I
with~J sub a (u sup h ) = ~1 over 2 a(u sup h, u sup h )~~~~~and~~~~~J sub b (u sup h ) = b(u sup h )
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
.EN "Shape functions at each node"
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
.EN "Example of shape function values"
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
.EN "Matrix to calculate constants"
.bp
.head 2 "Elemental Stiffness Matrix"
.LP
The first term of the energy expression over a single element
.I "n"
can be written as:
.EQ I
J sub a sup {(n)} =~1 over 2 a sup {(a)} (u sup h , u sup h ) = 1 over 2 int from {tau sub n} del bar u sup h Kappa del bar u sup h ~d Omega
.EN "Energy expression"
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
.EN "Final equation to calculate elemental energy"
.head 2 "Volumic Force Vector"
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
J sub {b,v} sup {(n)} (u sup h ) = int from {Tau sub n} [U sub e ]~ [N sub e ] sup T ~r~d Omega~~ =~~ [U sub e ] [F sub e sup v ]
.EN "2nd term in energy expression"
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
.EN "Volumic force vector"
.head 2 "Neumann Force Vector"
.LP
The second contribution to
.I "J\*<b\*>"
represents the Neumann boundary conditions for our problem:
.EQ I
J sub {b,N} (u sup h )= int from {partial Omega sub N} u sup h q sub N ~d Gamma
.EN
.LP
Across each element, this term is written as:
.EQ I
J sub {b,N} sup {(n)} (u sup h )= int from {Tau sub e} [U sub e ]~[N sub e ] sup T q sub N ~d Gamma
~~~~=~~[U sub e ]~[F sub e sup N ]
.EN
.EQ I
[F sub e sup N ]=~int from {edge} [N sub e ] sup T q sub N~d Gamma
.EN
.head "Complete tri3thermalDirect.py"
.head 2 "Compute Elemental Stiffness Matrix Ke"
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
The
.I "computeKe()"
function uses the above functions to calculate Elemental Stiffness Matrix:

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

.head 2 "Compute Volumic Force Vector"
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
.head 2 "Compute Neumann Force Vector"
.LP
In practice, instead of writing restrictions of the interpolation functions on the Neumann Boundary, the approximation is written directly on the edges lying on the boundary as 1D interpolation functions. The integral is therefore simplified into:
.EQ I
[F sub e sup N ]~=~int from 0 to {edge} [N sub k ( eta ) , N sub l ( eta ) ] sup T q sub N~~d eta
.EN
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
.head 2 "Results"
.LP
The following results were obtained by  considering
.I "u = 0"
on the Dirichlet Boundary,
.I "q\*<N\*> = 1"
on the Neumann Boundary, and source term
.I "r = 0."
For group A-03, the conductivity was 3
.I "W/(mm.K)."
These results are shown for a 4x4, 10x10, 20x20, and 40x40 mesh.
.PIC "Temperature distribution on 4x4 square mesh" "/home/sudarson/Study/Sem1/NUMME/UploadFiles/FE_Lab_Scripts/outputs/temp-square4x4.pdf" C 6
.PIC "Temperature distribution on 10x10 square mesh" "/home/sudarson/Study/Sem1/NUMME/UploadFiles/FE_Lab_Scripts/outputs/temp-square10x10.pdf" C 6
.PIC "Temperature distribution on 20x20 square mesh" "/home/sudarson/Study/Sem1/NUMME/UploadFiles/FE_Lab_Scripts/outputs/temp-square20x20.pdf" C 6
.PIC "Temperature distribution on 40x40 square mesh" "/home/sudarson/Study/Sem1/NUMME/UploadFiles/FE_Lab_Scripts/outputs/temp-square40x40.pdf" C 6

.bp
.head "Analytical Solution"
.head 2 "Solving the problem in 1 Dimension"
.LP
It can be seen clearly from the FEM results that this problem has the same temperature anywhere along the x-axis. Therefore, the problem can be reduced from a 2D problem into a 1D problem in the domain [-L,L].
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
lineup u~=~{-ry sup 2} over 2K + Ay + B~~~~\[fa]~y~~\[mo]~[-L, L]
.EN
.LP
This is the general solution of the problem. The exact solution can be found by considering boundary conditions.
.LP
.B "Neumann Boundary Condition"
.LP
The Neumann boundary on
.EQ I
From~~q bar = - Kappa . del bar u~~~and~~~~-{q bar}.{n bar} = q sub N~~~~\[fa]~u~~\[mo]~partial Omega sub N
.EN
.EQ I
del bar u~=~u'~= {q sub N} over Kappa~~~~~\[fa]~u~~\[mo]~partial Omega sub N
.EN
.EQ I
\[3d]~~~~~u'(L)~=~{-rL} over Kappa + A~=~{q sub N} over Kappa~~~~~~~~~~~~~~when~y~=~L
.EN
.EQ I
\[rA]~~~~ A~=~{q sub N + rL} over Kappa
.EN
.LP
.B "Dirichlet Boundary Conditions"
.EQ I
u(-L)~=~{-r (-L) sup 2} over {2 Kappa} + A(-L) + B = 0~~~~~~when~y~=~-L
.EN
.EQ I
\[rA]~B~=~3 over 2 {r L sup 2} over Kappa + {q sub N L} over Kappa
.EN
.LP
Therefore the exact 1D problem can be written as follows:
.EQ I
u(y)~=~{-ry sup 2} over {2 Kappa} + {(q sub N + rL) } over Kappa y + ~3 over 2 {r L sup 2} over Kappa + {q sub N L} over Kappa
.EN
.LP
When source term
.I "r = 0"
the equation is simplified into a linear equation of the form:
.EQ I
u(y)~={q sub N} over Kappa (y + L)
.EN
.LP
The exact analytical solution is calculated in the function
.I "uFun()"
like so:

.ft CW
.B1
# Returns exact solution based on Square or Bimat
.bp
 def uFun(y,K,qN,r,L,prev = 0, case = 0):
 out = 0
     if case == 0:   # Normal Square
         out = -(r*y**2/(2*K)) + (qN + r*L)*y/K + 3*r*L**2/(2*K) + qN*L/K
     elif case == 1: # Bimat PDE 1
         out =  r*(L**2-y**2)/(2*K) + qN*(y+L)/K
     elif case == 2: # Bimat PDE 2
         out =  -(r*y**2/(2*K)) + (qN + r*L)*y/K + prev
     return out

.B2
.ft
.bp
.head 2 "Extracting the FEM Solution"
.LP
A seperate file
.I "checkFE.py"
was written to check the FEM results and compare it to the analytical solution (the above mentioned
.I "uFun()"
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
.head 2 "Comparing FEM Solution to Analytical Solution"
.LP
In order to check that our FEM solutions are accurate, it is important to compare them to the analytical solution and plot the error. We expect the errors to reduce as we increase the mesh density, i.e make the mesh finer. It was observed that the FEM solution was very close to the analytical solution when there was no source term present, but the accuracy of the error is more defined if there is a source term.

.ft CW
.B1
 # Finds exact solution based on square or bimat
 isBimat = 0
 if case == 0:
     newMesh = square
     xex, uex = getExactSoln_Square(K,qN,r)
     name = "square"
 if case == 1:
     newMesh = bimat
     isBimat = 1
     xex, uex = getExactSoln_Bimat(K,qN,r)
     name = "bimat"
 N = len(newMesh)
 e = np.zeros(N)
 a = np.zeros(N)
 h = np.zeros(N)

 # Plot exact solution
 plt.figure()
 plt.plot(xex,uex,label='Exact Solution',linewidth=4,color='black')

 # Find solution and errors for different mesh sizes
 for i in range(0,len(newMesh)):
     meshName = newMesh[i]
     U = solveFE(meshName, conductivities, BCNs, BCD_lns, BCD_nds, sourceTerm, exportName, useSparse, verboseOutput)
     x, u, v = getApprox1D(U,K,qN,r,isBimat)
     e[i] = max(abs(v-u))
     a[i] = sum(abs(v-u))/len(u)

     print(meshName)
     print('Max Error = %g, Avg Error = %g\\n'%(e[i],a[i]))
     plt.plot(x,u, label=newMesh[i])
     h[i] = len(u)

 plt.legend()
 plt.grid()
 plt.xlabel("Position y", fontsize = 12)
 plt.ylabel("Temperature u(y)", fontsize = 12)
 plt.title('FEM Deviations for r = %g'%r)
 figName = "Exact-vs-Approx_r=" + str(r) + "_"+name+".png"
 plt.savefig(figName, bbox_inches='tight', dpi=300)
 cmd = "convert "+figName+" "+figName[:-3]+"eps"     # Save as eps file to import into groff document
 os.system(cmd)

.B2
.ft
.bp
.PIC "Exact v.s. Approximate values for square meshes at r=0" "/home/sudarson/Study/Sem1/NUMME/NUMMEFELab2020-2021/Exact-vs-Approx_r0_square.pdf" C 5.1
.PIC "Error plot for square meshes at r=0" "/home/sudarson/Study/Sem1/NUMME/NUMMEFELab2020-2021/ErrorPlot_r0_square.pdf" C 5.1
.LP
We can see here that when
.I "r = 0"
the errors are extremely small and that the FEM solutions are difficult to distinguish from the analytical solutions.
.bp
.PIC "Exact v.s. Approximate values for square meshes at r=1" "/home/sudarson/Study/Sem1/NUMME/NUMMEFELab2020-2021/Exact-vs-Approx_r1_square.pdf" C 4
.PIC "Error plot for square meshes at r=1" "/home/sudarson/Study/Sem1/NUMME/NUMMEFELab2020-2021/ErrorPlot_r1_square.pdf" C 4
.LP
However, when
.I "r = 1"
the accuracy of the FEM solutions reduce significantly, and they can be distinguished from the analytical solution.
.head "Comparing solution with Finite Difference (FD) Lab"
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
.I "1.9 seconds"
whereas the FD solution took approximately
.I "6.2 seconds,"
i.e. it was more than three times faster.
.RE
.PIC "Gmsh output for 40x40 mesh" "/home/sudarson/Study/Sem1/NUMME/UploadFiles/FE_Lab_Scripts/outputs/FD40x40.pdf" C 9
.PIC "Gmsh output for 20x20 mesh" "/home/sudarson/Study/Sem1/NUMME/UploadFiles/FE_Lab_Scripts/outputs/FD20x20.pdf" C 7
.PIC "FD Lab approximation plot for N = 20" "/home/sudarson/Study/Sem1/NUMME/NUMMEFELab2020-2021/FD_approxSolution.pdf" C 5
.PIC "Logarithmic error plot for FD" "/home/sudarson/Study/Sem1/NUMME/NUMMEFELab2020-2021/FD_Error.pdf" C 5
.PIC "Logarithmic error plot for FE" "/home/sudarson/Study/Sem1/NUMME/NUMMEFELab2020-2021/2D_ErrorLog.pdf" C 5
.LP
From both of these error plots, we can see that the two methods have about the same accuracies, with FEM being only slightly more accurate.
.bp
.head "FEM solution for two Isotropic Materials"
.head 2 "Modifying the program"
.LP
It is relatively simple to solve the problem for a mesh with two isotropic materials. The only change that was required in the program was to add the conductivity of the second element to the
.I "conductivities"
variable defined in
.I "testFE.py."
In this case, a pre-defined element ID of 2000 was assigned a conductivity value of 1 W/(mm.K) was assgined.

.ft CW
.B1
# Assigns conductivities
.bp
K = [3,1,1.38e-3,1510e-3]
.bp
if case == 0:                                   # Normal square(hole)
.bp
    conductivities = {1000: K[0]}
.bp
elif case == -1:                                # FD Problem
.bp
    conductivities = {1000: 1}
.bp
elif case == 1:                                 # Bimat and Inclusion
.bp
    conductivities = {1000: K[0], 2000: K[1]}
.bp
elif case == 2:                                 # Circuit
.bp
    conductivities = {1000: K[2], 2000: K[3]}
.bp

.B2
.ft
.PIC "Temperature gradient for 20x20 Bimaterial square mesh" "/home/sudarson/Study/Sem1/NUMME/UploadFiles/FE_Lab_Scripts/outputs/Bimat20.pdf" C 4

.bp
.head 2 "Analytical Solution for two Isotropic Materials"
.LP
The exact solution across a domain with two isotropic materials must be found by defining two different PDEs - one for each material. If we reduce the problem to a 1D problem like before and split up the domain equally, the first material esists in the domain [-L,0] and the second material exists in a domain [0,L]. Consider the same general solution as a domain with single conductivity, but change the boundary conditions to match this change in boundary.
.EQ I
mark u(y)~=~{-ry sup 2} over {2 Kappa} + Ay + B~~~~~~~~and~~~~~~~
u'(y)~=~{-ry} over Kappa + A
.EN
.SH
First Material [-L,0]
.EQ I
A = {q sub N} over Kappa sub 1~~~~~~~~~~ B = {rL sup 2} over {2 Kappa sub 1} + {q sub N L} over Kappa sub 1
.EN
.EQ I
\[3d]~~~u(y)~mark =~ r over {2 Kappa sub 1} (L sup 2 - y sup 2 ) + {q sub N } over Kappa sub 1 (y + L)~~~~~\[fa]~y~\[mo]~~[-L,0]
.EN
.SH
Second Material [0,L]
.EQ I
A = {rL + q sub N} over Kappa sub 2~~~~~~~~~~ B = T sub b ~~(Temperature~ at~ Boundary)
.EN
.EQ I
\[3d]~~~u(y)~=~{-ry sup 2} over {2 Kappa sub 2} + {(rL + q sub N )} over Kappa sub 2 y + T sub b~~~~~\[fa]~y~\[mo]~~[0,L]
.EN

.LP
We can compare our FEM solution against the analytical solution, and errors can be plotted:
.PIC "Exact v.s. Approx values for bimaterial mesh" "/home/sudarson/Study/Sem1/NUMME/NUMMEFELab2020-2021/Exact-vs-Approx_r0_bimat.pdf" C 5
.PIC "Error plot of bimaterial mesh" "/home/sudarson/Study/Sem1/NUMME/NUMMEFELab2020-2021/ErrorPlot_r0_bimat.pdf" C 4
.LP
Again, we see that when source term is equal to zero, the deviations from the analytical solution are extremely small to a point where they can be neglected.
In the graph of
.I "Position y v.s. Temperature u(y)"
we see that the there is a
.B "sudden change in slope of the graph"
at
.I "y = 0"
, i.e. at the boudnary of the two materials. This is where the conductivity changes from 3 W/(mm.K) to 1 W/(mm.K).
.bp
.head "Temperature fields of meshes with hole/inclusion"
.PSPIC /home/sudarson/Study/Sem1/NUMME/NUMMEFELab2020-2021/outputs/temp-squareHole60.eps 6
.DS C
.I "squareHole60.msh : r = 0"
.DE

.PIC "SquareInclusion40.msh" "/home/sudarson/Study/Sem1/NUMME/UploadFiles/FE_Lab_Scripts/outputs/temp-squareInclusion40.pdf" C 6
.bp
.head "Solving the Heating Circuit"
.LP
The conditions for the heating circuit are:
.RS
.BL
Size of the plate is 4mm x 2.1mm x 0.05mm, but due to how thin the circuit is, it is modelled as a 2D problem
.BL
Heat source
.I "r"
= 1 W/mm\*{-2\*}
.BL
Temperature on the lateral sides = 293K, i.e. Dirichlet Boundary Conditions are fixed at 293K
.BL
Conductivity of Glass = 1.38 10\*{-3\*} W/(mm.K), and Conductivity of Nichrome = 15 10\*{-3\*} W/(mm.K)
.RE
.head 2 "Propose a Converged Solution"
.LP
In order to measure convergence, the max temperature variation across the mesh was recorded.
.RS
.BL
.B "Circuit 0"
- Difference: 292.198 - 538.813 = 246.615 K,
.B "Convergence = 26.0416%"
.BL
.B "Circuit 1"
- Difference: 228.25 - 539.087 = 310.837 K,
.B "Convergence = 12.2018%"
.BL
.B "Circuit 2"
- Difference: 266.342 - 539.252 = 272.91 K,
.B "Convergence = 2.42835%"
.BL
.B "Circuit 3"
- Difference: 273.007 - 539.29 = 266.283 K
.RE
.LP
From this we can see that convergence of less than 5% accuracy is only reached as we reach
.B "Circuit 2."

.PIC "Gmsh Temperature field for circuit0.msh" "/home/sudarson/Study/Sem1/NUMME/UploadFiles/FE_Lab_Scripts/outputs/temp-circuit0_cropped.pdf" C 9.5
.PIC "Gmsh Temperatre field for circuit3.msh" "/home/sudarson/Study/Sem1/NUMME/UploadFiles/FE_Lab_Scripts/outputs/temp-circuit3_cropped.pdf" C 9.5

.LP
We see a cleaner boundary in Circuit 3 as compared to Circuit 0 because the mesh is much finer.
.bp

.head 2 "Range of Temperature Variation"
.LP
Temperature variation for each circuit mesh was mentioned in the previous section. The variation has been plotted below. Here, we can clearly see that the variation reduces as we increase the density of the mesh, and why the FEM solution converges at
.I "Circuit 2."
.PIC "Temperature Variation across circuits" "/home/sudarson/Study/Sem1/NUMME/NUMMEFELab2020-2021/Circuit_Temp_Variation.pdf" C 4
.bp
.head "User Scripts"
.LP
.SH
testFE.py
.LP
This is the main python script that calls all other functions. Since this script needs to execute different functions based on different meshes and boundary conditions, there are a set of "control variables" at the beginning of the script which let the user test for different conditions quickly.

.ft CW
.ps -1
.nr VS 8
 import os
 import time
 import matplotlib.pyplot as plt
 import numpy as np

 #Import finite element solver function
 from solveFE import solveFE
 from checkFE import *

 np.set_printoptions(linewidth=300)
 np.set_printoptions(precision=3, suppress=True)

 start = time.time()

 # List to store all the mesh files
 meshes = [
             "square1x1.msh",            #0
             "square2x2.msh",            #1
             "square4x4.msh",            #2
             "square10x10.msh",          #3
             "square20x20.msh",          #4
             "square30x30.msh",          #5
             "square40x40.msh",          #6

             "squareHole20.msh",         #7
             "squareHole30.msh",         #8
             "squareHole40.msh",         #9
             "squareHole60.msh",         #10

             "squareBimat4.msh",         #11
             "squareBimat8.msh",         #12
             "squareBimat10.msh",        #13
             "squareBimat20.msh",        #14

             "squareInclusion20.msh",    #15
             "squareInclusion40.msh",    #16

             "circuit0.msh",             #17
             "circuit1.msh",             #18
             "circuit2.msh",             #19
             "circuit3.msh",             #20
           ]



 #-------------------------------------------------------#
 #           These values control the program            #
 #-------------------------------------------------------#

 meshNumber = 2
 openMesh = 0
 displayU = 0
 isFD = 0
 plotErrors = 1
 showPlot = 1
 useSparse = True           # Reduce memory consumption
 verboseOutput = False      # Reduce console output

 #-------------------------------------------------------#

 # Stores the Meshes in seperate lists
 square = meshes[:7]
 squareHole = meshes[7:11]
 bimat = meshes[11:15]
 inclusion = meshes[15:17]
 circuit = meshes[17:21]

 meshName = meshes[meshNumber]

 # Sets the case based on chosen mesh
 if isFD == 1:
     case = -1
 elif meshNumber <=10 and isFD == 0:
     case = 0
 elif meshNumber > 10 and meshNumber <= 16:
     case = 1
 elif meshNumber > 16 and meshNumber <= 20:
     case = 2


 # Assigns Neumann Boundary Conditions
 if case == -1:
     BCNs = {103: 0}
 else:
     BCNs = {103: 1}
     qN = 1


 # Assigns Dirichlet Boundary Conditions
 if case == -1:
     BCD_lns = {101: 0, 102: 0, 103: 0, 104: 0}
 elif case == 2:
     BCD_lns = {101: 293, 102: 293, 103: 293, 104: 293}
 else:
     BCD_lns = {101: 0}
 BCD_nds = {1: 0}


 # Assings conductivities
 K = [3,1,1.38e-3,15e-3]
 if case == 0:                             # Normal square or square hole
     conductivities = {1000: K[0]}
 elif case == -1:                                    # FD Problem
     conductivities = {1000: 1}
 elif case == 1:                                     # Bimat and Inclusion
     conductivities = {1000: K[0], 2000: K[1]}
 elif case == 2:                                     # Circuit
     conductivities = {1000: K[2], 2000: K[3]}


 # Assigns source term
 if case == -1 or case == 2:
     r = 1
 else:
     r = 0
 sourceTerm = lambda xyz, physdom: r


 # Name of temperature file to be stored
 name = meshName[:-4]
 exportName = 'outputs/temp' + '-' + name + '.pos'

 # Calls function to calculate temperature and export to .pos
 if plotErrors == 0:
     U = solveFE(meshName, conductivities, BCNs, BCD_lns, BCD_nds, sourceTerm, exportName, useSparse, verboseOutput)

     if case == -1:
         FD_getMaxError(U)

     # Open .pos file in Gmsh
     if openMesh == 1:
         cmd = "gmsh " + exportName + " &"
         os.system(cmd)


 # Plots errors based on the case
 # e stores the maximum error
 # a stores the average error
 # h = 1/h or the number of nodes
 else:

     # Plot the error for the Finite DIFFERENCE problem
     if case == -1:
         newMesh = square
         newMesh = np.delete(newMesh,0)
         newMesh = np.delete(newMesh,0)
         N = len(newMesh)
         e = np.zeros(N)
         h = np.zeros(N)

         for i in range(0,N):
             meshName = newMesh[i]
             U = solveFE(meshName, conductivities, BCNs, BCD_lns, BCD_nds, sourceTerm, exportName, useSparse, verboseOutput)
             e[i], h[i] = FD_getMaxError(U)

         errFig = plt.figure()
         ax = errFig.add_subplot(111)
         plt.loglog(h,e)
         ax.scatter(h,e,color='black')
         j = 0
         for xy in zip(h, e):
             ax.annotate('  N=%i' % (h[j]+1), xy=xy, textcoords='data')
             j += 1

         plt.xlabel('1/h', fontsize=12)
         plt.ylabel('Error', fontsize=12)
         plt.title("Error Plot - Finite Element Method", fontsize=14)
         plt.grid(b=True, which='major', color='grey', linestyle='-')
         plt.grid(b=True, which='minor', color='lightsteelblue', linestyle='--')
         plt.tight_layout()
         figName = "FD_Error.png"
         plt.savefig(figName, bbox_inches='tight',dpi=300)
         end = time.time()
         cmd = "convert "+figName+" "+figName[:-3]+"eps"     # Save as eps file to import into groff document
         os.system(cmd)
         if showPlot:
             plt.show()

     # Plot error for CIRCUIT
     elif case == 2:
         newMesh = circuit
         N = len(newMesh)
         diff = np.zeros(N)

         for i in range(0,N):
             U = solveFE(newMesh[i], conductivities, BCNs, BCD_lns, BCD_nds, sourceTerm, exportName, useSparse, verboseOutput)

             diff[i] = getTempDiff(U)
             print(diff[i])

             if i > 0:
                 conv = abs((diff[i]-diff[i-1])/diff[i-1])
                 print("Convergence = %g%%"%(conv*100))

         plt.figure()
         plt.plot(newMesh,diff)
         plt.scatter(newMesh,diff)
         plt.ylim([0, 350])
         plt.xlabel('Circuit Mesh', fontsize=12)
         plt.ylabel('Temperature (K)', fontsize=12)
         plt.title("Temperature Variation", fontsize=14)
         plt.grid(b=True, which='major', color='grey', linestyle='-')
         plt.grid(b=True, which='minor', color='lightsteelblue', linestyle='--')
         figName = "Circuit_Temp_Variation.png"
         plt.savefig(figName, bbox_inches='tight', dpi=300)
         cmd = "convert "+figName+" "+figName[:-3]+"eps"     # Save as eps file to import into groff document
         os.system(cmd)
         if showPlot:
             plt.show()

     # Plot error for SQUARE and BIMAT
     else:
         # Finds exact solution based on square or bimat
         isBimat = 0
         if case == 0:
             newMesh = square
             xex, uex = getExactSoln_Square(K,qN,r)
             name = "square"
         if case == 1:
             newMesh = bimat
             isBimat = 1
             xex, uex = getExactSoln_Bimat(K,qN,r)
             name = "bimat"
         print("isBimat = ",isBimat)
         N = len(newMesh)

         # Stores maximum and average error
         e = np.zeros(N)
         a = np.zeros(N)
         h = np.zeros(N)

         # Plot exact solution
         plt.figure()
         plt.plot(xex,uex,label='Exact Solution',linewidth=4,color='black')

         # Find solution and errors for different mesh sizes
         for i in range(0,len(newMesh)):
             meshName = newMesh[i]
             U = solveFE(meshName, conductivities, BCNs, BCD_lns, BCD_nds, sourceTerm, exportName, useSparse, verboseOutput)
             x, u, v = getApprox1D(U,K,qN,r,isBimat)
             e[i] = max(abs(v-u))
             a[i] = sum(abs(v-u))/len(u)

             print(meshName)
             print('Max Error = %g, Avg Error = %g\\n'%(e[i],a[i]))
             plt.plot(x,u, label=newMesh[i])
             h[i] = len(u)

         plt.legend()
         plt.grid()
         plt.xlabel("Position y", fontsize = 12)
         plt.ylabel("Temperature u(y)", fontsize = 12)
         plt.title('FEM Deviations for r = %g'%r)
         figName = "Exact-vs-Approx_r=" + str(r) + "_"+name+".png"
         plt.savefig(figName, bbox_inches='tight', dpi=300)
         cmd = "convert "+figName+" "+figName[:-3]+"eps"     # Save as eps file to import into groff document
         os.system(cmd)

         if showPlot:
             plt.show()

         if case == 0 and r == 0:
             newMesh.pop(0)
             e = np.delete(e,0)
             a = np.delete(a,0)
             h = np.delete(h,0)
         plt.figure()
         for i in range(0,len(newMesh)):
             newMesh[i] = newMesh[i][6:]
             newMesh[i] = newMesh[i][:-4]
         plt.plot(h,e, label='Maximum Error')
         plt.plot(h,a, label='Average Error')
         plt.scatter(h,e)
         plt.scatter(h,a)
         plt.yscale("log")
         plt.xlabel("Mesh Size", fontsize=12)
         plt.ylabel("Error", fontsize=12)
         plt.title('Error for r = %g'%r)
         plt.legend()
         plt.grid()
         figName = "ErrorPlot_r="+str(r)+"_"+name+".png"
         plt.savefig(figName,bbox_inches='tight',dpi=300)
         cmd = "convert "+figName+" "+figName[:-3]+"eps"     # Save as eps file to import into groff document
         os.system(cmd)

         end = time.time()

         if showPlot:
             plt.show()

 try:
     end
 except NameError:
     end = time.time()
 print('\\n\\nTime Elapsed = %g\\n\\n'%(end-start))
.ft
.bp
.ps +1
.nr VS 12
.SH
checkFE.py
.LP
This script containts user functions used to extract approximate and exact values of U for all the different cases in the FE Lab problem.

.ps -1
.nr VS 8
.ft CW
 import math
 import numpy as np
 import matplotlib.pyplot as plt

 # This function sorts the values of U
 # and extracts 1D values from it
 def getApprox1D(U,K,qN,r,isBitmat = 0):
     N = getSize(len(U))
     u = np.zeros(N)     # Stores the 1D values
     U = np.sort(U)      # Sort U values
     p = np.zeros(N)     # Exact values for 1D nodes
     L = 1               # Size of the boundary from -1 to 1

     u = U[N-1:N*N-N:N]  # Extract 1D values
     u = np.insert(u,0,0,axis=0)    # Add BCD
     x = np.linspace(-L,L,N)

     # Two different PDEs need to be used in the case of two isotropic materials
     if isBitmat == 1:
         K1 = K[0]
         K2 = K[1]
         N = int(N/2)+1
         p1 = uFun(np.linspace(-L,0,N),K1,qN,r,L,case=1)
         p2 = uFun(np.linspace(0,L,N), K2,qN,r,L,prev=p1[-1],case=2)
         p2 = np.delete(p2,0)
         p   = np.concatenate((p1,p2),axis=0)

     # Use standard PDE for single material
     else:
         K1 = K[0]
         p = uFun(np.linspace(-L,L,N),K1,qN,r,L,case=0)

     return x, u, p

 # Returns exact FD values for a given NxN mesh size
 # Taken from FD Lab script
 def FDExact(L,n):
     U = np.zeros((n,n))
     N = 5
     X = np.linspace(-L,L,n)
     Y = np.linspace(-L,L,n)
     for p in range(0,n):
         for q in range(0,n):
             x = X[p]
             y = Y[q]
             out = 0
             for i in range(1,2*N,2):
                 for j in range(1,2*N,2):
                     out += (64/(i*j*(i**2+j**2)*math.pi**4)) * math.sin(i*math.pi*(x+1)/2) * math.sin(j*math.pi*(y+1)/2)
                     U[p][q] = out

     return U

 # Compares the FEM solution to the Analytical solution
 def FD_getMaxError(U):
     N = getSize(len(U))
     U = np.sort(U)
     L = 1

     Uex = FDExact(L,N)      # Stores exact temperature values
     Uex = Uex.flatten()
     U = np.sort(U)          # Sorts U values like in getAprrox1D()
     Uex = np.sort(Uex)

     max = 0
     for i in range(0,N*N):
         temp = abs(U[i] - Uex[i])
         if temp > max:
             max = temp
     print('N = %i, Error = %g\\n'%(N,max))
     return max, N

 # Returns size of the mesh given the number of elements
 def getSize(c):
     a = 1
     b = -1
     c = -c
     d = b**2 - 4*a*c
     size = (-b+math.sqrt(d))/2*a
     return int(size)

 # Returns exact solution based on Square or Bimat
 def uFun(y,K,qN,r,L,prev = 0, case = 0):
     out = 0
     if case == 0:   # Normal Square
         out = -(r*y**2/(2*K)) + (qN + r*L)*y/K + 3*r*L**2/(2*K) + qN*L/K
     elif case == 1: # Bimat PDE 1
         out =  r*(L**2-y**2)/(2*K) + qN*(y+L)/K
     elif case == 2: # Bimat PDE 2
         out =  -(r*y**2/(2*K)) + (qN + r*L)*y/K + prev
     return out

 # Returns high precision values for Square mesh
 def getExactSoln_Square(K,qN,r):
     n = 100
     L = 1
     K1 = K[0]
     xex = np.linspace(-L,L,n)
     uex = uFun(xex,K1,qN,r,L,case=0)
     return xex, uex

 # Returns high precision values for Bimat mesh
 def getExactSoln_Bimat(K,qN,r):
     n = 100
     L = 1
     K1 = K[0]
     K2 = K[1]

     x1 = np.linspace(-L,0,n)
     x2 = np.linspace(0,L,n)
     u1 = uFun(x1,K1,qN,r,L,case=1)
     u2 = uFun(x2,K2,qN,r,L,prev=u1[-1],case=2)

     uex = np.concatenate((u1,u2),axis=0)
     xex = np.concatenate((x1,x2),axis=0)
     return xex, uex

 # Returns max temperature variation
 def getTempDiff(U):
     U = np.sort(U)
     p = U[0]
     q = U[len(U)-1]
     print("Difference: %g - %g = %g" %(p,q,abs(p-q)))
     return abs(p-q)

.ft
.nr combine 0
.so /home/sudarson/.config/groff/closing_macros.ms
.TC
