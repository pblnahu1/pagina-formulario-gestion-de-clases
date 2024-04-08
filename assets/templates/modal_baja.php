<section class="modal2">
    <div class="modal2__container">
        <div class="btn-cerrar-modal2"> <a href="#" class="modal2__close" title="Cerrar">X</a>  </div>
    
        <h2 class="modal2__title">Baja de Clases</h2>

        <table>

            <thead>
            <tr>
              <th class="materia">Materia</th>
              <th class="comision">Comision</th>
              <th class="hora">Hora</th>
              <th class="fecha">Fecha</th>
              <th class="temas">Temas</th>
              <th class="novedades">Novedades</th>
            </tr>
            </thead>

            <tbody>
            <?php
            $consulta = "SELECT materias.NOMBRE,clases.COMISION,clases.FECHA,
            clases.HORA,clases.TEMAS,clases.NOVEDAD FROM clases , profesores , materias  
            WHERE clases.CODIGO_PROFESOR = profesores.codigo and clases.codigo_materia = materias.codigo " ;
            $resultado= mysqli_query($conexionBD,$consulta);
            if(isset($resultado)&& $resultado->num_rows>0){
                while($fila=mysqli_fetch_array($resultado)){ 
                ?>
                <tr>
                  <td> <?php echo $fila['NOMBRE'] ?> </td>
                  <td> <?php echo $fila['COMISION'] ?>  </td>
                  <td> <?php echo $fila['HORA'] ?> </td>
                  <td> <?php echo $fila['FECHA'] ?> </td>
                  <td> <textarea class="td_textarea" rows="1"  readonly > <?php echo $fila['TEMAS'] ?> </textarea> </td>
                  <td> <textarea  class="td_textarea" rows="1" readonly  ><?php echo $fila['NOVEDAD'] ?></textarea> </td>
                </tr>
                <?php
                }
              }
              else{
                echo"<tr ><td colspan='8' style=font-size:20px >No Se Encontraron Resultados.</td></tr>";
                //el colspan permite que ocuper las 8 columnas.        
              }            
            ?>

            </tbody>

          </table>
        
    
    </div>
</section>

<script type="module" src="assets/js/main.js"></script>
<script type="module" src="assets/js/app.js"></script>

