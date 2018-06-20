<?php
  require_once ('../DAL/DBAccess.php');
  require_once ('../DAO/Mostrarcurso.php');
  require_once ('../DAO/CargaCursos.php');
 ?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    <form method="POST" action="../DAO/InsertarCurso.php">
      <table>

        <tr>
            <td>Curso:</td>
            <td><input type="text" name="Nombre"></td>
        </tr>

        <tr>

            <td>&nbsp;</td>
            <td><input type="submit" value="Insertar Curso"></td>
        </tr>
      </table>

  </form>

    <br />
      <br />
        <br />
  <h1>Mis Cursos</h1>
   <?php cargar();  ?>








  </body>
</html>
