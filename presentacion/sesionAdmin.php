<?php
session_start();
require_once("../logica/Admin.php");

// Verificar sesión de admin
if (!isset($_SESSION["id_admin"]) || $_SESSION["rol"] !== "admin") {
    header('Location: ../autenticar.php');
    exit();
}

$admin = new Admin($_SESSION["id_admin"]);
$admin->consultarPorId();
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Sesión Administrador</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <?php include("menuAdministrador.php"); ?>

    <div class="container my-4">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <h3 class="mb-0">Bienvenido, <?php echo htmlspecialchars($admin->getNombre()); ?></h3>
                            <small class="text-muted">Estás en la sesión administrativa. Usa el menú para navegar.</small>
                        </div>
                        <div>
                            <a href="admin/crearCampeonato.php" class="btn btn-success btn-sm">
                                <i class="fa-solid fa-plus me-1"></i> Crear Campeonato
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        <!-- contenido adicional si es necesario -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>