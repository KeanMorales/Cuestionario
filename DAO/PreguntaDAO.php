<?php
class PreguntaDAO
{
  public function pregunta_alternativas($idtema)
	{
  require_once('../DAL/DBAccess.php');

  try
  {
    //$array = array();
    $dba = new DBAccess();
    $conn = $dba->get_connection();
    $statement = $conn->prepare("CALL up_listar_pregunta_alternativas(?)");
    $statement->bindParam(1,$idtema);
    $statement -> execute();
    //$array = $statement->Fetch
    //$statement->closecursor();
    return $statement;
  }
  catch (PDOException $pe)
  {
       die("Error occurred:" . $pe->getMessage());
  }
 }

 public function verificar_respuesta($idpregunta,$idalternativa)
 {
  require_once('../DAL/DBAccess.php');

  try
  {
   //$array = array();
   $dba = new DBAccess();
   $conn = $dba->get_connection();
   $statement = $conn->prepare("CALL up_verificar_respuesta(?,?)");
   $statement->bindParam(1,$idpregunta);
   $statement->bindParam(2,$idalternativa);
   $statement -> execute();
   //$array = $statement->Fetch
   //$statement->closecursor();
   return $statement;
  }
  catch (PDOException $pe)
  {
      die("Error occurred:" . $pe->getMessage());
  }
 }
}
