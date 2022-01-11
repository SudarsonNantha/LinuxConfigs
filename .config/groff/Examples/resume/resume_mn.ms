.ig

This document requires the use of the Margin Notes macros.
    -> http://www.port.de/cgi-bin/groff/MarginNotes

Unresolved: Margin Notes don't work when document is longer than 1 page.

..
\# Macro for bullet points
.de BL
.IP \(bu 2
.fam A
..
\# Define colours and page settings
.defcolor myblue rgb #e8f4ff
.defcolor navy rgb #002e8c
.po 0i
.nr HM 0i
.nr FM 0i
.
.
\# Positioning of blue rectangle. Requires negative spacing to
\# avoid white areas around the edges of the paper.
\v'-1'\h'-1'
\M[myblue]\D'P 9i 0 0 1.2i -9i 0'\M[]   \" Draws the blue rectangle
.br
.sp 0.25i
\m[navy]\FA\fB\s20\h'0.6i'Tux             \" First Name
.br
.sp 0.8
\h'-1.6i'The Penguin\s10\m[]               \" Last Name
\v'-1.5'\X'pdf: pdfpic /home/sudarson/.config/groff/tux.pdf -R 1.8i 1.8i  7.5i'
.
.
\# Inititialize Margin Notes
.so mn.tmac
.po 2.2i
.nr LL 5.5i
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
.MNinit symmetric 4c 3c 3n AR 10z 12p black ""
.
.
\# Macro for main Margin Note
.de para1
.LP
.MN left
\FA\fB
\m[navy]
\\$*
\m[]
\FA\fR
.MN
.fam A
.nf
..
.
\# Macros for secondary Margin Note
.de para2
.LP
.MN left
.ps -1.5
\\$*
.ps +1.5
.MN
.fam A
.nf
..
.
\# Macro to indicate designation
.de des
\s12
\\$*
\s10
..
.
\# Macro to indicate company name
.de comp
.sp 0.2
\fB
\\$*
\fR
.sp 0.1
..
.
\# Inserts partitioning line
.de line
\D'l 5.5i 0'\D'P -0.6m 0 0 -0.6m 0.6m 0'
.sp 0.3
..
.
.
\# Page initializations
.ds CH
.nr HM 0.8i
.nr FM 0i
.po 2.2i
.nr LL 5.5i
.sp 2
.para1 Personal Information
\fBAddress:\fR 120 Something Street, Madison, WI
\fBPhone:\fR +01 12 34 56 78 90
\fBEmail:\fR tux@linuxfoundation.org
.pdfhref W -D https://www.linkedin.com/ -P \fBLinkedIn:\fR \h'0.15c'Tux The Penguin
Sex: ?? | DOB: 01/01/1996 | Nationality: ??
.sp 0.3
.para1 Job Applied For
\s13Linux Mascot
.para1 Work Experience
.line
.para2 Aug 2018 - Present
.des Job Title
.comp Company Name
.fi
In a short statement of no more than a few sentences, describe your rile in the company and outline your key and main respsonsibilities. Try to focus on those duties that are relevant to the job you are applying for.
.nf
.BL
In a sentence describe your most relevant daily work duties
.BL
In a sentence describe your most relevant daily work duties
.sp 0.2
.para2 Mar 2016 - Aug 2018
.des Job Title
.comp Company Name
.fi
In a short statement of no more than a few sentences, describe your rile in the company and outline your key and main respsonsibilities. Try to focus on those duties that are relevant to the job you are applying for.
.nf
.BL
In a sentence describe your most relevant daily work duties
.sp 0.2
.para2 Mar 2013 - Feb 2016
.des Job Title
.comp Company Name
.fi
In a short statement of no more than a few sentences, describe your rile in the company and outline your key and main respsonsibilities. Try to focus on those duties that are relevant to the job you are applying for.
.nf
.BL
In a sentence describe your most relevant daily work duties
.sp 0.2
.para1 Education and Training
.line
.para2 Sep 2020 - Present
.des Name of course
.comp University Name
Course details and modules
.sp 0.15
.para2 2014-2018
.des Name of course
.comp University Name
Course details and modules
.sp 0.15
.para1 Professional Skills
.line
.mk
\fBCAD/CAE\fR
Autodesk Inventor
Autodesk Fustion 360
CATIA V5
Solidworks
Nastran
GD&T
.po +1.7i
.rt
\fBComputer Skills\fR
C/C++
Python
Rust
Javascript
Lol just kidding
I meant Bash Scripting
.po +1.7i
.rt
\fBProject Management\fR
Product Breakdown Structure
Product Cost Estimation
.sp 0.5
\fBLanguages\fR
English - \fIFluent\fR
Penguin - \fINative\fR
.po 2.2i
.para1 License
.line
.para2 2016
Licensed Slayer of Proprietary Software
.sp 0.3
.para1 Additional Activities
.line
.BL
Delivered a presentation on the reduction in the number of fish around the Arctic Cricle.
.BL
My article \fI10 Best Business Suits for Penguins\fR was published in \fILinux Weekly\fR.
.BL
My article \fIDown With Proprietary Software\fR was published on \fI/r/linuxmemes\fR.
