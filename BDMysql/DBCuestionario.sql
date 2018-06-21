create database Cuestionario;

use Cuestionario;
/*TABLA PERSONA*/
create table persona(
	idpersona int auto_increment primary key, /*INCREMENTA DE ACUERDO A LOS REGISTROS INSERTADOS*/
    nombres varchar(50) not null, /*NO PERMITE VALORES NULOS*/
    apellidos varchar(50) not null, /*NO PERMITE VALORES NULOS*/
    dni varchar(11) not null /*NO PERMITE VALORES NULOS*/
);
/*UNA PERSONA SOLO PUEDE TENER UN USUARIO, POR LO QUE EL idpersona 
FUNCIONA COMO LLAVE PRIMARIA Y LLAVEA FORANEA A LA VEZ*/
create table usuario(
	primary key(idpersona), 
	nombre varchar(50) not null, /*NO PERMITE VALORES NULOS*/
    contrasenia varchar(50) not null, /*NO PERMITE VALORES NULOS*/
    tipo varchar(20) not null, /*NO PERMITE VALORES NULOS*/
    foreign key(idpersona) references persona(idpersona)
);
create table curso(
	idcurso int auto_increment primary key, /*INCREMENTA DE ACUERDO A LOS REGISTROS INSERTADOS*/
	nombre varchar(500) not null UNIQUE, /*NO PERMITE VALORES NULOS Y SOLO UNICOS, NO DUPLICADOS*/
    estado varchar(500) not null default 'Activo' /*NO PERMITE VALORES NULOS Y POR DEFECTO SE AÑADE ACTIVO*/
);
create table tema(
	idtema int auto_increment primary key, /*INCREMENTA DE ACUERDO A LOS REGISTROS INSERTADOS*/
    nombre_tema varchar(500) not null UNIQUE, /*NO PERMITE VALORES NULOS Y SOLO UNICOS, NO DUPLICADOS*/
    idcurso int,
    estado varchar(500) not null default 'Activo', /*NO PERMITE VALORES NULOS Y POR DEFECTO SE AÑADE ACTIVO*/
    foreign key (idCurso) references curso(idcurso) /*LLAVE FORANEA DE LA TABLA CURSO*/
);
create table Pregunta(
	idpregunta int auto_increment primary key, /*INCREMENTA DE ACUERDO A LOS REGISTROS INSERTADOS*/
    idpersona int,
    foreign key (idpersona) references persona(idpersona), /*LLAVE FORANEA DE LA TABLA PERSONA*/
    descripcion varchar(500) not null UNIQUE, /*NO PERMITE VALORES NULOS Y SOLO UNICOS, NO DUPLICADOS*/
    idtema int,
    estado varchar(500) not null default 'Activo', /*NO PERMITE VALORES NULOS Y POR DEFECTO SE AÑADE ACTIVO*/
    foreign key (idtema) references tema(idtema) /*LLAVE FORANEA DE LA TABLA PERSONA*/
);
create table Alternativa(
	idalternativa int auto_increment primary key,/*INCREMENTA DE ACUERDO A LOS REGISTROS INSERTADOS*/
    alternativa varchar(500) not null, /*NO PERMITE VALORES NULOS*/
    respuesta boolean not null, /*NO PERMITE VALORES NULOS Y ACEPTA SOLO VERDADERO(TRUE) O FALSO(FALSE)*/
    idPregunta int,
    foreign key (idPregunta) references pregunta(idpregunta) /*LLAVE FORANEA DE LA TABLA PREGUNTA*/
);


/*INSERCIONES DE REGISTROS*/


