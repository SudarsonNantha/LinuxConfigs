\"
\" This is a standard groff template.
\"
\" Some standard functions:
\" .NH <x> for a numbered section - x denotes the level of the secionl is 0 by default
\" .SH unnumbered section
\" .RS and .RE for extra indentations
\" .B for bold
\" .I for italics
\" .BI for bold italics
\" .UL for underlining
\" .BX for encapsulating text in a box
\"
\" Text between .EQ <x> and .EN is considered as an equation
\" Equations are automatically indented, use ~ to add space
\" x = C by default (centred), I (indented), L (left aligned)
\"
\" Add images using .PSPIC, all images must be in .eps format
\"
\"

\" Import custom macros
\" .BL creates a bulleted list
.so /home/sudarson/.config/groff/macros

.TL \" Title of the document
My First Groff Document
.AU \" Authoer of the document
Sudarson Nanthacoumarane
.AI \" Article institution
Ecole Centrale de Nantes
.NH
First Section
.PP \" New paragraph
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras malesuada, lectus ac fermentum pharetra, odio mi condimentum arcu, in ultrices dolor est hendrerit massa. Vestibulum sed sagittis metus. Donec velit risus, ultrices vel pretium nec, commodo id nisi. Nunc lobortis mauris in semper eleifend. Sed tortor quam, pharetra vitae convallis quis, dignissim in nisl. Curabitur sed leo ac urna posuere pharetra quis eu sem. Curabitur molestie sapien ac felis ultricies varius. Nullam varius sapien eros, non imperdiet neque mattis pharetra. Nulla eleifend vel nisl sed sagittis. Donec eu dolor neque. Vivamus tempus commodo vestibulum. Mauris mattis quam ante.
.NH
Second Section
.RS
.NH 2
Subsection
.RE

\" Example equations and matrices
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

.PSPIC -I 4 /home/sudarson/.config/groff/pondy.eps
