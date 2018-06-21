<!DOCTYPE html>
<html lang="es">
	<head>
		<title>LISTAR PREGUNTA</title>
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
        <!--link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css"-->
	</head>
    <body  >
			<section class="contact-wrap">
	    </section>
			<!--     -->
	    <div class="container-contact100">
	      <div class="wrap-contact100">

							<form class="verificar" id="form" action="VerificarRespuesta.php" method="post" autocomplete="off">
      <center>
				<table>

				<?php
				require_once('../DAO/PreguntaDAO.php');
				$PreguntaDAO = new PreguntaDAO();

				/*//ESTE VALOR DEBERA SER CAMBIADO POR LA SELECCION
				DE DOS COMBOS UNO DE CURSO Y OTRO DE TEMA
				PARA OBTENER EL IDTEMA*/
				$idtema = '2';

				$stm=$PreguntaDAO->pregunta_alternativas($idtema);
				if($stm->rowcount()>0)
				{
					$row= $stm->fetch();
					?>
					<!--CAPTURAMOS EL ID DE LA PREGUNTA-->
					<input type="hidden" name="idpregunta" value="<?php echo $row['id']?>"/>
					<?php
					echo "<tr>";
					echo "<td colspan='2'>".$row['descripcion']."</td>";//MOSTRAMOS LA PREGUNTA DE LA BD
					echo "</tr>";

					echo "<tr>";
					echo "<td colspan='2'>";

					while ($row= $stm->fetch()):
					?>
					<!--MOSTRAMOS LAS ALTERNATIVAS UNA DEBAJO DELA OTRA-->
					<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" >
					<input type="radio" id="option-1" class="mdl-radio__button" name="idalternativa" value=<?php echo $row['id']?> required/>
						<span class="mdl-radio__label"></span>
					</label>
					<?php echo $row['descripcion']?><br/>
					<?php
					endwhile;
					echo "</td>";
          echo "</tr>";

					$stm->closecursor();//LIMPIAMOS EL ESPACIO OCUPADO POR LA CONSULTA
					?>

					<tr>

	          <td><left><input  style='width:150px; height:35px'></left></td>
	           <td><left><input  style='width:150px; height:35px'></left></td>
	        </tr>

				<?php
				}

				else {
					header('location:../DESIGNER/Login.php');
				}
				?>
      </table>
    </center>
		<div class="container-contact100-form-btn">
			<div class="wrap-contact100-form-btn">
				<div class="contact100-form-bgbtn"></div>
				<button class="contact100-form-btn" type="submit" value="Enviar" name="verificar">
					<span>
					ENVIAR
						<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
					</span>
				</button>
			</div>
		</div>
		<div class="container-contact100-form-btn">
			<div class="wrap-contact100-form-btn">
				<div class="contact100-form-bgbtn"></div>
				<button class="contact100-form-btn" type="submit" value="Salir" formaction="MenuDesing.php">
					<span>
					REGRESAR
						<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
					</span>
				</button>
			</div>
		</div>
		</form>
    </body>
</html>
