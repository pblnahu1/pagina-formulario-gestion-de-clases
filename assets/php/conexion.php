<?php
    /*try {
        $conexionBD = mysqli_connect("localhost", "root", "", "ppr3_v2");
        if($conexionBD->connect_error){
            throw new Exception("Error de conexión a la BD: " . $conexionBD->connect_error);
        }
    } catch (Exception $error) {
        ?>
            <h5 style="text-align:center; color:red">
                Error de conexión a la BD: <?php echo " " . $error->getMessage(); ?>
            </h5>
        <?php
    }
    */

    /**Conexion a Base de Datos**/
    $servidor = "sql309.byethost7.com";
    $basededatos = "b7_36409925_SAU";
    $usuario  = "b7_36409925";
    $password = "gestionPP3";

    $conn = mysqli_connect($servidor, $usuario, $password) or die("No se ha podido conectar al Servidor");
    mysqli_query($conn,"SET SESSION collation_connection ='utf8_unicode_ci'");
    $db = mysqli_select_db($conn, $basededatos) or die("Upps! Error en conectar a la Base de Datos");


?>