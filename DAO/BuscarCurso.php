<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <?php

    class Consultas{

       public function cargarCursos(){
        # code...


          //Conexion a la DB
          $modelo = new Conexion();
          $base =$modelo->get_conexion();

          $rows = null;
          $sentencia = $base->prepare("call BCurso(?)");
          $nombre = $_POST['Nombre'];
          $sentencia->bindParam(1, $nombre, PDO::PARAM_STR|PDO::PARAM_INPUT_OUTPUT, 4000);
          $sentencia->execute();


          while ($result = $sentencia->fetch()){
              $rows[] = $result;
              print "El procedimiento devolvió $rows\n";

          }
            return $rows;
            //  cargar();
        }
      //    cargar();
  }




     ?>


  </body>
</html>
