/*insercion corta*/
insert into cliente values (1,'Jose','Pichincha','correo@gmail.com');
select * from cliente;
/*insercion larga*/
insert into cliente (id_cliente,nombre_cliente,estado,correo)values(2,'Juan','Guayas','correo2@gmail.com');
/*insercion masiva*/
insert into cliente values (generate_series(3,10),
							'Pedro'||generate_series(3,10),
							 'Imbabura'|| generate_series(3,10),
				            'mfr@gmail.com'|| generate_series(3,10));

select * from articulos;
insert into articulos values (generate_series(1,10),
							 'articulo'||generate_series(1,10),
							 2 * generate_series(1,10));

alter table articulos alter precio set data type numeric(10,2);

select * from ordenes;
insert into ordenes values (1,1,'27/10/2021');
insert into ordenes values (generate_series(2,3),
							 2,
							 generate_series('2031-03-01 00:00'::timestamp, '2088-03-04 12:00','2 days'));
							 
select * from detalle_orden;
insert into detalle_orden values (1,5,1,8);

/*eliminacion fisica de datos*/
delete from cliente where id_cliente=10;

