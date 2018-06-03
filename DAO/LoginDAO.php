<?php

require_once('../DAL/DBAccess.php');

  try
  {
    $dba = new DBAccess();
    $conn = $dba->get_connection();
    $statement = $conn->prepare("CALL up_usuario(?,?)");
    $statement->bindParam(1,$_POST['usuario']);
    $statement->bindParam(2,$_POST['contrasenia']);
    $statement -> execute();

    if($statement->rowcount()==1)
    {
      $row = $statement->fetch();//OBTENEMOS LA FILA QUE DEVUELVE EL PROCEDIMIENTO
      if($row['nombre']==$_POST['usuario']&&
         $row['contrasenia']==$_POST['contrasenia'])
         {
           session_start();
           $_SESSION['id']= $row['idpersona'];
           $_SESSION['apellidos_y_nombres']= $row['APELLIDOS_Y_NOMBRES'];

           $_SESSION['ultimo_ingreso']= date("Y-n-j H:i:s");
           header('location:../DESIGNER/Inicio.php');
         }
    }
    else {
      header('location:../DESIGNER/Login.php');
    }

    $statement->closecursor();
  }
  catch (PDOException $pe)
  {
       die("Error occurred:" . $pe->getMessage());
  }
