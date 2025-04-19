create database Grupo9;
use Grupo9;

CREATE TABLE empresa(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
razaoSocial VARCHAR(50) NOT NULL,
nomeFantasia VARCHAR(50) NOT NULL,
cnpj CHAR(14) NOT NULL,
dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
email VARCHAR(100) NOT NULL,
CONSTRAINT checkEmail check(email LIKE '%@%'),
senha VARCHAR(100) NOT NULL,
celular VARCHAR (11) NOT NULL,
telefone VARCHAR(10) NOT NULL,
logradouro VARCHAR(100)
);

INSERT INTO empresa (razaoSocial, nomeFantasia, cnpj, dtCadastro, email, senha, celular, telefone, logradouro)
VALUES
('Ostra Dourada Ltda', 'Ostra Dourada', '12345678000190', '2025-03-01', 'contato.ostradourada@email.com','senha123','11988887777', '1133445566' , 'Rua santo antonio, 265, Vila Ipiranga, São Paulo, SP'),
('Perolas do Pacifico SA','Perolas do Pacifico', '12345678000190', '2025-02-15', 'vendasperolaspacifico@email.com', 'perolapacifico2025', '11988884698', '1133449988', 'Rua patricio, 874,Jardim Vitória, Belo Horizonte, MG'),
('Mare Branca Cultivo Ltda', 'Mare Branca Cultivo', '23456789000101', '2025-01-30', 'sacmarebranca@email.com', 'perolapacifico2025', '11965432109', '1135435588', 'Alameda Afonso Smthit, 1000, Santa cruz, São Paulo,SP');


create table usuario(
	idUsuario int auto_increment,
    Empresa_idEmpresa int, 
    nome varchar(45),
    email varchar(45),
    CONSTRAINT checkEmailUsuario check(email LIKE '%@%'),
    telefone VARCHAR (10),
    celular varchar (11),
    statusUsuario varchar (45) DEFAULT 'Ativo' NOT NULL,
    CONSTRAINT checkUsuario CHECK(statusUsuario IN("Ativo","Afastado","Ferias")),
    senha varchar(45),
	primary key (idUsuario,Empresa_idEmpresa),
	fkSupervisor int,
	constraint fkSupervisorUsuario 
        foreign key(fkSupervisor) 
        references usuario(idUsuario)
    ); 
    
insert into usuario (idUsuario, Empresa_idEmpresa, nome, email, telefone, celular, statusUsuario, senha, fkSupervisor) values
	(null ,'1','Gustavo Frieng', 'gustavo.frieng@email.com', '1123456789', '11987654321','Ativo','PollosHermanos290!', null),
    (null,'1','Cleber Junior', 'junior.cleb@email.com', '1134567890','11991234567', 'Ferias', 'MousseDeMaracuja1919#', 1),
    (null,'1','Sandra Regina', 'sandra.san80@email.com', '1134567890', '1138765432', 'Ativo', 'M3j3u31980!',  1),
    (null, '2','Ana Souza', 'ana.souza@email.com', '1134567890', '11991234567','Ativo','ana@123',  null),
	(null,'2','Bruno Oliveira', 'bruno.oliveira@email.com', '1133445566', '11998887766', 'Ativo', 'bruno456',  4),
    (null,'3','Diego Martins', 'diego.martins@email.com', '4134567890', '41998765432','Ativo', 'diego789',null),
	(null,'3','Elisa Ramos', 'elisa.ramos@email.com', '5138765432', '51998887744','Afastado', 'elisa@321', '6'),
	(null,'3','Felipe Andrade', 'felipe.andrade@email.com', '6133345566', '61999112233','Ferias', 'felipe2025','6'),
	(null,'3','Gabriela Lima', 'gabriela.lima@email.com', '7134561234', '71994455667', 'Ativo', 'gabi#654', '6');
    

CREATE TABLE areaCultivo(
idCultivo INT PRIMARY KEY auto_increment NOT NULL,
qtOstras decimal (5,0),
dtinstalacao date,
fkUsuario int,
constraint fkUsuarioCultivo
	foreign key (fkUsuario)
    references usuario(idusuario)
    );
    
