--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-04-25 03:09:55 ART

SET statement_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1974 (class 1262 OID 16384)
-- Name: hiposoft; Type: DATABASE; Schema: -; Owner: hiposoft
--

CREATE DATABASE hiposoft WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE hiposoft OWNER TO hiposoft;

\connect hiposoft

SET statement_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 172 (class 3079 OID 11681)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1977 (class 0 OID 0)
-- Dependencies: 172
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 164 (class 1259 OID 16414)
-- Dependencies: 5
-- Name: carrera; Type: TABLE; Schema: public; Owner: hiposoft; Tablespace: 
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


ALTER TABLE public.carrera OWNER TO hiposoft;

--
-- TOC entry 169 (class 1259 OID 16558)
-- Dependencies: 5
-- Name: cuidador; Type: TABLE; Schema: public; Owner: hiposoft; Tablespace: 
--

CREATE TABLE cuidador (
    persona_dni integer NOT NULL
);


ALTER TABLE public.cuidador OWNER TO hiposoft;

--
-- TOC entry 162 (class 1259 OID 16394)
-- Dependencies: 5
-- Name: encuentro; Type: TABLE; Schema: public; Owner: hiposoft; Tablespace: 
--

CREATE TABLE encuentro (
    numero integer NOT NULL,
    hipodromo_nombre character varying(50)[] NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE public.encuentro OWNER TO hiposoft;

--
-- TOC entry 170 (class 1259 OID 16568)
-- Dependencies: 5
-- Name: entrenador; Type: TABLE; Schema: public; Owner: hiposoft; Tablespace: 
--

CREATE TABLE entrenador (
    persona_dni integer NOT NULL
);


ALTER TABLE public.entrenador OWNER TO hiposoft;

--
-- TOC entry 167 (class 1259 OID 16436)
-- Dependencies: 5
-- Name: equino; Type: TABLE; Schema: public; Owner: hiposoft; Tablespace: 
--

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


ALTER TABLE public.equino OWNER TO hiposoft;

--
-- TOC entry 161 (class 1259 OID 16386)
-- Dependencies: 5
-- Name: hipodromo; Type: TABLE; Schema: public; Owner: hiposoft; Tablespace: 
--

CREATE TABLE hipodromo (
    nombre character varying(50)[] NOT NULL,
    direccion character varying(100)[]
);


ALTER TABLE public.hipodromo OWNER TO hiposoft;

--
-- TOC entry 166 (class 1259 OID 16430)
-- Dependencies: 5
-- Name: jockey; Type: TABLE; Schema: public; Owner: hiposoft; Tablespace: 
--

CREATE TABLE jockey (
    talla double precision,
    peso double precision,
    categoria character varying(50)[],
    persona_dni integer NOT NULL
);


ALTER TABLE public.jockey OWNER TO hiposoft;

--
-- TOC entry 171 (class 1259 OID 16659)
-- Dependencies: 5
-- Name: participacion; Type: TABLE; Schema: public; Owner: hiposoft; Tablespace: 
--

CREATE TABLE participacion (
    jockey_dni integer NOT NULL,
    equino_nombre character varying(50)[] NOT NULL,
    carrera_numero integer NOT NULL,
    carrera_encuentro_numero integer NOT NULL,
    tiempo integer,
    andarivel integer,
    peso double precision
);


ALTER TABLE public.participacion OWNER TO hiposoft;

--
-- TOC entry 165 (class 1259 OID 16422)
-- Dependencies: 5
-- Name: persona; Type: TABLE; Schema: public; Owner: hiposoft; Tablespace: 
--

CREATE TABLE persona (
    dni integer NOT NULL,
    nombres character varying(200)[],
    apellidos character varying(100)[]
);


ALTER TABLE public.persona OWNER TO hiposoft;

--
-- TOC entry 163 (class 1259 OID 16402)
-- Dependencies: 5
-- Name: pista; Type: TABLE; Schema: public; Owner: hiposoft; Tablespace: 
--

CREATE TABLE pista (
    nombre character varying(50)[] NOT NULL,
    nro_andariveles integer,
    hipodromo_nombre character varying(50)[] NOT NULL,
    tipo character varying(50)[]
);


ALTER TABLE public.pista OWNER TO hiposoft;

--
-- TOC entry 168 (class 1259 OID 16445)
-- Dependencies: 5
-- Name: stud; Type: TABLE; Schema: public; Owner: hiposoft; Tablespace: 
--

CREATE TABLE stud (
    nombre character varying(50)[] NOT NULL,
    color_gorra character varying(50)[],
    color_chaqueta character varying(50)[]
);


ALTER TABLE public.stud OWNER TO hiposoft;

--
-- TOC entry 1942 (class 2606 OID 16608)
-- Dependencies: 164 164 164 1971
-- Name: pk_carrera; Type: CONSTRAINT; Schema: public; Owner: hiposoft; Tablespace: 
--

ALTER TABLE ONLY carrera
    ADD CONSTRAINT pk_carrera PRIMARY KEY (numero, encuentro_numero);


--
-- TOC entry 1952 (class 2606 OID 16562)
-- Dependencies: 169 169 1971
-- Name: pk_cuidador; Type: CONSTRAINT; Schema: public; Owner: hiposoft; Tablespace: 
--

ALTER TABLE ONLY cuidador
    ADD CONSTRAINT pk_cuidador PRIMARY KEY (persona_dni);


--
-- TOC entry 1938 (class 2606 OID 16401)
-- Dependencies: 162 162 1971
-- Name: pk_encuentro; Type: CONSTRAINT; Schema: public; Owner: hiposoft; Tablespace: 
--

ALTER TABLE ONLY encuentro
    ADD CONSTRAINT pk_encuentro PRIMARY KEY (numero);


--
-- TOC entry 1954 (class 2606 OID 16572)
-- Dependencies: 170 170 1971
-- Name: pk_entrenador; Type: CONSTRAINT; Schema: public; Owner: hiposoft; Tablespace: 
--

ALTER TABLE ONLY entrenador
    ADD CONSTRAINT pk_entrenador PRIMARY KEY (persona_dni);


--
-- TOC entry 1948 (class 2606 OID 16444)
-- Dependencies: 167 167 1971
-- Name: pk_equino; Type: CONSTRAINT; Schema: public; Owner: hiposoft; Tablespace: 
--

ALTER TABLE ONLY equino
    ADD CONSTRAINT pk_equino PRIMARY KEY (nombre);


--
-- TOC entry 1936 (class 2606 OID 16393)
-- Dependencies: 161 161 1971
-- Name: pk_hipodromo; Type: CONSTRAINT; Schema: public; Owner: hiposoft; Tablespace: 
--

ALTER TABLE ONLY hipodromo
    ADD CONSTRAINT pk_hipodromo PRIMARY KEY (nombre);


--
-- TOC entry 1946 (class 2606 OID 16552)
-- Dependencies: 166 166 1971
-- Name: pk_jockey; Type: CONSTRAINT; Schema: public; Owner: hiposoft; Tablespace: 
--

ALTER TABLE ONLY jockey
    ADD CONSTRAINT pk_jockey PRIMARY KEY (persona_dni);


--
-- TOC entry 1956 (class 2606 OID 16666)
-- Dependencies: 171 171 171 171 171 1971
-- Name: pk_participacion; Type: CONSTRAINT; Schema: public; Owner: hiposoft; Tablespace: 
--

ALTER TABLE ONLY participacion
    ADD CONSTRAINT pk_participacion PRIMARY KEY (jockey_dni, equino_nombre, carrera_numero, carrera_encuentro_numero);


--
-- TOC entry 1944 (class 2606 OID 16429)
-- Dependencies: 165 165 1971
-- Name: pk_persona; Type: CONSTRAINT; Schema: public; Owner: hiposoft; Tablespace: 
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT pk_persona PRIMARY KEY (dni);


--
-- TOC entry 1940 (class 2606 OID 16596)
-- Dependencies: 163 163 163 1971
-- Name: pk_pista; Type: CONSTRAINT; Schema: public; Owner: hiposoft; Tablespace: 
--

ALTER TABLE ONLY pista
    ADD CONSTRAINT pk_pista PRIMARY KEY (nombre, hipodromo_nombre);


--
-- TOC entry 1950 (class 2606 OID 16452)
-- Dependencies: 168 168 1971
-- Name: pk_stud; Type: CONSTRAINT; Schema: public; Owner: hiposoft; Tablespace: 
--

ALTER TABLE ONLY stud
    ADD CONSTRAINT pk_stud PRIMARY KEY (nombre);


--
-- TOC entry 1959 (class 2606 OID 16619)
-- Dependencies: 164 162 1937 1971
-- Name: fk_carrera_encuentro; Type: FK CONSTRAINT; Schema: public; Owner: hiposoft
--

ALTER TABLE ONLY carrera
    ADD CONSTRAINT fk_carrera_encuentro FOREIGN KEY (encuentro_numero) REFERENCES encuentro(numero);


--
-- TOC entry 1960 (class 2606 OID 16624)
-- Dependencies: 163 163 1939 164 164 1971
-- Name: fk_carrera_pista; Type: FK CONSTRAINT; Schema: public; Owner: hiposoft
--

ALTER TABLE ONLY carrera
    ADD CONSTRAINT fk_carrera_pista FOREIGN KEY (pista_nombre, pista_hipodromo_nombre) REFERENCES pista(nombre, hipodromo_nombre);


--
-- TOC entry 1965 (class 2606 OID 16563)
-- Dependencies: 169 1943 165 1971
-- Name: fk_cuidador_persona; Type: FK CONSTRAINT; Schema: public; Owner: hiposoft
--

ALTER TABLE ONLY cuidador
    ADD CONSTRAINT fk_cuidador_persona FOREIGN KEY (persona_dni) REFERENCES persona(dni);


--
-- TOC entry 1957 (class 2606 OID 16602)
-- Dependencies: 162 1935 161 1971
-- Name: fk_encuentro_hipodromo; Type: FK CONSTRAINT; Schema: public; Owner: hiposoft
--

ALTER TABLE ONLY encuentro
    ADD CONSTRAINT fk_encuentro_hipodromo FOREIGN KEY (hipodromo_nombre) REFERENCES hipodromo(nombre);


--
-- TOC entry 1966 (class 2606 OID 16573)
-- Dependencies: 170 165 1943 1971
-- Name: fk_entrenador_persona; Type: FK CONSTRAINT; Schema: public; Owner: hiposoft
--

ALTER TABLE ONLY entrenador
    ADD CONSTRAINT fk_entrenador_persona FOREIGN KEY (persona_dni) REFERENCES persona(dni);


--
-- TOC entry 1962 (class 2606 OID 16644)
-- Dependencies: 167 169 1951 1971
-- Name: fk_equino_cuidador; Type: FK CONSTRAINT; Schema: public; Owner: hiposoft
--

ALTER TABLE ONLY equino
    ADD CONSTRAINT fk_equino_cuidador FOREIGN KEY (cuidador_dni) REFERENCES cuidador(persona_dni);


--
-- TOC entry 1963 (class 2606 OID 16649)
-- Dependencies: 167 170 1953 1971
-- Name: fk_equino_entrenador; Type: FK CONSTRAINT; Schema: public; Owner: hiposoft
--

ALTER TABLE ONLY equino
    ADD CONSTRAINT fk_equino_entrenador FOREIGN KEY (entrenador_dni) REFERENCES entrenador(persona_dni);


--
-- TOC entry 1964 (class 2606 OID 16654)
-- Dependencies: 167 1949 168 1971
-- Name: fk_equino_stud; Type: FK CONSTRAINT; Schema: public; Owner: hiposoft
--

ALTER TABLE ONLY equino
    ADD CONSTRAINT fk_equino_stud FOREIGN KEY (stud_nombre) REFERENCES stud(nombre);


--
-- TOC entry 1961 (class 2606 OID 16553)
-- Dependencies: 166 1943 165 1971
-- Name: fk_jockey_persona; Type: FK CONSTRAINT; Schema: public; Owner: hiposoft
--

ALTER TABLE ONLY jockey
    ADD CONSTRAINT fk_jockey_persona FOREIGN KEY (persona_dni) REFERENCES persona(dni);


--
-- TOC entry 1969 (class 2606 OID 16677)
-- Dependencies: 171 1941 164 164 171 1971
-- Name: fk_participacion_carrera; Type: FK CONSTRAINT; Schema: public; Owner: hiposoft
--

ALTER TABLE ONLY participacion
    ADD CONSTRAINT fk_participacion_carrera FOREIGN KEY (carrera_numero, carrera_encuentro_numero) REFERENCES carrera(numero, encuentro_numero);


--
-- TOC entry 1968 (class 2606 OID 16672)
-- Dependencies: 167 1947 171 1971
-- Name: fk_participacion_equino; Type: FK CONSTRAINT; Schema: public; Owner: hiposoft
--

ALTER TABLE ONLY participacion
    ADD CONSTRAINT fk_participacion_equino FOREIGN KEY (equino_nombre) REFERENCES equino(nombre);


--
-- TOC entry 1967 (class 2606 OID 16667)
-- Dependencies: 171 1945 166 1971
-- Name: fk_participacion_jockey; Type: FK CONSTRAINT; Schema: public; Owner: hiposoft
--

ALTER TABLE ONLY participacion
    ADD CONSTRAINT fk_participacion_jockey FOREIGN KEY (jockey_dni) REFERENCES jockey(persona_dni);


--
-- TOC entry 1958 (class 2606 OID 16682)
-- Dependencies: 163 161 1935 1971
-- Name: fk_pista_hipodromo; Type: FK CONSTRAINT; Schema: public; Owner: hiposoft
--

ALTER TABLE ONLY pista
    ADD CONSTRAINT fk_pista_hipodromo FOREIGN KEY (hipodromo_nombre) REFERENCES hipodromo(nombre);


--
-- TOC entry 1976 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-04-25 03:09:55 ART

--
-- PostgreSQL database dump complete
--