insert  into `persona`(`idpersona`,`nombres`,`apellidos`,`dni`) values (1,'juan','donaires ruiz',44369835);
insert  into `usuario`(`idpersona`,`nombre`,`contrasenia`,`tipo`) values (1,'jdr','123','docente');
insert  into `curso`(`idcurso`,`nombre`,`estado`) values (1,'PROGRAMACION','1');
insert  into `tema`(`idtema`,`idcurso`,`nombre_tema`,`estado`) values (1,1,'FUNDAMENTOS','1'),(2,1,'POO','1');
insert  into `pregunta`(`idpregunta`,`idpersona`,`descripcion`,`idtema`,`estado`) values (1,1,'¿QUE ES JAVA?',1,'1'),(2,1,'INDICA QUE HACE PERO NO COMO LO HACE',2,'1'),(3,1,'MUESTRA UN CONJUNTO DE METODOS TOTALMENTE ABSTRACTOS',2,'1');
insert  into `alternativa`(`idalternativa`,`alternativa`,`respuesta`,`idpregunta`) values (1,'UN FRAMEWORK',0,1),(2,'LENGUAJE DE PROGRAMACION',1,1),(3,'UNA SINTAXIS',0,1),(4,'UN IDE',0,1),(5,'UNA PLATAFORMA DE DESARROLLO',0,1),(6,'POLIMORFISMO',0,2),(7,'ENCAPSULAMIENTO',1,2),(8,'SOBRECARGA',0,2),(9,'INSTANCIA',0,2),(10,'HERENCIA',0,2),(11,'HERENCIA',0,3),(12,'ASOCIACION',0,3),(13,'INTERFAZ',1,3),(14,'CLASE',0,3),(15,'OBJETO',0,3);

/*PROCEDIMIENTOS ALMACENADOS*/

DELIMITER $$
CREATE  PROCEDURE `up_listar_pregunta_alternativas`(
      in _idtema int
)
BEGIN
		/*DECLARANDO VARIABLE DE TIPO ENTERO*/
	   DECLARE idpregunta_aleatoria INT DEFAULT 0;
	   /*Eliminar la tabla temporal si es que existe*/
	   DROP TABLE IF EXISTS temporal;
       /*Crear tabla temporal*/
       CREATE TEMPORARY TABLE temporal
	   (
  	   id int NOT NULL,
  	   descripcion varCHAR(500) NOT NULL
	   );

	   /*Hacer un select donde el idpregunta se va almacenar dentro de idpregunta_aleatoria ordenandolo de manera aleatoria*/
	   SELECT p.idpregunta into idpregunta_aleatoria FROM pregunta p WHERE p.idtema = _idtema ORDER BY RAND() LIMIT 1;
       /*Haciendo una insercion a la tabla temporal mediante un SELECT */
	   INSERT INTO temporal (id,descripcion)
	   SELECT p.idpregunta,CONCAT('PREGUNTA: ',p.descripcion) FROM pregunta p WHERE p.idpregunta = idpregunta_aleatoria;

	   INSERT INTO temporal (id,descripcion)
	   SELECT idalternativa, a.alternativa from pregunta p
	   inner join alternativa a on a.idpregunta = p.idpregunta
	   where p.idpregunta = idpregunta_aleatoria
	   ORDER BY RAND();
	   /*Mostrando la tabla temporal*/
	   SELECT * FROM temporal;
END
$$;
select * from Pregunta;
SELECT * FROM Alternativa;
CALL up_listar_pregunta_alternativas(2);
/* Procedure structure for procedure `up_usuario` */

"/*!50003 DROP PROCEDURE IF EXISTS  `up_usuario` */";

DELIMITER $$
CREATE PROCEDURE `up_usuario`(
/*Creacion de dos parametros*/
IN _nombre VARCHAR(50),
IN _contrasenia VARCHAR(100)
)
BEGIN
	/*Se va mostrar el idpersona, su nombre, contraseña y concatenando 
    su apellidos y nombres*/
	SELECT p.idpersona, u.nombre, u.contrasenia,CONCAT(p.apellidos,', ',p.nombres)
	AS 'APELLIDOS_Y_NOMBRES'FROM usuario u
	INNER JOIN persona p ON u.idpersona = p.idpersona
	WHERE nombre=_nombre AND contrasenia=_contrasenia;
