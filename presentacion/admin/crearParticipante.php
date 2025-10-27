<?php
require_once(__DIR__ . "/../../logica/Campeonato.php");
require_once(__DIR__ . "/../../logica/Participante.php");
require_once(__DIR__ . "/../../logica/Pais.php");

session_start();

// Verificar que el admin haya iniciado sesión
if (!isset($_SESSION["id_admin"])) {
    header('Location: ../../autenticar.php');
    exit();
}

// Consultar campeonatos del admin
$campeonatos = Campeonato::consultar($_SESSION["id_admin"]);
$id_campeonato = isset($_GET['id_campeonato']) ? (int)$_GET['id_campeonato'] : 0;

// Si hay un campeonato seleccionado, se cargan los datos
if ($id_campeonato > 0) {
    $paises_disponibles = Pais::obtenerNoParticipantes($id_campeonato);
    $total_equipos = Participante::contarPorCampeonato($id_campeonato);
} else {
    $paises_disponibles = [];
    $total_equipos = 0;
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agregar Equipo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container my-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-sm">
                <div class="card-header bg-success text-white">
                    <h4 class="mb-0">Agregar Equipos</h4>
                </div>
                <div class="card-body">

                    <?php 
                    // Mostrar mensajes de resultado
                    if (isset($_GET['status'])) {
                        if ($_GET['status'] == 'success') {
                            echo '<div class="alert alert-success">Equipo agregado correctamente.</div>';
                        } elseif ($_GET['status'] == 'error' && isset($_GET['message'])) {
                            echo '<div class="alert alert-danger">' . htmlspecialchars($_GET['message']) . '</div>';
                        }
                    }
                    ?>

                    <!-- Selección de campeonato -->
                    <div class="mb-4">
                        <label class="form-label fw-bold">1. Seleccionar Campeonato</label>
                        <select class="form-select" onchange="window.location.href='crearParticipante.php?id_campeonato=' + this.value">
                            <option value="0">Seleccione...</option>
                            <?php foreach ($campeonatos as $c): ?>
                                <option value="<?= $c->getId() ?>" <?= ($c->getId() == $id_campeonato) ? 'selected' : '' ?>>
                                    <?= $c->getNombre() ?> (<?= $c->getAnio() ?>)
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <hr>

                    <form action="controladorParticipante.php" method="POST">
                        <input type="hidden" name="id_campeonato" value="<?= $id_campeonato ?>">

                        <!-- Selección de equipo -->
                        <div class="mb-4">
                            <label class="form-label fw-bold">2. Seleccionar Equipo</label>

                            <?php if ($id_campeonato > 0): ?>
                                <select name="id_pais" class="form-select" <?= count($paises_disponibles) == 0 ? 'disabled' : '' ?>>
                                    <?php if (count($paises_disponibles) > 0): ?>
                                        <option value="">Seleccione país...</option>
                                        <?php foreach ($paises_disponibles as $p): ?>
                                            <option value="<?= $p['id_pais'] ?>"><?= $p['nombre'] ?></option>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <option value="">Todos los países ya fueron agregados</option>
                                    <?php endif; ?>
                                </select>
                            <?php else: ?>
                                <p class="alert alert-info mb-2">Seleccione un campeonato primero.</p>
                                <select name="id_pais" class="form-select" disabled>
                                    <option value="">Seleccione país...</option>
                                </select>
                            <?php endif; ?>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" name="accion" value="agregar" class="btn btn-primary"
                                <?= ($id_campeonato == 0 || count($paises_disponibles) == 0) ? 'disabled' : '' ?>>
                                Agregar Equipo
                            </button>

                            <?php if ($id_campeonato > 0): ?>
                                <a href="verParticipantes.php?id_campeonato=<?= $id_campeonato ?>" class="btn btn-info">
                                    Ver Equipos (<?= $total_equipos ?>)
                                </a>

                                <?php if ($total_equipos >= 2): ?>
                                    <a href="generarCalendario.php?id_campeonato=<?= $id_campeonato ?>" class="btn btn-warning">
                                        Generar Calendario
                                    </a>
                                <?php else: ?>
                                    <div class="alert alert-warning mb-0 mt-2">
                                        Se necesitan al menos 2 equipos para generar el calendario.
                                    </div>
                                <?php endif; ?>
                            <?php endif; ?>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
