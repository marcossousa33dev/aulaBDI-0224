#criar a nova base
create database empresa2;

#selecionar a base de dados
use empresa2;

#criar a tabela categoria
create table categoria(
	id int primary key,
    descricao varchar(15)
);

#criar a tabla unidmedida
create table unidmedida(
	id int primary key,
    descricao char(02)
);

#criar a tabela de produtos
create table produtos(
	codigo int primary key,
    descricao varchar(30),
    idcategoria int,
    est_minimo int,
    est_maximo int,
    tp_montadora int,
    tp_reposicao int,
    tp_exportacao int,
    unid_medida int,
    foreign key (idcategoria) references categoria(id),
    foreign key (unid_medida) references unidmedida(id)
);

#INSERIR DADOS NA TABELA UNIDADE DE MEDIDA
insert into unidmedida (id, descricao) values (1, 'Pç');
insert into unidmedida (id, descricao) values (2, 'Kg');
insert into unidmedida (id, descricao) values (3, 'Cj');
insert into unidmedida (id, descricao) values (4, 'Lt');

select * from unidmedida;

#INSERIR DADOS NA TABELA CATEGORIA
insert into categoria(id, descricao) values(1, 'Forjado');
insert into categoria(id, descricao) values(2, 'Usinado');
insert into categoria(id, descricao) values(3, 'Fundido');

#Bônus do Marcão
insert into categoria values(4, 'Semi Usinado');

select * from categoria;

#INSERIR DADOS NA TABELA DE PRODUTOS
insert into produtos values(1, 'Volante',1, 0, 10, 0, 0, 1, 1);

insert into produtos values(2, 'Parafuso',1, 0, 80, 1, 0, 1, 4);

insert into produtos values(3, 'Rebimboca da Parafuseta',2, 0, 80, 1, 0, 1, 3);

select codigo, descricao, idcategoria, est_minimo
from produtos;

select * from categoria
where id = 1;

#MALANDRAGEM 1
select codigo, produtos.descricao, 
categoria.descricao, idcategoria, 
est_minimo
from produtos, categoria
where idcategoria = id;

#MALANDRAGEM 2
select codigo, produtos.descricao, 
categoria.descricao as categoria, 
est_minimo, concat(unid_medida, ' - ', unidmedida.descricao) as unidade
from produtos, categoria, unidmedida
where idcategoria = categoria.id
  and unid_medida = unidmedida.id;
