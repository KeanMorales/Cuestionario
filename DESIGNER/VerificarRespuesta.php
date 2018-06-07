<?php
require_once('../DAO/PreguntaDAO.php');
$PreguntaDAO = new PreguntaDAO();
$idpregunta = $_POST['idpregunta'];
$stm=$PreguntaDAO->verificar_respuesta($idpregunta,$_POST["idalternativa"]);
if($stm->rowcount()>0)
{
  echo 'LA RESPUESTA ES CORRECTA';
}
else {
  echo 'LA RESPUESTA ES INCORRECTA';
}

?>
<!--?php echo $_POST["alternativa"]?-->
