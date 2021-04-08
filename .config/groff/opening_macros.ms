\# These lines set link text and border colours
.ds PDFHREF.COLOUR #193be5
.defcolor pdf:href.colour rgb \*[PDFHREF.COLOUR]
.ds PDFHREF.TEXT.COLOUR pdf:href.colour
\#
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
.ie (\n[no-head-numbering] == 1) \{\
.   ds nn (\\n+[s])     \" Store and increment equation number
.   ds fn \\n+[f]       \" Store and increment figure number
.   ds tn \\n+[t]       \" Store and increment table number
\#                         Store equation, figure, and table numbers
.   ds nnow (\\n[s])
.   ds fnow \\n[f]
.   ds tnow \\n[t]
.\}
.el \{\
.   ds nn (\\*[SN]\\n+[s])     \" Store and increment equation number
.   ds fn \\*[SN]\\n+[f]       \" Store and increment figure number
.   ds tn \\*[SN]\\n+[t]       \" Store and increment table number
\#                                Store equation, figure, and table numbers
.   ds nnow (\\*[SN]\\n[s])
.   ds fnow \\*[SN]\\n[f]
.   ds tnow \\*[SN]\\n[t]
.\}
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
.ie (\B'\\$1') \{\
.   nr arg \\$1         \" Assigns heading level if it is a valid integer
.   ds title \\$2
.\}
.el \{\
.   nr arg 1            \" Heading level defaults to 1 if no heading level is passed
.   ds title \\$1
.\}
.if (\n[no-head-numbering] == 0) \{\
.   if ((\\n[arg] > 1):(\\n[arg] <= \\n[old])) \{\
.       nr s 0              \" Resets counter when heading level is reduced
.       nr f 0
.       nr t 0
.   \}
.\}
.nr old \\n[arg]        \" Stores the value of heading level
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
.ie (\B'\\$1') \{\
.   if (\\$1 == 0) \{\
.       shift 1             \" Ignores numbering if optional 0 is passed
.       ds args \\$*
.   \}
.\}
.el \{\
.   ds args \\$* \\*[nn]
.\}
.EQog \\*[args]
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
.ie (\B'\\$1') \{\
.   if (\\$1 == 0) \{\
.       nr addentry 0   \" Checks if optional 0 is passed
.       ds eqname "
.   \}
.\}
.if (\\n[.$] > 0)
.   ds eqname \\$1
.
\# Remove parenthesis around equation numbering
.ds eqnum \\*[nnow]
.substring eqnum 1 -1
.chop eqnum
.ds eqnum eq\\*[eqnum]
.sp -7
\# Create a pdf reference
.pdfhref M -N \\*[eqnum] -X \\*[eqname]
.sp 7
.if (\\n[addentry] == 1) \{\
.   write eqstream ".ds entry \\n+[estep]. \\*[eqname] \\*[nnow] \\\\t . . .\\n[%]
.   write eqstream ".pdfhref L -D \\*[eqnum] \\\\*[entry]
.   write eqstream ".br
.\}
.nr sold \\n[s]
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
.if (\\n[.$] == 3) \{\
.   ds cap "
.   nr nocap 1              \" If only file name, alignment, and size are specified
.\}
.if (\\n[.$] == 4) \{\
.  ie (\B'\\$1') \{\
.       if (\\$1 == 0) \{\
.           nr addentry 0   \" Checks for 0 + no caption
.           nr f -1         \" Skips numbering for this figure
.           nr nocap 1
.           ds cap "
.           ds figname "
.           shift 1
.       \}
.   \}
.   el \{\
.       ds cap \\$1
.       shift 1             \" Checks for non-zero + caption. This is the idea case.
.   \}
.\}
.if (\\n[.$] == 5) \{\
.   if ((\B'\\$1' == 1)&(\\$1 == 0)) \{\
.       nr addentry 0       \" Checks for 0 + caption
.       nr f -1             \" Decrements numbering
.       shift 1
.       ds cap \\$1
.       ds figname "
.       shift 1
.   \}
.\}
.PDFPIC -\\$2 \\$1 \\$3     \" Prints image
.ad c
.B "\\*[figname]"           \" Displays figure caption
.I " \\*[cap]"
.sp
.ad n
.
.sp -15
.ds fignum fig\\*[fnow]
\# Create a pdf reference
.pdfhref M -N \\*[fignum] -X \\*[figname]
.sp 15
.
.if (\\n[addentry] == 1) \{\
.   ie (\\n[nocap] == 0)
.       ds figname \\*[cap] (Fig. \\*[fnow])
.   el
.       ds figname Figure \\*[fnow]
.   write figstream ".ds entry \\n+[fstep]. \\*[figname] \\\\t . . . \\n[%]
.   write figstream ".pdfhref L -D \\*[fignum] \\\\*[entry]
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
.   if (\\$1 == 0) \{\
.       ds tablename "
.       ds cap \\$2
.       nr addentry 0       \" Does not add entry if optional zero
.       nr t -1             \" Skips numbering for this table
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
.
.ds tabnum tab\\*[tnow]
.sp -15
\# Create a pdf reference
.pdfhref M -N \\*[tabnum] -X \\*[tablename]
.sp 15
.
.if (\\n[addentry] == 1) \{\
.   if (\\n[.$] == 1)
.       ds tablename \\*[cap] (\\*[tablename])
.   write tablestream ".ds entry \\n+[tstep]. \\*[tablename] \\\\t . . . \\n[%]
.   write tablestream ".pdfhref L -D \\*[tabnum] \\\\*[entry]
.   write tablestream ".br
.\}
..
.
\# Opens stream to write data into  Equations, Figures, and Tables file
\# These files are processed by groff in closing_macros.ms
\#
\# WARNING: Once this file (opening_macros.ms) is called
\# the closing_macros.ms files MUST be called to close the streams
\#
.open eqstream equations.ms
.open figstream figures.ms
.open tablestream tables.ms
.
.write eqstream ".bp
.write eqstream ".nr PO 1i
\#.write eqstream ".ds RH
\#.write eqstream ".ds LH
\#.write eqstream ".ds CH
\#.write eqstream ".ds CF - % -
.write eqstream ".CD
.write eqstream ".ps 14
.write eqstream ".B "List of Equations"
.write eqstream ".sp
.write eqstream ".DE
.write eqstream ".XS
.write eqstream ".sp 0.5
.write eqstream "List of Equations
.write eqstream ".XE
.write eqstream ".sp 1
.write eqstream ".ps 12
.write eqstream ".vs 20
.write eqstream ".po 1.1i
.write eqstream ".ll 6i
.write eqstream ".ta 0i 6iR
.write eqstream ".ds eqtitle Equation Number \t Page No.
.write eqstream ".B "\\\\*[eqtitle]"
.write eqstream ".br
.
.
.write figstream ".bp
.write figstream ".nr PO 1i
\#.write figstream ".ds CH
\#.write figstream ".ds RH
\#.write figstream ".ds LH
\#.write figstream ".ds CF - % -
.write figstream ".CD
.write figstream ".ps 14
.write figstream ".B "List of Figures"
.write figstream ".sp
.write figstream ".DE
.write figstream ".XS
.write figstream ".sp 0.5
.write figstream "List of Figures
.write figstream ".XE
.write figstream ".sp 1
.write figstream ".ps 12
.write figstream ".vs 20
.write figstream ".po 1.1i
.write figstream ".ll 6i
.write figstream ".ta 0i 6iR
.write figstream ".ds figtitle Figure Number \t Page No.
.write figstream ".B "\\\\*[figtitle]"
.write figstream ".br
.
.
.write tablestream ".bp
.write tablestream ".nr PO 1i
\#.write tablestream ".ds CH
\#.write tablestream ".ds RH
\#.write tablestream ".ds LH
\#.write tablestream ".ds CF - % -
.write tablestream ".CD
.write tablestream ".ps 14
.write tablestream ".B "List of Tables"
.write tablestream ".sp
.write tablestream ".DE
.write tablestream ".XS
.write tablestream ".sp 0.5
.write tablestream "List of Tables
.write tablestream ".XE
.write tablestream ".sp 1
.write tablestream ".ps 12
.write tablestream ".vs 20
.write tablestream ".po 1.1i
.write tablestream ".ll 6i
.write tablestream ".ta 0i 6iR
.write tablestream ".ds tabletitle Table \t Page No.
.write tablestream ".B "\\\\*[tabletitle]"
.write tablestream ".br
.
.
.de list-equations
.nr show-equations-list 1
..
.de list-figures
.nr show-figures-list 1
..
.de list-tables
.nr show-tables-list 1
..
.nr show-equations-list 0
.nr show-figures-list 0
.nr show-tables-list 0

