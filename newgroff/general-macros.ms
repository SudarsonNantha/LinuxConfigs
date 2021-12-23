\# String register to store today's date
.ds MONTH1 January
.ds MONTH2 February
.ds MONTH3 March
.ds MONTH4 April
.ds MONTH5 May
.ds MONTH6 June
.ds MONTH7 July
.ds MONTH8 August
.ds MONTH9 September
.ds MONTH10 October
.ds MONTH11 November
.ds MONTH12 December
.ds MO \E*[MONTH\n[mo]]
.ds DY \*[MO] \n[dy], \n[year]
.
.
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
.
\# An easy way to define headers
\# Usage:
\#  .header "<left>" "<centre>" "<right>"
\#  .header "" "" ""
\#                  -> Produces empty headers
\#
\# Note that the 'line' is controlled by the left header option
.de header
.nr o 0.15i
.nr o 0i
.ds LH \D't 0.2p'\v'1.5'\h'-\\n[o]u'\l'\n[LL]u+(\\n[o]u+\\n[o]u)'\v'-0.5'\h'-(\n[LL]u+\\n[o]u+\\n[o]u)'\\$1\D't 0.5p'
.ds CH \fI\\$2\fR
.ds RH \s14\\$3\h'-\\n[o]u'
..
.
\# An easy way to define footers
\# Usage:
\#  .footer "<left>" "<centre>" "<right>"
\#  .footer "" "" ""
\#                  -> Produces empty footers
\#
\# Note that the 'line' is controlled by the left footer option
.de footer
.nr o 0.15i
.nr o 0i
.ds LF \D't 0.2p'\v'-1'\h'-\\n[o]u'\l'\n[LL]u+(\\n[o]u+\\n[o]u)'\v'1'\h'-(\n[LL]u+\\n[o]u+\\n[o]u)'\\$1\D't 0.5p'
.ds CF \\$2
.ds RF \\$3\h'-\\n[o]u'
..
.
.
.de ref
.   pdfhref L -D \\$1 \\$2
..
.
\# =====================================================================
\#
\# CODE INSERTION
\# ---------------
\#
\# *Function:
\#     Prints embedded code from document or from an imported file.
\#     Font is changed to constant width (CW), a grey background
\#     is given to the text, and line numbering is added.
\#
\# *Arguments:
\#     <file path>
\#
\#     File path can be in the current folder or anywhere in the
\#     filesystem.
\#
\# *Notes:
\#     For now, there is only support for embedded code that is smaller
\#     than one page. Inserted code (through file path) can be several
\#     pages long.
\#
\#     Since this macro uses .nf (no-fill) mode, and will therefore ignore
\#     line lengths, it is recommended to insert code where the lines are
\#     less than 72 characters in length.
\#
\#     Point size and vertical space are automatically set by this macro.
\#
\#     Due to the limitations of groff, this macro makes use of bash
\#     scripting and commonly used GNU tools manipulate inserted code
\#     files. It is recommened to have the file *codeformat* in the same
\#     directory as the groff document or in your $PATH.
\#
\# *Usage:
\#     (Embedded code)
\#         .code1
\#             <user code>
\#         .code2
\#
\#     (Import file)
\#         .printcode <file path>
\#
.de code1
.nf
.ps 10
.vs 12
.ft CW
.box code-div
..
.
.de code2
.box
.printcode
..
.
.de printcode
.defcolor light rgb #f2f2eb
.defcolor pink rgb #fb3199
.defcolor comment rgb #29a828
.defcolor purple rgb #aa00ff
.nr minv 86400
.nr maxv 746400
.nr import-mode 1
.
.if (\\n[.$] == 0) \{\
.   nr import-mode 0
.\}
.
.if (\\n[.$] == 1) \{\
.   sy cp \\$1 temp                \" Make a copy of the file
.   sy ./codeformat temp           \" Process file through formater
.   sy cp temp \\$1_out            \" Save formatter output
.   nf                             \" Enable no-fill mode
.   ft CW                          \" Constant width font
.   ps 10                          \" Point size
.   vs 12                          \" Vertical space
.
.\}
.
.   nr diff 1                      \" Stored difference between
.                                  \" diversion and page length
.
.
.nm 1                           \" Start page numbering
.
\# Run while difference is larger than 0
\#
.while ( \\n[diff] > 0) \{\
.   nr startv \\n[nl]               \" Marks starting vertical position
.   ie ( \\n[import-mode] == 1) \{\
.       box code-div                \" Start diversion
.       nm                          \" Pause line numbering
.       so temp                     \" Print code
.       box                         \" Close diversion
.       nr diff \\n[dn]-\\n[maxv]+\\n[startv]
.   \}
.   el  \{\
.       nm
.       nr diff -1
.   \}
.
\#  If code is shorter than size of one page
\#
.   ie (\\n[diff] <= 0) \{\
.       nr vert \\n[dn]+5000
.       nop \M[light]\D'P 0 0 \\n[LL]u 0 0 \\n[vert]u -\\n[LL]u 0'\M[]
.       nm +0
.       po -0.3i
.       code-div
.       po +0.3i
.   \}
.
\#  Else if code is longer than the size of one page
\#
.   el  \{\
.       if ( \\n[import-mode] == 1) \{\
.           nr vert \\n[maxv]u-\\n[startv]u     \" Box dimensions
.           nr hoffset 0.15i
.           nr width \\\n[LL]u
.           nr cut ((\\n[vert]/(\\n[.v]))-1)    \" Calculate number of lines
.
\#          Extract number of lines that will fit on page
.           sy head -\\n[cut] temp > extracted_text
.           nop \v'-0'\M[light]\D'P 0 0 \\n[width]u 0 0 \\n[vert]u -\\n[width]u 0'\M[]
.           nm +0                               \" Resume line numbering
.           po -0.3i
.           so extracted_text                   \" Print extracted text
.           po +0.3i
.           sy sed -i -e "1,\\n[cut]d" temp     \" Pop extracted text from main file
.           sy rm extracted_text                \" Remove temp file
.           bp                                  \" Force page break
.       \}
.   \}
.\}
.
.sy rm temp
.ft
.nm
.fi
.ps \\n[font-size]
.vs \\n[font-space]
..
