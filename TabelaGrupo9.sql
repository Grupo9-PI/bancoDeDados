create database lumaris;
use lumaris;

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
	telefone VARCHAR(10) NOT NULL
);

INSERT INTO empresa (razaoSocial, nomeFantasia, cnpj, dtCadastro, email, senha, celular, telefone)
VALUES
('Ostra Dourada Ltda', 'Ostra Dourada', '12345678000190', '2025-03-01', 'contato.ostradourada@email.com','senha123','11988887777', '1133445566'),
('Perolas do Pacifico SA','Perolas do Pacifico', '12345678000190', '2025-02-15', 'vendasperolaspacifico@email.com', 'perolapacifico2025', '11988884698', '1133449988'),
('Mare Branca Cultivo Ltda', 'Mare Branca Cultivo', '23456789000101', '2025-01-30', 'sacmarebranca@email.com', 'perolapacifico2025', '11965432109', '1135435588');

create table endereco (
    idEndereco int primary key auto_increment,
    rua varchar(50),
    numero varchar(10),
    bairro varchar(100),
    cidade varchar(100),
    estado char(2),
	fkEmpresa int,
		constraint fkEmpresaEndereco foreign key (fkEmpresa) references empresa(idEmpresa));
        
insert into endereco (rua, numero, bairro, cidade, estado, fkEmpresa) values
	('Rua santo antonio', '265', 'Vila Ipiranga', 'São Paulo', 'SP', 1),
	('Rua patricio', '874', 'Jardim Vitória', 'Belo Horizonte', 'MG', 2),
	('Alameda Afonso Smthit', '1000', 'Santa cruz', 'São Paulo', 'SP', 3);        


create table usuario(
	idUsuario int primary key auto_increment,
    fkEmpresa int, 
    nome varchar(45),
    email varchar(45),
		CONSTRAINT checkEmailUsuario check(email LIKE '%@%'),
    telefone VARCHAR (10),
    celular varchar (11),
    statusUsuario varchar (45) DEFAULT 'Ativo' NOT NULL,
    CONSTRAINT checkUsuario CHECK(statusUsuario IN("Ativo","Afastado","Ferias")),
    senha varchar(45),
	fkSupervisor int,
		constraint fkSupervisorUsuario foreign key(fkSupervisor) references usuario(idUsuario),
        constraint fkUsuarioEmpresa foreign key(fkEmpresa) references empresa(idEmpresa)
    ); 
    
insert into usuario (idUsuario, fkEmpresa, nome, email, telefone, celular, statusUsuario, senha, fkSupervisor) values
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
qtOstras int,
dtinstalacao date,
fkEmpresa int,
constraint fkEmpresaArea
	foreign key (fkEmpresa)
    references empresa(idEmpresa)
    );
    
insert into areaCultivo(qtOstras, dtinstalacao, fkEmpresa) values
('250', '2024-11-01', 1),
('300', '2024-12-01', 1),
('280', '2024-10-01', 2),
('400', '2025-03-05', 1),
('590', '2025-03-05', 1),
('610', '2022-11-01', 3),
('402', '2022-11-01', 1),
('200', '2018-01-01', 2),
('500', '2018-04-01', 3),
('300', '2018-05-01', 3),
('280', '2018-10-01', 1),
('500', '2025-01-01', 1);


CREATE TABLE sensorLDR(
idSensor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
numSerie VARCHAR(100) UNIQUE NOT NULL,
dtFabricacao  DATE NOT NULL,
dtCompra DATE NOT NULL,
statusManutencao VARCHAR(10) DEFAULT 'Inativo' NOT NULL,
CONSTRAINT checkManutencao CHECK(statusManutencao IN("Ativo","Inativo","Manutencao")),
dtManutencao DATE NOT NULL,
fkCultivo int,
constraint fkCultivoSensor
	foreign key (fkCultivo)
    references areaCultivo (idCultivo)
);

select * from sensorLDR;

INSERT INTO sensorLDR (numSerie, dtFabricacao, dtCompra, dtManutencao, statusManutencao, fkCultivo)
VALUES
('9AKREG935G9', '2023-06-10', '2024-07-15', '2023-12-10', 'Ativo', 1),
('SEF4290KF29', '2023-11-28', '2024-01-10', '2025-02-25', 'Inativo', 2),
('ASDKF94K9F2', '2023-03-05', '2024-03-10', '2025-02-28', 'Inativo', 3),
('SAF4290KF29', '2023-11-20', '2024-01-10', '2025-05-20', 'Inativo', 4),
('XPT2048QW98', '2023-06-12', '2024-02-01', '2023-12-12', 'Manutenção', 5),
('LKJ9321PLO3', '2022-09-20', '2023-11-05', '2023-03-20', 'Ativo', 6),
('MNZ8543QAZX', '2024-01-01', '2024-04-15', '2024-07-01', 'Inativo', 7),
('TRD0192XZJK', '2023-05-17', '2024-05-10', '2023-11-17', 'Ativo', 8),
('QWE7584BNMA', '2022-12-10', '2023-10-25', '2023-06-10', 'Manutenção', 9),
('GHY3847IKLP', '2023-07-08', '2024-06-01', '2024-01-08', 'Inativo', 10),
('YUI5623ZXCV', '2023-10-25', '2024-08-15', '2024-04-25', 'Ativo', 11),
('BNM2398VFRD', '2024-02-02', '2024-06-30', '2024-08-02', 'Inativo', 12);


CREATE TABLE monitoramento(
    idSensorMonitoramento INT primary key auto_increment NOT NULL ,
	dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    iluminacao int NOT NULL,
    fkSensor int,
    constraint fkSensorMonitoramento
    foreign key (fkSensor) references sensorLDR (idSensor));
    



alter table sensorLDR add column proximaManutencao date;
select * from sensorLDR;

update sensorLDR set dtManutencao = '2025-01-01' where idSensor=1;
update sensorLDR set dtManutencao ='2025-02-01' where idSensor in (2,3,4,5);
update sensorLDR set dtManutencao= '2025-03-01' where idSensor in (6,7,8,9,10,11,12);

update sensorLDR set proximaManutencao = '2025-06-01' where idSensor= 1;
update sensorLDR set proximaManutencao = '2025-07-01' where idSensor in (2,3,4);
update sensorLDR set proximaManutencao = null where idSensor= 5;
update sensorLDR set proximaManutencao = '2025-08-01' where idSensor in (6,7,8,9,10,11,12);

select *from empresa;
select * from endereco;
select *from usuario;
select *from areaCultivo;
select *from monitoramento;
select *from sensorLDR;


-- Exibir Nome Empresa, Supervisor, Funcionário Responsável, Identificação do Cultivo, Quantidade de ostras, Identificação do Sensor, Data do Registro e valor LX.

select e.nomeFantasia as 'Nome da Empresa',
	u.nome as 'Supervisor',
    a.idCultivo as 'Identificação do Cultivo',
    a.qtOstras as 'Quantidade de ostras',
    s.idSensor as 'identificação do Sensor',
    m.dtRegistro as 'Data de registro',
    m.iluminacao as 'Valor LX'
from monitoramento m
	join sensorLDR s on m.fkSensor = s.idSensor
    join areaCultivo a on s.fkCultivo = a.idCultivo
    join empresa e on a.fkEmpresa = e.idEmpresa
    join usuario u on e.idEmpresa = u.fkEmpresa
    where fkSupervisor is null;

