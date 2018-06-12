

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cuestionario` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cuestionario`;

DROP TABLE IF EXISTS `alternativa`;

CREATE TABLE `alternativa` (
  `idalternativa` int(11) NOT NULL AUTO_INCREMENT,
  `alternativa` varchar(500) NOT NULL,
  `respuesta` tinyint(1) NOT NULL,
  `idpregunta` int(11) DEFAULT NULL,
  PRIMARY KEY (`idalternativa`),
  KEY `idpregunta` (`idpregunta`),
  CONSTRAINT `alternativa_ibfk_1` FOREIGN KEY (`idpregunta`) REFERENCES `pregunta` (`idpregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `alternativa` */

LOCK TABLES `alternativa` WRITE;

insert  into `alternativa`(`idalternativa`,`alternativa`,`respuesta`,`idpregunta`) values (1,'UN FRAMEWORK',0,1),(2,'LENGUAJE DE PROGRAMACION',1,1),(3,'UNA SINTAXIS',0,1),(4,'UN IDE',0,1),(5,'UNA PLATAFORMA DE DESARROLLO',0,1),(6,'POLIMORFISMO',0,2),(7,'ENCAPSULAMIENTO',1,2),(8,'SOBRECARGA',0,2),(9,'INSTANCIA',0,2),(10,'HERENCIA',0,2),(11,'HERENCIA',0,3),(12,'ASOCIACION',0,3),(13,'INTERFAZ',1,3),(14,'CLASE',0,3),(15,'OBJETO',0,3);

UNLOCK TABLES;

/*Table structure for table `curso` */

DROP TABLE IF EXISTS `curso`;

CREATE TABLE `curso` (
  `idcurso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) unique not null,
  `nombre` varchar(500) UNIQUE NOT NULL,
  `estado` varchar(500) NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`idcurso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `curso` */

LOCK TABLES `curso` WRITE;

insert  into `curso`(`idcurso`,`nombre`,`estado`) values (1,'PROGRAMACION','1');

UNLOCK TABLES;



DROP TABLE IF EXISTS `persona`;

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `dni` int(11) NOT NULL,
  PRIMARY KEY (`idpersona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



LOCK TABLES `persona` WRITE;

insert  into `persona`(`idpersona`,`nombres`,`apellidos`,`dni`) values (1,'juan','donaires ruiz',44369835);

UNLOCK TABLES;

/*Table structure for table `pregunta` */

DROP TABLE IF EXISTS `pregunta`;

CREATE TABLE `pregunta` (
  `idpregunta` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `idtema` int(11) DEFAULT NULL,
  `estado` varchar(500) NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`idpregunta`),
  UNIQUE KEY `descripcion` (`descripcion`),
  KEY `idtema` (`idtema`),
  KEY `FK_pregunta_persona` (`idpersona`),
  CONSTRAINT `FK_pregunta_persona` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`),
  CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`idtema`) REFERENCES `tema` (`idtema`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `pregunta` */

LOCK TABLES `pregunta` WRITE;

insert  into `pregunta`(`idpregunta`,`idpersona`,`descripcion`,`idtema`,`estado`) values (1,1,'¿QUE ES JAVA?',1,'1'),(2,1,'INDICA QUE HACE PERO NO COMO LO HACE',2,'1'),(3,1,'MUESTRA UN CONJUNTO DE METODOS TOTALMENTE ABSTRACTOS',2,'1');

UNLOCK TABLES;

/*Table structure for table `tema` */

DROP TABLE IF EXISTS `tema`;

CREATE TABLE `tema` (
  `idtema` int(11) NOT NULL AUTO_INCREMENT,
  `idcurso` int(11) DEFAULT NULL,
  `nombre_tema` varchar(500) unique NOT NULL,
  `estado` varchar(500) NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`idtema`),
  KEY `idcurso` (`idcurso`),
  CONSTRAINT `tema_ibfk_1` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tema` */

LOCK TABLES `tema` WRITE;

insert  into `tema`(`idtema`,`idcurso`,`nombre_tema`,`estado`) values (1,1,'FUNDAMENTOS','1'),(2,1,'POO','1');

UNLOCK TABLES;

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `idpersona` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `contrasenia` varchar(100) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`idpersona`),
  CONSTRAINT `fk_usuario_persona` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

