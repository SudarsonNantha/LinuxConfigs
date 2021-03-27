\# Bullet points
.de BL
.IP \(bu 2
..

\# Begin code box
.de b1
.B1
.sp 0.2
.ft CW
..

\# End code box
.de b2
.sp 1
.B2
.ft
..

.nr s 0 1
.nr f 0 1
.nr t 0 1
.ds nn (\\*[SN]\\n+[s])
.ds fn \\*[SN]\\n+[f]
.ds tn \\*[SN]\\n+[t]
.ds nnow (\\*[SN]\\n[s])
.ds fnow \\*[SN]\\n[f]
.ds tnow \\*[SN]\\n[t]

.nr old 1
.de head
.ie (\B'\\$1') \{\
.   nr arg \\$1
.   ds title \\$2
\}
.el \{\
.   nr arg 1
.   ds title \\$1
\}
\#.nr arg \\$1
\#.ie (\\n[.$] < 2) \{\
\#.   nr arg 1
\#.   ds title \\$1
\#\}
\#.el \{\
\#.   nr arg \\$1
\#.   ds title \\$2
\#\}

.if ((\\n[arg] > 1):(\\n[arg] <= \\n[old])) \{\
.   nr s 0
.   nr f 0
.   nr t 0
\}
.nr old \\n[arg]
.nr size \n[PS]
.if (\\n[arg] == 1) .nr PS \\n[size]+3
.if (\\n[arg] == 2) .nr PS \\n[size]+2
.if (\\n[arg] == 3) .nr PS \\n[size]+1
.NH \\n[arg]
.nr PS \\n[size]
.XN \\*[title]
.PP
..

.rn @EQ EQog
.de EQ
.ie (\B'\\$1')
.   if (\\$1 == 0) \{\
.       shift 1
.       ds args \\$*
.\}
.el \{\
.   shift 0
.   ds args \\$* \\*[nn]
.\}
.EQog \\*[args]
..

.nr estep 0 1
.rn @EN ENog
.de EN
.ENog
.ds eqname Equation
.if (\\n[.$] > 0) .ds eqname \\$1
\#.write eqstream ".ds entry \\n+[estep]. \\*[eqname] \\*[nnow] \\\\t . . . \\n[%]
\#.write eqstream "\\\\*[entry]
\#.write eqstream ".br
..



.nr fstep 0 1
.de PIC
.ie (\\n[.$] < 4) \{\
.   ds cap "
.   ds file \\$1
.   ds indent \\$2
.   nr size \\$3
\}
.el \{\
.   ds cap \\$1
.   ds file \\$2
.   ds indent \\$3
.   nr size \\$4
\}
.PDFPIC -\\*[indent] \\*[file] \\n[size]
.ad c
.B "Fig \\*[fn]"
.I "\\*[cap]"
.sp
.ad n
.ds figname Figure \\*[fnow]
.if (\\n[.$] == 4) .ds figname \\*[cap] (Fig. \\*[fnow])
\#.write figstream ".ds entry \\n+[fstep]. \\*[figname] \\\\t . . . \\n[%]
\#.write figstream "\\\\*[entry]
\#.write figstream ".br
..

