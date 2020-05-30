OUT_ZIP=arxiv.zip

MAIN_TEX=$(wildcard *.tex)
AUX_TEX=$(wildcard *.bib, *.bbl *.cls *.bst)
FIG_PDF=$(wildcard Fig_*.pdf)

## all      : Generate an zip-archive for arXiv upload.
.PHONY : all
all: $(OUT_ZIP)

$(OUT_ZIP): $(MAIN_TEX) $(AUX_TEX) $(FIG_PDF)
	zip -r -FS -9 $@ $^

## tex      : LaTeX files
.PHONY : tex
tex:
	@echo $(MAIN_TEX) $(AUX_TEX)

## figs     : Article figures in PDF
.PHONY : figs
figs:
	@echo $(FIG_PDF)

## clean    : Remove auto-generated files.
.PHONY : clean
clean:
	rm -f $(OUT_ZIP)

## variables: Print variables.
.PHONY : variables
variables:
	@echo MAIN_TEX: $(MAIN_TEX)
	@echo AUX_TEX: $(AUX_TEX)
	@echo FIG_PDF: $(FIG_PDF)
	@echo OUT_ZIP: $(OUT_ZIP)


.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<
