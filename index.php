<?php 
include("assets/php/conexion.php");
session_start();
$_SESSION["id"] = 1;

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gestión de Clases</title>
  <!-- Librería WaterCSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">
  <!-- Link estilos css -->
  <link rel="stylesheet" href="assets/css/style.css">
  <link rel="stylesheet" href="assets/css/modal.css">
</head>

<body>
  <header>
    <p class="name-page">Gestión de Clases</p>
    <nav id="nav-bar">
      <ul>
        <a href="#" target="_blank" class="nav-links">
          <li>Pagina principal</li>
        </a>
        <a href="#" target="_blank" class="nav-links">
          <li>Ayuda</li>
        </a>
      </ul>
    </nav>
  </header>

  <!-- Modal Form de Alta -->
  <?php include("assets/templates/modal_alta.php")  ?>
  <!-- Modal Form de Baja -->
  <?php include("assets/templates/modal_baja.php")  ?>

  <!-- Modal Form de Modificaciones -->
  <?php include("assets/templates/modal_modificacion.php")  ?>

  <main>
    <div class="container">

      <section id="menu">
        <div class="descripcion-menu">
          <h3 class="heading3-descripcion">¿Qué quieres hacer?</h3>
        </div>
        <div class="btn-menu">
          <button class="btn-alta btns-menu" id="id-btn-alta">Alta de clase</button>
          <button class="btn-modificar btns-menu" id="id-btn-modificar" disabled >Modificar una clase</button>
          <button class="btn-baja btns-menu" id="id-btn-baja" disabled >Baja de clase</button>
          <div class="imagen-menu">
          <img class="img-logo-menu" src="https://image.shutterstock.com/image-photo/image-260nw-1407027353.jpg"
            width="150" height="150" alt="Logo¿?" title="Imagen del Logo">
        </div>
        </div>
      </section>

      <section id="tabla-clases">
        <div class="contenedor-buscador-filtros">
          <div class="search">
            <input class="input-search" type="text" placeholder="Buscar">
            <input class="input-submit-search" type="submit" value="🔎">
          </div>
          <div class="filter">
            <select>
              <option value="">Filtrar</option>
              <option value="Por fecha">Por fecha</option>
              <option value="Por hora">Por hora</option>
              <option value="Por Materia">Por Materia</option>
            </select>
          </div>
        </div>
        <div class="contenedor-tabla">
          <table>

            <thead>
            <tr>
              <th class="checkbox"></th>
              <th class="materia">Materia</th>
              <th class="comision">Comision</th>
              <th class="hora">Hora</th>
              <th class="fecha">Fecha</th>
              <th class="aula">Aula</th>
              <th class="archivos">Archivos</th>
              <th class="temas">Temas</th>
              <th class="novedades">Novedades</th>
            </tr>
            </thead>

            <tbody>
            <?php
            $consulta = "SELECT clases.ID_CLASE,materias.NOMBRE,clases.COMISION,clases.FECHA,clases.HORA,clases.AULA,clases.ARCHIVOS,clases.TEMAS,clases.NOVEDADES 
            FROM clases , materias , usuario 
            WHERE clases.CODIGO_USUARIO = usuario.CODIGO and clases.CODIGO_MATERIA = materias.CODIGO " ;
            $resultado= mysqli_query($conexionBD,$consulta);
            mostrarDatos($resultado);
            ?>

            </tbody>

          </table>
        </div>
      </section>
    </div>
  </main>

  <footer></footer>

  <script type="module" src="assets/js/app.js"></script>
  <script type="module" src="assets/js/main.js"></script>

</body>

</html>



<?php 
function mostrarDatos($result){
  if(isset($result)&& $result->num_rows>0){
    while($fila=mysqli_fetch_array($result)){ 
    ?>
    <tr>
      <td><input class="input-checkbox-register" type="checkbox" name="seleccionar_registro" value="<?php echo  $fila['ID_CLASE'] ?>"></td>
      <td> <?php echo $fila['NOMBRE'] ?> </td>
      <td> <?php echo $fila['COMISION'] ?>  </td>
      <td> <?php echo $fila['HORA'] ?> </td>
      <td> <?php echo $fila['FECHA'] ?> </td>
      <td> <?php echo $fila['AULA'] ?> </td>
      <td> <?php echo $fila['ARCHIVOS'] ?> </td>
      <td> <textarea class="td_textarea" rows="1"  readonly > <?php echo $fila['TEMAS'] ?> </textarea> </td>
      <td> <textarea  class="td_textarea" rows="1" readonly  ><?php echo $fila['NOVEDADES'] ?></textarea> </td>
    </tr>
    <?php
    }
  }
  else{
    echo"<tr ><td colspan='9' style=font-size:20px >No Se Encontraron Resultados.</td></tr>";
    //el colspan permite que ocuper las 8 columnas.        
  }
}

?>