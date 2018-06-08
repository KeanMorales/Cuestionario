

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
  `nombre` varchar(500) NOT NULL,
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
  `nombre_tema` varchar(500) NOT NULL,
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

/*!50003 DROP PROCEDURE IF EXISTS  `up_listar_pregunta_alternativas` */;

DELIMITER $$

!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `up_listar_pregunta_alternativas`(
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

/*!50003 DROP PROCEDURE IF EXISTS  `up_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `up_usuario`(
IN _nombre VARCHAR(50),
IN _contrasenia VARCHAR(100)
)
BEGIN
SELECT p.idpersona, u.nombre, u.contrasenia,CONCAT(p.apellidos,', ',p.nombres)
AS 'APELLIDOS_Y_NOMBRES'FROM usuario u
INNER JOIN persona p ON u.idpersona = p.idpersona
WHERE nombre=_nombre AND contrasenia=_contrasenia;
END */$$
DELIMITER ;

/* Procedure structure for procedure `up_verificar_respuesta` */

/*!50003 DROP PROCEDURE IF EXISTS  `up_verificar_respuesta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `up_verificar_respuesta`(
IN _idpregunta INT,
IN _idalternativa INT
)
BEGIN
	select * from alternativa where idalternativa=_idalternativa and idpregunta = _idpregunta AND respuesta = '1';
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
