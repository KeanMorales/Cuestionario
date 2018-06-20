<?php
require_once('../DAL/DBAccess.php');

session_start();
$str = $_SESSION['apellidos_y_nombres'];
$variable_nombre =  trim(explode('-', $str)[1]);
$variable_id = trim(explode('-', $str)[0]);

 $mi_variable = $_POST["combobox_1"];
 $var2 = $_POST["pregunta"];
 $var3=null;
 $var4=null;
 $var5=null;
 $var6=null;
 $var7 = $_POST["pregunta_1"];
 $var8 = $_POST["pregunta_2"];
 $var9 = $_POST["pregunta_3"];
 $var10 = $_POST["pregunta_4"];
 $varRespuesta;

$radioVal = $_POST["gender"];
switch ($radioVal) {
  case "respuesta_1":
      $var3 = 1;
      $var4 = 0;
      $var5 = 0;
      $var6 = 0;
  break;
  case "respuesta_2":
    $var3 = 0;
    $var4 = 1;
    $var5 = 0;
    $var6 = 0;
  break;
  case "respuesta_3":
    $var3 = 0;
    $var4 = 0;
    $var5 = 1;
    $var6 = 0;
  break;
  case "respuesta_4":
    $var3 = 0;
    $var4 = 0;
    $var5 = 0;
    $var6 = 1;
  break;

  default:
    // code...
    break;
}


 echo $variable_id."-";
 echo $mi_variable."-";
 echo $var2."-";
 echo $var3."-";
 echo $var4."-";
 echo $var5."-";
 echo $var6."-";
 echo $var7."-";
 echo $var8."-";
 echo $var9."-";
 echo $var10."-";





  try
  {
    $dba = new DBAccess();
    $conn = $dba->get_connection();
    $statement = $conn->prepare("CALL InsertarPreAlter(?,?,?,?,?,?,?,?,?,?,?)");
    $statement->bindParam(1,$variable_id);
    $statement->bindParam(2,$mi_variable);
    $statement->bindParam(3,$var2);
    $statement->bindParam(4,$var7);
    $statement->bindParam(5,$var3);
    $statement->bindParam(6,$var8);
    $statement->bindParam(7,$var4);
    $statement->bindParam(8,$var9);
    $statement->bindParam(9,$var5);
    $statement->bindParam(10,$var10);
    $statement->bindParam(11,$var6);




    $statement -> execute();

    echo "se envio correctamente";
    //header('location:MenuDesing.php');

  }
  catch (PDOException $pe)
  {
       echo "chit oe";
       die("Error occurred:" . $pe->getMessage());

  }
  ?>
