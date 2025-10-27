<?php
require_once(__DIR__ . "/../../logica/Participante.php"); 
require_once(__DIR__ . "/../../logica/Campeonato.php"); 
session_start();

// Control de seguridad
if (!isset($_SESSION["id_admin"]) || $_SESSION["rol"] !== "admin") {
    header('Location: ../../autenticar.php');
    exit();
}

$id_campeonato = isset($_GET['id_campeonato']) ? (int)$_GET['id_campeonato'] : 0;

if ($id_campeonato == 0) {
    // Redirigir si no hay ID de campeonato
    header('Location: seleccionar_campeonato.php'); 
    exit();
}

// Obtener la información del campeonato para el título
$campeonato = new Campeonato($id_campeonato);
$campeonato->consultarPorId();

// Obtener la lista de equipos inscritos
$equipos_inscritos = Participante::obtenerPorCampeonato($id_campeonato);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Equipos Inscritos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
<body>
<div class="container my-5">
    <h2>Participantes en: <?= htmlspecialchars($campeonato->getNombre() . ' ' . $campeonato->getAnio()) ?></h2>
    <p class="lead">Total de equipos inscritos: <?= count($equipos_inscritos) ?></p>

    <div class="row">
        <?php if (count($equipos_inscritos) > 0): ?>
            <div class="col-12">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>País</th>
                            <th>Confederación</th>
                            <th>Sigla FIFA</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($equipos_inscritos as $equipo): ?>
                            <tr>
                                <td><?= htmlspecialchars($equipo['id_pais']) ?></td>
                                <td><?= htmlspecialchars($equipo['nombre']) ?></td>
                                <td><?= htmlspecialchars($equipo['confederacion']) ?> (<?= htmlspecialchars($equipo['sigla_conf']) ?>)</td>
                                <td><?= htmlspecialchars($equipo['sigla_fifa']) ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        <?php else: ?>
            <div class="col-12">
                <div class="alert alert-warning">Aún no hay equipos inscritos en este campeonato.</div>
            </div>
        <?php endif; ?>
    </div>

    <div class="mt-4">
        <a href="crearParticipante.php?id_campeonato=<?= $id_campeonato ?>" class="btn btn-secondary">
            <i class="fa fa-arrow-left"></i> Volver a Agregar Equipos
        </a>
        <a href="generarCalendario.php?id_campeonato=<?= $id_campeonato ?>" class="btn btn-warning">
            <i class="fa fa-calendar-alt"></i>Generar Calendario
        </a>
    </div>
</div>
</body>
</html>