-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-06-2018 a las 04:21:42
-- Versión del servidor: 10.1.33-MariaDB
-- Versión de PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cuestionario`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCurso` (IN `IDE` INT, IN `NombreCurActu` VARCHAR(500))  BEGIN
	UPDATE Curso set nombre = NombreCurActu where idcurso=IDE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarTema` (IN `IDETEMA` INT, IN `NomNuevoTema` VARCHAR(500))  BEGIN
    update Tema set nombre_tema = NomNuevoTema where idtema = IDETEMA;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BAlternativa` (IN `NumberQuestion` INT, IN `NameAlternativa` VARCHAR(150))  BEGIN
	SELECT * FROM Alternativa WHERE alternativa like concat(NameAlternativa,'%') and idPregunta = NumberQuestion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BCurso` (IN `NameCurso` VARCHAR(150))  BEGIN
	SELECT * FROM Curso WHERE nombre like concat(NameCurso,'%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BPregunta` (IN `IDETEMA` VARCHAR(150), IN `NamePregunta` VARCHAR(150))  BEGIN
	SELECT * FROM Pregunta WHERE Descripcion like concat('%',NamePregunta,'%') and IDTema = IDETEMA;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BTema` (IN `IDECurso` INT, IN `NameTema` VARCHAR(150))  BEGIN
	SELECT * FROM Tema WHERE NombreTema like concat(NameTema,'%') and idCurso = IDECurso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCurso` (IN `IDE` INT)  BEGIN
	UPDATE Curso set estado = '0' WHERE idcurso=IDE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarTema` (IN `IDETEMA` INT)  BEGIN
	UPDATE Tema set estado = '0' WHERE idtema = IDETEMA;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCurso` (IN `NomCurso` VARCHAR(150), IN `Est` VARCHAR(100))  BEGIN
	INSERT INTO curso (Nombre,estado) VALUES (NomCurso,Est);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPreAlter` (IN `IDEPersona` INT, IN `IDETema` INT, IN `Pregunta` VARCHAR(150), IN `A1` VARCHAR(150), IN `R1` BOOLEAN, IN `A2` VARCHAR(150), IN `R2` BOOLEAN, IN `A3` VARCHAR(150), IN `R3` BOOLEAN, IN `A4` VARCHAR(150), IN `R4` BOOLEAN)  BEGIN
	DECLARE IDEPREGUNTA int default 0;
	INSERT INTO Pregunta(idpersona,descripcion,idtema,estado) values(IDEPersona,Pregunta,IDETema,'1');
    select idpregunta into IDEPREGUNTA FROM pregunta WHERE descripcion = Pregunta;
    insert into alternativa(alternativa,respuesta,idpregunta)values(A1,R1,IDEPREGUNTA);
    insert into alternativa(alternativa,respuesta,idpregunta)values(A2,R2,IDEPREGUNTA);
    insert into alternativa(alternativa,respuesta,idpregunta)values(A3,R3,IDEPREGUNTA);
    insert into alternativa(alternativa,respuesta,idpregunta)values(A4,R4,IDEPREGUNTA);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPregunta` (IN `IDEPersona` INT, IN `Descrip` VARCHAR(150), IN `IDETema` INT, IN `Est` VARCHAR(150))  BEGIN
    insert into pregunta(idpersona,descripcion,idtema,estado) VALUES(IDEPersona,Descrip,IDETema,Est); 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarTema` (IN `IDECurso` INT, IN `NomTEMA` VARCHAR(150), IN `Est` VARCHAR(100))  BEGIN
    insert into Tema(idcurso,nombre_tema,estado) VALUES(IDECurso,NomTEMA,Est); 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_alternativas` (IN `IDE` INT, IN `_xml` TEXT(150000))  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarIdeTemas` (IN `NombreCurso` VARCHAR(150))  BEGIN
	select c.idcurso,t.nombre_tema from curso c inner join Tema t on t.idcurso = c.idcurso where c.nombre=NombreCurso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarCursos` ()  BEGIN
	select * from Curso;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MostrarTemas` ()  BEGIN
	SELECT * FROM Tema;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `up_listar_pregunta_alternativas` (IN `_idtema` INT)  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `up_usuario` (IN `_nombre` VARCHAR(50), IN `_contrasenia` VARCHAR(100))  BEGIN
SELECT p.idpersona, u.nombre, u.contrasenia,CONCAT(p.idpersona,'-',p.apellidos,', ',p.nombres)
AS 'APELLIDOS_Y_NOMBRES'FROM usuario u
INNER JOIN persona p ON u.idpersona = p.idpersona
WHERE nombre=_nombre AND contrasenia=_contrasenia;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `up_verificar_respuesta` (IN `_idpregunta` INT, IN `_idalternativa` INT)  BEGIN
	select * from alternativa where idalternativa=_idalternativa and idpregunta = _idpregunta AND respuesta = '1';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validar_respuesta` (IN `IDpregunta` INT, IN `Res` NVARCHAR(150))  BEGIN
	DECLARE correcto nvarchar(150) default '';
	select Alternativa into correcto from alternativa WHERE Respuesta = 'true' and idPregunta = IDpregunta;
    IF TRIM(Res) = correcto THEN
		SELECT 'CORRECTO' AS RESULTADO;
	ELSE
		SELECT 'INCORRECTO' AS RESULTADO;
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alternativa`
--

CREATE TABLE `alternativa` (
  `idalternativa` int(11) NOT NULL,
  `alternativa` varchar(500) NOT NULL,
  `respuesta` tinyint(1) NOT NULL,
  `idpregunta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alternativa`
--

INSERT INTO `alternativa` (`idalternativa`, `alternativa`, `respuesta`, `idpregunta`) VALUES
(1, 'UN FRAMEWORK', 0, 1),
(2, 'LENGUAJE DE PROGRAMACION', 1, 1),
(3, 'UNA SINTAXIS', 0, 1),
(4, 'UN IDE', 0, 1),
(5, 'UNA PLATAFORMA DE DESARROLLO', 0, 1),
(6, 'POLIMORFISMO', 0, 2),
(7, 'ENCAPSULAMIENTO', 1, 2),
(8, 'SOBRECARGA', 0, 2),
(9, 'INSTANCIA', 0, 2),
(10, 'HERENCIA', 0, 2),
(11, 'HERENCIA', 0, 3),
(12, 'ASOCIACION', 0, 3),
(13, 'INTERFAZ', 1, 3),
(14, 'CLASE', 0, 3),
(15, 'OBJETO', 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `idcurso` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `estado` varchar(500) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`idcurso`, `nombre`, `estado`) VALUES
(1, 'PROGRAMACION', '1'),
(4, 'ESTADISTICA', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `dni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `nombres`, `apellidos`, `dni`) VALUES
(1, 'juan', 'donaires ruiz', 44369835);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `idpregunta` int(11) NOT NULL,
  `idpersona` int(11) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `idtema` int(11) DEFAULT NULL,
  `estado` varchar(500) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`idpregunta`, `idpersona`, `descripcion`, `idtema`, `estado`) VALUES
