.EQ 0
delim $$
define l1 'l sub 1'
define l2 'l sub 2'
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
.EN 0
.nr no-head-numbering 1 \" Uncomment to disable equation/figure/table numbering based on heading
.so /home/sudarson/.config/groff/opening_macros.ms
\#.so /home/sudarson/.config/groff/macros.ms
.
.nr LT 6.25i
.nr LL 6.25i
.
\#  -------------------------------------------------------
\# |                 *** MOVES TOC HERE ***                |
\# | Always include in document when adding \X'pdf' to eof |
\# |                                                       |
\#  -------------------------------------------------------
.if '\*[.T]'pdf' \X'pdf: pagename here'
\#
.head "Direct Grometric Model"
.EQ I
x = l1 c1 + l2 c12
.EN
.EQ 0 I
y = l1 s1 + l2 s12
.EN 0
.head "Inverse Geometric Model"
.EQ I
x sup 2 + y sup 2 mark = l1 sup 2 c1_2 + l2 sup 2 c12_2 + 2 l1 l2 c1 c12
.EN
.EQ 0 I
lineup ~~~+~ l1 sup 2 s1_2 + l2 sup 2 s12_2 + 2 l1 l2 s1 s12
.EN 0
.sp -1
.EQ 0 I
lineup = l1 sup 2 + l2 sup 2 + 2 l1 l2 c2
.EN 0
.EQ 0 I
lineup \[rA] ~~c2 = {x sup 2 + y sup 2 - l1 sup 2 - l2 sup 2} over {2 l1 l2}
.EN 0
.sp -1
.EQ 0 I
lineup ~~~~~~theta sub 2 = cos sup -1 left [ {x sup 2 + y sup 2 - l1 sup 2 - l2 sup 2} over {2 l1 l2} right ]
.EN 0
.head "Jacobian"
.EQ I
x dot = - l1 theta dot sub 1 s1 - l2 ( theta dot sub 1 + theta dot sub 2 ) s12
.EN
.EQ 0 I
y dot = l1 theta dot sub 1 c1 + l2 ( theta dot sub 1 + theta dot sub 2 ) c12
.EN 0
.EQ I
left [ pile { x dot above y dot } right ] =
left [ matrix {
ccol { - l1 s1 - l2 s12 above l1 c1 + l2 c12 }
ccol { - l2 s12 above l2 c12 }
} right ]
~
left [ pile { theta dot sub 1 above theta dot sub 2 } right ]
.EN
.EQ I
\[rA] ~~ left [ pile { x dot above y dot } right ] = J~
left [ pile { theta dot sub 1 above theta dot sub 2 } right ]
~~~~~~where~J =
left [ matrix {
ccol { - l1 s1 - l2 s12 above l1 c1 + l2 c12 }
ccol { - l2 s12 above l2 c12 }
} right ]
.EN
.head "Probably don't need this"
.EQ I
P = left [ pile { x above y } right ] = l1 u under sub 1 + l1 u under sub 2
.EN
.EQ I
u under sub 1 = left [ pile { c1 above s1 } right ] ~~~~~~~ u dot under sub 1 = theta dot ~left [ pile { - s1 above c1 } right ]
.EN
.PP
Where $ v under sub 1 = u under sub 1 sup T$, or $ v under sub 1 = E u under sub 1$ and E is a rotation matrix such that $E = left [ matrix { ccol {0 above 1} ccol {-1 above 0} } right ]$
.PP
Similarly,
.EQ I
u under sub 2 = left [ pile { c12 above s12 } right ] ~~~~~~~ u dot under sub 2 = ( theta dot sub 1 + theta dot sub 2 ) ~ left [ pile { - s12 above c12 } right ]
.EN
.PP
Where $ v under sub 2 = u under sub 2 sup T$, or $ v under sub 2 = E u under sub 2$
.head "Cartesian Stiffness Matrix"
Prerequisites to finding Cartesian Stiffness Matrix:
.RS
.BL
From
.pdfhref L -D eq5 Eqn(5)
we  have $
left [ pile { x dot above y dot } right ] = J~
left [ pile { theta dot sub 1 above theta dot sub 2 } right ]$
.BL
If position is denoted by vector $p under$ and generalised displacement is $q under = theta under$, we have $delta p under = J delta theta under ~~\[rA]~delta theta under = delta p under J sup -1$
.BL
Motor torque vector $tau = K sub theta delta theta under$, where $K sub theta$ is the \fBjoint stiffness matrix\fR.
.BL
According to the Principle of Virtual Work, $W under sup T delta p under = tau sup T delta theta under$
.BL
From the above equations, we have $W under sup T delta p under = delta theta under sup T K sub theta sup T delta theta under$
.BL
Assuming that $ det ( J )~\[!=]~0$, we have $W under = J sup -T K sub theta J sup -1 delta p under$
.BL
Where \fBCartesian Stiffness Matrix\fR $K sub x = J sup -T K sub theta J sup -1$
.BL
And force applied on end effector $W under = K sub x delta p under$
.BL
\fBIf only stiffness in links is taken into account, then $K sub theta = I sub 2$ and $bold {K sub x = J sup -T J sup -1}$\fR
.RE
.PP
We know from
.pdfhref L -D eq5 Eqn(5)
that
.EQ 0 I
~~~~~~~~J =
left [ matrix {
ccol { - l1 s1 - l2 s12 above l1 c1 + l2 c12 }
ccol { - l2 s12 above l2 c12 }
} right ]
.EN
.EQ 0 I
\[rA]~~~J sup T =
left [ matrix {
ccol { -l1 s1 - l2 s12 above - l2 s12 }
ccol { l1 c1 + l2 c12 above l2 c12 }
} right ]
.EN 0
\# No headers or footers on TOC page
\#.list-equations
\#.list-figures
\#.list-tables
.bp     \" Page break necessary for references on a separate page
.so /home/sudarson/.config/groff/closing_macros.ms
.ds CH
.ds RH
.ds LH
.ds CF
.ds RF
.nr HM 0.8i
\#.if '\*[.T]'pdf' \{\
\#\X'pdf: switchtopage after here'
\#.TC
\#\}
