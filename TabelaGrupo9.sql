create database Grupo9;
use grupo9;

drop table empresa;
-- DADOS EMPRESA
CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cnpj CHAR(14),
    email VARCHAR(255),
    senha VARCHAR(45),
    numTelefone CHAR(10),
    numCelular CHAR(11));
    
insert into empresa (nome, cnpj, email, senha, numTelefone, numCelular) values
	('Ostra Dourada Ltda', '12345678000190', 'contato.ostradourada@email.com', 'DouradoostraSenha1243', '1333445566', '13988887777'),
	('Perolas do Pacifico SA', '23456789000101', 'vendasperolaspacifico@email.com', 'perolapacifico2025', '2132123434', '21999998888'),
	('Mare Branca Cultivo', '34567890000122', 'sacmarebranca@email.com', 'mareBranca2025', '7130213040', '71988880000'),
	('Perola Negra', '45678901000133', 'perola.negra@email.com.br', 'perolajoia123', '8532234455', '85999997777');
    
    
-- ENDERECO EMPRESA
create table endereco(
	idEndereco int primary key auto_increment,
    UF char(2),
    cidade varchar(45),
    bairro varchar(45),
    rua varchar(45),
    numLogradouro int,
    fkEmpresa int,
		constraint fkEmpresaEndereco foreign key(fkEmpresa) references empresa(idEmpresa));
        
insert into endereco (UF, cidade, bairro, rua, numLogradouro, fkEmpresa) values
	('SP', 'Santos', 'Centro', 'Rua Conceição', 245, 1),
	('RJ', 'Rio de Janeiro', 'Centro', 'Avenida Rio Branco', 789, 2), 
	('BA', 'Salvador', 'Comércio', 'Rua Portugal', 1500, 3), 
	('CE', 'Fortaleza', 'Aldeota', 'Rua Barbosa de Freitas', 77, 4);
		

-- DADOS PESSOA
create table usuario(
	idUser int primary key auto_increment,
    nome varchar(45),
    email varchar(45),
    senha varchar(45),
    cpf char(11),
	fkGestor int,
		constraint fkGestorUser foreign key(fkGestor) references usuario(idUser)); 
	
alter table usuario add column fkEmpresa int,
	add constraint fkEmpresaUsuario foreign key(fkEmpresa) references empresa(idEmpresa);

insert into usuario(nome, email, senha, cpf, fkEmpresa) values
	('Gustavo Frieng', 'gustavo.frieng@email.com', 'PollosHermanos290!', '25986794079', 4),
    ('Cleber Junior', 'junior.cleb@email.com', 'MousseDeMaracuja1919#', '18009763055', 1),
    ('Sandra Regina', 'sandra.san80@email.com', 'M3j3u31980!', '18413095085', 3),
    ('Hermes Juscelino', 'hermes.jus@email.com','JorgeBen1970%', '52428382055', 2);
    
insert into usuario(nome, email, senha, cpf, fkGestor, fkEmpresa) values
	('Ana Ribeiro', 'anaribeiroemailcom', 'ana123segura', '12345678901', 1, 4),
	('Carlos Mendes', 'cmendesempresaorg', 'carlosSenha2024', '23456789012', 2, 1),
	('Juliana Costa', 'julianacostacomercialnet', 'julianaSenha', '34567890123', 1, 4),
	('Rafael Lima', 'rafaellimaempresaorg', 'rafa321forte', '45678901234', 3, 3),
	('Beatriz Nogueira', 'beatriznogueiragmailcom', 'beatriz@segura', '56789012345', 4, 2),
	('Thiago Souza', 'thiagosouzaemailnet', 'thsenha2025', '67890123456', 2, 1),
	('Mariana Rocha', 'marianarochaempresaorg', 'mariSenha123', '78901234567', 3, 3),
	('Eduardo Martins', 'emartinscontatoorg', 'eduMartins456', '89012345678', 4, 2);
    
    select * from usuario;
    
select u.nome as 'Nome do Usuáio',
	g.nome as 'Nome do Gestor',
    e.nome as 'Nome da Empresa'
from usuario as u
	left join usuario as g on u.fkGestor = g.idUser
    join empresa as e on u.fkEmpresa = e.idEmpresa;

-- DADOS SENSOR
CREATE TABLE sensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    numSerial char(8),	
    dtInstalacao date,
    fkEmpresa int,
    constraint fkMonitoramentoEmpresa foreign key(fkEmpresa) references empresa(idEmpresa));
    
-- DADOS MONITORAMENTO 
create table monitoramento(
	idSensor int primary key auto_increment,
    numSerial char(8),
    fkSensor int,
    dtMonitoramento datetime,
		constraint fkSensorMonitoramendo foreign key (fkSensor) references sensor(idSensor));
    
    

 