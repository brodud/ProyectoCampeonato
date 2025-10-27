<?php
require_once(__DIR__ . "/../../logica/Campeonato.php"); 
require_once(__DIR__ . "/../../logica/Fecha.php");
session_start();

$campeonatos = [];
$mensaje = null;

try {
    $campeonatos = Campeonato::consultar($_SESSION["id_admin"]); 
} catch (Exception $e) {
    $mensaje = '<div class="alert alert-danger">Error cargando campeonatos</div>';
}

if (isset($_POST['generar']) && empty($mensaje)) { 
    $id_campeonato = (int)$_POST['id_campeonato'];
    $fecha_base = $_POST['fecha_base'];

    try {
        Fecha::generarCalendario($id_campeonato, $fecha_base, 1);
        $mensaje = '<div class="alert alert-success">Calendario generado</div>';
    } catch (Exception $e) {
        $mensaje = '<div class="alert alert-danger">Error generando calendario</div>';
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Generar Calendario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container my-4">
    <div class="card-body">        
        <?= $mensaje ?>
        <form method="POST">
            <div class="mb-3">
                <label class="form-label">Seleccionar Campeonato</label>
                <select name="id_campeonato" class="form-select" required>
                    <option value="">Seleccione...</option>
                    <?php foreach ($campeonatos as $c): ?>
                        <option value="<?= $c->getId() ?>">
                            <?= $c->getNombre() ?> (<?= $c->getAnio() ?>)
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Fecha de Inicio</label>
                <input type="date" name="fecha_base" class="form-control" required>
            </div>

            <button type="submit" name="generar" class="btn btn-warning w-100">
                Generar Calendario
            </button>
        </form>
    </div>
</div>
</body>
</html>