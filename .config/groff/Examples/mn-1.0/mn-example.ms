.so mn.tmac
.po 4c
.nr LL 10c
.rn pg@top pg@top@orig
.de pg@top
.  pg@top@orig
.  MNtop
..
.rn pg@bottom pg@bottom@orig
.de pg@bottom
.  MNbottom
.  pg@bottom@orig
..
.rn pg@end-text pg@end-text@orig
.de pg@end-text
.  MNbottom
.  pg@end-text@orig
..
.
.PP
\# Arguments for .MNinit
\#    Alignment (symmetric or ragged)
\#    Left note size
\#    Right note size
\#    Note distance
\#    Font Type
\#    Font size
\#    Vertical spacing
\#    Font colour
\#    Hyphen rules
.MNinit symmetric 3c 3c 2n TB 10z 12p black ""
.
.
\# Define counting registers
\# step1 and step2 are used for counting
\# Here, the initial values are 2 and 10
\# They are incermented by a value of 1
.nr step1 2 1
.nr step2 10 1
.
\# Use this macro if you want to start a new "section"
\# and restart numbering
.de next-section
.nr step1 \\n+[step1] 1
.nr step2 0 1
..
.
\# Invoke .para just like you would use .LP or .PP
.de para
.LP
.MN left
\\n[step1].\\n+[step2]
.MN
\h'0.2i'
..
.
.para
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
.para
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
.para
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
.para
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
.para
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
.para
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
.para
7 This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
.
\# This starts the next "section" and counting starts from 3
.next-section
.
.para
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
.para
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
.para
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
.para
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
.para
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
.para
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
.para
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
.para
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
.para
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
.para
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
.para
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
This is a test.  This is a test.  This is a test.  This is a test.
