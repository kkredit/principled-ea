DOCNAME := Thesis
OUTDIR := build
TEMPLATE := gvsu-thesis-template
TEMPLATE_IS_CLONED := $(TEMPLATE)/Fonts

ARG_SRC_DIR := arguments
ARG_IMAGE_SOURCES  := $(wildcard $(ARG_SRC_DIR)/*.argdown)
ARG_IMAGES := $(patsubst $(ARG_SRC_DIR)/%.argdown,$(ARG_SRC_DIR)/build/%.pdf,$(ARG_IMAGE_SOURCES))

DFD_SRC_DIR := dfds
DFD_IMAGE_SOURCES  := $(wildcard $(ARG_SRC_DIR)/*.drawio)
DFD_IMAGES := $(patsubst $(DFD_SRC_DIR)/%.drawio,$(DFD_SRC_DIR)/build/%.png,$(DFD_IMAGE_SOURCES))

IMAGES := $(ARG_IMAGES) $(DFD_IMAGES)

SOURCES := $(wildcard *.tex) $(wildcard *.bib) $(wildcard Forms/*.pdf) $(wildcard $(TEMPLATE)/*.tex) \
	$(wildcard $(TEMPLATE)/*.cls) $(ARG_IMAGE_SOURCES) $(DFD_IMAGE_SOURCES)
LATEX_OPTS := -xelatex -bibtex -outdir=$(OUTDIR) -halt-on-error -file-line-error
LIVE_OPTS := -pvc -view=none
LATEX_PATHS := '.:./$(TEMPLATE):'
ENVIRON := TEXINPUTS=$(LATEX_PATHS) TEXFORMATS=$(LATEX_PATHS)

GVSU_JOB := Thesis-GVSU
PRETTY_JOB := Thesis

DOCKER_BUILD_ARGS := --build-arg USER_UID=`id -u` --build-arg USER_GID=`id -g` --build-arg USER_NAME=`whoami`
DOCKER_TAG := thesis-build-env
# DBUS_FLAGS := -v /run/dbus/system_bus_socket:/run/dbus/system_bus_socket:ro
DISP_FLAGS := -e DISPLAY=$(DISPLAY) -v /tmp/.X11-unix:/tmp/.X11-unix
DOCKER_RUN_FLAGS := --privileged $(DISP_FLAGS) -v `pwd`:/host --user=`id -u`:`id -g` --hostname builder --rm -it
DOCKER_RUN_CMD := bash -c "make live"

.PHONY: all pretty gvsu live gvsu-live docker clean clean-all prereqs
# TODO: build from a container. I don't trust myself to keep this environment working!

pretty: $(OUTDIR)/$(PRETTY_JOB).pdf
gvsu: $(OUTDIR)/$(GVSU_JOB).pdf
all: gvsu pretty

$(TEMPLATE_IS_CLONED):
	git submodule init
	git submodule update --init --force --remote

Fonts: | $(TEMPLATE_IS_CLONED)
	if [ ! -L Fonts ]; then ln -s $(TEMPLATE)/Fonts Fonts; fi

# FIXME: Kludge to fix broken VSCode LatexWorkshop
build/build:
	mkdir -p build
	ln -s . build/build

$(IMAGES):
	make -C $(ARG_SRC_DIR)
	make -C $(DFD_SRC_DIR)

$(DOCNAME).bib:
	./scripts/bib-gen.sh

$(DOCNAME)-Glossary.tex: notes/glossary.md
	./scripts/update-acronyms.sh

prereqs: | $(TEMPLATE_IS_CLONED) Fonts build/build $(IMAGES) $(DOCNAME).bib

$(OUTDIR)/$(GVSU_JOB).pdf: $(SOURCES) | prereqs
	$(ENVIRON) latexmk -jobname=$(GVSU_JOB) $(LATEX_OPTS) $(DOCNAME)

$(OUTDIR)/$(PRETTY_JOB).pdf: $(SOURCES) | prereqs
	$(ENVIRON) latexmk -jobname=$(PRETTY_JOB) $(LATEX_OPTS) $(DOCNAME)

live: | prereqs
	$(ENVIRON) latexmk -jobname=$(PRETTY_JOB) $(LATEX_OPTS) $(LIVE_OPTS) $(DOCNAME)

gvsu-live: | prereqs
	$(ENVIRON) latexmk -jobname=$(GVSU_JOB) $(LATEX_OPTS) $(LIVE_OPTS) $(DOCNAME)

docker:
	docker build $(DOCKER_BUILD_ARGS) -t $(DOCKER_TAG) .
	# docker run --rm -it $(DOCKER_TAG)
	docker run $(DOCKER_RUN_FLAGS) $(DOCKER_TAG) $(DOCKER_RUN_CMD)

clean:
	rm -rf $(OUTDIR) $(DOCNAME).bib

clean-all: clean
	make -C $(ARG_SRC_DIR) clean
	make -C $(DFD_SRC_DIR) clean
