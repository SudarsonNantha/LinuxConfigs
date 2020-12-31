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
.ps 12
.B "M1 - M-ENG"
.B "Advanced Manufacturing"

.ps 15
.B "ALEMO Project - Bone Remodelling"

.ps 13
.I "Sudarson Nanthacoumarane"
.sp
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
y' sub i~=~{y sub i - y sub {i-1}} over {Delta t sub i-1}
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
f (y sub i )~=~{y sub i - y sub {i-1}} over {Delta t sub i-1}
~~~~\[hA]~~~~
f (y sub i+1 )~=~{y sub i+1 - y sub {i}} over {Delta t sub i}
.EN
.LP
If we seperate
.B "y"
into y\*<1\*> and y\*<2\*> values, we can write their scalar forms as:
.EQ I
f (y sub {1,i+1})~~=~~a sub 1 y sub 1,i+1 sup {g sub 11} y sub 2,i+1 sup {g sub 21} - b sub 1 y sub 1,i+1
~~=~~{y sub {1,i+1} - y sub {1,i}} over {Delta t sub i}
.EN
.EQ I
\[rA]~~~~y sub {1,i+1}~-~y sub {1,i}~-~Delta t sub i (a sub 1 y sub {1,i+1} sup {g sub 11} y sub {2,i+1} sup {g sub 21}~-~b sub 1 y sub {1,i+1} )~~=~~0~
.EN

.EQ I
f (y sub {2,i+1})~~=~~a sub 2 y sub 1,i+1 sup {g sub 12} y sub 2,i+1 sup {g sub 22} - b sub 2 y sub 2,i+1
~~=~~ {y sub {2,i+1} - y sub {2,i}} over {Delta t sub i}
.EN
.EQ I
\[rA]~~~~y sub {2,i+1}~ -~ y sub {2,i} ~-~ Delta t sub i (a sub 2 y sub {1,i+1} sup {g sub 12} y sub {2,i+1} sup {g sub 22} ~-~ b sub 2 y sub {2,i+1} )~~=~~0~
.EN
.NH
Prove that y\*<i+i\*> is the root of g(z) = 0
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
.LP
.B "The root of an equation is that value which when substituted in the equation, makes the equation true."
In this case, we need to find the value of
.I "z"
which is true for the function
.I "g(z) = 0."
In order to prove that
.I "y\*<i+1\*>"
is the root of
.I "g(z)"
we substitute
.I "y\*<i+1\*>"
for the value of z in the function.
.sp
.LP
Recall that,
.EQ I
f (y sub i+1 )~=~{y sub i+1 - y sub {i}} over {Delta t sub i}
.EN
.EQ I
\[3d]~~~g(z)~=~g(y sub i+1 )~=~y sub i+1 - y sub i - Delta t sub i f (y sub i+1 )
~~~\[rA]~~~
g(y sub i+1 )~=~y sub i+1 - y sub i - Delta t sub i~
left ( matrix { ccol {{y sub i+1 - y sub {i}} over {Delta t sub i}} } right )
.EN
.EQ I
\[rA]~~~g(y sub i+1 )~=~y sub i+1 - y sub i+1 + y sub i - y sub i~=~0
.EN
.LP
.B "Since the value of"
.BI "g(z) = 0"
.B "when"
.BI "z = y\*<i+1\*>"
.B "it has been proved that"
.BI "y\*<i+1\*>"
.B "is the root of"
.BI "g(z)."
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
Backward Euler method is a numerical method for the solution of differential equations. It is an implicit method, i.e. a solution is found by solving an equation involving both the current state of the system and the later one. We find the solution of two functions,
.B "g(z)"
and
.B "L(z)"
at each time step
.I "dt."
Here,
.I "y\*<i+1\*>"
indexing was used instead of
.I "y\*<i\*>"
indexing to make the code similar to teaching slides and the equations defined above.

