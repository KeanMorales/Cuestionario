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
          $sentencia = $base->prepare("CALL InsertarTema(?,?)");

          $Id = $_POST['IdCurso'];
          $nombre = $_POST['Nombre'];
          $sentencia->bindParam(1, $Id, PDO::PARAM_STR|PDO::PARAM_INPUT_OUTPUT, 4000);
          $sentencia->bindParam(2, $nombre, PDO::PARAM_STR|PDO::PARAM_INPUT_OUTPUT, 4000);

          $sentencia->execute();

          print "El procedimiento devolvió $Id\n";
          print "El procedimiento devolvió $nombre\n";

          echo '<br> <br> Conexion correcta';


        } catch (Exception $e) {
          die('Error : '.$e->GetMessage());
        }finally{
         $base=null;
        }





     ?>






  </body>
</html>
