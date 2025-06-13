-- Este es un cambio


--- asjabsjd ajdaj sd
create database TiendaModerna;
use TiendaModerna;

create table Cat_Empleados(
id_emp smallint identity primary key,
nom_emp varchar (30) not null,
apa_emp varchar (30) not null,
ama_emp varchar (30) not null,
sexo_emp varchar (1) not null,
fecha_nac_emp date not null,
);

create table Categoria(
id_categoria smallint identity primary key,
nombre_categoria varchar (30) not null
);

create table Presentacion(
id_presentacion smallint identity primary key,
nombre_presentacion varchar (30) not null
);

create table Cat_Productos(
id_producto smallint identity primary key,
nom_prod varchar (50) not null,
cantidad_producto int not null,
id_cat_pro smallint not null,
id_pre_pro smallint not null,
disponible_promo bit not null,

constraint "fk_categoria" foreign key (id_cat_pro) references Categoria(id_categoria),
constraint "fk_presentacion" foreign key (id_pre_pro) references Presentacion(id_presentacion)
);

alter table cat_Productos add disponible_promo bit not null;

create table cat_Clientes(
id_cli smallint identity primary key,
nom_cli varchar (30) not null,
email_cli varchar (50) not null,
tel_cli varchar (10) not null
);


create table cat_Proveedores(
id_pro smallint identity primary key,
nom_pro varchar (30) not null,
tel_pro varchar (10) not null,
email_pro varchar (50) not null
);

create table ingreso (
id_ingreso smallint identity primary key,
id_emp_ing smallint not null,
id_pro_ing smallint not null,
fecha_ing date not null,

constraint "fk_empleado" foreign key (id_emp_ing) references Cat_Empleados(id_emp),
constraint "fk_proveedor" foreign key (id_pro_ing) references Cat_Proveedores(id_pro)
);

create table Detalle_Ingreso(
id_detalle_ing smallint identity primary key,
id_ingreso_det smallint not null,
id_prod_ing_det smallint not null,
precio_compra decimal (8,2) not null,
precio_venta decimal (8,2) not null,
stok_inicial int not null,
stok_actual int not null,
fecha_venta date not null,
fecha_cad date not null,

constraint "fk_ingreso" foreign key (id_ingreso_det) references ingreso(id_ingreso),
constraint "fk_producto" foreign key (id_prod_ing_det) references Cat_Productos(id_producto)

);

drop table Detalle_Ingreso

create table Ventas(
id_ventas smallint identity primary key,
id_cliente_venta smallint not null,
id_empleado_venta smallint not null,
fecha_venta date not null,

constraint "fk_cliente" foreign key (id_cliente_venta) references cat_Clientes(id_cli)
);

create table detalle_ventas(
id_det_venta smallint identity primary key,
id_venta smallint not null,
id_emp_det smallint not null,
cantidad int not null,
desc_promo decimal (3,2) not null,

constraint "fk_venta" foreign key (id_venta) references Ventas(id_ventas),
constraint "fk_empleado_det" foreign key (id_emp_det) references Cat_Empleados(id_emp)

);


create table corte_caja(
id_corte smallint identity primary key,
total_ventas decimal (10,2) not null, 
egresos decimal (10,2) not null,
fecha_corte date not null,
saldo_inicial decimal (10,2) not null,
saldo_final decimal (10,2) not null
);
