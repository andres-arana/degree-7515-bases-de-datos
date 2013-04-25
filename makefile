doc: build/informe.pdf

build:
	-mkdir -p build
	-mkdir -p build/images

build/informe.pdf: build build/images/der.png build/images/rel.png informe.tex
	pdflatex --output-directory build informe.tex
	pdflatex --output-directory build informe.tex
	pdflatex --output-directory build informe.tex

build/images/der.png: build diagramas/der.dia
	dia --export=build/images/der.png --filter=png diagramas/der.dia

build/images/rel.png: build diagramas/rel.dia
	dia --export=build/images/rel.png --filter=png diagramas/rel.dia

clean:
	rm -rf build

doc-preview: doc
	evince build/informe.pdf &

doc-spell:
	aspell -t check informe.tex -d es

createdb:
	psql -U postgres -a -f scripts/hiposoft_create.sql
