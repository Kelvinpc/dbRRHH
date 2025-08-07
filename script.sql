CREATE DATABASE recursoshumanos;

USE recursoshumanos;

show tables;


CREATE TABLE departamentos(
    iddepartamento              INT AUTO_INCREMENT                      PRIMARY KEY,
    departemento                VARCHAR(40)                             NOT NULL,

    CONSTRAINT uk_departamento_depa UNIQUE (departemento)

)ENGINE = INNODB;

CREATE TABLE distritos(
    iddistrito                 INT AUTO_INCREMENT                      PRIMARY KEY,
    distrito                    VARCHAR(40)                             NOT NULL,
    idprovincia                 INT                                     NOT NULL,

    CONSTRAINT fk_idprovincia_dist FOREIGN KEY (idprovincia) REFERENCES provincias(idprovincia),
    CONSTRAINT uk_distrito_provincia UNIQUE (distrito, idprovincia)

)ENGINE = INNODB;


CREATE TABLE sucursales(
    idsucursal                  INT AUTO_INCREMENT                      PRIMARY KEY,
    sucursal                    VARCHAR(40)                             NOT NULL,
    direccion                   VARCHAR(60)                             NOT NULL,
    referencia                  VARCHAR(50)                             NOT NULL,

    iddistrito                  INT                                     NOT NULL,

    CONSTRAINT fk_iddistrito_sucur FOREIGN KEY (iddistrito) REFERENCES distritos(iddistrito)

)ENGINE = INNODB;


CREATE TABLE areas(
    idarea                      INT AUTO_INCREMENT                      PRIMARY KEY,
    area                        VARCHAR(40)                             NOT NULL,
    idsucursal                  INT                                     NOT NULL,

    CONSTRAINT fk_idsucursal_area FOREIGN KEY (idsucursal) REFERENCES sucursales(idsucursal),
    CONSTRAINT uk_area_sucursal UNIQUE (area, idsucursal)
) ENGINE = INNODB;

CREATE TABLE cargos(
    idcargo                     INT AUTO_INCREMENT                      PRIMARY KEY,
    cargo                       VARCHAR(40)                             NOT NULL,
    idarea                      INT                                     NOT NULL,

    CONSTRAINT fk_idarea_carg FOREIGN KEY (idarea) REFERENCES areas(idarea),
    CONSTRAINT uk_cargo_area UNIQUE (cargo, idarea)

)ENGINE = INNODB;

CREATE TABLE personas(
    idpersona                   INT AUTO_INCREMENT                      PRIMARY KEY,
    apepaterno                   VARCHAR(40)                             NOT NULL,
    apematerno                   VARCHAR(40)                             NOT NULL,
    nombres                     VARCHAR(30)                             NOT NULL,
    fechanac                    DATE                                    NOT NULL,
    genero                      ENUM('M', 'F')                          NOT NULL COMMENT 'M = Masculino ; F = Femenino',
    tipodoc                     ENUM('DNI', 'CEX', 'PASS')              NOT NULL COMMENT 'CEX = Carnet de EXtrangeria ; PASS = Pasaporte',
    numdoc                      VARCHAR(15)                             NOT NULL,
    direccion                   VARCHAR(40)                             NOT NULL,
    referencia                  VARCHAR(30)                             NOT NULL,
    estadocivil                 ENUM('Soltero', 'Casado', 'Divorciado', 'Viudo', 'Separado', 'Conviviente')                              NOT NULL,
    iddistrito                  INT                                     NOT NULL,

    CONSTRAINT fk_iddistrito_pers FOREIGN KEY (iddistrito) REFERENCES distritos(iddistrito),
    CONSTRAINT uk_numdoc_pers UNIQUE (numdoc)


)ENGINE = INNODB;


CREATE TABLE contratos(
    idcontrato                  INT AUTO_INCREMENT                      PRIMARY KEY,
    fechainicio                 DATE                                    NOT NULL,
    fechafin                    DATE                                    NOT NULL,
    sueldobase                  DECIMAL(7.2)                            NOT NULL,
    toleranciadiaria            INT                                     NOT NULL,
    toleranciamensual           INT                                     NOT NULL,
    idpersona                   INT                                     NOT NULL,
    idcargo                     INT                                     NOT NULL,

    CONSTRAINT fk_idpersona_cont FOREIGN KEY (idpersona) REFERENCES personas(idpersona),
    CONSTRAINT fk_idcargo_cont FOREIGN KEY (idcargo) REFERENCES cargos(idcargo)

)ENGINE = INNODB;

