-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.7.2
-- PostgreSQL version: 9.4
-- Project Site: pgmodeler.com.br
-- Model Author: ---

SET check_function_bodies = false;
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE new_database;
-- CREATE DATABASE new_database
-- ;
-- -- ddl-end --
-- 

-- object: public.medico | type: TABLE --
-- DROP TABLE public.medico;
CREATE TABLE public.medico(
	"Id_cedula" integer NOT NULL,
	"Nombres" character varying(30) NOT NULL,
	"Especialidad" character varying(30) NOT NULL,
	"Apellidos" character varying(30) NOT NULL,
	telefono integer NOT NULL,
	CONSTRAINT "Id_cedula_claveprimaria" PRIMARY KEY ("Id_cedula")

);
-- ddl-end --
-- object: public."Cita" | type: TABLE --
-- DROP TABLE public."Cita";
CREATE TABLE public."Cita"(
	"Id_codigo" integer NOT NULL,
	"Fecha" date NOT NULL,
	"Hora" time NOT NULL,
	c_paciente character varying(30) NOT NULL,
	c_medico character varying(30) NOT NULL,
	CONSTRAINT "Id_codigo_claveprimaria" PRIMARY KEY ("Id_codigo")

);
-- ddl-end --
-- object: public."Paciente" | type: TABLE --
-- DROP TABLE public."Paciente";
CREATE TABLE public."Paciente"(
	"Id_cedulapaciente" character varying(30) NOT NULL,
	"Nombres" character varying(20) NOT NULL,
	"Telefono" integer NOT NULL,
	"Direccion" character varying(30) NOT NULL,
	"Apellidos" character varying(20) NOT NULL,
	CONSTRAINT "Id_cedula_claveprimaria" PRIMARY KEY ("Id_cedulapaciente")

);
-- ddl-end --
-- object: public."Especialidad" | type: TABLE --
-- DROP TABLE public."Especialidad";
CREATE TABLE public."Especialidad"(
	"Id_especialidad" character varying(30) NOT NULL,
	"Nombre" character varying(30) NOT NULL,
	CONSTRAINT especialidad PRIMARY KEY ("Id_especialidad")

);
-- ddl-end --
-- object: public."Especialidad_medico" | type: TABLE --
-- DROP TABLE public."Especialidad_medico";
CREATE TABLE public."Especialidad_medico"(
	"Id_esp" integer NOT NULL,
	horasinicio time NOT NULL,
	horasfin time NOT NULL,
	cd_identidadmedico character varying(10) NOT NULL,
	CONSTRAINT "Id_especialidad" PRIMARY KEY ("Id_esp")

);
-- ddl-end --
-- object: frc_id_em | type: CONSTRAINT --
-- ALTER TABLE public."Cita" DROP CONSTRAINT frc_id_em;
ALTER TABLE public."Cita" ADD CONSTRAINT frc_id_em FOREIGN KEY ("Id_codigo")
REFERENCES public."Especialidad_medico" ("Id_esp") MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: frc_cd_paciente | type: CONSTRAINT --
-- ALTER TABLE public."Cita" DROP CONSTRAINT frc_cd_paciente;
ALTER TABLE public."Cita" ADD CONSTRAINT frc_cd_paciente FOREIGN KEY (c_paciente)
REFERENCES public."Paciente" ("Id_cedulapaciente") MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: frc_cl_medico | type: CONSTRAINT --
-- ALTER TABLE public."Especialidad_medico" DROP CONSTRAINT frc_cl_medico;
ALTER TABLE public."Especialidad_medico" ADD CONSTRAINT frc_cl_medico FOREIGN KEY (cd_identidadmedico)
REFERENCES public.medico ("Id_cedula") MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: frc_idespecialidad | type: CONSTRAINT --
-- ALTER TABLE public."Especialidad_medico" DROP CONSTRAINT frc_idespecialidad;
ALTER TABLE public."Especialidad_medico" ADD CONSTRAINT frc_idespecialidad FOREIGN KEY ("Id_esp")
REFERENCES public."Especialidad" ("Id_especialidad") MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --



