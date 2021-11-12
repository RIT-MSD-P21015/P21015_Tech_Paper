TARGET = P21015_Tech_Paper
OPTIONS = -halt-on-error

all: clean
	pdflatex $(OPTIONS) -draftmode $(TARGET).tex
	bibtex $(TARGET).aux
	pdflatex $(OPTIONS) -draftmode $(TARGET).tex
	pdflatex $(OPTIONS) $(TARGET).tex

spell:
	aspell -t -c $(TARGET).tex

clean:
	rm -f $(TARGET)*.{aux,bbl,blg,log,toc,idx,ilg,ind,glg,glo,gls,ist,nav,snm,bak}

cclean: clean
	rm -f $(TARGET).pdf

.PHONY: clean cclean all