<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Acceso al Sistema</title>
    <link rel="stylesheet" type="text/css" href="css/normalize.css">
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
  </head>

  <body>

    <div class="wrapper">
      <form class="login" id="form" action="../DAO/LoginDAO.php" method="post" autocomplete="off">
        <p class="title">Registrese</p>
        <input type="text" placeholder="Usuario" name="usuario" id="usuario" autofocus required/>
        <i class="fa fa-user"></i>
        <input type="password" placeholder="Contraseña" name="contrasenia" id="contrasenia" required/>
        <i class="fa fa-key"></i>

        <button type="submit" name="login">
        <i class="spinner"></i>
        <span class="state">Ingresar</span>
        </button>
      </form>
      <footer><a href="#">Todos los derechos reservados | Chincha</a></footer>
    </div>
  </body>
</html>
