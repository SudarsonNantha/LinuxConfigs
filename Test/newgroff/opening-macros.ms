\# These lines set link text and border colours
.ds PDFHREF.COLOUR #193be5
.ds PDFHREF.COLOUR #000000
.defcolor pdf:href.colour rgb \*[PDFHREF.COLOUR]
.ds PDFHREF.TEXT.COLOUR pdf:href.colour
.
.de toc-entry
.nr lim \\n[LL]u-0.2i
.while (\\n[.k]u < \\n[lim]u) \{\
\v'0.18'\[pc] \v'-0.18'
.\}
.br
.sp -1
\h'|\n[LL]u-0.2i'\\$1
.br
..
.de toc-entry-main
.sp -1
\h'|\n[LL]u-0.2i'\fB\\$1\fR
.br
..
.
.
.
\# Defining user registers for counting equations, figures and tables
.nr s 0 1                   \" Equation counter register
.nr f 1 1                   \" Figure counter register
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
.
.ds num "\\n[old] + \\n[arg]
.
.if (\n[no-head-numbering] == 0) \{\
.   if ((\\n[arg] > 1):(\\n[arg] <= \\n[old])) \{\
.       nr s 0              \" Resets counter when heading level is reduced
.       nr f 0
.       nr t 0
.   \}
.\}
.nr old \\n[arg]        \" Stores the value of heading level
.nr size \\n[PS]         \" Changes font heading size up to 3 levels
.if (\\n[arg] == 1) \{\
.   nr PS \\n[font-size]+4
.   sp 1
.   \}
.if (\\n[arg] == 2) .nr PS \\n[font-size]+2
.if (\\n[arg] == 3) .nr PS \\n[font-size]+1
.NH \\n[arg]
.nr PS \\n[size]
.XN \\*[title]
.ds sec-num \\*[SN]
.chop sec-num
.ds head-ref head\\*[sec-num]
.pdfhref M -N \\*[head-ref] -X \\*[title]
.
.   nr mult (\\n[arg] - 1)*1
.   nr post-space 1
.   if (\\n[arg] == 1) \{\
.       write titlestream "\fB
.       write titlestream "\\*[sec-num]\h'0.5'
.   \}
.   if (\\n[arg] == 2) .write titlestream "\h'|0.7c'\\*[sec-num]\h'0.5'
.   if (\\n[arg] == 3) .write titlestream "\h'|1.6c'\\*[sec-num]\h'0.5'
.
.   write titlestream ".pdfhref L -D \\*[head-ref] -X \\*[title]
.   ie (\\n[arg] > 1) .write titlestream ".toc-entry \\n[%]
.   el                .write titlestream ".toc-entry-main \\n[%]
.
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
.   write eqstream "\\n+[estep]\h'|1.5'
.   write eqstream ".pdfhref L -D \\*[eqnum] -X \\*[eqname]
.   write eqstream ".toc-entry \\n[%]
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
.
.
.nr fstep 0 1               \" Counter for figure list
.de newfig
.   ds figlocation \\$1
.   nr ff \\n[fstep]+1
.   ds fignum fig\\n[ff]
.   ds figcaption
.   ds figname
.   ds figalign C
.   ds figscale 3
.   nr dispcaption 0
.   de caption end
.       ds figcaption \\\\$*
.       ds figname \fBFigure \\\\n[ff]:\fP \\\\*[figcaption]
.       ds fignum fig\\\\n[ff]
.       nr dispcaption 1
.   end
.   de align end
.       ds figalign \\\\$1
.   end
.   de scale end
.       ds figscale \\\\$1
.   end
.   de label end
.       ds fignum \\\\$*
.   end
.   de dispfig end
.       PDFPIC -\\\\*[figalign] \\\\*[figlocation] \\\\*[figscale]
.       sp -5
.       pdfhref M -N \\\\*[fignum] -X \\\\*[figname]
.       sp 5
.       if (\\\\n[dispcaption] == 1) \{\
.       write figstream "\\\\n+[fstep]\h'|1.5'
.       write figstream ".pdfhref L -D \\\\*[fignum] -X \\\\*[figcaption]
.       write figstream ".toc-entry \\\\n[%]
.
.       if "\\\\*[figalign]"C" .CD
.       if "\\\\*[figalign]"R" .RD
.       if "\\\\*[figalign]"L" .LD
.           nop \\\\*[figname]
.       DE
.
.       \}
.   end
..
.
.de endfig
.rm caption
.rm location
.rm scale
.rm align
.rm label
.rm dispfig
..
.
.
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
.
.nr tstep 0 1               \" Counter for figure list
.de newtable
.   nr tt \\n[tstep]+1
.   ds tablenum table\\n[tstep]
.   ds tablecaption
.   ds tablename
.   ds tablealign C
.   nr dispcaption 0
.
.   de caption end
.       ds tablecaption \\\\$*
.       ds tablename \fBTable \\\\n[tt]:\fP \\\\*[tablecaption]
.       ds tablenum table\\\\n[tt]
.       nr dispcaption 1
.   end
.   de label end
.       ds tablenum \\\\$*
.   end
.   de disptable end
.       sp -7
.       pdfhref M -N \\\\*[tablenum] -X \\\\*[tablename]
.       sp 7
.       if (\\\\n[dispcaption] == 1) \{\
.       write tablestream "\\\\n+[tstep]\h'|1.5'
.       write tablestream ".pdfhref L -D \\\\*[tablenum] -X \\\\*[tablecaption]
.       write tablestream ".toc-entry \\\\n[%]
.
.       if "\\\\*[tablealign]"C" .CD
.       if "\\\\*[tablealign]"R" .RD
.       if "\\\\*[tablealign]"L" .LD
.           nop \\\\*[tablename]
.       DE
.
.       \}
.   end
..
.
.de endtable
.rm caption
.rm disptable
.rm label
..
\# Opens stream to write data into  Equations, Figures, and Tables file
\# These files are processed by groff in closing_macros.ms
\#
\# WARNING: Once this file (opening_macros.ms) is called
\# the closing_macros.ms files MUST be called to close the streams
.
.
.sy if [ -d "lists" ]; then echo Directory lists exists; else mkdir lists; fi
.
.nr LL 6.25i
.
.open titlestream lists/toc.ms
.open eqstream lists/equations.ms
.open figstream lists/figures.ms
.open tablestream lists/tables.ms
.
.
.write titlestream ".bp
.write titlestream ".footer "" "" "%"
.write titlestream ".ps 18
.write titlestream ".vs 20
.write titlestream ".ll \n[LL]u
.write titlestream "\fBContents\fR
.write titlestream ".sp 1
.write titlestream ".ps \\n[font-size]
.
.
.write eqstream ".bp
.write eqstream ".ps 18
.write eqstream ".vs 20
.write eqstream ".ll \n[LL]u
.write eqstream "\fBList of Equations\fR
.write eqstream ".sp 1
.write eqstream ".ps 13
.
.
.write figstream ".bp
.write figstream ".ps 18
.write figstream ".vs 20
.write figstream ".ll \n[LL]u
.write figstream "\fBList of Figures\fR
.write figstream ".sp 1
.write figstream ".ps 13
.
.
.
.write tablestream ".bp
.write tablestream ".ps 18
.write tablestream ".vs 20
.write tablestream ".ll \n[LL]u
.write tablestream "\fBList of Tables\fR
.write tablestream ".sp 1
.write tablestream ".ps 13
.
.
.
.de list-toc
.nr show-toc 1
..
.de list-equations
.nr show-equations-list 1
..
.de list-figures
.nr show-figures-list 1
..
.de list-tables
.nr show-tables-list 1
..
.nr show-toc 0
.nr show-equations-list 0
.nr show-figures-list 0
.nr show-tables-list 0
