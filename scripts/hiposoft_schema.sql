--
-- PostgreSQL database dump
--

CREATE TABLE carrera (
    distancia integer,
    estado_pista character varying(100)[],
    estado_tiempo character varying(100)[],
    tipo character varying(50)[],
    numero integer NOT NULL,
    sexo_equinos integer NOT NULL,
    encuentro_numero integer NOT NULL,
    pista_nombre character varying(50)[] NOT NULL,
    pista_hipodromo_nombre character varying(50)[] NOT NULL
);


CREATE TABLE cuidador (
    persona_dni integer NOT NULL
);


CREATE TABLE encuentro (
    numero integer NOT NULL,
    hipodromo_nombre character varying(50)[] NOT NULL,
    fecha date NOT NULL
);


CREATE TABLE entrenador (
    persona_dni integer NOT NULL
);


CREATE TABLE equino (
    nombre character varying(50)[] NOT NULL,
    tipo character varying(50)[],
    pelaje character varying(50)[],
    padre_nombre character varying(50)[],
    madre_nombre character varying(50)[],
    sexo integer NOT NULL,
    handicap double precision,
    cuidador_dni integer NOT NULL,
    entrenador_dni integer NOT NULL,
    stud_nombre character varying(50)[] NOT NULL
);


CREATE TABLE hipodromo (
    nombre character varying(50)[] NOT NULL,
    direccion character varying(100)[]
);


CREATE TABLE jockey (
    talla double precision,
    peso double precision,
    categoria character varying(50)[],
    persona_dni integer NOT NULL
);


CREATE TABLE participacion (
    jockey_dni integer NOT NULL,
    equino_nombre character varying(50)[] NOT NULL,
    carrera_numero integer NOT NULL,
    carrera_encuentro_numero integer NOT NULL,
    tiempo integer,
    andarivel integer,
    peso double precision
);


CREATE TABLE persona (
    dni integer NOT NULL,
    nombres character varying(200)[],
    apellidos character varying(100)[]
);


CREATE TABLE pista (
    nombre character varying(50)[] NOT NULL,
    nro_andariveles integer,
    hipodromo_nombre character varying(50)[] NOT NULL,
    tipo character varying(50)[]
);


CREATE TABLE stud (
    nombre character varying(50)[] NOT NULL,
    color_gorra character varying(50)[],
    color_chaqueta character varying(50)[]
);


ALTER TABLE ONLY carrera
    ADD CONSTRAINT pk_carrera PRIMARY KEY (numero, encuentro_numero);


ALTER TABLE ONLY cuidador
    ADD CONSTRAINT pk_cuidador PRIMARY KEY (persona_dni);


ALTER TABLE ONLY encuentro
    ADD CONSTRAINT pk_encuentro PRIMARY KEY (numero);


ALTER TABLE ONLY entrenador
    ADD CONSTRAINT pk_entrenador PRIMARY KEY (persona_dni);


ALTER TABLE ONLY equino
    ADD CONSTRAINT pk_equino PRIMARY KEY (nombre);


ALTER TABLE ONLY hipodromo
    ADD CONSTRAINT pk_hipodromo PRIMARY KEY (nombre);


ALTER TABLE ONLY jockey
    ADD CONSTRAINT pk_jockey PRIMARY KEY (persona_dni);


ALTER TABLE ONLY participacion
    ADD CONSTRAINT pk_participacion PRIMARY KEY (jockey_dni, equino_nombre, carrera_numero, carrera_encuentro_numero);


ALTER TABLE ONLY persona
    ADD CONSTRAINT pk_persona PRIMARY KEY (dni);


ALTER TABLE ONLY pista
    ADD CONSTRAINT pk_pista PRIMARY KEY (nombre, hipodromo_nombre);


ALTER TABLE ONLY stud
    ADD CONSTRAINT pk_stud PRIMARY KEY (nombre);


ALTER TABLE ONLY carrera
    ADD CONSTRAINT fk_carrera_encuentro FOREIGN KEY (encuentro_numero) REFERENCES encuentro(numero);


ALTER TABLE ONLY carrera
    ADD CONSTRAINT fk_carrera_pista FOREIGN KEY (pista_nombre, pista_hipodromo_nombre) REFERENCES pista(nombre, hipodromo_nombre);


ALTER TABLE ONLY cuidador
    ADD CONSTRAINT fk_cuidador_persona FOREIGN KEY (persona_dni) REFERENCES persona(dni);


ALTER TABLE ONLY encuentro
    ADD CONSTRAINT fk_encuentro_hipodromo FOREIGN KEY (hipodromo_nombre) REFERENCES hipodromo(nombre);


ALTER TABLE ONLY entrenador
    ADD CONSTRAINT fk_entrenador_persona FOREIGN KEY (persona_dni) REFERENCES persona(dni);


ALTER TABLE ONLY equino
    ADD CONSTRAINT fk_equino_cuidador FOREIGN KEY (cuidador_dni) REFERENCES cuidador(persona_dni);


ALTER TABLE ONLY equino
    ADD CONSTRAINT fk_equino_entrenador FOREIGN KEY (entrenador_dni) REFERENCES entrenador(persona_dni);


ALTER TABLE ONLY equino
    ADD CONSTRAINT fk_equino_stud FOREIGN KEY (stud_nombre) REFERENCES stud(nombre);


ALTER TABLE ONLY jockey
    ADD CONSTRAINT fk_jockey_persona FOREIGN KEY (persona_dni) REFERENCES persona(dni);


ALTER TABLE ONLY participacion
    ADD CONSTRAINT fk_participacion_carrera FOREIGN KEY (carrera_numero, carrera_encuentro_numero) REFERENCES carrera(numero, encuentro_numero);


ALTER TABLE ONLY participacion
    ADD CONSTRAINT fk_participacion_equino FOREIGN KEY (equino_nombre) REFERENCES equino(nombre);


ALTER TABLE ONLY participacion
    ADD CONSTRAINT fk_participacion_jockey FOREIGN KEY (jockey_dni) REFERENCES jockey(persona_dni);


ALTER TABLE ONLY pista
    ADD CONSTRAINT fk_pista_hipodromo FOREIGN KEY (hipodromo_nombre) REFERENCES hipodromo(nombre);


--
-- PostgreSQL database dump complete
--

