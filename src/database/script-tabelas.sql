-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/* para workbench - local - desenvolvimento */
create database Icelog;

use Icelog;

create table Empresa (
idEmpresa int primary key auto_increment,
cnpj varchar(14) not null,
nomeEmpresa varchar(100) not null,
emailEmpresa varchar(100) not null,
cepEmpresa varchar(8) not null,
numero varchar(10) not null,
senha varchar(100) not null
);

create table Caminhao (
idCaminhao int primary key auto_increment,
marca varchar(45),
nomeCaminhao varchar(45),
placa char(7),
fkEmpresa int,
foreign key (fkEmpresa) references Empresa(idEmpresa)
);

create table Sensor (
idSensor int primary key auto_increment,
tipo varchar(20), constraint chkTipo check (tipo in ('temperatura')),
codigo int,
dtInstalacao datetime default current_timestamp,
fkCaminhao int,
foreign key (fkCaminhao) references Caminhao(idCaminhao)
);

create table Dados (
idDados int,
dtH datetime default current_timestamp,
temperatura double,
fkSensor int,
foreign key (fkSensor) references Sensor(idSensor),
primary key (fkSensor, idDados)
);