CREATE TABLE horarios(
    idhorario                   INT AUTO_INCREMENT                      PRIMARY KEY,
    dia                         VARCHAR(10)                         NOT NULL,
    entrada                     TIME                                NOT NULL,
    iniciorefrigerio            TIME                                NOT NULL,
    finrefrigerio               TIME                                NOT NULL,
    salida                      TIME                                NOT NULL,
    idcontrato                  INT                                     NOT NULL,

    CONSTRAINT fk_idcontrato_hora FOREIGN KEY (idcontrato) REFERENCES contratos(idcontrato)

)ENGINE = INNODB;

CREATE TABLE asistencias(
    idasistencia                INT AUTO_INCREMENT                      PRIMARY KEY,
    diamarcado                  DATE                                 NOT NULL,
    entrada                     TIME                                NULL,
    iniciorefrigerio            TIME                                NULL,
    finrefrigerio               TIME                                NULL,
    salida                      TIME                                NULL,
    minnolaborados              INT                                     NULL,
    tipoasistencia              ENUM('con goce','sin goce','permiso','inasistencia','regular')  DEFAULT 'regular',
    idhorario                   INT                                     NOT NULL,

    CONSTRAINT fk_idhorario_asis FOREIGN KEY (idhorario) REFERENCES horarios(idhorario)

)ENGINE = INNODB;


CREATE TABLE tipolicencias(
    idtipolicencia          INT AUTO_INCREMENT                          PRIMARY KEY,
    nombretipo              VARCHAR(30)                                 NOT NULL,
    descripcion             VARCHAR(255)                                NOT NULL,
    diasmaximo              INT                                         NOT NULL,
    horasmaximo             INT                                         NOT NULL,
    idasistencia            INT                                               NOT NULL,
    CONSTRAINT fk_idasistencia FOREIGN KEY (idasistencia) REFERENCES asistencias(idasistencia)
    
)ENGINE = INNODB;

SHOW ENGINE INNODB STATUS;


CREATE TABLE usuarios(
    idusuario                   INT AUTO_INCREMENT                      PRIMARY KEY,
    nombreusuario               VARCHAR(20)                             NOT NULL,
    claveacceso                 VARCHAR(255)                            NOT NULL,
    idcontrato                  INT                                     NOT NULL,

    CONSTRAINT fk_idcontrato_usua FOREIGN KEY (idcontrato) REFERENCES contratos(idcontrato),
    CONSTRAINT uk_nombreusuario_usua UNIQUE (nombreusuario)

)ENGINE = INNODB;

CREATE TABLE cargafamiliar(
    idcargafami                 INT AUTO_INCREMENT                      PRIMARY KEY,
    parentesco                  VARCHAR(50)                             NOT NULL,
    
    vive                        BOOLEAN DEFAULT TRUE                    NOT NULL,
 
    idpersona                   INT                                     NOT NULL,
    idcontrato                  INT                                     NOT NULL,

    CONSTRAINT fk_idpersona_carg FOREIGN KEY (idpersona) REFERENCES personas(idpersona),
    CONSTRAINT fk_idcontrato_carg FOREIGN KEY (idcontrato) REFERENCES contratos(idcontrato)

)ENGINE = INNODB;

CREATE TABLE feriados(
    idferiado           INT AUTO_INCREMENT PRIMARY KEY,
    aniocurso           INT NOT NULL,
    mes                 INT NOT NULL,
    dia                 INT NOT NULL, 
    nombreferiado       VARCHAR(100) NOT NULL
) ENGINE = INNODB;


CREATE TABLE laboraferiados(
    idlaboraferiados    INT AUTO_INCREMENT                              PRIMARY KEY,

    idferiado           INT                                             NOT NULL,
    idcontrato          INT                                             NOT NULL,

    CONSTRAINT fk_idferiado_labo FOREIGN KEY (idferiado) REFERENCES feriados(idferiado),
    CONSTRAINT fk_idcontrato_labo FOREIGN KEY (idcontrato) REFERENCES contratos(idcontrato)

)ENGINE = INNODB;

