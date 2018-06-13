<?php

   function cargar() {
     $consultas = new Consultas();
     $filas = $consultas->cargarTemas();

     echo "<table>
           <tr>
              <th>IdTema</th>
              <th>NombreTema</th>
              <th>IdCurso</th>
              <th>Estado</th>
            </tr>";

      foreach ($filas as $fila) {
            echo "<tr>";
            echo "<td>".$fila['IdTema']."</td>";
            echo "<td>".$fila['NombreTema']."</td>";
            echo "<td>".$fila['idCurso']."</td>";
            echo "<td>".$fila['Estado']."</td>";
            echo "</tr>";
      }



      }
   echo "</table>";

 ?>
