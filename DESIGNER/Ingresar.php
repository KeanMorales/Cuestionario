

    <!DOCTYPE html>
    <html lang="es" dir="ltr">
      <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" href="css/Ingresar.css">
        <link rel="stylesheet" href="css/fonts.css">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
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
          <div class="Barra">
            <ul>
              <li><a href="MenuDesing.php"   class="icon-home"></a></li>
              <li><a href="Ingresar.php"     class="icon-loop"></a></li>
              <li><a href="Seleccionar.php"  class="icon-arrow-left"></a></li>
              <!--<li><a href="#" class="icon-database"></a></li>-->
            </ul>
          </div>
        </section>

        <!--     -->
        <div class="container-contact100">
       		<div class="wrap-contact100">
       			<form class="contact100-form validate-form">
       				<span class="contact100-form-title">
       					Ingrese Preguntas y Respuestas
       				</span>

        <table>
            <tr>
            <td width="2%">Ingrese Pregunta:</td>
            <td width="2%">
              <form action="#">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                  <input class="mdl-textfield__input" type="text" id="sample3">
                  <label class="mdl-textfield__label" for="sample3">Ingrese Pregunta</label>
                </div>
              </form>
            </td>
            </tr>
          </table>

              <form class="centro" name="formulario" id="formulario" method="POST">
              <table class="tabla" border="0" cellpadding="0" cellspacing="0" width="70%">

              <!--<tr>
              <td width="60%">Ingrese Pregunta:</td>
              <td width="60%">
                <form action="#">
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="text" id="sample3">
                    <label class="mdl-textfield__label" for="sample3">Ingrese Pregunta</label>
                  </div>
                </form>
              </td>
              </tr>
            -->
              <center>
              <tr>
              <td width="60%">
                <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-1">
                <input type="radio" id="option-1" class="mdl-radio__button" name="options" value="1" checked>
                  <span class="mdl-radio__label"></span>
                </label>
              </td>
              <td width="60%">
                <form action="#">
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="text" id="t1">
                    <label class="mdl-textfield__label" for="sample3">Respuesta 1</label>
                  </div>
                </form>
              </td>
              </tr>

              <tr>
              <td width="60%">
                <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-2">
                  <input type="radio" id="option-2" class="mdl-radio__button" name="options" value="2">
                  <span class="mdl-radio__label"></span>
                </label>
              </td>
              <td width="60%">
                <form action="#">
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="text" id="t2">
                    <label class="mdl-textfield__label" for="sample3">Respuesta 2</label>
                  </div>
                </form>
              </td>
              </tr>

              <tr>
              <td width="60%">
                <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-3">
                  <input type="radio" id="option-3" class="mdl-radio__button" name="options" value="3" >
                  <span class="mdl-radio__label"></span>
                </label>
              </td>
              <td width="60%">
                <form action="#">
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="text" id="t3">
                    <label class="mdl-textfield__label" for="sample3">Respuesta 3</label>
                  </div>
                </form>
              </td>
              </tr>

              <tr>
              <td width="60%">
                <label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="option-4">
                  <input type="radio" id="option-4" class="mdl-radio__button" name="options" value="4" >
                  <span class="mdl-radio__label"></span>
                </label>
              </td>
              <td width="60%">
                <form action="#">
                  <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                    <input class="mdl-textfield__input" type="text" id="t4">
                    <label class="mdl-textfield__label" for="sample3">Respuesta 4</label>
                  </div>
                </form>
              </td>
              </tr>
              </center>
              </table>
              </form>
          </center>
          <br><br>
          <button class="button icon-checkmark" type="button" id="boton" value="" onclick="myHN()">
          <button class="button2" type="button" >Guarda
        </div>

        <script>
          function myHN() {
          // var a = document.getElementById("radio");

          if (document.getElementById("option-1").checked) {
              var rpta = document.getElementById("t1").value;
              alert(rpta);
          }
          if (document.getElementById("option-2").checked) {
              var rpta = document.getElementById("t2").value;
              alert(rpta);
          }
          if (document.getElementById("option-3").checked) {
              var rpta = document.getElementById("t3").value;
              alert(rpta);
          }
          if (document.getElementById("option-4").checked) {
              var rpta = document.getElementById("t4").value;
              alert(rpta);
          }
      }
        </script>
      </body>
    </html>