LOCK TABLES `usuario` WRITE;

insert  into `usuario`(`idpersona`,`nombre`,`contrasenia`,`tipo`) values (1,'jdr','123','docente');

UNLOCK TABLES;

/* Procedure structure for procedure `up_listar_pregunta_alternativas` */

/*50003 DROP PROCEDURE IF EXISTS  `up_listar_pregunta_alternativas` */;

DELIMITER $$

CREATE  PROCEDURE `up_listar_pregunta_alternativas`(
      in _idtema int
)
BEGIN
     DECLARE idpregunta_aleatoria INT DEFAULT 0;

	   DROP TABLE IF EXISTS temporal;
     CREATE TEMPORARY TABLE temporal
	   (
  	   id int NOT NULL,
  	   descripcion varCHAR(500) NOT NULL
	   );


	   SELECT p.idpregunta into idpregunta_aleatoria FROM pregunta p WHERE p.idtema = _idtema ORDER BY RAND() LIMIT 1;

	   INSERT INTO temporal (id,descripcion)
	   SELECT p.idpregunta,CONCAT('PREGUNTA: ',p.descripcion) FROM pregunta p WHERE p.idpregunta = idpregunta_aleatoria;

	   INSERT INTO temporal (id,descripcion)
	   SELECT idalternativa, a.alternativa from pregunta p
	   inner join alternativa a on a.idpregunta = p.idpregunta
	   where p.idpregunta = idpregunta_aleatoria
	   ORDER BY RAND();

	   SELECT * FROM temporal;
END
$$;


/* Procedure structure for procedure `up_usuario` */

"/*!50003 DROP PROCEDURE IF EXISTS  `up_usuario` */";

DELIMITER $$
CREATE PROCEDURE `up_usuario`(
IN _nombre VARCHAR(50),
IN _contrasenia VARCHAR(100)
)
BEGIN
SELECT p.idpersona, u.nombre, u.contrasenia,CONCAT(p.apellidos,', ',p.nombres)
AS 'APELLIDOS_Y_NOMBRES'FROM usuario u
INNER JOIN persona p ON u.idpersona = p.idpersona
WHERE nombre=_nombre AND contrasenia=_contrasenia;
END;
$$


/* Procedure structure for procedure `up_verificar_respuesta` */

"/*!50003 DROP PROCEDURE IF EXISTS  `up_verificar_respuesta` */";

DELIMITER $$

CREATE  PROCEDURE `up_verificar_respuesta`(
IN _idpregunta INT,
IN _idalternativa INT
)
BEGIN
	select * from alternativa where idalternativa=_idalternativa and idpregunta = _idpregunta AND respuesta = '1';
END;
$$

/*PROCEDURE CURSOS*/

DELIMITER $$
CREATE PROCEDURE InsertarCurso(
	IN NombreCur varchar(500)
)
BEGIN
	declare validar int default 0;
	select count(NombreCurso) into validar from Curso where NombreCurso=NombreCur;
    if validar = 0 THEN
		insert into Curso (NombreCurso) values (NombreCur);
	end if;
	if validar > 0 then
		SELECT 'ERROR - DUPLICADO' AS FATAL_ERROR;
	END IF;
END;
$$

DELIMITER $$
CREATE PROCEDURE ActualizarCurso(
	In IDE int,
    In NombreCurActu varchar(500)
)
BEGIN
	UPDATE Curso set NombreCurso = NombreCurActu where IdCurso=IDE;
END;
$$


DELIMITER $$
CREATE PROCEDURE EliminarCurso(
	In IDE int
)
BEGIN
	UPDATE Curso set Estado = 'Anulado' WHERE IdCurso=IDE;
END;
$$


DELIMITER $$
CREATE PROCEDURE MostrarCursos()
BEGIN
	select * from Curso;
END;
$$


/*PROCEDURE TEMA*/


DELIMITER $$
CREATE PROCEDURE InsertarTema(
	IN IDE int,
	IN NomTema varchar(500)
)
BEGIN
	insert into Tema(NombreTema, idCurso) values(NomTema,IDE);
