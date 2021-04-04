\# Closes  streams for equations, figures, and tables
.write eqstream ".bp
.write figstream ".bp
.write tablestream ".bp

.close eqstream
.close figstream
.close tablestream
.
.if (\n[show-equations-list]) .so equations.ms
.if (\n[show-figures-list]) .so figures.ms
.if (\n[show-tables-list]) .so tables.ms
.
\# Processes equation, figure, and table files using groff
\#.sy groff -Tpdf -ms equations.ms > equations.pdf
\#.sy groff -Tpdf -ms figures.ms > figures.pdf
\#.sy groff -Tpdf -ms tables.ms > tables.pdf
.
\# ATTENTION: Define a register called 'combine'
\# in your main file to control whether pdfjam combines the above files or not.
\#
\# If combine is not defined, it fails the first if-condition below.
\# Usage:   .nr combine 1
\#
\#.ie (\n[combine] == 1) \{\
\#.   sy pdfjam equations.pdf figures.pdf tables.pdf -q -o list.pdf
\#.   tm List of Equations, Figures, and Tables combined
\#.\}
\#.el
\#.   tm List of Equations, Figures, and Tables NOT combined
