<?php
  require_once ('../DAL/DBAccess.php');
  require_once ('../DAO/MostrarTema.php');
  require_once ('../DAO/CargarTema.php');
 ?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

  </head>
  <body>

    <form method="POST" action="../DAO/InsertarTema.php">
      <table>
        <tr>
            <td>IdCurso:</td>
            <td><input type="text" name="IdCurso"></td>
        </tr>

        <tr>
            <td>Tema:</td>
            <td><input type="text" name="Tema"></td>
        </tr>

        <tr>

            <td>&nbsp;</td>
            <td><input type="submit" value="Insertar Tema"></td>
        </tr>
      </table>

  </form>



  </body>
</html>