.ft CW
.B1
for i = 1:numel(t)-1

    % compute Delta t
    dt = t(i+1) - t(i);

    % set g fun
    gfun = @(z) (z - y(:,i) - dt*ffun(t(i+1),z));

    % Set L
    Lfun = @(z) (eye(2) - dt*Jfun(t(i+1),z));

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
.LP
Since we have proved above that the root of
.B "g(z)"
= 0 is y\*<i+1\*>, we can find its value using Newton-Rhapson Method.

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
.bp
.NH
Test code using testKomarova.m
.LP
Since many calculations had to be repeated over and over again in the course of doing this project, all values of
.I "y"
and its corresponding
.I "days, time, and Nt"
were saved as a matlab ".mat file". If the values of
.I "y"
needed to be calculated using Backward Euler method, a function
.I "dataExist()"
was written to check if those values had already been computed. If the values existed, they were loaded into the script to be used. Otherwise, the cell count was computed using the Backward Euler method.

.ft CW
.B1
 function [y, time] = dataExist(days,Nt,ffun,Jfun,y0)

     fileName = strcat("vectorData/data_D",
                num2str(days),"_N",num2str(Nt),".mat");

     if exist(fileName)
         printf("%s exists. Loading data...\n",fileName);
         cmd = sprintf("load %s",fileName);
         eval(cmd);
         y;
         time;
     else
         printf("%s does not exist. Calculating and saving data...\n",fileName);
         time = linspace(0,days,Nt+1);
         y = BwdEuler(time,ffun,Jfun,y0);
         str = sprintf("save %s y time Nt days",fileName);
         eval(str);
     endif

 endfunction

.B2
.ft
.bp
.DS C
.ps 12
.BI "The results for Nt = 1000, 10000, 50000, 100000 are plotted below:"
.DE

\#.PSPIC -C /home/sudarson/Study/ALEMO/Project/images/IMG_D500_N1000.eps 5
\#\#.PSPIC -C /home/sudarson/Study/ALEMO/Project/images/IMG_D500_N2000.eps 5
\#.PSPIC -C /home/sudarson/Study/ALEMO/Project/images/IMG_D500_N10000.eps 5
\#\#.PSPIC -C /home/sudarson/Study/ALEMO/Project/images/IMG_D500_N20000.eps 5
\#.PSPIC -C /home/sudarson/Study/ALEMO/Project/images/IMG_D500_N50000.eps 5
\#.PSPIC -C /home/sudarson/Study/ALEMO/Project/images/IMG_D500_N100000.eps 5
.bp
.NH
Plot solutions on the same graph while increasing the time step
.LP
Comparisons were made using time steps for
.I "Nt = 1000, 4000, 9000, 16000, and 25000 "
with the reference of 0.5 million time steps. The reference plot in both the osteoclast figure and the osteoblast figure are represented by a dash-dotted line.
.B "As the number of time steps increases, the solutions start to get plotted closer and closer to each other."
This means that the solution starts to
.B "converge"
as the number of time steps increases, and this can be seen clearly because the solution for the highest number of time steps in these plots
.I "(Nt = 25000)"
is very close to the exact/reference solution.

\#.PSPIC -C /home/sudarson/Study/ALEMO/Project/images/IMG_OB_Comparison_500_N1000-N25000.eps 7
\#.PSPIC -C /home/sudarson/Study/ALEMO/Project/images/IMG_OC_Comparison_500_N1000-N25000.eps 7
.sp 4
.NH
Plot error against reference solution
.NH 2
Interpolating approximate solution and compute the error
.LP
The inbuilt function
.I "interp1()"
was used to find the interpolation of approximate solution with the exact solution. A user-defined function called
.I "getInterpError()"
returned the interpolation error when provided with data for the approximate time step. Error for Osteoclast and Osteoblast count was caclulated as the difference of the norm of the reference values and the interpolated values.

.NH 2
Increase number of points in time stepping vector and plot the error
.LP
In order to plot the evolution of error with increase in number of time steps, a doubling time step was chosen where
.I "Nt = 2000, 4000, 8000, 16000, 32000, 64000, 128000, 256000."
This computation was done in a user-defined function
.I "convergenceStudy()"
which called the previously mentioned
.I "getInterpError()"
function.

