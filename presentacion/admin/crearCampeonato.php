<?php
require_once(__DIR__ . "/../../logica/Campeonato.php");
session_start();

// Verificar admin
if (!isset($_SESSION["id_admin"]) || $_SESSION["rol"] !== "admin") {
    header('Location: ../../autenticar.php');
    exit();
}

$mensaje = "";

if (isset($_POST["crear"])) {
    $nombre = trim($_POST["nombre"]);
    $anio = (int)$_POST["anio"];
    $fecha_inicio = $_POST["fecha_inicio"];
    $fecha_fin = $_POST["fecha_fin"];
    $id_admin = $_SESSION["id_admin"];

    // Subir imagen
    $imagen_path = null;
    if ($_FILES["imagen"]["error"] == UPLOAD_ERR_OK) {
        $carpeta = __DIR__ . "/../../imagenes/campeonatos/";
        if (!is_dir($carpeta)) {
            mkdir($carpeta, 0755, true);
        }
        
        $ruta_archivo = $carpeta . $_FILES["imagen"]["name"];
        if (move_uploaded_file($_FILES["imagen"]["tmp_name"], $ruta_archivo)) {
            $imagen_path = "../../imagenes/campeonatos/" . $_FILES["imagen"]["name"];
        } else {
            $mensaje = '<div class="alert alert-danger">Error subiendo imagen</div>';
        }
    }

    // Crear campeonato si no hay error
    if (empty($mensaje)) {
        try {
            $campeonato = new Campeonato(0, $nombre, $anio, $imagen_path, $fecha_inicio, $fecha_fin, $id_admin);
            $campeonato->crear();
            $mensaje = '<div class="alert alert-success">Campeonato creado</div>';
        } catch (Exception $e) {
            $mensaje = '<div class="alert alert-danger">Error creando campeonato</div>';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Crear Campeonato</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<?php include(__DIR__ . "/../menuAdministrador.php"); ?>

<div class="container my-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h4>Crear Campeonato</h4>
                </div>
                <div class="card-body">
                    <?= $mensaje ?>
                    <form method="post" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label class="form-label">Nombre</label>
                            <input type="text" name="nombre" class="form-control" required>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Año</label>
                                <input type="number" name="anio" class="form-control" min="2000" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Imagen</label>
                                <input type="file" name="imagen" class="form-control" accept="image/*">
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Fecha Inicio</label>
                                <input type="date" name="fecha_inicio" class="form-control">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Fecha Fin</label>
                                <input type="date" name="fecha_fin" class="form-control">
                            </div>
                        </div>
                        
                        <button type="submit" name="crear" class="btn btn-success w-100 mb-2">
                            Crear Campeonato
                        </button>
                        <a href="index.php" class="btn btn-secondary w-100">
                            Cancelar
                        </a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>