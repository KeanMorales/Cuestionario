<?php
session_start();
$str = $_SESSION['apellidos_y_nombres'];
$variable_nombre =  trim(explode('-', $str)[1]);
$variable_id = trim(explode('-', $str)[0]);
?>

<!DOCTYPE html>
<html>
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
  <style type="text/css">
  form {
      /* Sólo para centrar el formulario a la página */
      margin: 0 auto;
      width: 400px;
      /* Para ver el borde del formulario */
      padding: 1em;
      border: 1px solid #CCC;
      border-radius: 1em;
  }
  form div + div {
    margin-top: 1em;
}
label {
    /* Para asegurarse que todos los labels tienen el mismo tamaño y están alineados correctamente */
    display: inline-block;
    width: 90px;
    text-align: right;
}
input:focus, textarea:focus {
    /* Para dar un pequeño destaque en elementos activos*/
    border-color: #000;
}
textarea {
    /* Para alinear campos de texto multilínea con sus labels */
    vertical-align: top;

    /* Para dar suficiente espacio para escribir texto */
    height: 5em;

    /* Para permitir a los usuarios cambiar el tamaño de cualquier textarea verticalmente
        No funciona en todos los navegadores */
    resize: vertical;
}
.button {
    /* Para posicionar los botones a la misma posición que los campos de texto */
    padding-left: 90px; /* mismo tamaño a todos los elementos label */
}
button {
    /* Este margen extra representa aproximadamente el mismo espacio que el espacio
       entre los labels y sus campos de texto */
    margin-left: .5em;
  
}

    </style>


<title>Page Title</title>
</head>
<body>
  <section class="contact-wrap">
  </section>
  <!--     -->
  <div class="container-contact100">
    <div class="wrap-contact100">
      <form class="contact100-form validate-form" action="test_agregar_pregunta.php" method="post">

      <div>
          <label for="name">Persona:</label>
           <?php echo "<center><P> ".$variable_nombre."</P></center>";?>
      </div>
      <div>
           <p>Tema:
            <select name="combobox_1" class="mdl-textfield__input">
             <option value="0">Seleccione:</option>
             <?php
               $mysqli = new mysqli('localhost', 'root', '', 'cuestionario');
               $query = $mysqli -> query ("select * from tema");
               while ($valores = mysqli_fetch_array($query)) {
                 echo "<option value=$valores[idtema]>$valores[idtema]-$valores[nombre_tema]</option>";

               }
             ?>
           </select>

         </p>
       </div>
      <div>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input class="mdl-textfield__input" type="pregunta" name="pregunta" id="pregunta">
          <label class="mdl-textfield__label" for="sample3">Pregunta</label>
        </div>
      </div>
      <div class="alternativas">
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input class="mdl-textfield__input" type="pregunta_1" name="pregunta_1" id="pregunta_1">
          <label class="mdl-textfield__label" for="sample3">Pregunta_1:</label>
        </div>
        <input type="radio" name="gender" value="respuesta_1" checked>
        <br>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input class="mdl-textfield__input" type="pregunta_2" name="pregunta_2" id="pregunta_2">
          <label class="mdl-textfield__label" for="sample3">Pregunta_2:</label>
        </div>
        <input type="radio" name="gender" value="respuesta_2">
        <br>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input class="mdl-textfield__input" type="pregunta_3" name="pregunta_3" id="pregunta_3">
          <label class="mdl-textfield__label" for="sample3">Pregunta_3:</label>
        </div>
        <input type="radio" name="gender" value="respuesta_3">
        <br>
        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input class="mdl-textfield__input" type="pregunta_4" name="pregunta_4" id="pregunta_4">
          <label class="mdl-textfield__label" for="sample3">Pregunta_4:</label>
        </div>
        <input type="radio" name="gender" value="respuesta_4">
      </div>

      <!--<div class="button">
          <button type="submit">Ingresar</button>
      </div>-->

      <div class="container-contact100-form-btn">
        <div class="wrap-contact100-form-btn">
          <div class="contact100-form-bgbtn"></div>
          <button class="contact100-form-btn" type="submit">
            <span>
            INGRESAR
              <i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
            </span>
          </button>
        </div>
      </div>




</body>
</html>
