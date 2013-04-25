# 75.15 - Bases de datos

Este repositorio contiene los trabajos prácticos de la materia 75.15: Bases de
datos para la carrera de Ingeniería en Informática de la FIUBA.

## Desarrollo

El informe del trabajo práctico fue confeccionado usando latex y se encuentra
en la raiz del repositorio, en el archivo `informe.tex`. Los diagramas,
implementados con DIA, se encuentran en `diagramas/*.dia`. Los scripts
asociados a la creación y consulta del esquema desarrollado se encuentan en la
carpeta `scripts`. El enunciado original del trabajo práctico está en la raíz
del repositorio, en `enunciado.pdf`

Se incluye además un makefile con varias tareas para facilitar el armado del
informe:

* **doc**: Utiliza pdflatex para generar un pdf a partir del código fuente del
  informe, dejándolo en `build/informe.pdf`.

* **doc-preview**: Genera el informe a través de la tarea `make doc`, y
  posteriormente abre el informe con evince para poder previsualizarlo.

* **doc-spell**: Chequea la ortografía del informe utilizando aspell.

* **clean**: Elimina todos los archivos generados.

* **createdb**: Crea la base de datos en funcion al script de creacion.

Para poder correr estas tareas se requiere instalar las siguientes dependencias
en el sistema:

```
sudo apt-get install -y pdflatex texlive texlive-lang-all aspell aspell-es
```

