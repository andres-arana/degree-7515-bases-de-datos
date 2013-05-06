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

* **vagrant-up**: Descarga, configura y levanta una máquina virtual con un
  server de PostgreSQL listo para ejecutar los scripts del trabajo práctico. Si
la máquina virtual ya fue descargada y configurada anteriormente, únicamente la
levanta.

* **vagrant-ssh**: Abre una sesión de ssh a la máquina virtual.

* **vagrant-halt**: Cierra la máquina virtual.

* **vagrant-destroy**: Elimina completamente la máquina virtual previamente
  creada. La próxima vez que se ejecute `vagrant-up` se deberá descargar y
configurar nuevamente la virtual machine.

