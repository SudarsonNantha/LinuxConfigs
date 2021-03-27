\# Bullet points
.de BL
.IP \(bu 2
..
.
\# Begin code box
.de b1
.B1
.sp 0.2
.ft CW
..
.
\# End code box
.de b2
.sp 1
.B2
.ft
..
.
\# Defining user registers for counting equations, figures and tables
.nr s 0 1                   \" Equation counter register
.nr f 0 1                   \" Figure counter register
.nr t 0 1                   \" Table counter register
.
.ds nn (\\*[SN]\\n+[s])     \" Store and increment equation number
.ds fn \\*[SN]\\n+[f]       \" Store and increment figure number
.ds tn \\*[SN]\\n+[t]       \" Store and increment table number
.ds nnow (\\*[SN]\\n[s])    \" Store equation number
.ds fnow \\*[SN]\\n[f]      \" Store figure number
.ds tnow \\*[SN]\\n[t]      \" Store table number
.
\# Define a new macro for Numbered Headings
\# This macro helps with automatic numbering of
\# equations, figures and tables corresponding to heading number
\# It also automatically increments heading size
\# Heading levels are the same as .NH
\# If level is not specified, level defaults to 1
\#
\# Arguments:   [heading level] [heading title]
\# Example:     .head 2 "This is a subheading"
\#
.nr old 1               \" Original heading level
.de head
.ie (\B'\\$1') \{\      \" Assigns heading level if
.   nr arg \\$1         \" it is a valid integer
.   ds title \\$2
\}
.el \{\                 \" Heading level defaults to 1
.   nr arg 1            \" if no heading level is passed
.   ds title \\$1
\}
.if ((\\n[arg] > 1):(\\n[arg] <= \\n[old])) \{\     \" Resets counter when new heading is made
.   nr s 0
.   nr f 0
.   nr t 0
\}
.nr old \\n[arg]        \" Stores the value of heading level
.                       \" for comparison next time .head is called
.
.nr size \n[PS]         \" Changes font heading size up to 3 levels
.if (\\n[arg] == 1) .nr PS \\n[size]+3
.if (\\n[arg] == 2) .nr PS \\n[size]+2
.if (\\n[arg] == 3) .nr PS \\n[size]+1
.NH \\n[arg]
.nr PS \\n[size]
.XN \\*[title]
.PP
..
.
\# Modification to .EQ macro
\# This macro is set to display equation numbers by default
\# This macro centre aligns the equations by default. Add 'I' to change.
\# Equation numbers can be skipped by passing 0 as an argument
\#
\# Arguments:   [optional 0] [optional C | L | I]
\# Example:     .EQ 0 I
\#
.rn @EQ EQog                \" Renames .EQ macro
.de EQ                      \" Redefines .EQ macro
.ie (\B'\\$1')
.   if (\\$1 == 0) \{\      \" Checks if optional 0 is passed
.       shift 1
.       ds args \\$*
.\}
.el \{\                     \" Numbers the equation if
.   ds args \\$* \\*[nn]    \" 0 is not passed
.\}
.EQog \\*[args]             \" Invokes original .EQ macro
..
.
\# Modification of the .EN macro
\# This macro behaves the same way as .EN
\# However it also stores equation name in a separate file
\# Pass the optional 0 argument to skip adding the entry to an equations file
\#
\# Arguments:   [optional 0] [optional equation name (string)]
\# Example:     .EN 0 "Pythogoras Theorem"
\#
.nr estep 0 1           \" Counter for equation list
.rn @EN ENog            \" Renames .EN macro
.de EN                  \" Redefine .EN macro
.ENog
.nr addentry 1
.ds eqname Equation
.ie (\B'\\$1') \{\      \" Checks if optional 0 is passed
.   if (\\$1 == 0) \{\
.       nr addentry 0
.       ds eqname "
.   \}
.\}
.if (\\n[.$] > 0)
.   ds eqname \\$1
.if (\\n[addentry] == 1) \{\        \" Write to stream
.   write eqstream ".ds entry \\n+[estep]. \\*[eqname] \\*[nnow] \\\\t . . . \\n[%]
.   write eqstream "\\\\*[entry]
.   write eqstream ".br
.\}
..
.
\# Macro to name and number figures
\# This macro processes images in PDF format using .PDFPIC, numbers the images,
\# and also stores the figure names in a separate file in a seprate file.
\# Pass the optional 0 argument to skip numbering and adding an entry to the figures file.
\# (Check img2pdf for image conversion)
\#
\# Arguments:   [optional 0] [optional caption] [filename] [alignment] [size]
\# Example:     .PIC 0 "This is an image" "/home/user/Pictures/image.pdf" C 4
\#
.nr fstep 0 1               \" Counter for figure list
.de PIC                     \" Define .PIC macro
.ds cap "
.ds figname Figure \\*[fn]
.nr addentry 1
.nr nocap 0
.if (\\n[.$] == 3) \{\      \" Checks number of arguments
.   ds cap "                \" If value = 3, only file name, alignment, and size are specified
.   nr nocap 1
.\}
.if (\\n[.$] == 4) \{\
.  ie (\B'\\$1') \{\        \" Checks for 0 + no caption
.       if (\\$1 == 0) \{\
.           nr addentry 0
.           nr nocap 1
.           ds cap "
.           ds figname "
.           shift 1
.       \}
.   \}
.   el \{\                  \" Checks for non-zero + caption
.       ds cap \\$1         \" This is the ideal case
.       shift 1
.   \}
.\}
.if (\\n[.$] == 5) \{\      \" Checks for 0 + caption
.   if (\B'\\$1' == 0) \{\
.       nr addentry 0
.       shift 1
.       ds cap \\$1
.       shift 1
.   \}
.\}
.PDFPIC -\\$2 \\$1 \\$3     \" Prints image
.ad c
.B "\\*[figname]"           \" Displays figure caption
.I " \\*[cap]"
.sp
.ad n
.if (\\n[addentry] == 1) \{\    \" Writes figure names into stream
.   ie (\\n[nocap] == 0)
.       ds figname \\*[cap] (Fig. \\*[fnow])
.   el
.       ds figname Figure \\*[fnow]
.   write figstream ".ds entry \\n+[fstep]. \\*[figname] \\\\t . . . \\n[%]
.   write figstream "\\\\*[entry]
.   write figstream ".br
.\}
..
.
\# This is a modification of the .TE macro
\# This macros is used to  name and number tables,
\# as well as store the table names in a separate file.
\# This works very similar to the .PIC macro.
\# Pass an optional 0 argument to skip numbering and storing
\#
\# Arguments:   [optional 0] [optional tablename]
\# Example:     .TE 0 "This is an uninteresting table"
\#
.nr tstep 0 1           \" Counter for table list
.rn TE TEog             \" Rename .TE macro
.de TE                  \" Redefine .TE macro
.TEog
.nr addentry 1
.ds cap "
.ds tablename Table \\*[tn]
.ie (\B'\\$1') \{\
.   if (\\$1 == 0) \{\      \" Checks for optional 0 argument
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
.B "\\*[tablename]"         \" Displays table caption
.I "\\*[cap]"
.br
.ad n
.if (\\n[addentry] == 1) \{\    \" Writes table names into stream
.   if (\\n[.$] == 1)
.       ds tablename \\*[cap] (\\*[tablename])
.   write tablestream ".ds entry \\n+[tstep]. \\*[tablename] \\\\t . . . \\n[%]
.   write tablestream "\\\\*[entry]
.   write tablestream ".br
.\}
..

\# Opens stream to write data into  Equations, Figures, and Tables file
\# These files are processed by groff in closing_macros.ms
\#
\# WARNING: Once this file (opening_macros.ms) is called
\# the closing_macros.ms files MUST be called to close the streams
\#
.open eqstream equations.ms
.open figstream figures.ms
.open tablestream tables.ms

.write eqstream ".nr PO 1.5i
.write eqstream ".ds CH
.write eqstream ".ds CF
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
.write figstream ".ds CH
.write figstream ".ds CF
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
.write tablestream ".ds CH
.write tablestream ".ds CF
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
