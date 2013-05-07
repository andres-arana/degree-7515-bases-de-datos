# 75.15 - Bases de datos

Este repositorio contiene los trabajos prácticos de la materia 75.15: Bases de
datos para la carrera de Ingeniería en Informática de la FIUBA.

## Desarrollo

### Informe

El informe del trabajo práctico fue confeccionado usando latex y se encuentra
en el archivo `docs/informe.tex`. Los diagramas, implementados con DIA, se
encuentran en `docs/diagramas/*.dia`. Los scripts asociados a la creación y
consulta del esquema desarrollado se encuentan en la carpeta `scripts`. El
enunciado original del trabajo práctico está en `docs/enunciado.pdf`

Se incluye además un makefile con varias tareas para facilitar el armado del
informe:

* **doc**: Utiliza pdflatex para generar un pdf a partir del código fuente del
  informe, dejándolo en `build/informe.pdf`.

* **doc-preview**: Genera el informe a través de la tarea `make doc`, y
  posteriormente abre el informe con evince para poder previsualizarlo.

* **doc-spell**: Chequea la ortografía del informe utilizando aspell.

* **clean**: Elimina todos los archivos generados.

Para poder correr estas tareas se requiere instalar las siguientes dependencias
en el sistema:

```
sudo apt-get install -y pdflatex texlive texlive-lang-all aspell aspell-es
```

### Ejecución de scripts

Los scripts del trabajo práctico fueron diseñados y probados en PostgreSQL.
Para poder ejecutarlos y probarlos **no es necesario** contar con un server
PostgreSQL instalado localmente. Sólo debe contar con los siguientes
prerequisitos en su sistema:

1. [virtual box](https://www.virtualbox.org/), necesario para ejecutar la
   máquina virtual incluida que contiene al server PostgreSQL.

1. [vagrant](http://www.vagrantup.com/), necesario para automatizar la
   configuración de la máquina virtual.

1. [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest), una
   utilidad opcional para evitar algunos warnings.

Una vez instaladas estas utilidades, se puede utilizar vagrant para configurar
una máquina virtual con el server PostgreSQL automáticamente, y conectarse a
ella. Si bien es posible utilizar los comandos de vagrant estándar para manejar
la máquina virtual, se proveen varias tareas en el makefile que lo hacen más
sencillo:

* **vm-up**: Inicia un servidor PostgreSQL virtualizado, descargando y
  configurando una máquina virtual virtualbox si fuese necesario. El servidor
puede accederse conectándose a localhost, puerto 5432 con credenciales
postgres:123.

* **vm-stop**: Detiene el servidor PostgreSQL virtualizado. Con `db-up` se
  vuelve a iniciar.

* **vm-destroy**: Elimina la máquina virtualizada.

* **db-console**: Se conecta a la consola de la base de datos PostgreSQL
  virtualizada a través de `psql`.

* **db-reset**: Recrea el esquema de la base de datos en el sever virtualizado,
  ejecutando los scripts `sql/database.sql` y `sql/schema.sql`.


