doc: prepare generate-graphics
	pdflatex --output-directory build informe.tex
	pdflatex --output-directory build informe.tex
	pdflatex --output-directory build informe.tex

generate-graphics: prepare
	dia --export=build/images/der.png --filter=png diagramas/der.dia
	dia --export=build/images/rel.png --filter=png diagramas/rel.dia

prepare:
	-mkdir -p build
	-mkdir -p build/images

clean:
	rm -rf build

doc-preview: doc
	evince build/informe.pdf &

doc-spell:
	aspell -t check informe.tex -d es
