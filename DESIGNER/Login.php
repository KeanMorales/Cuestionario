<?php
session_start();
$fecha_antigua=$_SESSION['ultimo_ingreso'];
$hora=date("y-n-j H:i:s");
$tiempo = (strtotime($hora)-strtotime($fecha_antigua));
if($tiempo>=60)
{
  session_destroy();
  header('location:ErrorSession.html');
}
else {
  if(!isset($_SESSION['id'])&&!isset($_SESSION['apellidos_y_nombres']))
  {
    header('location:Login.php');
    die();
  }
  else {
    ?>
    
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Acceso al Sistema</title>
    <!--<link rel="stylesheet" type="text/css" href="css/normalize.css">-->
    <!--<link rel="stylesheet" type="text/css" href="css/estilo.css">-->

    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="css/Responder.css">
    <link rel="stylesheet" href="css/fonts.css">
    <!--===============================USAR TODO ESTO================================================================-->
        <link rel="stylesheet" href="material desing lite/material.min.css">
        <script type="text/javascript" src="material desing lite/material.min.js"></script>
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="diseño/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="diseño/vendor/animate/animate.css">
        <link rel="stylesheet" type="text/css" href="diseño/vendor/css-hamburgers/hamburgers.min.css">
        <link rel="stylesheet" type="text/css" href="diseño/vendor/animsition/css/animsition.min.css">
        <link rel="stylesheet" type="text/css" href="diseño/vendor/select2/select2.min.css">
        <link rel="stylesheet" type="text/css" href="diseño/vendor/daterangepicker/daterangepicker.css">
        <link rel="stylesheet" type="text/css" href="diseño/css/util.css">
        <link rel="stylesheet" type="text/css" href="diseño/css/main1.css">
      <!--===============================================================================================-->

  </head>

  <body>
    <section class="contact-wrap">
      <!--<div class="Barra">
        <ul>
          <li><a href="MenuDesing.html"   class="icon-home"></a></li>

        </ul>
      </div>-->
    </section>

    <!--     -->
    <div class="container-contact100">
      <div class="wrap-contact100">
        <form class="contact100-form validate-form">
     <!--     -->
    <div class="wrapper">
      <form class="login" id="form" action="../DAO/LoginDAO.php" method="post" autocomplete="off">
        <span class="contact100-form-title">
          Registrese
        </span>

<tr>
  <center>
        <!-- Cajas Con Diseño Material Desing -->
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <tr>
            <td width="70%">
              <form action="#">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                  <input class="mdl-textfield__input" type="text"  name="usuario" id="usuario" autofocus required>
                  <label class="mdl-textfield__label" for="sample3">Usuario</label>
                </div>
              </form>
            </td>
          </tr>
        </div>

        <i class="fa fa-user"></i>

        <!-- Cajas Con Diseño Material Desing -->
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <tr>
            <td width="70%">
              <form action="#">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                  <input class="mdl-textfield__input" type="password"  name="contrasenia" id="contrasenia" required>
                  <label class="mdl-textfield__label" for="sample3">Contraseña</label>
                </div>
              </form>
            </td>
          </tr>
        </div>

        <i class="fa fa-key"></i>

      <!--  <button type="submit" name="login">
        <i class="spinner"></i>
        <span class="state">Ingresar</span>
        </button>
      -->

<!-- Diseño de Boton -->
        <div class="container-contact100-form-btn">
          <div class="wrap-contact100-form-btn">
            <div class="contact100-form-bgbtn"></div>
            <button class="contact100-form-btn" onclick="myFunction()" type="submit" name="login">
              <i class="spinner"></i>
              <span class="state">
                Ingresar
                <i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
              </span>
            </button>
          </div>
        </div>
      </center>
</tr>
      </form>
      <br><br>
      <footer>
        <span class="copyright">&copy;Todos los derechos reservados | Chincha <a href="#">HTML5</a>.</span>
      </footer>
    </div>
  </body>
</html>
