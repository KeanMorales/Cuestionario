<?php
class DBAccess
{
 private $conn;

 public function __construct()
 {
   try {
     $this->conn = new PDO('mysql:host=localhost;dbname=cuestionario', 'root', '');
   } catch (PDOException $e) {
     print "¡Error!: " . $e->getMessage() . "<br/>";
     die();
   }
 }
 public function get_connection()
 {
   return $this->conn;
 }
}
 ?>
