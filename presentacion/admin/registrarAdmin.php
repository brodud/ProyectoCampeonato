<?php
require_once(__DIR__ . "/../../persistencia/Conexion.php");

if (isset($_POST["registrar"])) {
    $nombre = $_POST["nombre"];
    $apellido = $_POST["apellido"];
    $correo = $_POST["correo"];
    $clave = $_POST["clave"];

    $conexion = new Conexion();
    $conexion->abrir();

    // Validar si el correo ya existe
    $consulta = "SELECT correo FROM g8_administrador WHERE correo = '$correo'";
    $conexion->ejecutar($consulta);

    if ($conexion->filas() > 0) {
        $mensaje = "<div class='alert alert-danger text-center'>El correo ya está registrado</div>";
    } else {
        // Insertar el nuevo administrador 
        $claveMD5 = md5($clave);
    
    $insertar = "INSERT INTO g8_administrador (nombre, apellido, correo, contraseña)
             VALUES ('$nombre', '$apellido', '$correo', '$claveMD5')";
        $conexion->ejecutar($insertar);
        $mensaje = "<div class='alert alert-success text-center'>Administrador registrado exitosamente</div>";
    }

    $conexion->cerrar();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Registrar Administrador</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<div class="container">
    <div class="row mt-5">
        <div class="col-12 col-md-6 offset-md-3">
            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h3><i class="fa-solid fa-user-plus me-2"></i>Registrar Administrador</h3>
                </div>
                <div class="card-body">
                    <?php
                    if (isset($mensaje)) {
                        echo $mensaje;
                    }
                    ?>
                    <form method="post" action="registrarAdmin.php">
                        <div class="mb-3">
                            <label class="form-label"><i class="fa-solid fa-user me-2"></i>Nombre</label>
                            <input type="text" class="form-control" name="nombre" placeholder="Nombre" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><i class="fa-solid fa-user me-2"></i>Apellido</label>
                            <input type="text" class="form-control" name="apellido" placeholder="Apellido" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><i class="fa-solid fa-envelope me-2"></i>Correo</label>
                            <input type="email" class="form-control" name="correo" placeholder="Correo" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><i class="fa-solid fa-lock me-2"></i>Contraseña</label>
                            <input type="password" class="form-control" name="clave" placeholder="Contraseña" required>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary" name="registrar">
                                <i class="fa-solid fa-floppy-disk me-2"></i>Registrar
                            </button>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center">
                    <a href="../../autenticar.php" class="text-decoration-none">
                        <i class="fa-solid fa-arrow-left me-1"></i> Volver al inicio de sesión
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
