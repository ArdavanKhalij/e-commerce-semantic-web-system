outputname=test.pdf

.PHONY: clean $(outputname) all

all: $(outputname)
$(outputname): $(texfile)
	latexmk -pdf -xelatex -latexoption='--shell-escape' -use-make test.tex

clean:
	latexmk -c -C
	rm _minted-main -rf
