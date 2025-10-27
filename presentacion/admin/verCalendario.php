<?php
require_once(__DIR__ . "/../../logica/Fecha.php");
require_once(__DIR__ . "/../../logica/Partido.php");
require_once(__DIR__ . "/../../logica/Campeonato.php");
session_start();

// Obtener ID del campeonato
$id_campeonato = isset($_GET['id_campeonato']) ? (int)$_GET['id_campeonato'] : 0;

if ($id_campeonato === 0) {
    die('<div class="alert alert-danger">Error: Falta ID de campeonato</div>');
}

try {
    $campeonato = new Campeonato($id_campeonato);
    $campeonato->consultarPorId(); 
    $nombre_campeonato = $campeonato->getNombre();
    $fechas = Fecha::obtenerFechasPorCampeonato($id_campeonato);
} catch (Exception $e) {
    $error_mensaje = '<div class="alert alert-danger">Error cargando datos: ' . $e->getMessage() . '</div>';
    $fechas = []; 
    $nombre_campeonato = "Error";
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Calendario <?= $nombre_campeonato ?></title>
    <base href="http://localhost/proyectocampeonatofutbol/presentacion/">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container my-5">
    <h1>Calendario <?= $nombre_campeonato ?></h1>
    <a href="menuAdministrador.php" class="btn btn-secondary mb-4">Volver</a>
    
    <?php if (isset($error_mensaje)) echo $error_mensaje; ?>

    <?php if (empty($fechas)): ?>
        <div class="alert alert-warning">No hay calendario generado</div>
    <?php else: ?>
        
        <?php foreach ($fechas as $fecha): ?>
            <div class="card mb-4">
                <div class="card-header bg-warning text-white">
                    <h5 class="mb-0">
                         Jornada <?= $fecha->numero_fecha ?> 
                         <small>(<?= date('d/m/Y', strtotime($fecha->fecha_real)) ?>)</small>
                    </h5>
                </div>
                <ul class="list-group list-group-flush">
                    <?php 
                    try {
                        $partidos = Partido::obtenerPartidosPorFecha($fecha->id_fecha);
                    } catch (Exception $e) {
                        echo '<li class="list-group-item text-danger">Error: ' . $e->getMessage() . '</li>';
                        $partidos = [];
                    }

                    if (empty($partidos)): ?>
                        <li class="list-group-item text-muted">No hay partidos</li>
                    <?php endif; ?>
                    
                    <?php foreach ($partidos as $partido): ?>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <span>
                                <?= $partido->nombre_local ?> vs <?= $partido->nombre_visitante ?> 
                            </span>
                            <span class="badge bg-primary">
                                <?= date('H:i', strtotime($partido->hora_partido)) ?>
                            </span>
                        </li>
                    <?php endforeach; ?>
                </ul>
            </div>
        <?php endforeach; ?>

    <?php endif; ?>
</div>
</body>
</html>