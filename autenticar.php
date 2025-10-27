<?php
session_start();
require_once("logica/Persona.php");
require_once("logica/Admin.php");

$error = false;

if (isset($_POST["autenticar"])) {
    $correo = trim($_POST["correo"]);
    $clave  = trim($_POST["clave"]);

    // --- AUTENTICACIÓN ADMINISTRADOR ---
    $admin = new Admin(0, "", "", $correo, $clave);
    if ($admin->autenticar()) {
        $_SESSION["id_admin"] = $admin->getId();
        $_SESSION["rol"] = "admin";
        header('Location: presentacion/sesionAdmin.php');
        exit();
    } else {
        $error = true;
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Campeonato de Fútbol - Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<div class="container">
    <div class="row mt-5">
        <div class="col-12 col-md-4 offset-md-4">
            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h4><i class="fa-solid fa-futbol me-2"></i> Autenticación</h4>
                </div>
                <div class="card-body">
                    <?php
                    if ($error) {
                        echo "<div class='alert alert-danger text-center'>
                                <i class='fa-solid fa-triangle-exclamation me-1'></i>
                                Correo o clave incorrectos
                            </div>";
                    }
                    ?>

                    <form method="post" action="autenticar.php">
                        <div class="mb-3">
                            <label for="correo" class="form-label">
                                <i class="fa-solid fa-envelope me-2"></i>Correo
                            </label>
                            <input type="email" class="form-control" id="correo" name="correo" 
                                placeholder="ejemplo@correo.com" required>
                        </div>

                        <div class="mb-3">
                            <label for="clave" class="form-label">
                                <i class="fa-solid fa-lock me-2"></i>Clave
                            </label>
                            <input type="password" class="form-control" id="clave" name="clave" 
                                placeholder="••••••" required>
                        </div>

                        <div class="d-grid">
                            <button type="submit" name="autenticar" class="btn btn-primary">
                                <i class="fa-solid fa-right-to-bracket me-1"></i> Ingresar
                            </button>
                        </div>
                        <div class="text-center">
                            <a href="presentacion/admin/registrarAdmin.php" class="text-decoration-none">
                                <i class="fa-solid fa-user-plus me-1"></i> ¿No tienes cuenta? Regístrate
                            </a>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-center">
                    <a href="index.php" class="text-decoration-none">
                        <i class="fa-solid fa-arrow-left me-1"></i> Volver al inicio
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
