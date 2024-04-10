<?php
if(isset($_SESSION['Array_valores_checkbox'])) {
    $valores_checkbox = $_SESSION['Array_valores_checkbox'];
    $valor_checkbox = implode("",$valores_checkbox);   //Lo convierto a String
    $id_profe = $_SESSION["id"];

    $consulta = "SELECT * FROM clases WHERE CODIGO_PROFESOR= '$id_profe' and ID_CLASE= '$valor_checkbox' ";
    $resultado = mysqli_query($conexionBD, $consulta);
    if (mysqli_num_rows($resultado) == 1) {
      $fila = mysqli_fetch_array($resultado);

      $id_materia = $fila['CODIGO_MATERIA'];
      $comision= $fila['COMISION'];
      $hora = $fila['HORA'];
      $fecha = $fila['FECHA'];
      $temas = $fila['TEMAS'];
      $novedades = $fila['NOVEDAD'];
    }
}
?>



<section class="modal3">
  <div class="modal3__container">
      <div class="btn-cerrar-modal3"> <a href="#" class="modal3__close" title="Cerrar">X</a>  </div>
  
      <h2 class="modal__title3">Modificacion de Clase</h2>
  
  <form method="post">
      <label >
          Materia
          <select class="inputs-form-mod_materia" name="materia">
              <option value="<?php echo $id_materia ?> " hidden class="op-materia hidden" >Seleccione la materia</option>
          </select>
      </label>

      <label >
          Comision
          <select class="inputs-form-alta" name="comision">
              <option value="" >Seleccione la comision</option>
              <option value="1.º, 1.ª" >1.º, 1.ª</option>
              <option value="1.º, 2.ª" >1.º, 2.ª</option>
              <option value="1.º, 3.ª" >1.º, 3.ª</option>
          </select>  
      </label>

      <label >
          Hora
          <select class="inputs-form-alta" name="hora">
              <option value="" >Seleccione hora</option>
              <option value="8:00 a 10:00">8:00 a 10:00</option>
              <option value="8:00 a 12:00" >8:00 a 12:00</option>
              <option value="10:10 a 12:00" >10:10 a 12:00</option>
              <option value="20:10 a 22:00" >20:10 a 22:00</option>
              <option value="18:00 a 22:00" >18:00 a 22:00</option>
              <option value="18:00 a 20:00" >18:00 a 20:00</option>
          </select>      
      </label>
      
      <label >
          Fecha
          <input class="inputs-form-alta" type="date" name="fecha" >
      </label>

      <textarea  name="temas" maxlength="50" rows="2" placeholder="Ingresá una tarea" class="textarea-form-class"></textarea>
  
      <textarea name="novedad" maxlength="50" rows="2" placeholder="¿Alguna Novedad?" class="textarea-form-class"></textarea>

      <input type="submit" name="btn_Añadir" value="Añadir" class="btn_añadir">

  </form>
  <h3 class="bad">¡Por favor complete los campos indicados de manera correcta! </h3>

  </div>
</section>




<?php

if(isset($_POST['btn_Añadir'])){  
if(strlen($_POST['materia']) >= 1 && strlen($_POST['comision']) > 0 &&  strlen($_POST['fecha']) > 0
&& strlen($_POST['hora']) >0  &&  strlen($_POST['temas']) >= 0  && strlen($_POST['novedad']) >= 0)  { 
  $id_profe = $_SESSION["id"];
  $materia = trim($_POST['materia']);
  $comision=trim($_POST['comision']);
  $fecha_reg = trim($_POST['fecha']);
  $hora = trim($_POST['hora']);
  $temas= trim($_POST['temas']);
  $novedad = trim($_POST['novedad']);
  $consulta = "INSERT INTO clases(CODIGO_PROFESOR,CODIGO_MATERIA,COMISION,FECHA,HORA,TEMAS,NOVEDAD) VALUES 
                                  ('$id_profe','$materia','$comision','$fecha_reg','$hora','$temas','$novedad')";  
  $resultado= mysqli_query($conexionBD,$consulta);  
  if($resultado){
          header("Location:index.php");
      ?>
      <?php
  }
  else{
      ?>
      <h3 class="bad">¡Ups ha ocurrido un error! </h3>
      <?php
  }
}
else{
  ?>
  <script>
      const $modal = document.querySelector(".modal");
      const bad = document.querySelector(".bad") ;
      const fondo_modal = document.querySelector(".modal__container");  
      const inputs_modal = document.querySelectorAll(".inputs-form-alta");

      $modal.classList.add("modal--show");
      fondo_modal.style.borderColor="red";
      for (let i = 0; i < inputs_modal.length; i++) {
      inputs_modal[i].style.borderColor = "red";
      }      
      bad.style.display="block";
  </script>

  <?php
  }
}

?>