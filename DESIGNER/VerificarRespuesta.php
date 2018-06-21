
<!--?php echo $_POST["alternativa"]?-->
<!DOCTYPE html>
<html lang="es" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
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
    </section>
    <!--     -->
    <div class="container-contact100">
      <div class="wrap-contact100">
        <form class="contact100-form validate-form">
    <!--Funcion Para Regresar a la pagina anterior Despues de 2sg-->
    <script>
      function r(){
        location.href="MostrarPregunta.php"
      }
      setTimeout("r()",2000);
    </script>
    <!---->
    <table>
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
    </table>
  </body>
</html>
