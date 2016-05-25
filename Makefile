LATEX = pdflatex
TARGET = main
BIBTEX = bibtex

all: $(TARGET).pdf

$(TARGET).pdf: $(TARGET).tex
	$(LATEX) $< -o $@ && \
	$(BIBTEX) $(TARGET).aux && \
	$(LATEX) $< -o $@ && \
	$(LATEX) $< -o $@

clean:
	rm -f *.fls *.fdb* *.synctex.gz *.toc *.lof *.lot *.bbl *.blg *.log *.aux *.las *.lsb
	rm -f $(TARGET).pdf

clean-utf8:
	rm -rf utf8

utf8: clean-utf8
	mkdir utf8
	find . -maxdepth 1 -name "*.tex" -exec iconv -f ISO-8859-1 -t UTF-8 {} -o utf8/{} \;
	find . -maxdepth 1 -name "*.bib" -exec iconv -f ISO-8859-1 -t UTF-8 {} -o utf8/{} \;
