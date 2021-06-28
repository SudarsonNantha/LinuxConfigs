\# Define colours and page initializations
.defcolor myblue rgb #e8f4ff
.defcolor navy rgb #002e8c
\# Macro for bullet points
.po 0i
.nr LL 7i
.nr HM 0i
.nr FM 0i
.
\# Macro for bullet points
.de BL
\s-2\[bu]\s+2  \\$*
..
\# Positioning of blue rectangle. Requires negative spacing to
\# avoid white areas around the edges of the paper.
\v'-1'\h'-1'
\M[myblue]\D'P 2.8i 0 0 12i -2.8i 0'\M[]
.br
.sp 0.3i
.LP
\m[navy]\FA\fB\s20\h'2.9i'Tux The Penguin\m[]
.br
\h'2.9i'\v'0.7'\s-5Linux Mascot\fR
.br
.po 0.4i
\v'-4.0'\X'pdf: pdfpic /home/sudarson/.config/groff/tux.pdf -L 2.1i 2.1i  2i'
.br
.po 2.9i
.nr LL 4.9i
.ps 10
.nr VS 14
.fi
.LP
\FATux is a penguin character and the official brand character of the Linux kernel. Originally created as an entry to a Linux logo competition, Tux is the most commonly used icon for Linux, although different Linux distributions depict Tux in various styles. The character is used in many other Linux programs and as a general symbol of Linux.
.br
.
\# Macros for the left side of the page
.de head2
\fI\s(11\\$*
..
.de list
\s9\fB\\$1 \fR \\$2
..
.de lang
\s9\fB\\$1\fR - \fI \\$2
..
.
.
\# Macros for the right side of the page
.de line
\D'l 4.9i 0 '\D'P -0.6m 0 0 -0.6m 0.6m 0'
..
.de head
\m[navy]\fR\s(14\\$*\fR\s(10\m[]
.br
.sp -0.5
.line
..
.de des
.sp 0.3
.nf
\fB\s(12\\$1\s9\fR   (\\$2)
\fB\s(10\\$3\fR
..
.
.
\# Main document starts here
.sp 3
.mk     \" Mark the current vertical position of the documnet
.nf     \" No fill more
.po 0.4i
.vs 16
\m[navy]\s(12\fBPersonal Information:
\s9Address:\fR 120 Something Street
                 Madison, WI
\fBPhone:\fR +01 12 34 56 78 90
\fBE-mail:\fR tux@linuxfoundation.org
.pdfhref W -D https://www.linkedin.com/ -P \fBLinkedIn:\fR \h'0.15c'Tux The Penguin
\fBNationality:\fR ??

\fB\s(12Professional Skills:
.sp 0.2
.head2 CAD/CAE
.list "CATIA" "(4+ years)"
.list "Solidworks" "(4+ years)"
.list "Autodesk Inventor" "(2+ years)"
.list "Autodesk Fuction 360" "(2+ years)"
.list "Nastran"
.list "GD&T"

.head2 Computer Skills
.list C/C++
.list Python
.list Rust
.list "GNU Troff"
.list "Bash Script"
.list "Libre Office"

.head2 Project Management
.list "Product Breakdown Structure"
.list "Product Cost Estimation"

.head2 Languages
.lang English Fluent
.lang Penguin Native\fR\m[]
.
.
\m[black]
.rt         \" Return to marked vertical position
.sp -2
.po 2.9i
.vs 15
.head Work Experience
.des "Job Title" "Aug 2018 - Present" "Company Name"
.fi
In a short statement of no more than a few sentences, describe your rile in the company and outline your key and main respsonsibilities. Try to focus on those duties that are relevant to the job you are applying for.
.nf
.BL In a sentence describe your most relevant daily work duties
.BL In a sentence describe your most relevant daily work duties
.des "Job Title" "Aug 2018 - Present" "Company Name"
.fi
In a short statement of no more than a few sentences, describe your rile in the company and outline your key and main respsonsibilities. Try to focus on those duties that are relevant to the job you are applying for.
.nf
.BL In a sentence describe your most relevant daily work duties
.des "Job Title" "Aug 2018 - Present" "Company Name"
.fi
In a short statement of no more than a few sentences, describe your rile in the company and outline your key and main respsonsibilities. Try to focus on those duties that are relevant to the job you are applying for.
.nf
.BL In a sentence describe your most relevant daily work duties

.head Education and Training
.des "Name of Course" "Sep 2020 - Present" "University Name"
Course details and modules
.des "Name of Course" "Sep 2020 - Present" "University Name"
Course details and modules
.sp 0.5
.head License
Licensed Slayer of Proprietary Software
.sp 0.5
.head Additional Activities
.fi
.BL Delivered a presentation on the reduction in the number of fish around the Arctic Cricle.
.br
.BL My article \fI10 Best Business Suits for Penguins \fRwas published in \fILinux Weekly\fR.
.br
.BL My article \fIDown With Proprietary Software\fR was published on \fI/r/linuxmemes\fR.
