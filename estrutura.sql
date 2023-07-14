/*Criação do banco*/

CREATE DATABASE IF NOT EXISTS intranet_unimed;

/*Criação das Tabelas*/

USE intranet_unimed;
--
CREATE TABLE IF NOT EXISTS USUARIO 
(
	CD_MATRICULA INT NOT NULL AUTO_INCREMENT,
    USUARIO VARCHAR(30) NOT NULL UNIQUE,
    SENHA VARCHAR(30) NOT NULL,
    NOME VARCHAR(100) NOT NULL,
    SOBRENOME VARCHAR(100) NOT NULL,
    SEXO VARCHAR(5),
    DATA_NASCIMENTO DATE,
    CARGO VARCHAR (250),
    CD_DEPARTAMENTO INT,
    CD_TIPO_CARGO VARCHAR(5),
    PRIMARY KEY (CD_MATRICULA)
);
--
CREATE TABLE IF NOT EXISTS EXTERNO
(
	CD_EXTERNO INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    SOBRENOME VARCHAR(100) NOT NULL,
    SEXO VARCHAR(5),
    DATA_NASCIMENTO DATE,
    CARGO VARCHAR (250),
    CD_DEPARTAMENTO INT,
    CD_TIPO_CARGO VARCHAR(5),
    PRIMARY KEY (CD_EXTERNO)
);
--
CREATE TABLE IF NOT EXISTS TELEFONE_INTERNO
(
	CD_TELEFONE_INT INT NOT NULL AUTO_INCREMENT,
    NUM_TELEFONE VARCHAR(50) NOT NULL,
    CD_MATRICULA INT,
    CD_TIPO_TELEFONE VARCHAR(5),
    PRIMARY KEY (CD_TELEFONE_INT)
);
--
CREATE TABLE IF NOT EXISTS TELEFONE_EXTERNO
(
	CD_TELEFONE_EXT INT NOT NULL AUTO_INCREMENT,
    NUM_TELEFONE VARCHAR(50) NOT NULL,
    CD_EXTERNO INT,
    CD_TIPO_TELEFONE VARCHAR(5),
    PRIMARY KEY (CD_TELEFONE_EXT)
);
--
CREATE TABLE IF NOT EXISTS TIPO_TELEFONE
(
	CD_TIPO_TELEFONE VARCHAR(5) NOT NULL,
    TIPO_TELEFONE VARCHAR(25) NOT NULL,
    PRIMARY KEY (CD_TIPO_TELEFONE)
);
--
CREATE TABLE IF NOT EXISTS DEPARTAMENTO
(
	CD_DEPARTAMENTO INT NOT NULL AUTO_INCREMENT,
    NOME_DEPARTAMENTO VARCHAR(250) NOT NULL,
    PRIMARY KEY (CD_DEPARTAMENTO)
);
--
CREATE TABLE IF NOT EXISTS TIPO_CARGO
(
	CD_TIPO_CARGO VARCHAR(5) NOT NULL,
    TIPO_CARGO VARCHAR(25),
    PRIMARY KEY (CD_TIPO_CARGO)
);

Renomeação do Banco

ALTER TABLE USUARIO
ADD CONSTRAINT FK_CD_DEPARTAMENTO_USER
FOREIGN KEY (CD_DEPARTAMENTO)
REFERENCES DEPARTAMENTO (CD_DEPARTAMENTO);
--
ALTER TABLE USUARIO
ADD CONSTRAINT FK_CD_TIPO_CARGO_USER
FOREIGN KEY (CD_TIPO_CARGO)
REFERENCES TIPO_CARGO (CD_TIPO_CARGO);
--
ALTER TABLE EXTERNO
ADD CONSTRAINT FK_CD_DEPARTAMENTO_EXT
FOREIGN KEY (CD_DEPARTAMENTO)
REFERENCES DEPARTAMENTO (CD_DEPARTAMENTO);
--
ALTER TABLE EXTERNO
ADD CONSTRAINT FK_CD_TIPO_CARGO_EXT
FOREIGN KEY (CD_TIPO_CARGO)
REFERENCES TIPO_CARGO (CD_TIPO_CARGO);
--
ALTER TABLE TELEFONE_INTERNO
ADD CONSTRAINT FK_CD_MATRICULA
FOREIGN KEY (CD_MATRICULA)
REFERENCES USUARIO (CD_MATRICULA);
--
ALTER TABLE TELEFONE_EXTERNO
ADD CONSTRAINT FK_CD_EXTERNO
FOREIGN KEY (CD_EXTERNO)
REFERENCES EXTERNO (CD_EXTERNO);
--
ALTER TABLE TELEFONE_INTERNO
ADD CONSTRAINT FK_CD_TIPO_TELEFONE_INT
FOREIGN KEY (CD_TIPO_TELEFONE)
REFERENCES TIPO_TELEFONE (CD_TIPO_TELEFONE);
--
ALTER TABLE TELEFONE_EXTERNO
ADD CONSTRAINT FK_CD_TIPO_TELEFONE_EXT
FOREIGN KEY (CD_TIPO_TELEFONE)
REFERENCES TIPO_TELEFONE (CD_TIPO_TELEFONE);

