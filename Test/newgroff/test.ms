.ig
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
.
.nr HM 1.2i
.nr FM 0.5i
.nr PO 1i
.nr page-width 8.25i
.nr LL \n[page-width]-(2*\n[PO])
.nr font-size 13
.nr font-space 15
.nr PS \n[font-size]   \" Change font point size
.nr VS \n[font-space]   \" Change vertical spacing **IMPORTANT**
.
.nr no-head-numbering 1 \" Uncomment to disable equation/figure/table numbering based on heading
.so general-macros.ms
.so opening-macros.ms
.
.EQ 0
delim $$
.EN 0
.
.
\#.tl 'left'center'right'
.
.
.newfig ECN.pdf
.scale 2.4
.dispfig
.endfig
.sp 8
.CD
.nf
\s20\fBOptimization in Manufacturing Engineering\fP
.sp 2
\s18É\s14COLE\s18 C\s14ENTRALE DE\s18 N\s14ANTES
.sp 1
\s17M2 A\s12DVANCED \s17M\s12ANUFACTURING
.sp 2
\D't 1.7p'\l'6i'
.sp 1
\s28\fBOptimization Project\fP
\l'6i'
.sp 4
.vs 20
\s15\fIAuthors:\fR
Sudarson NANTHACOUMARANE
Ahmad MOHAMAD
.sp 5
\s13Date: \*[DY]
.DE
.
.
.
.
.
.
\# Accumulate references at the end of document
\# and surround reference numbers with square brackets []
.R1
accumulate
bracket-label \*([.[ ]\*(.] ", "
.R2
.
.header "Left Header" "\fICenter Header\fR" "\fBRight Header\fR"
\#.footer "" "" "%"
.toc
.list-of-equations
\~
.sp -1.5
.head "First Section"       \" Numbered heading
This starts an indented paragraph. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras malesuada, lectus ac fermentum pharetra, odio mi condimentum arcu, in ultrices dolor est hendrerit massa. Vestibulum sed sagittis metus. Donec velit risus, ultrices vel pretium nec, commodo id nisi. References can be added.
\# Invoke references between .[ and ].
.[
pipe simple
.]
.LP \" New unindented paragraph
This starts an unindented paragraph. Nunc lobortis mauris in semper eleifend. Sed tortor quam, pharetra vitae convallis quis, dignissim in nisl. Curabitur sed leo ac urna posuere pharetra quis eu sem. Curabitur molestie sapien ac felis ultricies varius. Nullam varius sapien eros, non imperdiet neque mattis pharetra. Nulla eleifend vel nisl sed sagittis. Donec eu dolor neque. Vivamus tempus commodo vestibulum. Mauris mattis quam ante.
.LP
.B "Here is proof that forward referencing works."
.pdfhref L -D fig2.1.1 Figure 2.1.1
shows an old monument in Bharathi Park, Pondicherry.
.
.head 2 "Pythogoram Theorem"
.head 2 "Pythogoram Theorem"
.head 2 "Pythogoram Theorem"
.head 2 "Pythogoram Theorem"
.head 2 "Pythogoram Theorem"
.head 2 "Pythogoram Theorem"
.head 2 "Pythogoram Theorem"
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
.EQ
f(x) = 5x + 3
.EN "A linear equation"
.EQ
f(x) = 5x + 3
.EN "A linear equation"
.EQ
f(x) = 5x + 3
.EN "A linear equation"
.EQ
f(x) = 5x + 3
.EN "A linear equation"
.EQ
f(x) = 5x + 3
.EN "A linear equation"
.EQ
f(x) = 5x + 3
.EN "A linear equation"
.EQ
f(x) = 5x + 3
.EN "A linear equation"
.EQ
f(x) = 5x + 3
.EN "A linear equation"
.EQ
f(x) = 5x + 3
.EN "A linear equation"
.EQ
f(x) = 5x + 3
.EN "A linear equation"
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
.EQ 0
a sup 2 + b sup 2 = c sup 2
.EN
.EQ
E = m c sup 2
.EN
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
\#.PIC "This is a nice caption" "/home/sudarson/.config/groff/pondy.pdf" C 4
\#.PIC  0 "This logo won't have a figure number" "/home/sudarson/.config/groff/dragon.pdf" C 2
\#.PIC  "/home/sudarson/.config/groff/dragon.pdf" C 2
.newfig /home/sudarson/.config/groff/pondy.pdf
.caption Bharathi Park
.dispfig
.endfig
.
.newfig /home/sudarson/.config/groff/dragon.png
.caption CAPTION
.label dragon
.dispfig
.endfig
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
\#.nr PS \n[font-size]
\#.nr VS \n[font-space]
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
.BL
.pdfhref L -D eq2.1.1 Affixed text to Equation (2.1.1)
is the first equation
.BL
.pdfhref L -D fig2.1.2 Fig(2.1.2)
is the MSI logo
.BL
.pdfhref L -D tab3.2.1 Table(3.2.1)
contains the specs for carburetors found in Yamaha DT 125 motorcycle.
.BL
.B
Notice that this does forward referencing.
.
.
.RE
.
.
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
.TE
.newtable
.caption Carburetor specifications for Yamaha DT 125
.label carbparams
.disptable
.endtable
.
.
.
.newfig /home/sudarson/.config/groff/dragon.png
.dispfig
.endfig
.
.newfig /home/sudarson/.config/groff/archlinux-logo-black.pdf
.caption Arch
.align R
.scale 2
.dispfig
.endfig
.
.
.bp
.
.
This is some code:
.br
a
.br
b
.br
c
\#.nr a 0 1
\#.while (\na < 90) \{\
\#\n+a
\#.br
\#.\}
\#\n+a
.
.printcode code
.code1
function docs
 This is a pseudo-function
    ...
    Function does stuff
end
.code2
.br
.
.
.
.no-image-convert
\# No headers or footers on TOC page
.list-of-figures
.list-of-tables
.so closing-macros.ms
