.close eqstream
.close figstream
.close tablestream
.sy groff -Tpdf -ms equations.ms > equations.pdf
.sy groff -Tpdf -ms figures.ms > figures.pdf
.sy groff -Tpdf -ms tables.ms > tables.pdf
.ie (\n[combine] == 1) \{\
.   sy pdfjam equations.pdf figures.pdf tables.pdf -q -o list.pdf
.   tm List files combined
.\}
.el
.   tm List files NOT combined