END;
$$

DELIMITER $$
CREATE PROCEDURE ActualizarTema(
	In IDE int,
	IN IDETEMA int,
	IN NomNuevoTema varchar(500)
)
BEGIN
    update Tema set NombreTema = NomNuevoTema where IdTema = IDETEMA and idCurso = IDE;
END;
$$

DELIMITER $$
CREATE PROCEDURE EliminarTema(
	IN IDECurso int,
    IN IDETEMA int
)
BEGIN
	UPDATE Tema set Estado = 'Anulado' WHERE IdTema = IDETEMA and idCurso = IDECurso;
END;
$$

DELIMITER $$
CREATE PROCEDURE MostrarTemas()
BEGIN
	SELECT * FROM Tema;
END;
$$


/*PROCEDURE BUSCAR*/
DELIMITER $$
CREATE PROCEDURE BCurso(
	IN NameCurso varchar(150)
)
BEGIN
	SELECT * FROM Curso WHERE NombreCurso like concat(NameCurso,'%');
END;
$$

DELIMITER $$
CREATE PROCEDURE BTema(
	IN IDECurso int,
	IN NameTema varchar(150)
)
BEGIN
	SELECT * FROM Tema WHERE NombreTema like concat(NameTema,'%') and idCurso = IDECurso;
END;
$$


DELIMITER $$
CREATE PROCEDURE BPregunta(
	IN IDETEMA varchar(150),
	IN NamePregunta varchar(150)
)
BEGIN
	SELECT * FROM Pregunta WHERE Descripcion like concat('%',NamePregunta,'%') and IDTema = IDETEMA;
END;
$$


DELIMITER $$
CREATE PROCEDURE BAlternativa(
	IN NumberQuestion int,
	IN NameAlternativa varchar(150)
)
BEGIN
	SELECT * FROM Alternativa WHERE Alternativa like concat(NameAlternativa,'%') and idPregunta = NumberQuestion;
END;
$$

/*XML INSERTAR PREGUNTA - ALTERNATIVA*/


DELIMITER $$
CREATE PROCEDURE insertar_alternativas(
IN IDE int,
IN _xml TEXT(150000)
)
BEGIN
	/*ALTERNATIVAS*/
	DECLARE i INT DEFAULT 1;
	DECLARE n INT DEFAULT 0;
	DECLARE alternativa VARCHAR(200) DEFAULT '';
	/*RESPUESTAS*/
	DECLARE respuesta VARCHAR(250) default '';
    /*ASIGNAR*/

	SET n = extractvalue(_xml, 'count(alternativas/alternativa)');

	WHILE i <= n DO
	   SET alternativa = ExtractValue(_xml, '//alternativa[$i]');
       SET respuesta = Extractvalue(_xml,'//respuesta[$i]');
       insert into Alternativa (Alternativa,Respuesta,idPregunta) values(alternativa,respuesta,IDE);
	   SET i = i+1;
	END WHILE;
END
$$
select * from Pregunta;
select * from alternativa;
insert into Pregunta(idpersona,descripcion,idtema,estado) values(2,'¿Qué es Sql?',3,1);
call insertar_alternativas(4,'<alternativas>
    <alternativa>Un Sistema Gestor de Base de Datos</alternativa>
    <alternativa>Un Programa</alternativa>
    <alternativa>Un framework</alternativa>
    <alternativa>Un Procedimiento</alternativa>
</alternativas>
,
<respuestas>
	<respuesta>1</respuesta>
	<respuesta>0</respuesta>
	<respuesta>0</respuesta>
	<respuesta>0</respuesta>
</respuestas>');
/*VALIDAR RESPUESTA*/

DELIMITER $$
CREATE PROCEDURE validar_respuesta(
	IN IDpregunta int,
    IN Res nvarchar(150)
)
BEGIN
	DECLARE correcto nvarchar(150) default '';
	select Alternativa into correcto from alternativa WHERE Respuesta = 'true' and idPregunta = IDpregunta;
    IF TRIM(Res) = correcto THEN
		SELECT 'CORRECTO' AS RESULTADO;
	ELSE
		SELECT 'INCORRECTO' AS RESULTADO;
    END IF;
END;
$$
