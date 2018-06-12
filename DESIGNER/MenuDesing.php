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
<html lang="es" dir="ltr">
  <head>
    <meta charset="UTF-8">
	   <title>Menu</title>
	   <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" >

	   <link rel="stylesheet" href="css/fonts.css">
	   <script src="http://code.jquery.com/jquery-latest.js"></script>
	   <script src="js/MenuDesing.js"></script>
	   <link rel="stylesheet" href="diseño/css/main.css" />
  </head>

  <body class="loading">
		<div id="wrapper">
			<div id="bg"></div>
			<div id="overlay"></div>
			<div id="main">

				<!-- Header -->
					<header id="header">
						<h1>Intranet</h1>
						<p> Mentes &nbsp;&bull;&nbsp; Futuras</p>
						<nav>
							<ul>
								<li><a href="MenuDesing.html" class="icon-home"><span class="label">Inicio</span></a></li>
								<li><a href="Seleccionar.html" class="icon-question"><span>Ingresar Preguntas</span></a></li>
								<li><a href="Responder.html" class="icon-pencil"><span class="label">Responder Preguntas</span></a></li>
								<li><a href="info.html" class="icon-profile"><span class="label">Contacto</span></a></li>
							</ul>
						</nav>
					</header>

				<!-- Footer -->
  <footer id='footer'>
            <?php
            echo "<center><h1><P>BIENVENIDO AL SISTEMA: ".$_SESSION['apellidos_y_nombres']."</P></h1></center>";
            echo "<center><h5><P>ID: ".$_SESSION['apellidos_y_nombres']."</P></h5></center>";


          }
        }

          ?>
          </footer>

			</div>
		</div>

		<script>
			window.onload = function() { document.body.className = ''; }
			window.ontouchmove = function() { return false; }
			window.onorientationchange = function() { document.body.scrollTop = 0; }
		</script>
</html>
