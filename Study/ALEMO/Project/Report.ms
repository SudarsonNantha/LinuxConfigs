
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
.ds CH
.ds CF - % -
.nr LL 6.3i
.DS C
.ps 15
.B "ALEMO Project - Bone Remodelling"

.ps 12
.I "Sudarson Nanthacoumarane"
.DE

.LP
.BI "Objective"
- To create a solver for the Komarova’s model and use it to simulate random boneremodeling.
.NH
Complete KomarovaModel.m
.LP
The governing equations for Komarova's Model are:
.EQ I
y dot sub 1 = a sub 1 y sub 1 sup {g sub 11} y sub 2 sup {g sub 21} - b sub 1 y sub 1
.EN
.EQ I
y dot sub 2 = a sub 2 y sub 1 sup {g sub 12} y sub 2 sup {g sub 22} - b sub 2 y sub 2
.EN
.LP
This has been coded into
.I "KomarovaModel.m"
as:
.ft CW
.B1
 y1 = y(1);     # Stores y1
 y2 = y(2);     # Stores y2

 ydot1 = a1 * y1.^g11 * y2.^g21 - b1*y1;
 ydot2 = a2 * y1.^g12 * y2.^g22 - b2*y2;

.B2
.ft
.LP
We take these
.I "ydot1"
and
.I "ydot2"
values and store them in a functional
.B "f(y)"
,where:
.EQ I
y =
left [ matrix{
ccol {y sub 1 above y sub 2}
} right ]
~~~and~~~
f(y) =
left [ matrix{
ccol {a sub 1 y sub 1 sup {g sub 11} y sub 2 sup {g sub 21} - b sub 1 y sub 1 above  a sub 2 y sub 1 sup {g sub 12} y sub 2 sup {g sub 22} - b sub 2 y sub 2}
} right ]
~~~\[hA]~~~
y dot = f(y)
.EN
.NH
Complete KomarovaModel_Jac.m
.LP
The governing equations for the Jacobian in Komarova Model are:
.EQ I
J (y) = {partial f} over {partial y} =
left [ matrix{
ccol { {partial f sub 1} over {partial y sub 1} above {partial f sub 2} over {partial y sub 1}}
ccol { {partial f sub 1} over {partial y sub 2} above {partial f sub 2} over {partial y sub 2}}
} right ]
.EN
.LP
Solving these partial differential equations, we get:
.EQ I
J sub 11 = a sub 1 g sub 11 y sub 1 sup {(g sub 11 - 1)} y sub 2 sup {g sub 21} - b sub 1
~~~~~~~~~~
J sub 12 = a sub 1 g sub 21 y sub 1 sup {g sub 11} y sub 2 sup {(g sub 21 - 1)}
.EN
.EQ I
J sub 21 = a sub 2 g sub 12 y sub 1 sup {(g sub 12 - 1)} y sub 2 sup {g sub 22}
~~~~~~~~~~~~~~~~~
J sub 22 = a sub 2 g sub 22 y sub 1 sup {g sub 12} y sub 2 sup {(g sub 22 - 1)} - b sub 2
.EN
.LP
These values are stored in
.I "KomarovaModel_Jac.m"
as:

.ft CW
.B1
 y1 = y(1);     # Stores y1
 y2 = y(2);     # Stores y2

 J11 = g11 * a1 * y1.^(g11-1) * y2.^g21 - b1;
 J12 = g21 * a1 * y1.^g11     * y2.^(g21-1);
 J21 = g12 * a2 * y1.^(g12-1) * y2.^g22;
 J22 = g22 * a2 * y1.^g12     * y2.^(g22-1) - b2;

