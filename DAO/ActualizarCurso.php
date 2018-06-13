<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <?php

          require_once ('../Conexion/conexion.php');

        try {

          //conexion a la DB mediante la funcion
          $modelo = new Conexion();
          $base =$modelo->get_conexion();

          //CONSULTA PREPARADA


          $sentencia = $base->prepare("CALL ActualizarCurso(?,?,?)");
          $idcurso = $_POST['IdCurso'];
          $nombre = $_POST['Nombre'];
          $estado = $_POST['Estado'];
          $sentencia->bindParam(1, $idcurso, PDO::PARAM_STR|PDO::PARAM_INPUT_OUTPUT, 4000);
          $sentencia->bindParam(2, $nombre, PDO::PARAM_STR|PDO::PARAM_INPUT_OUTPUT, 4000);
          $sentencia->bindParam(3, $estado, PDO::PARAM_STR|PDO::PARAM_INPUT_OUTPUT, 4000);
          //$nombre = 'Diseño Web';
          // llamar al procedimiento almacenado
          $sentencia->execute();

          print "El procedimiento devolvió $idcurso <br /> ";
          print "El procedimiento devolvió $nombre <br />";
          print "El procedimiento devolvió $estado <br /> ";

          echo '<br> <br> Conexion correcta';


        } catch (Exception $e) {
          die('Error : '.$e->GetMessage());
        }finally{
         $base=null;
        }

        ?>






  </body>
</html>
