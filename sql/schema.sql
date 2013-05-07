-- Tablas
CREATE TABLE carrera (
    numero integer NOT NULL,
    encuentro_numero integer NOT NULL,
    tipo varchar NOT NULL,
    estado_pista varchar,
    estado_tiempo varchar,
    sexo_equinos integer NOT NULL,
    distancia integer,
    pista_nombre varchar,
    pista_hipodromo_nombre varchar NOT NULL
);

CREATE TABLE cuidador (
    persona_dni integer NOT NULL
);

CREATE TABLE encuentro (
    numero integer NOT NULL,
    hipodromo_nombre varchar NOT NULL,
    fecha date NOT NULL
);

CREATE TABLE entrenador (
    persona_dni integer NOT NULL
);

CREATE TABLE equino (
    nombre varchar NOT NULL,
    tipo varchar NOT NULL,
    pelaje varchar NOT NULL,
    sexo integer NOT NULL,
    handicap decimal NOT NULL,
    stud_nombre varchar NOT NULL,
    padre_nombre varchar NOT NULL,
    madre_nombre varchar NOT NULL,
    cuidador_persona_dni integer NOT NULL,
    entrenador_persona_dni integer NOT NULL
);

CREATE TABLE hipodromo (
    nombre varchar NOT NULL,
    direccion varchar NOT NULL
);

CREATE TABLE jockey (
    persona_dni integer NOT NULL,
    categoria varchar NOT NULL,
    talla decimal NOT NULL,
    peso decimal NOT NULL
);

CREATE TABLE participacion (
    jockey_persona_dni integer NOT NULL,
    equino_nombre varchar NOT NULL,
    carrera_numero integer NOT NULL,
    carrera_encuentro_numero integer NOT NULL,
    tiempo integer,
    andarivel integer,
    peso_jockey decimal,
    talla_jockey decimal,
    handicap_equino decimal
);

CREATE TABLE persona (
    dni integer NOT NULL,
    nombres varchar NOT NULL,
    apellidos varchar NOT NULL,
    stud_nombre varchar NOT NULL
);

CREATE TABLE pista (
    nombre varchar NOT NULL,
    hipodromo_nombre varchar NOT NULL,
    tipo varchar,
    nro_andariveles integer
);

CREATE TABLE stud (
    nombre varchar NOT NULL,
    color_gorra varchar NOT NULL,
    color_chaqueta varchar NOT NULL
);

-- Claves primarias
ALTER TABLE carrera
    ADD CONSTRAINT pk_carrera
    PRIMARY KEY (numero, encuentro_numero);

ALTER TABLE cuidador
    ADD CONSTRAINT pk_cuidador
    PRIMARY KEY (persona_dni);

ALTER TABLE encuentro
    ADD CONSTRAINT pk_encuentro
    PRIMARY KEY (numero);

ALTER TABLE entrenador
    ADD CONSTRAINT pk_entrenador
    PRIMARY KEY (persona_dni);

ALTER TABLE equino
    ADD CONSTRAINT pk_equino
    PRIMARY KEY (nombre);

ALTER TABLE hipodromo
    ADD CONSTRAINT pk_hipodromo
    PRIMARY KEY (nombre);

ALTER TABLE jockey
    ADD CONSTRAINT pk_jockey
    PRIMARY KEY (persona_dni);

ALTER TABLE participacion
    ADD CONSTRAINT pk_participacion PRIMARY
    KEY (jockey_persona_dni, equino_nombre, carrera_numero, carrera_encuentro_numero);

ALTER TABLE persona
    ADD CONSTRAINT pk_persona PRIMARY
    KEY (dni);

ALTER TABLE pista
    ADD CONSTRAINT pk_pista
    PRIMARY KEY (nombre, hipodromo_nombre);

ALTER TABLE stud
    ADD CONSTRAINT pk_stud
    PRIMARY KEY (nombre);

-- Claves foraneas
ALTER TABLE carrera
    ADD CONSTRAINT fk_carrera_encuentro
    FOREIGN KEY (encuentro_numero)
    REFERENCES encuentro(numero);


ALTER TABLE carrera
    ADD CONSTRAINT fk_carrera_pista
    FOREIGN KEY (pista_nombre, pista_hipodromo_nombre)
    REFERENCES pista(nombre, hipodromo_nombre);


ALTER TABLE cuidador
    ADD CONSTRAINT fk_cuidador_persona
    FOREIGN KEY (persona_dni)
    REFERENCES persona(dni);