END;
$$
call up_usuario('jdr','123');

/* Procedure structure for procedure `up_verificar_respuesta` */

"/*!50003 DROP PROCEDURE IF EXISTS  `up_verificar_respuesta` */";

DELIMITER $$
/*Este procedimiento mostrará la alternativa correcta de cada pregunta*/
CREATE  PROCEDURE `up_verificar_respuesta`(
IN _idpregunta INT,
IN _idalternativa INT
)
BEGIN
	select * from alternativa where idalternativa=_idalternativa and idpregunta = _idpregunta AND respuesta = '1';
END;
$$
call up_verificar_respuesta(1,2);
select * from Pregunta;
select * from Alternativa;

/*PROCEDURE CURSOS*/
/*Este procedimiento insertará cursos a través del nombre que le pasemos como parametro*/
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
select * from Curso;
/*Este procedimiento actualizará los cursos por medio de su id y el nombre nuevo del curso*/
DELIMITER $$
CREATE PROCEDURE ActualizarCurso(
	In IDE int,
    In NombreCurActu varchar(500)
)
BEGIN
	UPDATE Curso set NombreCurso = NombreCurActu where IdCurso=IDE;
END;
$$

/*Este procedimiento cambiará el estado del curso por medio de su ID cambiandolo a Anulado*/
DELIMITER $$
CREATE PROCEDURE EliminarCurso(
	In IDE int
)
BEGIN
	UPDATE Curso set Estado = 'Anulado' WHERE IdCurso=IDE;
END;
$$

/*Este procedimiento mostrará los curso por medio de un select*/
DELIMITER $$
CREATE PROCEDURE MostrarCursos()
BEGIN
	select * from Curso;
END;
$$


/*PROCEDURE TEMA*/

/*Este procedimiento insertara un tema por medio de su ID y su nombre*/
DELIMITER $$
CREATE PROCEDURE InsertarTema(
	IN IDE int,
	IN NomTema varchar(500)
)
BEGIN
	insert into Tema(NombreTema, idCurso) values(NomTema,IDE);
END;
$$
/*Este procedimiento actualizará un tema por medio de su id, el id del tema y el nombre del nuevo tema*/
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
/*Este procedimiento eliminará un tema por medio del idcurso y el idtema, cambiando su estado a anulado*/
DELIMITER $$
CREATE PROCEDURE EliminarTema(
	IN IDECurso int,
    IN IDETEMA int
)
BEGIN
	UPDATE Tema set Estado = 'Anulado' WHERE IdTema = IDETEMA and idCurso = IDECurso;
END;
$$
/*Este procedimiento mostrara los temas*/
DELIMITER $$
CREATE PROCEDURE MostrarTemas()
BEGIN
	SELECT * FROM Tema;
END;
$$


/*PROCEDURE BUSCAR*/
/*Este procedimiento buscara los cursos por medio de su nombre*/
DELIMITER $$
CREATE PROCEDURE BCurso(
	IN NameCurso varchar(150)
)
BEGIN
	SELECT * FROM Curso WHERE NombreCurso like concat(NameCurso,'%');
END;
$$
/*Este procedimiento buscara los temas por medio del id del curso y su nombre del tema*/
DELIMITER $$
CREATE PROCEDURE BTema(
	IN IDECurso int,
	IN NameTema varchar(150)
)
BEGIN
	SELECT * FROM Tema WHERE NombreTema like concat(NameTema,'%') and idCurso = IDECurso;
END;
$$

/*Este procedimiento buscará las preguntas por medio del IdeTema y su nombre de la pregunta*/
DELIMITER $$
CREATE PROCEDURE BPregunta(
	IN IDETEMA varchar(150),
	IN NamePregunta varchar(150)
)
BEGIN
	SELECT * FROM Pregunta WHERE Descripcion like concat('%',NamePregunta,'%') and IDTema = IDETEMA;