/*Povoação do Banco*/

INSERT INTO TIPO_CARGO (CD_TIPO_CARGO, TIPO_CARGO)
VALUES
('C', 'COLABORADOR'),
('M', 'MÉDICO'),
('F', 'FORNECEDOR');
--
INSERT INTO TIPO_TELEFONE (CD_TIPO_TELEFONE, TIPO_TELEFONE)
VALUES
('C', 'CELULAR'),
('F', 'FIXO'),
('P', 'PROFISSIONAL'),
('R', 'RAMAL');
--
INSERT INTO DEPARTAMENTO (NOME_DEPARTAMENTO)
VALUES
('ALMOXARIFADO'),
('ADMINISTRATIVO'),
('AMBULATORIO EFAPI'),
('ARQUIVO'),
('AUDITORIA'),
('AUTORIZAÇÃO'),
('CCIRAS'),
('CENTRAL DE ATENDIMENTO - SAC'),
('CENTRAL DE MATERIAIS'),
('CENTRO CIRÚRGICO'),
('COMERCIAL'),
('COMPRAS'),
('CONTROLADORIA'),
('COTEP'),
('ENFERMAGEM'),
('ESPAÇO VIVER BEM'),
('FARMÁCIA'),
('FATURAMENTO'),
('FINANCEIRO'),
('FISIOTERAPIA'),
('GERÊNCIA'),
('GESTAO DE CONTRATOS'),
('GESTÃO DE OBRAS'),
('INFORMAÇÕES GERENCIAIS'),
('INTERNAÇÃO'),
('INTERNAÇÃO CIRÚRGICA'),
('INTERNAÇÃO CLÍNICA'),
('JURÍDICO'),
('LABORATÓRIO'),
('LAVANDERIA'),
('MANUTENÇÃO'),
('MARKETING'),
('MATERNIDADE'),
('NÚCLEO DE GESTÃO ESTRATÉGICA E ORÇAMENTOS'),
('NÚCLEO DE GOVERNANÇA CORPORATIVA'),
('NÚCLEO DE QUALIDADE EM SAÚDE'),
('NUTRIÇÃO'),
('ONCOLOGIA'),
('OUVIDORIA'),
('PRONTO ATENDIMENTO'),
('RELACIONAMENTO CORPORATIVO'),
('RH'),
('SAÚDE OCUPACIONAL'),
('SUSTENTABILIDADE'),
('TELEFONIA'),
('TI'),
('TRANSPORTE'),
('UND INTERNAÇÃO PEDIÁTRICA - SETOR B'),
('UNIMAGEM - CDI'),
('UNIMED PERSONAL'),
('UNIMED PERSONAL - PINHALZINHO'),
('UNIVOCÊ'),
('UTI ADULTO - ÁREA 1'),
('UTI ADULTO - ÁREA 2'),
('UTI NEONATAL'),
('UTI PEDIÁTRICA');

/*Povoação Login*/

INSERT INTO USUARIO (USUARIO, SENHA, NOME, SOBRENOME, SEXO, DATA_NASCIMENTO, CARGO, CD_DEPARTAMENTO, CD_TIPO_CARGO)
VALUES
('jhenifferdeoliveira', '@uni@227', 'Jheniffer', 'de Oliveira', 'F', '2005-07-25', 'Jovem Aprendiz TI', 46, 'C'),
('kauandelara', '@uni@227', 'Kauan', 'de Lara', 'M', '2005-04-27', 'Jovem Aprendiz TI', 46, 'C'),
('niumargirardi', '@uni@227', 'Niumar', 'Girardi', 'M', '2006-02-24', 'Jovem Aprendiz TI', 46, 'C'),
('lucaswillenbring', '@uni@227', 'Lucas', 'Davila Willenbring', 'M', '2005-02-19', 'Jovem Aprendiz TI', 46, 'C');