<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <?php

    class Consultas{

       public function cargarTemas(){
        # code...


          //Conexion a la DB
          $modelo = new Conexion();
    			$base =$modelo->get_conexion();

          $rows = null;
          $sentencia = $base->prepare("call MostrarTemas;");
          $sentencia->execute();


          while ($result = $sentencia->fetch()){
              $rows[] = $result;

          }
            return $rows;
        }

  }




/*
            function printResultSet(&$conjunto_filas) {

              foreach ($conjunto_filas as $fila) {
                  foreach ($fila as $columna) {
                      print $columna . "\t";
                  }
                  print "\n";
              }
              print "<br />";
          }*/


     ?>






  </body>
</html>
