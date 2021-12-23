.ig
  -------------------------------------------------------------
 |            Compile this document with the command(s):        |
 |   refer "$file" > temp.ms && echo ".ds LH                    |
 |   .ds CF                                                     |
 |   .if '\*[.T]'pdf' \X'pdf: switchtopage before here'         |
 |   .TC" >> temp.ms &&                                         |
 |   groff -Tpdf -U -tep -mspdf temp.ms > "$base".pdf           |
 |   && rm temp.ms                                              |
 |                                                              |
 |              If not relocating TOC then use:                 |
 | groff -Tpdf -U -tepR -mspdf ms_template.ms > ms_template.pdf |
 |                                                              |
 |                      *** IMPORTANT ***                       |
 |   This document requires the files opening_macros.ms and     |
 |   closing_macros.ms to work properly.                        |
 |                                                              |
  -------------------------------------------------------------

 This is a Groff Template written by Sudarson Nantha

 List of custom macros
     1) .head - .NH with more features
     2) .EQ   - Automatically increment equations numbering
     3) .EN   - Adds names to equations and saves in an external file
     4) .TE   - Adds names to tables and saves in an external file
     5) .PIC  - Displays images (in PDF format) and saves in an external file
                Remember to use img2pdf command
                (Imagemagick throws errors when converting images to pdf)
     6) .b1 and .b2 should be used for code

     [ See opening_macros.ms and closing_macros.ms for more information ]

