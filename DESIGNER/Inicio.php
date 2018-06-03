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
    echo "<title>Inicio</title>";
    echo "<center><h1><P>BIENVENIDO AL SISTEMA</P></h1></center>";
    echo "ID: ".$_SESSION['id']."<br/>";
    echo "APELLIDOS Y NOMBRES: ".$_SESSION['apellidos_y_nombres'];
  }
}

?>
