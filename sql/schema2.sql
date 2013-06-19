-- Separacion de Tabla Jockey
ALTER TABLE jockey DROP CONSTRAINT fk_jockey_persona;

ALTER TABLE jockey ADD nombres varchar NOT NULL;

ALTER TABLE jockey ADD apellidos varchar NOT NULL;

UPDATE jockey SET nombres = (SELECT nombres FROM persona WHERE persona.dni = jockey.persona_dni);

UPDATE jockey SET apellidos = (SELECT apellidos FROM persona WHERE persona.dni = jockey.persona_dni);

DELETE FROM persona WHERE EXISTS(SELECT * FROM JOCKEY WHERE JOCKEY.persona_dni = persona.dni);

ALTER TABLE jockey RENAME COLUMN persona_dni TO dni;

ALTER TABLE participacion RENAME COLUMN jockey_persona_dni TO jockey_dni;

-- Agregado de campo posicion en la participacion
ALTER TABLE participacion ADD posicion integer;

-- Agregado de tabla de premios por posicion
CREATE TABLE premio (
  carrera_numero integer NOT NULL,
  carrera_encuentro_numero integer NOT NULL,
  posicion integer NOT NULL,
  monto decimal NOT NULL
);

ALTER TABLE premio 
  ADD CONSTRAINT pk_premio
  PRIMARY KEY(carrera_numero, carrera_encuentro_numero, posicion);

ALTER TABLE premio
  ADD CONSTRAINT fk_premio_carrera
  FOREIGN KEY (carrera_numero, carrera_encuentro_numero)
  REFERENCES carrera(numero, encuentro_numero);

-- Agregado de campo a Tabla Cuidador
ALTER TABLE cuidador ADD sueldo decimal NOT NULL;

ALTER TABLE cuidador
  ADD CONSTRAINT cuidador_sueldo_gtzero
  CHECK (sueldo > 0);

-- Agregado de campos a Tabla Entrenador
ALTER TABLE entrenador ADD sueldo decimal NOT NULL;

ALTER TABLE entrenador ADD fecha_baja date;

ALTER TABLE entrenador
  ADD CONSTRAINT entrenador_sueldo_gtzero
  CHECK (sueldo > 0);

-- Creacion de nueva tabla Accionista
CREATE TABLE accionista (
	persona_dni integer NOT NULL,
    contribucion_fija decimal NOT NULL,
    porcentaje_participacion decimal NOT NULL
);

ALTER TABLE accionista
    ADD CONSTRAINT pk_accionista
    PRIMARY KEY (persona_dni);

ALTER TABLE accionista
    ADD CONSTRAINT fk_accionista_persona
    FOREIGN KEY (persona_dni)
    REFERENCES persona(dni);

ALTER TABLE accionista
  ADD CONSTRAINT porcentaje_participacion_gtzero
  CHECK (porcentaje_participacion > 0);

ALTER TABLE accionista
  ADD CONSTRAINT porcentaje_participacion_lthundred
  CHECK (porcentaje_participacion <= 100);

-- Agregado de FK a hipodromo en el equino    
ALTER TABLE equino add hipodromo_nombre_aloja varchar NOT NULL;

ALTER TABLE equino
    ADD CONSTRAINT fk_equino_hipodromo
    FOREIGN KEY (hipodromo_nombre_aloja)
    REFERENCES hipodromo(nombre);

-- Creacion de nueva tabla apuesta
CREATE TABLE apuesta (
    jockey_dni integer NOT NULL,
    equino_nombre varchar NOT NULL,
    carrera_numero integer NOT NULL,
    carrera_encuentro_numero integer NOT NULL,
	numero integer NOT NULL,
    monto decimal NOT NULL
);

ALTER TABLE apuesta
    ADD CONSTRAINT pk_apuesta PRIMARY
    KEY (jockey_dni, equino_nombre, carrera_numero, carrera_encuentro_numero, numero);

ALTER TABLE apuesta
  ADD CONSTRAINT monto_apuesta_gtzero
  CHECK (monto > 0);
  
ALTER TABLE apuesta
    ADD CONSTRAINT fk_apuesta_carrera
    FOREIGN KEY (carrera_numero, carrera_encuentro_numero)
    REFERENCES carrera(numero, encuentro_numero);

ALTER TABLE  apuesta
    ADD CONSTRAINT fk_apuesta_equino
    FOREIGN KEY (equino_nombre)
    REFERENCES equino(nombre);

ALTER TABLE apuesta
    ADD CONSTRAINT fk_apuesta_jockey
    FOREIGN KEY (jockey_dni)
    REFERENCES jockey(dni);
	
-- Creacion de nueva tabla movimiento	
CREATE TABLE movimiento (
    stud_nombre varchar NOT NULL,
    numero integer NOT NULL,
	concepto varchar NOT NULL,
    fecha date NOT NULL,     	
    monto decimal NOT NULL
);

ALTER TABLE movimiento
    ADD CONSTRAINT fk_movimiento_stud
    FOREIGN KEY (stud_nombre)
    REFERENCES stud(nombre);

ALTER TABLE movimiento
    ADD CONSTRAINT pk_movimiento
    PRIMARY KEY (stud_nombre, numero);

-- Creacion de nueva tabla contratacion
CREATE TABLE contratacion (
    jockey_dni integer NOT NULL,
    stud_nombre varchar NOT NULL,
	honorario_fijo decimal NOT NULL,
	porcentaje_premio decimal NOT NULL
);

ALTER TABLE contratacion
    ADD CONSTRAINT fk_contratacion_stud
    FOREIGN KEY (stud_nombre)
    REFERENCES stud(nombre);

ALTER TABLE contratacion
    ADD CONSTRAINT fk_contratacion_jockey
    FOREIGN KEY (jockey_dni)
    REFERENCES jockey(dni);

ALTER TABLE contratacion
    ADD CONSTRAINT pk_contratacion
    PRIMARY KEY (stud_nombre, jockey_dni);

ALTER TABLE contratacion
  ADD CONSTRAINT porcentaje_premio_gtzero
  CHECK (porcentaje_premio > 0);

ALTER TABLE contratacion
  ADD CONSTRAINT porcentaje_premio_lthundred
  CHECK (porcentaje_premio <= 100);

ALTER TABLE contratacion
  ADD CONSTRAINT honorario_fijo_gtzero
  CHECK (honorario_fijo > 0);	