..
\# *** VERY IMPORTANT ***
\# Use "$ equation $" within text to include math in paragraphs
\#
.EQ 0
delim $$
.EN 0
.nr no-head-numbering 1 \" Uncomment to disable equation/figure/table numbering based on heading
.so /home/sudarson/.config/groff/opening_macros.ms
\#.so /home/sudarson/.config/groff/macros.ms
.
.nr HM 0.3  \" Set Header and footer margins
.nr FM 0.6i
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
.
.
\# Accumulate references at the end of document
\# and surround reference numbers with square brackets []
.R1
accumulate
bracket-label \*([.[ ]\*(.] ", "
.R2
\#
\# The following lines define the headers and footers the document.
\# LH stands for Left Header, LF stands for Left Footer, etc.
\# \D sets the line width in points
\# \l draws a line of specified length
\# \v moves vertically
\# \h moves horizontally
\#
.ds LH \D't 0.2p'\v'1.5'\l'6.25i'\v'-0.5'\h'-6.25i'Sample Header\D't 0.5p'
.ds RH Groff Template for ms macros
.ds LF \D't 0.2p'\v'-0.5'\l'6.25i'\v'1'\h'-6.25i'S. Nanthacoumarane\D't 0.5p'
.ds RF Page No. %
.ds RH This is a sample header  \" Right aligned header
.ds CH          \" Empty header (centred)
\#.ds CF - % -    \" Foooter with page number (centred)
.
.
.sp -4
.po 0.8i        \" Page offset
.ll 6.7i        \" Line length
\l'6.6i'        \" Draw horizontal line (Make sure it is a little smaller than line length)
.br             \" Break line
.po 1i          \" Change page offset (to default)
.ll 6.25i        \" Change line length (to default)
.sp -0.8        \" More up because there is too much spacing
.ad c           \" Center align
.PS             \" Invoke GNU Pic
box rad 0.1 ht 1 wid 4.2 at (0,0) fill 0.1 outline "white"
.PE
.po 1.2i
.sp -5.5
.ps 16          \" Set font point size
.pdfhref W -D http://www.gnu.org/software/groff Welcome to Groff    \" A hyperlink
.br
.ps 10
.sp 0.2
GNU troff (groff) - a GNU project
.br
.sp 0.5
Ms macros template by
.I
.pdfhref W -D https://github.com/SudarsonNantha/LinuxConfigs/tree/master/.config/groff Sudarson Nantha
.br
.ad n           \" Normal/Justify alignment
.po 0.8i
.ll 6.7i
.sp -0.95i
.PDFPIC -L /home/sudarson/.config/groff/gnu.pdf 1
.sp -1.18i
.PDFPIC -R /home/sudarson/.config/groff/tux.pdf 0.9
.sp -0.8
\D't 1.5p'      \" Change line thickness
\l'6.6i'        \" Draw a horizontal line
\D't 0.5p'      \" Change line thickness (to default)
.br
.po 1i          \" Change page offset (to default)
.nr LL 6.25i     \" Change line length (to default)
.
.nr HM 1.2i
.ds LH \D't 0.2p'\v'1.5'\l'6.25i'\v'-0.5'\h'-6.25i'Sample Header\D't 0.5p'
.ds RH Groff Template for ms macros
.PP
\#.EQ
\#E = m c sup 2
\#.EN
.head "First Section"       \" Numbered heading
This starts an indented paragraph. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras malesuada, lectus ac fermentum pharetra, odio mi condimentum arcu, in ultrices dolor est hendrerit massa. Vestibulum sed sagittis metus. Donec velit risus, ultrices vel pretium nec, commodo id nisi. References can be added.
\# Invoke references between .[ and ].
.[
pipe simple
.]
.nr PS 11   \" Change font point size
.nr VS 15   \" Change vertical spacing **IMPORTANT**
.LP \" New unindented paragraph
This starts an unindented paragraph. Nunc lobortis mauris in semper eleifend. Sed tortor quam, pharetra vitae convallis quis, dignissim in nisl. Curabitur sed leo ac urna posuere pharetra quis eu sem. Curabitur molestie sapien ac felis ultricies varius. Nullam varius sapien eros, non imperdiet neque mattis pharetra. Nulla eleifend vel nisl sed sagittis. Donec eu dolor neque. Vivamus tempus commodo vestibulum. Mauris mattis quam ante.
.LP
.B "Here is proof that forward referencing works."
.pdfhref L -D fig2.1.1 Figure 2.1.1
shows an old monument in Bharathi Park, Pondicherry.
.
.ps 10      \" Change font point size (to default)
.nr VS 12   \" Change font vertical spacing (to default)
.head 2 "Pythogoram Theorem"
.PP
This theorem states that given a triangle with sides $a$, $b$, and $c$ $\[rA]~~a sup 2 + b sup 2 = c sup 2$
.
.head "Second Section"
.LP
Here, we take a look at indentation
.[
simple
.]
.RS
.head 2 "Subsection"
\# .RS and .RE add indentation
.BL
Bullet point 1
.BL
Bullet point 2
.RE
.
.
\# Example equations and matrices
.EQ
f(x) = 5x + 3
.EN "A linear equation"
.EQ  I
e sup (i theta ) = mark 1 + e sup (i theta ) + 1 smallover 2! (i theta ) sup 2...
.EN "A long mathematical series"
.EQ 0 I
lineup + 1 smallover {N-1} (i theta ) sup {N-1} + 1 smallover N (i theta ) sup N
.EN 0
.EQ I
K sub e = int from {T sub e} K~~
left [ matrix{
ccol { (c sub 1 sup k ) sup 2 above  (c sub 1 sup l ) sup 2 above (c sub 1 sup m ) sup 2 }
ccol { x sub k above x sub l above x sub m }
ccol { y sub k above y sub l above y sub m }
} right ]
~~d OMEGA
.EN "Example matrix equation"
.
.
\# Code can be put in a box by putting it between .b1 and .b2
.b1
def myfunction(arg):
    arg = arg**2 - arg + 1
    return int(arg)
.b2
.
.
\# Break page
.bp
.
.
\# Arguments C, L, and R are used for alignment
\# Usage: .PIC [0 if no numbering] [caption] [file path] [alignement] [size]
.PIC "This is a nice caption" "/home/sudarson/.config/groff/pondy.pdf" C 4
.PIC  0 "This logo won't have a figure number" "/home/sudarson/.config/groff/dragon.pdf" C 2
.PIC  "/home/sudarson/.config/groff/dragon.pdf" C 2
.bp
.
.
.head "Last Section"
.LP
In this section, we will look at tables and PDF links.
.[
search
.]
.head 2 "Links using .pdfhref"
.RS
.head 3 "Internet Hyperlinks"
\# Add hyperlinks
.LP
Here is an internet hyperlink to
.pdfhref W -D https://www.gnu.org/software/groff/manual/groff.html the Groff Manual
where you can find documentation for groff.
.br
.pdfhref W -D www.youtube.com Youtube
is a great website for informational videos
.head 3 "PDF links"
.LP
.ig
 Look at opening_macros.ms to see how equations, figures,
 and tables are named. Their number will be prefixed by
 'eq' , 'fig' , or 'tab'. This is the reference name.
 After the reference name, the affixed text to the link
 is displayed.
..
.pdfhref L -D eq2.1.1 Affixed text to Equation (2.1.1)
is the first equation
.br
.pdfhref L -D fig2.1.2 Fig(2.1.2)
is the MSI logo
.br
.pdfhref L -D tab3.2.1 Table(3.2.1)
contains the specs for carburetors found in Yamaha DT 125 motorcycle.
.br
.B
Notice that this does forward referencing.
.RE
.head 2 "Table example"
.ig

 TABLES
 Cannot put comments inside .TS and .TE for some reason...
 Line1: Table properties - uses ; as delimiter
 Line2: Layout of first row
 Line3 Layout of second row
 Line4: Layout of subsequent rows
 .T& signifies continuation of table
 The next line is new row layout
..
.TS
tab(;) allbox nospaces center;
cBp+1 s s s
ab ab ab ab
a a a a.
Yamaha DT 125 Carburetor Specifications;
Bike Model; TZR;    DT 3DBI;    DT 3RN1 onward
Make;       Mikuni; Mikuni;     Mikuni
Type;       VM26SS; VM26SS;     VM26SS
ID Mark;    2RH00;  3BN00;      3MB00
Main Jet;   180;    125;        210
Air Jet;    0.8;    0.8;        0.8
Jet Needle; 406;    407;        5J25
Needle clip position;4th;3rd;4th
.T&
a a s s.
Float height - all models;20-21mm (0.787-0.827in)
.TE "Carburetor specifications for Yamaha DT 125"
.
\# No headers or footers on TOC page
.list-equations
.list-figures
.list-tables
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
