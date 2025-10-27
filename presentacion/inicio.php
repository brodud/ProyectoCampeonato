<!-- presentacion/inicio.php -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold d-flex align-items-center" href="#">
      <img src="img/logo.png" alt="Logo" width="40" height="40" class="me-2 rounded-circle">
      Campeonato de Fútbol
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="menu">
      <ul class="navbar-nav">
        <li class="nav-item"><a href="#" class="nav-link active">Inicio</a></li>
        <li class="nav-item"><a href="presentacion/admin/listarCampeonatos.php" class="nav-link">Campeonatos</a></li>
        <li class="nav-item"><a href="presentacion/admin/verParticipantes.php" class="nav-link">Equipos</a></li>
        <li class="nav-item"><a href="#" class="nav-link">Resultados</a></li>
        <li class="nav-item"><a href="#" class="nav-link">Contacto</a></li>
    <li class="nav-item">
    <a href="autenticar.php" 
      class="btn btn-outline-primary">
      <i class="fa-solid fa-user-tie me-1"></i> Administrador
    </a>
    </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Banner principal -->
<section class="banner text-white text-center d-flex align-items-center justify-content-center">
  <div class="overlay"></div>
  <div class="contenido">
    <h1 class="display-4 fw-bold">¡Vive la pasión del fútbol!</h1>
    <p class="lead">Resultados, posiciones y mucho más de tus torneos favoritos</p>
    <a href="presentacion/admin/listarCampeonatos.php" class="btn btn-light btn-lg mt-3">Ver Campeonatos</a>
  </div>
</section>

<!-- Sección de campeonatos destacados -->
<section class="container my-5">
  <h2 class="text-center mb-4">Campeonatos Destacados</h2>
  <div class="row g-4">
    <div class="col-md-4">
      <div class="card shadow-sm">
        <img src="img/copa_america.jpg" class="card-img-top" alt="Copa América">
        <div class="card-body text-center">
          <h5 class="card-title">Copa América</h5>
          <p class="card-text">Organizada por la CONMEBOL</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card shadow-sm">
        <img src="img/eurocopa.jpg" class="card-img-top" alt="Eurocopa">
        <div class="card-body text-center">
          <h5 class="card-title">Eurocopa</h5>
          <p class="card-text">Organizada por la UEFA</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card shadow-sm">
        <img src="img/mundial.jpg" class="card-img-top" alt="Mundial">
        <div class="card-body text-center">
          <h5 class="card-title">Mundial</h5>
          <p class="card-text">Organizado por la FIFA</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="bg-dark text-white text-center p-3">
  <p class="mb-0">&copy; 2025 Campeonato de Fútbol - Todos los derechos reservados</p>
</footer>