.B2
.ft
.bp
.NH
Write Backward Euler's formula for Komarova's equations
.LP
Backward Euler scheme is a method of finite difference approximation that allows us to find the slope of a curve at a point by using a point that is present behind the current point. It is generally written as:
.EQ I
y' sub i~=~{y sub i - y sub {i-1}} over {Delta t sub i}
.EN
Where
.I "y'\*<i\*>"
is the slope at point
.I "i"
,
.I "y\*<i\*>"
is the value of the function y at point
.I "i"
,
.I "y\*<i-1\*>"
is the value of the function y at a point
.I "i-1"
, and \[*D]
.I "t\*<i\*>"
is the time step. In our equations, since we know that slope is
.B "f(y)"
, we can write:
.EQ I
f (y sub i )~=~{y sub i - y sub {i-1}} over {Delta t sub i}
.EN
.LP
If we seperate
.B "y"
into y\*<1\*> and y\*<2\*> values, we can write their scalar forms as:
.EQ I
f (y sub {1,i})~~=~~a sub 1 y sub 1,i sup {g sub 11} y sub 2,i sup {g sub 21} - b sub 1 y sub 1,i
~~=~~{y sub {1,i} - y sub {1,i-1}} over {Delta t sub i}
.EN
.EQ I
\[rA]~~~~y sub {1,i}~-~y sub {1,i-1}~-~Delta t sub i (a sub 1 y sub 1,i~ sup {g sub 11} y sub 2,i sup {g sub 21}~-~b sub 1 y sub 1,i )~~=~~0
.EN
.EQ I
\[rA]~~~~y sub {1,i+1}~-~y sub {1,i}~-~Delta t sub i (a sub 1 y sub {1,i+1} sup {g sub 11} y sub {2,i+1} sup {g sub 21}~-~b sub 1 y sub {1,i+1} )~~=~~0~~~~~(~in~i+1~indexing~)
.EN

