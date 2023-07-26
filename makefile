all: main.pdf

%.pdf: %.ms header.ms
	cat header.ms $< | eqn -Tpdf | groff -U -P-e -tbl -Tpdf -P-pa4 -ms > $@

%.pdf: %.jpg
	convert $< temp.tiff
	tiff2pdf temp.tiff > $@
