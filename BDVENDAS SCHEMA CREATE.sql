DROP SCHEMA BDVENDAS;
CREATE SCHEMA IF NOT EXISTS BDVENDAS;
USE BDVENDAS;

CREATE TABLE IF NOT EXISTS CADESTADO(
									 UF CHAR(2),
                                     ESTADO VARCHAR(20),
                                     CONSTRAINT PK_CADESTADO
                                     PRIMARY KEY (UF));
                                     
CREATE TABLE IF NOT EXISTS CADMUN(
								  CODMUN INT UNSIGNED NOT NULL,
                                  MUNICIPIO VARCHAR(30),
                                  UF CHAR(2),
                                  CONSTRAINT PK_CADMUN
                                  PRIMARY KEY (CODMUN),
                                  CONSTRAINT FK_CADMUN_CADESTADO
									FOREIGN KEY (UF)
                                    REFERENCES CADESTADO(UF));        
                                    
CREATE TABLE IF NOT EXISTS CADCARGO(
								    CODCARGO INT UNSIGNED NOT NULL,
                                    CARGO VARCHAR(100),
                                    CONSTRAINT PK_CADCARGO
                                    PRIMARY KEY (CODCARGO));                                           

CREATE TABLE IF NOT EXISTS CADFUN(
						   CODFUN INT UNSIGNED NOT NULL,
                           NOME VARCHAR(70),
                           ESTCIVIL CHAR(10),
                           DTANASC DATE,
                           SEXO CHAR(1),
                           SALHORA DECIMAL(10,6),
                           CODCARGO INT UNSIGNED,
                           CODMUN INT UNSIGNED,
                           CONSTRAINT PK_CADFUN
                           PRIMARY KEY (CODFUN),
                           CONSTRAINT FK_CADFUN_CADCARGO
							FOREIGN KEY (CODCARGO)
                            REFERENCES CADCARGO(CODCARGO),
						   CONSTRAINT FK_CADFUN_CADMUN
							FOREIGN KEY (CODMUN)
                            REFERENCES CADMUN(CODMUN));
                                                       
                                     
CREATE TABLE IF NOT EXISTS LCTFOLHA(
									CODFUN INT UNSIGNED NOT NULL,
									DTAFOLHA DATE,
                                    TIPOSAL VARCHAR(8),
                                    QTDHORAS DECIMAL(10,6),
                                    CONSTRAINT PK_LCTFOLHA
                                    PRIMARY KEY (CODFUN),
                                    CONSTRAINT FK_LCTFOLHA_CADFUN
										FOREIGN KEY (CODFUN)
                                        REFERENCES CADFUN(CODFUN));                                     