.EQ I
f (y sub {2,i})~~=~~a sub 2 y sub 1,i sup {g sub 12} y sub 2,i sup {g sub 22} - b sub 2 y sub 2,i
~~=~~ {y sub {2,i} - y sub {2,i-1}} over {Delta t sub i}
.EN
.EQ I
\[rA]~~~~y sub {2,i}~ -~ y sub {2,i-1} ~-~ Delta t sub i (a sub 2 y sub 1,i sup {g sub 12} y sub 2,i sup {g sub 22} ~-~ b sub 2 y sub 2,i )~~=~~0
.EN
.EQ I
\[rA]~~~~y sub {2,i+1}~ -~ y sub {2,i} ~-~ Delta t sub i (a sub 2 y sub {1,i+1} sup {g sub 12} y sub {2,i+1} sup {g sub 22} ~-~ b sub 2 y sub {2,i+1} )~~=~~0~~~~~(~in~i+1~indexing~)
.EN
.NH
Prove that y\*<i+i\*> is the root of g(z) = 0
.SH
???
.LP
The scalar forms of Backward Euler formula for Komarova's equation can be rewritten as a vector values function. Here we introduce a new variable
.I "z"
which is equal to [z\*<1\*> ; z\*<2\*>], with
.I "z\*<1\*> = y\*<1,i+i\*> "
and
.I " z\*<2\*> = y\*<2,i+i\*> ."
.EQ I
g(z)~=~z~-~y sub i ~-~Delta t sub i~f(z)~~~~~~~~~where~~
z =
left [ matrix{
ccol { z sub 1 above z sub 2}
} right ]
~=~
left [ matrix{
ccol { y sub {1,i+1} above y sub {2,i+1}}
} right ]
.EN
.NH
Derive a mathematical expression for gradient of g(z)
.LP
The gradient of a function is the sum of of its partial derivatives. Since
.B "g(z)"
is a vector function, we require two sets of partial derivatives to describe it. Spliting up
.B "g(z)"
into its scalar components and differentiating, we obtain:
.EQ I
g(y sub 1,i+1 )~=~y sub 1,i+1 - y sub 1,i - Delta t sub i f( y sub 1,i+1 )
~~~~\[rA]~~~~
g(y sub 1,i+1 )~=~y sub 1,i+1 - y sub 1,i - Delta t sub i ( a sub 1 y sub 1,i+1 sup {g sub 11} y sub 2,i+1 sup {g sub 21} - b sub 1 y sub 1,i+1 )
.EN
.EQ I
g(y sub 2,i+1 )~=~y sub 2,i+1 - y sub 2,i - Delta t sub i f( y sub 2,i+1 )
~~~~\[rA]~~~~
g(y sub 2,i+1 )~=~y sub 2,i+1 - y sub 2,i - Delta t sub i ( a sub 2 y sub 1,i+1 sup {g sub 12} y sub 2,i+1 sup {g sub 22} - b sub 2 y sub 2,i+1 )
.EN
.LP
Taking the partial derivatives of these two terms with respect to y\*<1,i+1\*> and y\*<2,i+1\*> the gradient of
.B "g(z)"
can be split up into the following parts:
.EQ I
{partial g(y sub 1,i+1 )} over {partial y sub 1,i+1 }~=~1 - Delta t sub i (a sub 1 g sub 11 y sub 1,i+1 sup {(g sub 11 - 1)} y sub 2,i+1 sup {g sub 21} - b sub 1
~~~~~~~~~~~~~~~
{partial g(y sub 1,i+1 )} over {partial y sub 2,i+1}~=~- Delta t sub i (a sub 1 g sub 21 y sub 1,i+1 sup {g sub 11} y sub 2,i+1 sup {(g sub 21 - 1)})
.EN
.EQ I
{partial g(y sub 2,i+1 )} over {partial y sub 1,i+1}~=~- Delta t sub i (a sub 1 g sub 12 y sub 1,i+1 sup {(g sub 12 - 1)} y sub 2,i+1 sup {g sub 21 }
~~~~~~~~~~~~~~~~~~~~~~~~~
{partial g(y sub 2,i+1 )} over {partial y sub 2,i+1 }~=~1 - Delta t sub i (a sub 2 g sub 22 y sub 1,i+1 sup {g sub 12} y sub 2,i+1 sup {(g sub 22 - 1)} - b sub 2
.EN
.LP
Therefore, the gradient of
.B "g(z)"
can be written as:
.EQ I
L(z)~=~{partial g} over {partial z}~=~
left [ matrix {
ccol { 1 above 0 }
ccol { 0 above 1 }
} right ]
~-~ Delta t sub i~
left [ matrix{
lcol { a sub 1 g sub 11 y sub 1,i+1 sup {(g sub 11 - 1)} y sub 2,i+1 sup {g sub 21} - b sub 1 above  a sub 1 g sub 12 y sub 1,i+1 sup {(g sub 12 - 1)} y sub 2,i+1 sup {g sub 21 } }
lcol { a sub 1 g sub 21 y sub 1,i+1 sup {g sub 11} y sub 2,i+1 sup {(g sub 21 - 1)} above  a sub 2 g sub 22 y sub 1,i+1 sup {g sub 12} y sub 2,i+1 sup {(g sub 22 - 1)} - b sub 2 }
} right ]
.EN
.LP
We know that Jacobian
.B "J(z)"
is:
.EQ I
J(z)~=~J(y sub i+1 )~=~
left [ matrix{
ccol { {partial f sub 1} over {partial y sub 1,i+1} above {partial f sub 1} over {partial y sub 2,i+1}}
ccol { {partial f sub 2} over {partial y sub 1,i+1} above {partial f sub 2} over {partial y sub 2,i+1}}
} right ]
~~~~=~~
left [ matrix{
lcol { a sub 1 g sub 11 y sub 1,i+1 sup {(g sub 11 - 1)} y sub 2,i+1 sup {g sub 21} - b sub 1 above  a sub 1 g sub 12 y sub 1,i+1 sup {(g sub 12 - 1)} y sub 2,i+1 sup {g sub 21 } }
lcol { a sub 1 g sub 21 y sub 1,i+1 sup {g sub 11} y sub 2,i+1 sup {(g sub 21 - 1)} above  a sub 2 g sub 22 y sub 1,i+1 sup {g sub 12} y sub 2,i+1 sup {(g sub 22 - 1)} - b sub 2 }
} right ]
.EN
.EQ I
\[3d]~~L(z)~=~{partial g} over {partial z}~=~I~-~ Delta t sub i J(z)
.EN
.NH
Complete BwdEuler.m
.LP
.I "y\*<i+1\*>"
indexing was used instead of
.I "y\*<i\*>"
indexing to make the code similar to teaching slides and equations defined above.

.ft CW
.B1
for i = 1:numel(t)-1

    % compute Delta t
    dt = t(i+1) - t(i);

    % set g fun
    gfun = @(z) (z - y(:,i) - dt*ffun(t(i),z));

    % Set L
    Lfun = @(z) (eye(2) - dt*Jfun(t(i),z));

    % solve nonlinear problem using the solution at previous time step as
    % initial guess
    y(:,i+1) = solveNR(gfun,Lfun,y(:,i));

    %Display message
    fprintf('Solved time step %d of %d\n',i,numel(time))

 endfor

.B2
.ft
.bp
.NH
Complete solveNR.m

.ft CW
.B1
 function znew = solveNR(gfun,Lfun,z1)

 err = 1;
 k = 0;
 znew = z1;

 while (err>1e-10)&&(k<=10000)

     %STORE the old solution
     zold = znew;

     %Increment iteration index k
     k = k+1;

     %COMPUTE THE FUNCTION
     g = gfun(zold);

     %COMPUTE THE GRADIENT
     L = Lfun(zold);

     %UPDATE Z
     znew = zold - inv(L) * g;

     %ERROR ESTIMATION
     err = max(norm(g),norm(zold-znew));
     end

     if err>1e-10
         error('Newton Raphson did not converge! Try increasing the error tolerance or the number of iterations!')
     end

 end

.B2
.ft
