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

\# Defining user registers for counting equations, figuresm and tables
.nr s 0 1
.nr f 0 1
.nr t 0 1
.ds nn (\\*[SN]\\n+[s])
.ds fn \\*[SN]\\n+[f]
.ds tn \\*[SN]\\n+[t]
.ds nnow (\\*[SN]\\n[s])
.ds fnow \\*[SN]\\n[f]
.ds tnow \\*[SN]\\n[t]

\# Define a new macro for Numbered Headings
\# This macro helps with equation numbering,
\# and automatically increments heading size
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

\# Modification of Equation macros
\# .EQ macro

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

\# .EN macro
\# Stores entries in a seperate file
.nr estep 0 1
.rn @EN ENog
.de EN
.ENog
.nr addentry 1
.ds eqname Equation
.ie (\B'\\$1') \{\
.   if (\\$1 == 0) \{\
.       nr addentry 0
.       ds eqname "
.   \}
.\}
.if (\\n[.$] > 0) .ds eqname \\$1
.if (\\n[addentry] == 1) \{\
.   write eqstream ".ds entry \\n+[estep]. \\*[eqname] \\*[nnow] \\\\t . . . \\n[%]
.   write eqstream "\\\\*[entry]
.   write eqstream ".br
.\}
..

\# Macro to name and number figures
\# This macro also stores entries in a seprate file
.nr fstep 0 1
.de PIC
.ds cap "
.ds figname Figure \\*[fn]
.nr addentry 1
.nr nocap 0
.if (\\n[.$] == 3) \{\
.   ds cap "
.   nr nocap 1
.\}
.if (\\n[.$] == 4) \{\
.  ie (\B'\\$1') \{\
.       if (\\$1 == 0) \{\
.           nr addentry 0
.           nr nocap 1
.           ds cap "
.           ds figname "
.           shift 1
.       \}
.   \}
.   el \{\
.       ds cap \\$1
.       shift 1
.   \}
.\}
.if (\\n[.$] == 5) \{\
.   if (\B'\\$1' == 0) \{\
.       nr addentry 0
.       shift 1
.       ds cap \\$1
.       shift 1
.   \}
.\}
.PDFPIC -\\$2 \\$1 \\$3
.ad c
.B "\\*[figname]"
.I " \\*[cap]"
.sp
.ad n
.if (\\n[addentry] == 1) \{\
.   ie (\\n[nocap] == 0)
.       ds figname \\*[cap] (Fig. \\*[fnow])
.   el
.       ds figname Figure \\*[fnow]
.   write figstream ".ds entry \\n+[fstep]. \\*[figname] \\\\t . . . \\n[%]
.   write figstream "\\\\*[entry]
.   write figstream ".br
.\}
..

\# Macro to name and number tables
\# This macro also stores entries in a seperate file
.nr tstep 0 1
.rn TE TEog
.de TE
.TEog
.nr addentry 1
.ds cap "
.ds tablename Table \\*[tn]
.ie (\B'\\$1') \{\
.   if (\\$1 == 0) \{\
.       ds tablename "
.       ds cap \\$2
.       nr addentry 0
.    \}
.\}
.el \{\
.   if (\\n[.$] == 1) \{\
.       ds cap \\$1
.       ds tablename Table \\*[tnow]
.    \}
.\}
.ad c
.B "\\*[tablename]"
.I "\\*[cap]"
.br
.ad n
.if (\\n[addentry] == 1) \{\
.   if (\\n[.$] == 1)
.       ds tablename \\*[cap] (\\*[tablename])
.   write tablestream ".ds entry \\n+[tstep]. \\*[tablename] \\\\t . . . \\n[%]
.   write tablestream "\\\\*[entry]
.   write tablestream ".br
.\}
..

\# Opens stream to write data into
\# Equations, Figures, and Tables file
.open eqstream equations.ms
.open figstream figures.ms
.open tablestream tables.ms

.write eqstream ".nr PO 1.5i
.write eqstream ".CD
.write eqstream ".ps 14
.write eqstream ".B "List of Equations"
.write eqstream ".sp
.write eqstream ".DE
.write eqstream ".sp 1
.write eqstream ".ps 12
.write eqstream ".vs 20
.write eqstream ".ll 5.3i
.write eqstream ".ta 0i 5.3iR
.write eqstream ".ds eqtitle Equation Number \t Page No.
.write eqstream ".B "\\\\*[eqtitle]"
.write eqstream ".br
.write figstream ".nr PO 1.5i
.write figstream ".CD
.write figstream ".ps 14
.write figstream ".B "List of Figures"
.write figstream ".sp
.write figstream ".DE
.write figstream ".sp 1
.write figstream ".ps 12
.write figstream ".vs 20
.write figstream ".ll 5.3i
.write figstream ".ta 0i 5.3iR
.write figstream ".ds figtitle Figure Number \t Page No.
.write figstream ".B "\\\\*[figtitle]"
.write figstream ".br
.write tablestream ".nr PO 1.5i
.write tablestream ".CD
.write tablestream ".ps 14
.write tablestream ".B "List of Tables"
.write tablestream ".sp
.write tablestream ".DE
.write tablestream ".sp 1
.write tablestream ".ps 12
.write tablestream ".vs 20
.write tablestream ".ll 5.3i
.write tablestream ".ta 0i 5.3iR
.write tablestream ".ds tabletitle Table \t Page No.
.write tablestream ".B "\\\\*[tabletitle]"
.write tablestream ".br
