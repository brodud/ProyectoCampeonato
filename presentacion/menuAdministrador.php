<head>
    <base href="http://localhost/proyectocampeonatofutbol/presentacion/">
</head>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">
            ⚽ Campeonato de Fútbol
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="menu">
            <ul class="navbar-nav ms-auto align-items-center">
                 <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Campeonato
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="admin/crearCampeonato.php">
                            Crear Nuevo
                        </a></li>
                        <li><a class="dropdown-item" href="admin/listarCampeonatos.php">
                            Ver Todos
                        </a></li>
                    </ul>
                </li>     
                <li class="nav-item"><a class="nav-link" href="admin/crearPais.php">Crear pais</a></li>
                <li class="nav-item"><a class="nav-link" href="admin/crearParticipante.php">Crear Participante</a></li>
                <li class="nav-item"><a class="nav-link" href="admin/generarCalendario.php">Calendario</a></li>
                <li class="nav-item"><a class="nav-link" href="admin/clasificacion.php">Clasificación</a></li>                 
            </ul>
            <a href="../logout.php" class="btn btn-outline-light ms-3">
                <i class="fa-solid fa-right-from-bracket me-1"></i>Salir
            </a>
        </div>
    </div>
</nav>
<!-- Cargar Bootstrap JS (necesario para dropdowns y collapse) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
