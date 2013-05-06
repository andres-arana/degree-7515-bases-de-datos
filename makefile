doc: build/informe.pdf

build:
	-mkdir -p build
	-mkdir -p build/images

build/informe.pdf: build build/images/der.png build/images/rel.png docs/informe.tex
	pdflatex --output-directory build docs/informe.tex
	pdflatex --output-directory build docs/informe.tex
	pdflatex --output-directory build docs/informe.tex

build/images/der.png: build docs/diagramas/der.dia
	dia --export=build/images/der.png --filter=png docs/diagramas/der.dia

build/images/rel.png: build docs/diagramas/rel.dia
	dia --export=build/images/rel.png --filter=png docs/diagramas/rel.dia

clean:
	rm -rf build

doc-preview: doc
	./scripts/preview build/informe.pdf &

doc-spell:
	aspell -t check informe.tex -d es

db-up:
	vagrant up

db-stop:
	vagrant halt

db-destroy:
	vagrant destroy

db-console:
	psql -h localhost -U postgres --password

db-create:
	psql -h localhost -U postgres --password -a -f sql/create.sql
