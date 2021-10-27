/*crear tablas*/
create table paciente(id_cedula varchar(30) not null,
					 nombres varchar(20) not null,
					 telefono integer not null,
					 direccion varchar(30) not null,
					 apellidos varchar(30) not null,
					 primary key (id_cedula));

create table cita(id_codigo integer not null,
				  fecha date not null,
				  hora time not null,
				  cd_paciente varchar(30) not null,
				  cd_medico varchar(30) not null,
				  primary key (id_codigo));

alter table cita add foreign key(id_codigo)references especialidad_medico(id_esp);
alter table cita add foreign key(cd_paciente) references paciente (id_cedula);


create table medico(id_cedulamedico varchar(30) not null,
				   nombres varchar(30) not null,
				   especialidad varchar(30) not null,
				   apellidos varchar(30) not null,
				   telefono integer not null,
				   primary key (id_cedulamedico));

create table especialidad_medico(id_esp integer not null,
								 hora_inicio time not null,
								 hora_fin time not null,
								 cd_identidadmedico varchar(20),
								 primary key (id_esp));
								 
alter table especialidad_medico add foreign key(cd_identidadmedico)references medico (id_cedulamedico);
alter table especialidad_medico add foreign key (id_esp) references especialidad (id_especialidad);
								 
alter table especialidad_medico drop cd_identidadmedico;
alter table especialidad_medico add column cd_identidadmedico varchar(20) not null;

create table especialidad(id_especialidad varchar(30) not null,
						  nombre varchar(30)not null,
						  primary key (id_especialidad));
						  
alter table especialidad drop id_especialidad;
alter table especialidad add column id_especialidad integer not null;
alter table especialidad add primary key (id_especialidad);

