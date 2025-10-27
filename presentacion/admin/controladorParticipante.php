<?php
require_once(__DIR__ . '/../../logica/Participante.php'); 

// Solo procesar si es POST
if ($_SERVER['REQUEST_METHOD'] != 'POST') {
    header("Location: crearParticipante.php");
    exit();
}

$id_campeonato = (int)$_POST['id_campeonato'];
$id_pais = (int)$_POST['id_pais'];
$url_redireccion = 'crearParticipante.php?id_campeonato=' . $id_campeonato;

// Validar datos
if ($id_campeonato <= 0 || $id_pais <= 0) {
    header("Location: " . $url_redireccion . "&status=error&message=" . urlencode("Seleccione campeonato y país"));
    exit();
}

try {
    $participante = new Participante($id_campeonato, $id_pais);
    $participante->agregar(); 
    header("Location: " . $url_redireccion . "&status=success");
    
} catch (Exception $e) {
    header("Location: " . $url_redireccion . "&status=error&message=" . urlencode($e->getMessage()));
}

exit();
?>