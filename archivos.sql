/*Creacion de datos base*/
create database prueba;

/*Creacion de las tablas*/
create table cliente(id_cliente integer not null,
					 nombre_cliente varchar(30)not null,
					 estado varchar(20) not null,
					 primary key (id_cliente));
alter table cliente add correo varchar(30) not null;
					 
create table articulos(num_art integer not null,
					   nom_art varchar(30) not null,
					   precio decimal(3,2) not null,
					   primary key (num_art));
					   
create table ordenes(id_orden integer not null,
					 fecha date not null,
					 id_cliente integer not null,
					 primary key (id_orden));
					 
alter table ordenes drop fecha;

alter table ordenes add column fecha date not null;

alter table ordenes add foreign key(id_cliente)references cliente (id_cliente);

create table detalle_orden(id_detalle integer not null,
						   cant integer not null,
						   id_orden integer not null,
						   num_art integer not null,
						   primary key(id_detalle));

alter table detalle_orden add foreign key(id_orden)references ordenes(id_orden);
alter table detalle_orden add foreign key (num_art) references articulos(num_art);


