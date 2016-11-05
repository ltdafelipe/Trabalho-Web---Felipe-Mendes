create database trabweb
default character set utf8
default collate utf8_general_ci;

create table user (
id_usuario tinyint auto_increment primary key,
nome_usuario varchar(100) unique key,
senha varchar(100),
tipo char(1)
);

create table produto(
id_prod integer,
nome varchar (100),
descricao varchar (255),
precoUnitario real,
Primary Key(id_prod)
);

create table vendaProduto(
idVenda integer,
id_prod integer,
qtde double,
valorTotal double,
primary key (idVenda, id_prod),
foreign key (id_prod) references produto (id_prod)
);

insert into user values (1, 'admin', 'admin', 'a');
insert into user values (2, 'user', 'user', 'u');

select * from user;

insert into produto values (1, 'Motorola Moto G4', 'Produto Novo','1300');
insert into produto values (2, 'Motorola Moto G4 Plus', 'Produto Novo','1500');
insert into produto values (3, 'Samsung Galaxy J5', 'Produto Novo','1000');


