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

          //Conexion a la DB
          $modelo = new Conexion();
    			$base =$modelo->get_conexion();


          //CONSULTA PREPARADA
          $sentencia = $base->prepare("call EliminarCurso(?);");
          $Id = $_POST['Id'];
          $sentencia->bindParam(1,$Id, PDO::PARAM_STR|PDO::PARAM_INPUT_OUTPUT, 4000);
          //$nombre = 'Diseño Web';
          // llamar al procedimiento almacenado
          $sentencia->execute();

          print "El procedimiento devolvió $Id\n";

          echo '<br> <br> Conexion correcta';


        } catch (Exception $e) {
          die('Error : '.$e->GetMessage());
        }finally{
         $base=null;
        }





     ?>






  </body>
</html>
