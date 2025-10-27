<?php
require_once(__DIR__ . '/../persistencia/ConfederacionDAO.php'); 
require_once(__DIR__ . '/../persistencia/Conexion.php');
class Confederacion {
    private $id_confederacion;
    private $nombre;
    private $sigla;
    private $logo_url;

    public function __construct($id_confederacion = 0, $nombre = "", $sigla = "", $logo_url = "") {
        $this->id_confederacion = $id_confederacion;
        $this->nombre = $nombre;
        $this->sigla = $sigla;
        $this->logo_url = $logo_url;
    }

    public static function consultarTodos() {
        $conexion = new Conexion();
        $conexion->abrir();
        $dao = new ConfederacionDao();
        $resultado = $conexion->ejecutar($dao->consultarTodos());
        
        $confederaciones = [];
        if ($resultado) {
            while ($fila = $resultado->fetch_assoc()) {
                $confederaciones[] = $fila;
            }
        }
        
        $conexion->cerrar();
        return $confederaciones;
    }
}