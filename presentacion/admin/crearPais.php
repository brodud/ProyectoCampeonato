<?php
require_once(__DIR__ . "/../../logica/Pais.php"); 
require_once(__DIR__ . "/../../logica/Confederacion.php"); 
session_start();

// Verificar si es admin
if (!isset($_SESSION["id_admin"]) || $_SESSION["rol"] !== "admin") {
    header('Location: ../../autenticar.php');
    exit();
}

$mensaje = "";

// Cargar confederaciones para el select
try {
    $confederaciones = Confederacion::consultarTodos(); 
} catch (Exception $e) {
    $mensaje = '<div class="alert alert-warning">Error cargando confederaciones</div>';
}

// Procesar formulario
if (isset($_POST["crear_pais"])) {
    $nombre = trim($_POST["nombre"]);
    $sigla_fifa = strtoupper(trim($_POST["sigla_fifa"])); 
    $id_confederacion = (int)$_POST["id_confederacion"];
    
    // Subir bandera
    $bandera_url = null;
    if ($_FILES["bandera"]["error"] == UPLOAD_ERR_OK) {
        $carpeta = __DIR__ . "/../../imagenes/banderas/";
        if (!is_dir($carpeta)) {
            mkdir($carpeta, 0755, true);
        }
        
        $nombre_archivo = uniqid() . '_' . $_FILES["bandera"]["name"];
        $ruta_archivo = $carpeta . $nombre_archivo;
        
        if (move_uploaded_file($_FILES["bandera"]["tmp_name"], $ruta_archivo)) {
            $bandera_url = "../../imagenes/banderas/" . $nombre_archivo;
        } else {
            $mensaje = '<div class="alert alert-danger">Error subiendo la bandera</div>';
        }
    } else {
        $mensaje = '<div class="alert alert-danger">Debe seleccionar una bandera</div>';
    }

    // Crear país si todo está bien
    if ($bandera_url && empty($mensaje)) {
        try {
            $pais = new Pais(0, $nombre, $sigla_fifa, $bandera_url, $id_confederacion);
            $pais->crear(); 
            $mensaje = '<div class="alert alert-success">País ' . htmlspecialchars($nombre) . ' creado</div>';

        } catch (Exception $e) {
            $mensaje = '<div class="alert alert-danger">Error creando país</div>';
        }
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Crear País</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-dark text-white">
                    <h4>Registrar Nuevo País</h4>
                </div>
                <div class="card-body">
                    <?= $mensaje ?>

                    <form method="POST" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label class="form-label">Nombre del País</label>
                            <input type="text" name="nombre" class="form-control" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Sigla FIFA</label>
                            <input type="text" name="sigla_fifa" class="form-control" required maxlength="3" placeholder="COL">
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Confederación</label>
                            <select name="id_confederacion" class="form-select" required>
                                <option value="">Seleccione...</option>
                                <?php foreach ($confederaciones as $conf): ?>
                                    <option value="<?= $conf['id_confederacion'] ?>">
                                        <?= htmlspecialchars($conf['nombre']) ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Bandera</label>
                            <input type="file" name="bandera" class="form-control" accept="image/*" required>
                        </div>
                        
                        <button type="submit" name="crear_pais" class="btn btn-dark w-100">
                            Guardar País
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>