.ft CW
.B1
 function convergenceStudy(days,ffun,Jfun,y0)
     a = 1000;
     for i=1:20
         N(i) = a;
         if a > 200000
             break;
         endif
         a = a * 2;
     endfor

     for i = 1:length(N)
         Nt = N(i);
         [y, time] = dataExist(days,Nt,ffun,Jfun,y0);
         [e1(1,i),e2(1,i)] = getInterpError(y,days,time,Nt);
     endfor

     loglog(N,e1,'-o','MarkerSize',10,'LineWidth',1.5);
     hold on
     loglog(N,e2,'-o','MarkerSize',10,'LineWidth',1.5);
     xlabel("Time Discretization Nt");
     ylabel("Norm (ref - approx)");
     legend("Error 1", "Error 2");

endfunction

.B2
.sp 2
.B1
 function [err1, err2] = getInterpError(apx, d, t, N)
     fileName = "vectorData/data_D500_N500000.mat";
     cmd = sprintf("load %s",fileName);
     eval(cmd);

     if days != d
         error('Number of days is not the same')
     endif

     ref = y;

    r1 = ref(1,:);  # Reference 0.5M value y1 for 'time'
     r2 = ref(2,:);  # Reference 0.5M value y2 for 'time'

    a1 = apx(1,:);  # Approx Nt value y1 for 't'
     a2 = apx(2,:);  # Approx Nt value y2 for 't'

     b1 = interp1(t,a1,time,'spline');   # Interpolation y1
     b2 = interp1(t,a2,time,'spline');   # Interpolation y2

     err1 = norm(r1-b1)  # Find error y1
     err2 = norm(r2-b2)  # Find error y2

 endfunction

.B2
.ft
\#.PSPIC -C /home/sudarson/Study/ALEMO/Project/images/IMG_D500_ErrorPlot.eps
.bp
.NH
Compute bone mass density and plot M(t) vs Time
.LP
For a time period of 500 days, the error between approximate solution and reference solution is suitably small for
.I "Nt = 100000."
This is demonstrated with the following graph, where the approximate solution and reference solution are nearly indistinguishable.

\#.PSPIC -C /home/sudarson/Study/ALEMO/Project/images/IMG_D500_N100000_vs_Reference.eps
.bp
The bone mass density
.I "M(t)"
was calculated by integrating the following equation using the trapezoidal rule:
.EQ C
M(t)~=~ int from 0 to t k sub 1 x sub 1 ( tau ) + k sub 2 x sub 2 ( tau )~~d tau
.EN
.EQ C
x sub i ( tau )~=~max( y sub i - y sub ss , 0)~~~i = 1,2
.EN

\#.PSPIC -C /home/sudarson/Study/ALEMO/Project/images/IMG_BMi_D500_N100000.eps
.bp
.ft CW
.B1
function M = boneMass(y,yss,t,days,Nt,k1,k2,BMi)

    x1 = max(y(1,:)-yss(1,:),0);
    x2 = max(y(2,:)-yss(2,:),0);

    for i = 2:Nt+1
        dt = t(i)-t(i-1);
        m = k1*(x1(i)+x1(i-1)) + k2*(x2(i)+x2(i-1));
        M(i) = 0.5 * dt*m;
    endfor

    M0 = BMi;
    M = (M0-M)/M0 * 100;

    plot(t,M);
    xlabel("Time [days]");
    ylabel("Bone Mass %");
    grid minor;
    set(gca, 'LineWidth', 1.5, 'FontSize', 14);
    titleName = strcat("Bone Mass Density for",{" "},num2str(Nt)," time steps");
    title(titleName);

    imageName = strcat("images/IMG_BMi_D",num2str(days),"_N",num2str(Nt),".eps");
    str = sprintf("print -depsc %s", imageName);
    eval(str);

endfunction

.B2
.ft

\#.nr H1 0
.bp
.NH
Appendix
.NH 2
dataExist()

.NH 2
convergenceStudy()

.NH 2
getInterpError()

.NH
boneMass()
