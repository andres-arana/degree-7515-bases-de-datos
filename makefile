doc: build/informe.pdf

build:
	-mkdir -p build
	-mkdir -p build/images

build/informe.pdf: build build/images/der.png build/images/der2.png build/images/rel.png build/images/rel2.png docs/informe.tex
	pdflatex --output-directory build docs/informe.tex
	pdflatex --output-directory build docs/informe.tex
	pdflatex --output-directory build docs/informe.tex

build/images/der.png: build docs/diagramas/der.dia
	dia --export=build/images/der.png --filter=png docs/diagramas/der.dia

build/images/der2.png: build docs/diagramas/der2.dia
	dia --export=build/images/der2.png --filter=png docs/diagramas/der2.dia

build/images/rel.png: build docs/diagramas/rel.dia
	dia --export=build/images/rel.png --filter=png docs/diagramas/rel.dia

build/images/rel2.png: build docs/diagramas/rel2.dia
	dia --export=build/images/rel2.png --filter=png docs/diagramas/rel2.dia


clean:
	rm -rf build

doc-preview: doc
	./scripts/preview build/informe.pdf &

doc-spell:
	aspell -t check docs/informe.tex -d es

vm-up:
	vagrant up

vm-stop:
	vagrant halt

vm-destroy:
	vagrant destroy

db-console:
	psql -h localhost -U postgres --password -p 3000

db-reset:
	psql -h localhost -U postgres -p 3000 --password -a -f sql/database.sql -v client_min_messages='warning'
	psql -h localhost -U postgres -p 3000 -d hiposoft --password -a -f sql/schema.sql -v client_min_messages='warning'
	psql -h localhost -U postgres -p 3000 -d hiposoft --password -a -f sql/schema2.sql -v client_min_messages='warning'