ALTER TABLE encuentro
    ADD CONSTRAINT fk_encuentro_hipodromo
    FOREIGN KEY (hipodromo_nombre)
    REFERENCES hipodromo(nombre);

ALTER TABLE entrenador
    ADD CONSTRAINT fk_entrenador_persona
    FOREIGN KEY (persona_dni)
    REFERENCES persona(dni);


ALTER TABLE equino
    ADD CONSTRAINT fk_equino_cuidador
    FOREIGN KEY (cuidador_persona_dni)
    REFERENCES cuidador(persona_dni);


ALTER TABLE equino
    ADD CONSTRAINT fk_equino_entrenador
    FOREIGN KEY (entrenador_persona_dni)
    REFERENCES entrenador(persona_dni);

ALTER TABLE equino
    ADD CONSTRAINT fk_equino_stud
    FOREIGN KEY (stud_nombre)
    REFERENCES stud(nombre);

ALTER TABLE equino
    ADD CONSTRAINT fk_equino_madre
    FOREIGN KEY (madre_nombre)
    REFERENCES equino(nombre);

ALTER TABLE equino
    ADD CONSTRAINT fk_equino_padre
    FOREIGN KEY (padre_nombre)
    REFERENCES equino(nombre);

ALTER TABLE jockey
    ADD CONSTRAINT fk_jockey_persona
    FOREIGN KEY (persona_dni)
    REFERENCES persona(dni);

ALTER TABLE participacion
    ADD CONSTRAINT fk_participacion_carrera
    FOREIGN KEY (carrera_numero, carrera_encuentro_numero)
    REFERENCES carrera(numero, encuentro_numero);

ALTER TABLE  participacion
    ADD CONSTRAINT fk_participacion_equino
    FOREIGN KEY (equino_nombre)
    REFERENCES equino(nombre);

ALTER TABLE participacion
    ADD CONSTRAINT fk_participacion_jockey
    FOREIGN KEY (jockey_persona_dni)
    REFERENCES jockey(persona_dni);

ALTER TABLE pista
    ADD CONSTRAINT fk_pista_hipodromo
    FOREIGN KEY (hipodromo_nombre)
    REFERENCES hipodromo(nombre);

-- Unicidad de fecha para encuentros
ALTER TABLE encuentro
  ADD CONSTRAINT unique_fecha
  UNIQUE (fecha);

-- Unicidad de participacion de equinos por encuentro
ALTER TABLE participacion
  ADD CONSTRAINT unique_equino_encuentro
  UNIQUE (equino_nombre, carrera_encuentro_numero);

-- Distancia de la carrera mayor que cero
ALTER TABLE carrera
  ADD CONSTRAINT carrera_distancia_gtzero
  CHECK (distancia > 0);

-- Numero de andariveles en la pista mayor que cero
ALTER TABLE pista
  ADD CONSTRAINT pista_nro_andariveles_gtzero
  CHECK (nro_andariveles > 0);

-- Handicap de equinos mayor que cero
ALTER TABLE equino
  ADD CONSTRAINT equino_handicap_gtzero
  CHECK (handicap > 0);

-- Andarivel de participacion mayor que cero
ALTER TABLE participacion
  ADD CONSTRAINT participacion_andarivel_gtzero
  CHECK (andarivel > 0);

-- Handicap equino de participacion mayor que cero
ALTER TABLE participacion
  ADD CONSTRAINT participacion_handicap_equino_gtzero
  CHECK (handicap_equino > 0);

-- Peso jockey de participacion mayor que cero
ALTER TABLE participacion
  ADD CONSTRAINT participacion_peso_jockey_gtzero
  CHECK (peso_jockey > 0);

-- Talla jockey de participacion mayor que cero
ALTER TABLE participacion
  ADD CONSTRAINT participacion_talla_jockey_gtzero
  CHECK (talla_jockey > 0);

-- Tiempo de participacion mayor que cero
ALTER TABLE participacion
  ADD CONSTRAINT participacion_tiempo_gtzero
  CHECK (tiempo > 0);

-- Peso de jockey mayor que cero
ALTER TABLE jockey
  ADD CONSTRAINT jockey_peso_gtzero
  CHECK (peso > 0);

-- Talla de jockey mayor que cero
ALTER TABLE jockey
  ADD CONSTRAINT jockey_talla_gtzero
  CHECK (talla > 0);

