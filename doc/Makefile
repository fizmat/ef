SHELL:=/bin/bash -O extglob
NAME=ef
ARCHIVEDIR=./${NAME}_tex
MAJOR=ef.tex

all: pdf archive

pdf:
	pdflatex --jobname ${NAME} ${MAJOR}
	bibtex ${NAME}
	pdflatex --jobname ${NAME} ${MAJOR}
	pdflatex --jobname ${NAME} ${MAJOR}
ps:
	latex --jobname ${NAME} ${MAJOR}
	bibtex ${NAME}
	latex --jobname ${NAME} ${MAJOR}
	latex --jobname ${NAME} ${MAJOR}
	dvips ${NAME}.dvi
archive:
	mkdir -p ${ARCHIVEDIR}
	cp -r figs ${ARCHIVEDIR}
	cp *.tex *.bib *.sty ${ARCHIVEDIR}
	zip -r  ${ARCHIVEDIR}.zip ${ARCHIVEDIR}
clean:
	rm -f *.aux *.log *.*~ *.bbl *.blg *.out *.dvi
