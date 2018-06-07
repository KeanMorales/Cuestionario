<!DOCTYPE html>
<html lang="es">
	<head>
		<title>LISTAR PREGUNTA</title>
        <!--link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css"-->
	</head>
    <body style="padding:15px;">
      <center>
				<table>
				<form class="verificar" id="form" action="VerificarRespuesta.php" method="post" autocomplete="off">
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
					<input type="radio" name="idalternativa" value=<?php echo $row['id']?> required/>
					<?php echo $row['descripcion']?><br/>
					<?php
					endwhile;
					echo "</td>";
          echo "</tr>";

					$stm->closecursor();//LIMPIAMOS EL ESPACIO OCUPADO POR LA CONSULTA
					?>

					<tr>
	          <td><left><input type="submit" value="Salir" formaction="Inicio.php" style='width:150px; height:35px'></left></td>
	           <td><left><input type="submit" value="Enviar" name="verificar" style='width:150px; height:35px'></left></td>
	        </tr>
				</form>
				<?php
				}

				else {
					header('location:../DESIGNER/Login.php');
				}
				?>
      </table>
    </center>
    </body>
</html>
