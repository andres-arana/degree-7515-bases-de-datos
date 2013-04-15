doc: prepare
	pdflatex --output-directory build informe.tex
	pdflatex --output-directory build informe.tex
	pdflatex --output-directory build informe.tex

prepare:
	-mkdir -p build

clean:
	rm -rf build

doc-preview: doc
	evince build/informe.pdf &

doc-spell:
	aspell -t check informe.tex -d es
