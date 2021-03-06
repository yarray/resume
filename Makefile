SRC = $(wildcard *.md)

PDFS=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
LATEX_TEMPLATE=./pandoc-templates/default.latex
PANDOCARGS=--latex-engine=xelatex -V fontsize=12pt
COMMON_OPTIONS=--no-gravatar

all: $(PDFS) $(HTML)

pdf:   $(PDFS)
html:  $(HTML)

%-cn.html: %-cn.md header.html banner-cn.html work-cn.html contacts-cn.html
	cat $< | pandoc -t html5 --section-divs -H header.html -B banner-cn.html -A work-cn.html -A contacts-cn.html -c resume.css -o $@

%-cn.pdf:  %-cn.md $(LATEX_TEMPLATE) header.tex contacts-cn.tex
	cat contacts-cn.tex $< | pandoc $(PANDOCARGS) --template=$(LATEX_TEMPLATE) -H header.tex -o $@

ifeq ($(OS),Windows_NT)
  # on Windows
  RM = cmd //C del
else
  # on Unix
  RM = rm -f
endif

clean:
	$(RM) *.html *.pdf

$(LATEX_TEMPLATE):
	git submodule update --init
