# Resume

My resume with both [online]() and [pdf]() versions (from LaTeX) using [mwhite's template](https://github.com/mwhite/resume)
=======
This is a simple Markdown resumé template, LaTeX header, and pre-processing
script that can be used with [Pandoc](http://johnmacfarlane.net/pandoc/) to generate
professional-looking PDF and HTML output.

## Dependencies

* Pandoc >= 1.9 
* Python >= 2.7
* A Tex installation with pdflatex and the Tex Gyre Pagella font, and some
  packages needed by pandoc.

## Usage

To generate PDF and HTML versions of each .md file in the directory:

    $ make
