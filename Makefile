SRC_DIR = src
OUT_FILE = master-thesis
TEMPLATE = format/template
SOURCES = *.md Metadata.yaml
PREAMBLE = format/preamble.tex
CSS = format/style.css
BIB = media/library.bib
CSL = format/csl-ieee.xml

COMMON_ARGS = -F pandoc-crossref -F pandoc-citeproc \
		--number-sections \
		--table-of-contents \
		--bibliography=$(BIB) \
		--csl $(CSL)

html: 
	cd $(SRC_DIR) && \
	pandoc $(SOURCES) \
		-o ../$(OUT_FILE).html  \
		$(COMMON_ARGS) \
		--template=$(TEMPLATE).html \
		--latexmathml \
		--standalone \
		--self-contained \
		-c $(CSS) 

pdf: 
	cd $(SRC_DIR) && \
	pandoc $(SOURCES) \
		-o ../$(OUT_FILE).pdf  \
		$(COMMON_ARGS) \
		--template=$(TEMPLATE).tex \
		--include-in-header=$(PREAMBLE)


