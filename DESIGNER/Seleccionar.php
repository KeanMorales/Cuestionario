

<!DOCTYPE html>
<html lang="es" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="css/Seleccionar.css">
    <link rel="stylesheet" href="css/fonts.css">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<!--===============================USAR TODO ESTO================================================================-->
    <link rel="stylesheet" href="material desing lite/material.min.css">
    <script type="text/javascript" src="material desing lite/material.min.js"></script>
  	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
  	<link rel="stylesheet" type="text/css" href="diseño/vendor/bootstrap/css/bootstrap.min.css">
  	<link rel="stylesheet" type="text/css" href="diseño/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
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
        <li><a href="Ingresar.php"     class="icon-arrow-right"></a></li>
        <li><a href="Seleccionar.php"  class="icon-loop"></a></li>
        <!--<li><a href="mailto:contacto@pregunta.com" class="icon-info"></a></li>-->
      </ul>
    </div>
 </section>
 <!--     -->
 <div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form validate-form">
				<span class="contact100-form-title">
					Busque y Seleccione el Curso
				</span>

        <tr>
           <td width="70%">Buscar Curso :</td>
           <td width="70%">
             <form action="#">
               <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                 <input class="mdl-textfield__input" type="search" id="sample3">
                 <label class="mdl-textfield__label" for="sample3">Ingrese Busqueda</label>
               </div>
             </form>
           </td>
        </tr>
<tr>

<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
        <tr>
          <td width="70%"> Agregar Curso :</td>
          <td width="70%">
            <form action="#">
              <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" id="sample3">
                <label class="mdl-textfield__label" for="sample3">Agregue Curso</label>
              </div>
            </form>
          </td>
      </tr>
</div>

      <div class="container-contact100-form-btn">
        <div class="wrap-contact100-form-btn">
          <div class="contact100-form-bgbtn"></div>
          <button class="contact100-form-btn" onclick="myFunction()">
            <span>
            AGREGAR
              <i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
            </span>
          </button>
        </div>
      </div>
</tr>
<tr>

<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
<tr>
  <td width="70%">Seleccione Tema :</td>
  <td width="70%"> <select id="mySelect" name="cantidad" class="mdl-textfield__input">
   <option>EAA</option>
   <option>POLIMORFISMO</option>
   <option>INTERFACES</option>
 </select>
 </td>

</tr>
</div>
</tr>
<tr>

<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
  <tr>
     <td width="70%"> Agregar Tema : </td>
     <td width="70%">
       <form action="#">
         <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
           <input class="mdl-textfield__input" type="text" id="tt">
           <label class="mdl-textfield__label" for="sample3">Agregue Tema</label>
         </div>
       </form>

     </td>
</tr>
</div>

      <div class="container-contact100-form-btn">
        <div class="wrap-contact100-form-btn">
          <div class="contact100-form-bgbtn"></div>
          <button class="contact100-form-btn" onclick="myFunction()">
            <span>
            AGREGAR
              <i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
            </span>
          </button>
        </div>
      </div>

</tr>


	<div id="dropDownSelect1"></div>
    <script>
    function myFunction() {
      var x = document.getElementById("mySelect");
      var option = document.createElement("option");
      option.text = document.getElementById("tt").value;
      x.add(option);
    }
    //material contact form animation
$('.contact-form').find('.form-control').each(function() {
  var targetItem = $(this).parent();
  if ($(this).val()) {
    $(targetItem).find('label').css({
      'top': '10px',
      'fontSize': '14px'
    });
  }
})
$('.contact-form').find('.form-control').focus(function() {
  $(this).parent('.input-block').addClass('focus');
  $(this).parent().find('label').animate({
    'top': '10px',
    'fontSize': '14px'
  }, 300);
})
$('.contact-form').find('.form-control').blur(function() {
  if ($(this).val().length == 0) {
    $(this).parent('.input-block').removeClass('focus');
    $(this).parent().find('label').animate({
      'top': '25px',
      'fontSize': '18px'
    }, 300);
  }
})
    </script>
    <!--===============================================================================================-->
    	<script src="diseño/vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    	<script src="diseño/vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    	<script src="diseño/vendor/bootstrap/js/popper.js"></script>
    	<script src="diseño/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    	<script src="diseño/vendor/select2/select2.min.js"></script>
    	<script>
    		$(".selection-2").select2({
    			minimumResultsForSearch: 20,
    			dropdownParent: $('#dropDownSelect1')
    		});
    	</script>
    <!--===============================================================================================-->
    	<script src="diseño/vendor/daterangepicker/moment.min.js"></script>
    	<script src="diseño/vendor/daterangepicker/daterangepicker.js"></script>
    	<script src="diseño/vendor/countdowntime/countdowntime.js"></script>
    <!--===============================================================================================-->
    	<script src="js/main.js"></script>
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'UA-23581568-13');
    </script>
  </body>
</html>
