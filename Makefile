DOCNAME := Thesis
OUTDIR := build
TEMPLATE := gvsu-thesis-template
TEMPLATE_IS_CLONED := $(TEMPLATE)/Fonts

SOURCES := $(wildcard *.tex) $(wildcard *.bib) $(wildcard $(TEMPLATE)/*.cls)
LATEX_OPTS := -xelatex -bibtex -outdir=$(OUTDIR) -halt-on-error -file-line-error
LATEX_PATHS := '.:./$(TEMPLATE):'
ENVIRON := TEXINPUTS=$(LATEX_PATHS) TEXFORMATS=$(LATEX_PATHS)

GVSU_JOB := Thesis-GVSU
PRETTY_JOB := Thesis

.PHONY: all
.PHONY: pretty
.PHONY: gvsu
.PHONY: clean

gvsu: $(OUTDIR)/$(GVSU_JOB).pdf
pretty: $(OUTDIR)/$(PRETTY_JOB).pdf
all: gvsu pretty

$(TEMPLATE_IS_CLONED):
	git submodule init
	git submodule update --init --force --remote

Fonts: | $(TEMPLATE_IS_CLONED)
	if [ ! -L Fonts ]; then ln -s $(TEMPLATE)/Fonts Fonts; fi

$(OUTDIR)/$(GVSU_JOB).pdf: $(SOURCES) | $(TEMPLATE_IS_CLONED) Fonts
	$(ENVIRON) latexmk -jobname=$(GVSU_JOB) $(LATEX_OPTS) $(DOCNAME)

$(OUTDIR)/$(PRETTY_JOB).pdf: $(SOURCES) | $(TEMPLATE_IS_CLONED) Fonts
	$(ENVIRON) latexmk -jobname=$(PRETTY_JOB) $(LATEX_OPTS) $(DOCNAME)

clean:
	rm -rf $(OUTDIR)
