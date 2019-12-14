DOCNAME := Thesis
OUTDIR := build
TEMPLATE := gvsu-thesis-template
TEMPLATE_IS_CLONED := $(TEMPLATE)/Fonts
ENVIRON := TEXINPUTS='.:./$(TEMPLATE)/:' TEXFORMATS='.:./$(TEMPLATE)/:'

.PHONY: all
.PHONY: clean

all: $(OUTDIR)/$(DOCNAME).pdf

$(TEMPLATE_IS_CLONED):
	git submodule init
	git submodule update --init --force --remote

Fonts: | $(TEMPLATE_IS_CLONED)
	if [ ! -L Fonts ]; then ln -s $(TEMPLATE)/Fonts Fonts; fi

$(OUTDIR)/$(DOCNAME).pdf: $(DOCNAME).tex $(DOCNAME).bib | Fonts $(TEMPLATE_IS_CLONED)
	$(ENVIRON) latexmk -jobname=Thesis-GVSU -xelatex -outdir=$(OUTDIR) $(DOCNAME).tex

clean:
	rm -rf $(OUTDIR)