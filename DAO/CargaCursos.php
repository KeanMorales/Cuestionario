<?php

   function cargar() {
     $consultas = new Consultas();
     $filas = $consultas->cargarCursos();

     echo "<table>
           <tr>
              <th>ID</th>
              <th>Nombre</th>
              <th>Estado</th>
            </tr>";

      foreach ($filas as $fila) {
            echo "<tr>";
            echo "<td>".$fila['IdCurso']."</td>";
            echo "<td>".$fila['NombreCurso']."</td>";
            echo "<td>".$fila['Estado']."</td>";
            echo "</tr>";
      }



      }
   echo "</table>";

 ?>
