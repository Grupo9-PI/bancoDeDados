create database Grupo9;
use grupo9;


-- DADOS EMPRESA
CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cnpj CHAR(14),
    email VARCHAR(255),
    senha VARCHAR(45),
	cep CHAR(8),
    numLogradouro INT,
    numTelefone CHAR(10),
    numCelular CHAR(11));
    
insert into empresa (nome, cnpj, email, senha, cep, numLogradouro, numTelefone, numCelular) values
	('Ostra Dourada Ltda', '12345678000190', 'contato.ostradourada@email.com', 'DouradoostraSenha1243', '13010111', '245', '1133445566', '11988887777'),
	('Perolas do Pacifico SA', '23456789000101', 'vendasperolaspacifico@email.com', 'perolapacifico2025', '20040010', '789', '2132123434', '21999998888'),
	('Mare Branca Cultivo', '34567890000122', 'sacmarebranca@email.com', 'mareBranca2025', '40010000', '1500', '7130213040', '71988880000'),
	('Perola Negra', '45678901000133', 'perola.negra@email.com.br', 'perolajoia123', '60060230', '77', '8532234455', '85999997777');
    
    


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
    
insert into usuario(nome, email, senha, cpf, fkGestor) values
	('Ana Ribeiro', 'anaribeiroemailcom', 'ana123segura', '12345678901', 1, 1),
	('Carlos Mendes', 'cmendesempresaorg', 'carlosSenha2024', '23456789012', 2, 1),
	('Juliana Costa', 'julianacostacomercialnet', 'julianaSenha', '34567890123', 1, 2),
	('Rafael Lima', 'rafaellimaempresaorg', 'rafa321forte', '45678901234', 3, 2),
	('Beatriz Nogueira', 'beatriznogueiragmailcom', 'beatriz@segura', '56789012345', 4, 3),
	('Thiago Souza', 'thiagosouzaemailnet', 'thsenha2025', '67890123456', 2, 3),
	('Mariana Rocha', 'marianarochaempresaorg', 'mariSenha123', '78901234567', 3, 4),
	('Eduardo Martins', 'emartinscontatoorg', 'eduMartins456', '89012345678', 4, 4);

-- DADOS MONITORAMENTO
CREATE TABLE monitoramento (
	idMonitoramento INT PRIMARY KEY AUTO_INCREMENT,
    numSerial int,
    iluminacao int,
    fkEmpresa int,
    constraint fkMonitoramentoEmpresa foreign key(fkEmpresa) references empresa(idEmpresa));
    

    

