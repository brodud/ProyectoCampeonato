
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Resumen del Campeonato</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
   <?php include(__DIR__ . "/../menuAdministrador.php"); ?>

    <div class="header-campeonato">
        <div class="container">
            <div class="titulo-campeonato">
                <div class="icono-trofeo">
                    <i class="fas fa-trophy" style="color: #28a745; font-size: 1.8rem;"></i>
                </div>
                <a href="#" class="btn-editar ms-auto">
                    <i class="fas fa-edit"></i>
                </a>
            </div>
        </div>
    </div>

    <div class="container my-4">
        <div class="row">
            <!-- Sección Detalles -->
            <div class="col-md-6 mb-4">
                <div class="seccion-titulo">
                    <span>Detalles</span>
                    <a href="#" class="btn-editar">
                        <i class="fas fa-edit"></i>
                    </a>
                </div>
                <table class="tabla-detalles">
                    <tr>
                        <td>Deporte</td>
                        <td>Fútbol</td>
                    </tr>
                    <tr>
                        <td>Reglas / Descripción</td>
                        <td>N/D</td>
                    </tr>
                </table>
            </div>

            <!-- Sección Configuración del torneo -->
            <div class="col-md-6 mb-4">
                <div class="seccion-titulo">
                    <span>Configuración del torneo</span>
                    <a href="#" class="btn-editar">
                        <i class="fas fa-edit"></i>
                    </a>
                </div>
                <table class="tabla-detalles">
                    <tr>
                        <td>Número de vueltas</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <td>Puntos (Victoria, Empate, Derrota)</td>
                        <td>3, 1, 0</td>
                    </tr>
                </table>
            </div>
        </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>