END;
$$

/*Este procedimiento buscara las alternativas por medio del numero de la pregunta y su alternativa*/
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
	/*VARIABLES DE LAS ALTERNATIVAS*/
	DECLARE i INT DEFAULT 1;
	DECLARE n INT DEFAULT 0;
	DECLARE alternativa VARCHAR(200) DEFAULT '';
	/*VARIABLES DE LAS RESPUESTAS*/
	DECLARE respuesta VARCHAR(250) default '';
    /*ASIGNACIÓN*/

	SET n = extractvalue(_xml, 'count(alternativas/alternativa)');

	WHILE i <= n DO
	   SET alternativa = ExtractValue(_xml, '//alternativa[$i]');
       SET respuesta = Extractvalue(_xml,'//respuesta[$i]');
       insert into Alternativa (Alternativa,Respuesta,idPregunta) values(alternativa,respuesta,IDE);
	   SET i = i+1;
	END WHILE;
END
$$

/*VALIDAR RESPUESTA*/
/*ESTE PROCEDIMIENTO VALIDARÁ LA RESPUESTA POR MEDIO DE EL IDPREGUNTA Y SU RESPUESTA*/
DELIMITER $$
CREATE PROCEDURE validar_respuesta(
	IN IDEPregunta int,
    IN Res nvarchar(150)
)
BEGIN
	DECLARE correcto nvarchar(150) default '';
	select a.alternativa into correcto from alternativa a inner join pregunta p on a.idpregunta=p.idpregunta WHERE a.respuesta = '1' and p.idpregunta= IDEPregunta;
    IF TRIM(Res) = correcto THEN
		SELECT 'CORRECTO' AS RESULTADO;
	ELSE
		SELECT 'INCORRECTO' AS RESULTADO;
    END IF;
END;
$$

call validar_respuesta(3,'INTERFAZ');

select * from Pregunta;
select * from Alternativa;

/*Procedure Lista Curso*/
DELIMITER $$
CREATE PROCEDURE ListarIdeTemas(
	In NombreCurso nvarchar(150)
)
BEGIN
	select c.idcurso,t.nombre_tema from curso c inner join Tema t on c.nombre=NombreCurso;
END;
$$
/*Procedure Insertar Pregunta Alternativa*/
SELECT * FROM Pregunta;
SELECT * FROM Alternativa;
DELIMITER $$
CREATE PROCEDURE InsertarPreAlter(
	IN IDEPersona int,
    IN IDETema int,
    IN Pregunta varchar(150),
    IN A1 varchar(150),
    IN R1 boolean,
    IN A2 varchar(150),
    IN R2 boolean,
    IN A3 varchar(150),
    IN R3 boolean,
    IN A4 varchar(150),
    IN R4 boolean
)
BEGIN
	DECLARE IDEPREGUNTA int default 0;
	INSERT INTO Pregunta(idpersona,descripcion,idtema,estado) values(IDEPersona,Pregunta,IDETema,'1');
    select idpregunta into IDEPREGUNTA FROM pregunta WHERE descripcion = Pregunta;
    insert into alternativa(alternativa,respuesta,idpregunta)values(A1,R1,IDEPREGUNTA);
    insert into alternativa(alternativa,respuesta,idpregunta)values(A2,R2,IDEPREGUNTA);
    insert into alternativa(alternativa,respuesta,idpregunta)values(A3,R3,IDEPREGUNTA);
    insert into alternativa(alternativa,respuesta,idpregunta)values(A4,R4,IDEPREGUNTA);
END;
$$
CALL InsertarPregunta('1','¿ QUÉ ES POO ?',2,'1');
CALL InsertarPreAlter('1',2,'Abstract en Java','No deja instanciar',true,'Si deja instanciar',false,'Es malo',false,'Es bueno',false);
