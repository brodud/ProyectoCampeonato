<?php
require_once ("../../logica/Campeonato.php");
require_once ("../../logica/Admin.php");
session_start();


$id = $_SESSION["id_admin"] ?? 0;
if (!isset($_SESSION["id_admin"]) || ($_SESSION["rol"] ?? "") != "admin") {
    header('Location: ../../autenticar.php');
    exit;
}
$admin = new Admin($id);
$campeonato = new Campeonato();
$campeonatos = $campeonato -> consultar($id);

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listar Campeonatos</title>
    <!-- Bootstrap y Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body>
    <?php include __DIR__ . '/../menuAdministrador.php'; ?>
    <div class="container">
        <div class="row mt-5">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        <h3>Consultar Campeonatos</h3>
                    </div>
                    <div class="card-body">
                        <?php
                        if (count($campeonatos) == 0) {
                            echo "<div class='alert alert-warning' role='alert'>\n                                    No hay registros\n                                    </div>";
                        } else {
                        ?>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Año</th>
                                    <th scope="col">Inicio</th>
                                    <th scope="col">Fin</th>
                                    <th scope="col">Imagen</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php
                            foreach ($campeonatos as $c) {
                                echo "<tr>";
                                echo "<td>" . $c -> getId() . "</td>";
                                echo "<td>" . $c -> getNombre() . "</td>";
                                echo "<td>" . $c -> getAnio() . "</td>";
                                echo "<td>" . $c -> getFechaInicio() . "</td>";
                                echo "<td>" . $c -> getFechaFin() . "</td>";
                            if($c -> getImagenUrl() != ""){
                                    echo "<td><img src='" . $c -> getImagenUrl() . "' height='60px'></td>";                                    
                                } else {
                                    echo "<td></td>";
                                }
                                echo "<td>";
                                echo "<a class='btn btn-sm btn-info' href='verParticipantes.php?id=" . intval($c -> getId()) . "'>Ver</a> ";
                                echo "<a class='btn btn-sm btn-danger' href='?accion=eliminar&id=" . intval($c -> getId()) . "' onclick='return confirm(\'¿Eliminar este campeonato?\')'>Eliminar</a>";
                                echo "</td>";
                                echo "</tr>";
                            }
                            ?>
                            </tbody>
                        </table>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