CREATE TABLE sistemapensiones(
    idsistepension              INT AUTO_INCREMENT                      PRIMARY KEY,
    sistpensiones               VARCHAR(40)                             NOT NULL,
    nombre                      VARCHAR(30)                             NOT NULL,
    pctjaportetrabajor          INT                                     NOT NULL,
    pctjcomision                INT                                     NOT NULL,
    pctjseguro                  INT                                     NOT NULL,
    pctjaporteempleador         INT                                     NOT NULL,
    fechainicio                 DATETIME                                NOT NULL,
    fechafin                    DATETIME                                NOT NULL,
       
    fechacreado                 DATETIME DEFAULT NOW()                  NOT NULL,
    fechamodificada             DATETIME                                NULL,

    CONSTRAINT uk_sistpensiones_sist UNIQUE (sistpensiones),
    CONSTRAINT uk_nombre_sist UNIQUE (nombre)

)ENGINE = INNODB;

CREATE TABLE historialsistepensiones(
    idhistorial                 INT AUTO_INCREMENT                      PRIMARY KEY,
    fechainicio                 DATETIME                                NOT NULL,
    fechafin                    DATETIME                                NOT NULL,
   
    fechacreado                 DATETIME DEFAULT NOW()                  NOT NULL,
    fechamodificada             DATETIME                                NULL,
 
    idpersona                   INT                                     NOT NULL,
    idsistepension              INT                                     NOT NULL,

    CONSTRAINT fk_idpersona_hist FOREIGN KEY (idpersona) REFERENCES personas(idpersona),
    CONSTRAINT fk_idsistepension_hist FOREIGN KEY (idsistepension) REFERENCES sistemapensiones(idsistepension)

)ENGINE = INNODB;


CREATE TABLE planillas(
    idplanilla                  INT AUTO_INCREMENT                      PRIMARY KEY,
    anio                        INT                                     NOT NULL,
    mes                         INT                                     NOT NULL,
    diaslaborados               INT                                     NOT NULL,
    horasextras                 INT                                     NULL,
    pctjhextras                 INT                                     NOT NULL,
    tardanzas                   INT                                     NULL,
    faltas                      INT                                     NULL,
-- sueldobasico                 DECIMAL(7,2)                            NOT NULL,
    vacacionestruncas           INT                                     NULL,
    pctjdsctpension             DECIMAL(7,2) DEFAULT 0.00               NOT NULL,
    dsctpension                 DECIMAL(7,2) DEFAULT 0.00               NOT NULL,
    comisionafp                 DECIMAL(7,2) DEFAULT 0.00               NOT NULL,
    seguroafp                   DECIMAL(7,2) DEFAULT 0.00               NOT NULL,
    otrosdescuentos             DECIMAL(7,2) DEFAULT 0.00               NOT NULL,
    bonificaciones              DECIMAL(7,2) DEFAULT 0.00               NOT NULL,
    aporteempleador             DECIMAL(7,2) DEFAULT 0.00               NOT NULL,
    totalneto                   DECIMAL(7,2)                            NOT NULL,
    fechageneracion             DATETIME DEFAULT NOW()                  NOT NULL,
    estado                      BOOLEAN                                 NOT NULL,
   
    fechacreado                 DATETIME DEFAULT NOW()                  NOT NULL,
    fechamodificada             DATETIME                                NULL,
 
    idcontrato                  INT                                     NOT NULL,
    idtipolicencia              INT                                     NULL,
    idcargafami                 INT                                     NULL,    

    CONSTRAINT fk_idcontrato_plan FOREIGN KEY (idcontrato) REFERENCES contratos(idcontrato),
    CONSTRAINT fk_idtipolicencia_plan FOREIGN KEY (idtipolicencia) REFERENCES tipolicencias(idtipolicencia),
    CONSTRAINT fk_cargafamiliar_plan FOREIGN KEY (idcargafami) REFERENCES cargafamiliar(idcargafami)

)ENGINE = INNODB;

SHOW ENGINE INNODB STATUS;