insert into areaCultivo(qtOstras, dtinstalacao, fkUsuario) values
('250', '2024-11-01', '3'),
('300', '2024-12-01', 3),
('280', '2024-10-01', 3),
('400', '2025-03-05', 3),
('590', '2025-03-05', 3),
('610', '2022-11-01', 5),
('402', '2022-11-01', 5),
('200', '2018-01-01', 9),
('500', '2018-04-01', 9),
('300', '2018-05-01', 9),
('280', '2018-10-01', 9),
('500', '2025-01-01', 9);

drop table sensorLDR;
CREATE TABLE sensorLDR(
idSensor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
numSerie VARCHAR(100) UNIQUE NOT NULL,
dtFabricacao  DATE NOT NULL,
dtCompra DATE NOT NULL,
statusManutencao VARCHAR(10) DEFAULT 'Inativo' NOT NULL,
CONSTRAINT checkManutencao CHECK(statusManutencao IN("Ativo","Inativo","Manutencao")),
dtManutencao DATE NOT NULL,
dtInstalacao date not null,
fkCultivo int,
constraint fkCultivoSensor
	foreign key (fkCultivo)
    references areaCultivo (idCultivo)
);

INSERT INTO sensorLDR (numSerie, dtFabricacao, dtCompra, dtManutencao, statusManutencao, dtInstalacao, fkCultivo)
VALUES
('9AKREG935G9', '2023-06-10', '2024-07-15', '2023-12-10', 'Ativo', '2024-07-20', 1),
('SEF4290KF29', '2023-11-28', '2024-01-10', '2025-02-25', 'Inativo', '2024-01-15', 2),
('ASDKF94K9F2', '2023-03-05', '2024-03-10', '2025-02-28', 'Inativo', '2024-03-12', 3),
('SAF4290KF29', '2023-11-20', '2024-01-10', '2025-05-20', 'Inativo', '2024-01-13', 4),
('XPT2048QW98', '2023-06-12', '2024-02-01', '2023-12-12', 'Manutenção', '2024-02-05', 5),
('LKJ9321PLO3', '2022-09-20', '2023-11-05', '2023-03-20', 'Ativo', '2023-11-10', 6),
('MNZ8543QAZX', '2024-01-01', '2024-04-15', '2024-07-01', 'Inativo', '2024-04-20', 7),
('TRD0192XZJK', '2023-05-17', '2024-05-10', '2023-11-17', 'Ativo', '2024-05-12', 8),
('QWE7584BNMA', '2022-12-10', '2023-10-25', '2023-06-10', 'Manutenção', '2023-10-30', 9),
('GHY3847IKLP', '2023-07-08', '2024-06-01', '2024-01-08', 'Inativo', '2024-06-05', 10),
('YUI5623ZXCV', '2023-10-25', '2024-08-15', '2024-04-25', 'Ativo', '2024-08-18', 11),
('BNM2398VFRD', '2024-02-02', '2024-06-30', '2024-08-02', 'Inativo', '2024-07-02', 12);

CREATE TABLE monitoramento(
    idSensorMonitoramento INT primary key auto_increment NOT NULL ,
	dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    iluminacao FLOAT NOT NULL,
    fkSensor int,
    constraint fkSensorMonitoramento
    foreign key (fkSensor)
		references SensorLDR (idSensor)
        );
    
INSERT INTO monitoramento (dtRegistro, iluminacao,fkSensor) VALUES
('2025-04-18 06:00:00', 240, 1),
('2025-04-18 07:00:00', 320, 1),
('2025-04-18 08:00:00', 450, 1),
('2025-04-18 09:00:00', 600, 1),
('2025-04-18 10:00:00', 720, 1),
('2025-04-18 11:00:00', 850, 2),
('2025-04-18 12:00:00', 1020, 2),
('2025-04-18 13:00:00', 1100, 2),
('2025-04-18 14:00:00', 970, 2),
('2025-04-18 15:00:00', 860, 3),
('2025-04-18 16:00:00', 740, 4),
('2025-04-18 17:00:00', 530, 5),
('2025-04-18 18:00:00', 380, 6),
('2025-04-18 19:00:00', 260, 7),
('2025-04-18 20:00:00', 230, 8),
('2025-04-18 21:00:00', 210, 9),
('2025-04-18 22:00:00', 200, 10),
('2025-04-18 23:00:00', 215, 11),
('2025-04-19 00:00:00', 220, 12);

select *from empresa;
select *from usuario;
select *from areaCultivo;
select *from monitoramento;
select *from sensorLDR;

