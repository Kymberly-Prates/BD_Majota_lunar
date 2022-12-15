
create database Db_majora;
use Db_majora;


create table usuario(
id_usuario int not null unique auto_increment,
nome_usuario varchar (60) not null,
email_usuario varchar (50) not null unique,
senha_usuario  varchar (10) not null, 
primary key (id_usuario)
);

create table endereco (
id_endereco int not null unique auto_increment,
bairro varchar (60) not null,
cep varchar (30) not null,
logradouro varchar (60) not null,
numero varchar (15) not null,
complemento varchar (60),
cidade varchar (60) not null,
uf char (2) not null,
primary key (id_endereco)
);


create table telefone (
id_telefone int not null unique auto_increment,
fixo varchar(20),
celular1 varchar(20) unique,
celular2 varchar(20) unique,
primary key (id_telefone)
);

create table categoria (
id_categoria int not null unique auto_increment,
categoria varchar(30) not null,
primary key (id_categoria)
);

create table subcategoria (
id_categoria int not null,
id_subcategoria int not null unique auto_increment,
subcategoria1 varchar(30) not null,
primary key (id_subcategoria)
);
 

 create table loja_cliente (
 id_loja_cliente int not null unique auto_increment,
 visita int,
 nome_loja varchar (90) not null,
 foto_capa blob,
 instagram varchar (30),
 facebook varchar (30),
 whatsapp varchar (30),
 primary key (id_loja_cliente)
 );
 
 create table vendedor (
id_vendedor int not null unique auto_increment,
id_endereco int not null unique,
id_telefone int not null unique,
id_categoria int not null unique,
id_subcategoria int not null unique,
id_usuario int not null unique,
primary key(id_vendedor)
 );

alter table `vendedor` add constraint `fk_id_subcategoria` foreign key (`id_subcategoria`)  references `subcategoria`(`id_subcategoria`);
alter table `vendedor` add constraint `fk_id_categoria` foreign key (`id_categoria`)  references `categoria`(`id_categoria`);
alter table `vendedor` add constraint `fk_id_endereco` foreign key (`id_endereco`)  references `endereco`(`id_endereco`);
alter table `vendedor` add constraint `fk_id_telefone` foreign key (`id_telefone`)  references `telefone`(`id_telefone`);
alter table `vendedor` add constraint `fk_id_usuario` foreign key (`id_usuario`) references `usuario`(`id_usuario`);
alter table `vendedor` add constraint `fk_id_categoria_subcategoria` foreign key (`id_categoria`)  references `categoria`(`id_categoria`);
