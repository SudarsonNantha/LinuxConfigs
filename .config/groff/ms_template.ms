.nr HM 0.8i \" Set Header and footer margins
.nr FM 0.8i
\# This is a standard groff template.
\#
\# Use \# to comment the entire line
\# Use \" to add comment after some text
\#
\# Some standard functions:
\# .NH <x> for a numbered section - x denotes the level of the section, value is 0 by default
\# .SH unnumbered section
\# .RS and .RE for extra indentations
\# .B for bold
\# .I for italics
\# .BI for bold italics
\# .UL for underlining
\# .BX for encapsulating text in a box
\# .sp <n> to add blank lines
\# .B1, B2 to enclose text in a box
\# .b1, .b2 to enclose constant width text in a box (Use for code)
\#
\# Text between .EQ <x> and .EN is considered as an equation
\# Equations are automatically indented, use ~ to add space
\# x = C by default (centred), I (indented), L (left aligned)
\#
\# If compiling with -Tps add images using .PSPIC, all images must be in .eps format
\# If compiling with -U -Tpdf add images using .PDFPIC, all images must be in .pdf format
\# Remember to use img2pdf command (Imagemagick throws errors when converting images to pdf)
\#
\# Import custom macros
\# .BL creates a bulleted list
.so /home/sudarson/.config/groff/macros
\#
\# *** VERY IMPORTANT ***
\# Use "$ equation $" within text to include math in paragraphs
\#
.EQ
delim $$
.EN
.ds CH          \" Empty header (centred)
.ds CF - % -    \" Foooter with page number (centred)
.nr LL 6.3i     \" Line width
\#.DS C         \" Center the text below this
\#.ps 12        \" Change font size
.TL \" Title of the document
My First Groff Document
.AU \" Author of the document
Sudarson NANTHACOUMARANE
.AU
Aditya BIJU
.AI \" Article institution
Ecole Centrale de Nantes
.NH
First Section
.XS             \" Text between .XS and .XN is automatically numbered and added to TOC
First Section   \" This is the text that will appear in TOC
.XE
.PP \" New indented paragraph
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras malesuada, lectus ac fermentum pharetra, odio mi condimentum arcu, in ultrices dolor est hendrerit massa. Vestibulum sed sagittis metus. Donec velit risus, ultrices vel pretium nec, commodo id nisi.

.LP \" New unindented paragraph
Nunc lobortis mauris in semper eleifend. Sed tortor quam, pharetra vitae convallis quis, dignissim in nisl. Curabitur sed leo ac urna posuere pharetra quis eu sem. Curabitur molestie sapien ac felis ultricies varius. Nullam varius sapien eros, non imperdiet neque mattis pharetra. Nulla eleifend vel nisl sed sagittis. Donec eu dolor neque. Vivamus tempus commodo vestibulum. Mauris mattis quam ante.
.NH
Pythogoras Theorem
.XS
Pythogoras Theorem
.XE
.PP
This theorem states that given a trianalge with sides $a$, $b$, and $c$ $\[rA]~~a sup 2 + b sup 2 = c sup 2$
.NH
Second Section
.XS
.pdfhref W -D www.google.com Second Section
.XE
\# .RS and .RE add indentation
.RS
.NH 2
Subsection
.BL
Bullet point 1
.BL
Bullet point 2
.RE
\# Example equations and matrices
.EQ
f(x) = 5x + 3
.EN
.EQ I
e sup (i theta ) = mark 1 + e sup (i theta ) + 1 smallover 2! (i theta ) sup 2...
.EN
.EQ I
lineup + 1 smallover {N-1} (i theta ) sup {N-1} + 1 smallover N (i theta ) sup N
.EN
.EQ I
K sub e = int from {T sub e} K~~
left [ matrix{
ccol { (c sub 1 sup k ) sup 2 above  (c sub 1 sup l ) sup 2 above (c sub 1 sup m ) sup 2 }
ccol { x sub k above x sub l above x sub m }
ccol { y sub k above y sub l above y sub m }
} right ]
~~d OMEGA
.EN

\# Code can be put in a box by putting it between .b1 and .b2
.b1
def myfunction(arg):
    arg = arg**2 - arg + 1
    return int(arg)
.b2
\#
\# Break page
.bp
\#
\# Image files MUST be saved as .eps or .PDF
\# Number at eol controls image size
\# Arguments C, L, R, and I <n> are used for alignment (n = indent spaces)
\#.PSPIC -C /home/sudarson/.config/groff/pondy.eps 2
.PDFPIC -C "/home/sudarson/.config/groff/pondy.pdf" 5

\# TABLES
\# Cannot put comments inside .TS and .TE for some reason...
\# Line1: Table properties - uses ; as delimiter
\# Line2: Layout of first row
\# Line3 Layout of second row
\# Line4: Layout of subsequent rows
\# .T& signifies continuation of table
\# The next line shows the row layout
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
.TE

\# Add hyperlinks
.pdfhref W -D http://www.gnu.org/software/groff -A , the groff web site
a great website!
.sp
.pdfhref W -D www.youtube.com Youtube
is a great website for informational videos
.ds CF
.TC