(1, 1, '¿QUE ES JAVA?', 1, '1'),
(2, 1, 'INDICA QUE HACE PERO NO COMO LO HACE', 2, '1'),
(3, 1, 'MUESTRA UN CONJUNTO DE METODOS TOTALMENTE ABSTRACTOS', 2, '1'),
(4, 1, 'Que logramos con Android Studio', 4, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tema`
--

CREATE TABLE `tema` (
  `idtema` int(11) NOT NULL,
  `idcurso` int(11) DEFAULT NULL,
  `nombre_tema` varchar(500) NOT NULL,
  `estado` varchar(500) NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tema`
--

INSERT INTO `tema` (`idtema`, `idcurso`, `nombre_tema`, `estado`) VALUES
(1, 1, 'FUNDAMENTOS', '1'),
(2, 1, 'POO', '1'),
(4, 4, 'PROGRAMACION LINEAL', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idpersona` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `contrasenia` varchar(100) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idpersona`, `nombre`, `contrasenia`, `tipo`) VALUES
(1, 'jdr', '123', 'docente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alternativa`
--
ALTER TABLE `alternativa`
  ADD PRIMARY KEY (`idalternativa`),
  ADD KEY `idpregunta` (`idpregunta`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`idcurso`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`idpregunta`),
  ADD UNIQUE KEY `descripcion` (`descripcion`),
  ADD KEY `idtema` (`idtema`),
  ADD KEY `FK_pregunta_persona` (`idpersona`);

--
-- Indices de la tabla `tema`
--
ALTER TABLE `tema`
  ADD PRIMARY KEY (`idtema`),
  ADD UNIQUE KEY `nombre_tema` (`nombre_tema`),
  ADD KEY `idcurso` (`idcurso`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idpersona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alternativa`
--
ALTER TABLE `alternativa`
  MODIFY `idalternativa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `idcurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `idpregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tema`
--
ALTER TABLE `tema`
  MODIFY `idtema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alternativa`
--
ALTER TABLE `alternativa`
  ADD CONSTRAINT `alternativa_ibfk_1` FOREIGN KEY (`idpregunta`) REFERENCES `pregunta` (`idpregunta`);

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `FK_pregunta_persona` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`),
  ADD CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`idtema`) REFERENCES `tema` (`idtema`);

--
-- Filtros para la tabla `tema`
--
ALTER TABLE `tema`
  ADD CONSTRAINT `tema_ibfk_1` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_persona` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
