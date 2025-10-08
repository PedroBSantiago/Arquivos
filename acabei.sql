create database joi;
use joi;

create table ramo(
cd_ramo int,
ds_ramo varchar(50),
constraint PK_ramo primary key (cd_ramo));


create table tipo(
cd_tipo int,
ds_tipo varchar(50),
constraint PK_tipo primary key (cd_tipo));

create table cidade(
cd_cidade int primary key,
ds_cidade varchar(50)
);

create table estado(
cd_estado int primary key,
ds_estado char(2));

create table pais(
cd_pais int primary key,
ds_pais varchar (50)
);

create table municipio(
cd_municipio int,
ds_municipio varchar(50),
constraint PK_municipio primary key (cd_municipio)
);


create table assinante(
cd_assinante int,
nome varchar(50),
cd_ramo int,
cd_tipo int,
constraint PK_assinante primary key (cd_assinante),
constraint FK_assinante1 foreign key (cd_ramo) references ramo (cd_ramo),
constraint FK_assinante2 foreign key (cd_tipo) references tipo (cd_tipo));


create table endereco(
cd_endereco int,
ds_endereco varchar(50),
complemento varchar(50),
bairro varchar(50),
CEP varchar(50),
cd_assinante int,
cd_municipio int,
cd_cidade int,
cd_estado int,
cd_pais int,
constraint PK_endereco primary key (cd_endereco),
constraint FK_end foreign key (cd_assinante) references assinante (cd_assinante),
constraint FK_end2 foreign key (cd_municipio) references municipio (cd_municipio),
constraint FK_cd_cidade foreign key (cd_cidade) references cidade (cd_cidade),
constraint FK_cd_estado foreign key (cd_estado) references estado (cd_estado),
constraint Fk_cd_pais foreign key (cd_pais) references pais (cd_pais)
);


create table telefone(
cd_fone int,
ddd varchar(3),
n_fone varchar(10),
cd_endereco int,
constraint PK_telefone primary key (cd_fone),
constraint FK_fone foreign key (cd_endereco) references endereco (cd_endereco));



insert into tipo values (1, 'PREMIUM');
insert into tipo values (2, 'BÁSICO');
insert into tipo values (3, 'GRÁTIS');
insert into tipo values (4, 'RESIDENCIAL');

insert into RAMO values (1, 'INFORMÁTICA');
insert into RAMO values (2, 'MEDICINA');
insert into RAMO values (3, 'COMÉRCIO');
insert into RAMO values (4, 'YOUTUBER');
insert into RAMO values (5, 'PEDREIRO');
insert into RAMO values (6, 'ARQUITETO');
insert into RAMO values (7, 'PROGRAMADOR');

insert into MUNICIPIO values (1, 'JOÃO CÂMARA');
insert into MUNICIPIO values (2, 'CEARA MIRIM');
insert into MUNICIPIO values (3, 'TOUROS');
insert into MUNICIPIO values (4, 'SÃO MIGUEL');
insert into MUNICIPIO values (5, 'PELOTAS');
insert into MUNICIPIO values (6, 'SÃO PAULO');
insert into MUNICIPIO values (7, 'JOOP SILVA');

insert into cidade values(1,'Mongagua');
insert into cidade values(2,'Praia Grande');
insert into cidade values(3,'Carlinhos Maia');
insert into cidade values(4,'São Paulo');
insert into cidade values(5,'itanhaem');
insert into cidade values(6,'Novo Mirim');
insert into cidade values(7,'Santos');

insert into estado values(1,'SP');
insert into estado values(2,'MG');
insert into estado values(3,'MA');
insert into estado values(4,'MT');
insert into estado values(5,'RJ');
insert into estado values(6,'PA');
insert into estado values(7,'PR');

insert INTO pais values(1,'Brazil');
insert INTO pais values(2,'EUA');
insert INTO pais values(3,'CANADA');
insert INTO pais values(4,'ARGENTINA');
insert INTO pais values(5,'CRISTOVÃO');
insert INTO pais values(6,'EUROPA');
insert INTO pais values(7,'ITALIA');

INSERT INTO ASSINANTE VALUES (1, 'JOÃO', 1, 2);	
INSERT INTO ASSINANTE VALUES (2, 'JOSÉ', 2, 1);	
INSERT INTO ASSINANTE VALUES (3, 'MARIA', 2, 3);	
INSERT INTO ASSINANTE VALUES (4, 'MARIA BETÂNIA', 3, 3);	
INSERT INTO ASSINANTE VALUES (5, 'JOANA', 4, 4);	
INSERT INTO ASSINANTE VALUES (6, 'CARLOS', 5, 1);	
INSERT INTO ASSINANTE VALUES (7, 'PEDRO', 6, 4);	
INSERT INTO ASSINANTE VALUES (8, 'JOTA', 7, 2);	

INSERT INTO ENDERECO VALUES (1, 'RUA JORGE AMARAL', 'APTO 201', 'ITAOCA', '11730-000', 1, 7,1,1,1);
INSERT INTO ENDERECO VALUES (2, 'RUA BLOCO DA PENHA', '172','CAMPOS', '18429-000', 2, 1,2,2,2);
INSERT INTO ENDERECO VALUES (7, 'RUA BLOCO DA PENHA', '423', 'AGENOR','24237-080', 3, 2,3,3,3);
INSERT INTO ENDERECO VALUES (3, 'RUA PEDROSA LEITE', 'APTO 1021', 'SANTA AMARAL', '88964-000', 4, 3,4,4,4);
INSERT INTO ENDERECO VALUES (4, 'RUA JOSÉ CARLOS', 'APTO 1101', 'SANTA AMARAL', '19709-030', 5, 5,5,5,5);
INSERT INTO ENDERECO VALUES (5, 'RUA JORGE AMARAL', 'APTO 1321', 'CENTRO', '24909-090', 6, 4,6,6,6);
INSERT INTO ENDERECO VALUES (6, 'CARLINHOS MAIA', 'APTO 1532', 'CENTRO', '42999-010', 8, 6,7,7,7);

INSERT INTO TELEFONE VALUES (1, '13', '99120-4891', 1);
INSERT INTO TELEFONE VALUES (2, '11', '97324-6770', 5);
INSERT INTO TELEFONE VALUES (3, '15', '98109-9782', 6);
INSERT INTO TELEFONE VALUES (4, '12', '91841-0879', 2);
INSERT INTO TELEFONE VALUES (5, '11', '92141-0819', 3);
INSERT INTO TELEFONE VALUES (6, '17', '91021-0279', 4);
insert into telefone values (7, '14', '98718-2288',4);


create view vv_d_assinante
as
select a.nome as assinante,concat('(',t.ddd,')',t.n_fone) as telefone,r.ds_ramo as 'nome do ramo',tp.ds_tipo as 'tipo instalação', concat(e.ds_endereco,',', e.complemento, ',', e.cd_municipio,',',e.cd_cidade,',',e.cd_estado,',',e.cd_pais)
 from assinante a inner join tipo tp on tp.cd_tipo = a.cd_tipo
inner join endereco e on a.cd_assinante = e.cd_assinante
inner join municipio m on e.cd_municipio = m.cd_municipio
inner join cidade c  on e.cd_cidade = c.cd_cidade
inner join estado es on e.cd_estado = es.cd_estado
inner join pais p on e.cd_pais = p.cd_pais
inner join telefone t on e.cd_endereco = t.cd_endereco
inner join ramo r on a.cd_ramo = r.cd_ramo;








