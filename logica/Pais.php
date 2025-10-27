<?php
require_once(__DIR__ . '/../persistencia/PaisDAO.php');
require_once(__DIR__ . '/../persistencia/Conexion.php');

class Pais {
    private $id_pais;
    private $nombre;
    private $sigla_fifa;
    private $bandera_url;
    private $id_confederacion;

    public function __construct($id_pais = 0, $nombre = "", $sigla_fifa = "", $bandera_url = "", $id_confederacion = 0) {
        $this->id_pais = $id_pais;
        $this->nombre = $nombre;
        $this->sigla_fifa = $sigla_fifa;
        $this->bandera_url = $bandera_url;
        $this->id_confederacion = $id_confederacion;
    }

    public function getId_pais() {
        return $this->id_pais;
    }

    public function getNombre() {
        return $this->nombre;
    }

    public function getSigla_fifa() {
        return $this->sigla_fifa;
    }

    public function getBandera_url() {
        return $this->bandera_url;
    }

    public function getId_confederacion() {
        return $this->id_confederacion;
    }

    public static function consultarTodos() {
        $conexion = new Conexion();
        $conexion->abrir();
        $dao = new PaisDAO();
        $resultado = $conexion->ejecutar($dao->consultarTodos());
        
        $paises = [];
        if ($resultado) {
            while ($fila = $resultado->fetch_assoc()) {
                $paises[] = $fila;
            }
        }
        
        $conexion->cerrar();
        return $paises;
    }

    public static function obtenerNoParticipantes($id_campeonato) {
        $conexion = new Conexion();
        $conexion->abrir();
        $dao = new PaisDAO();
        $resultado = $conexion->ejecutar($dao->consultarNoParticipantes($id_campeonato));
        
        $paises = [];
        if ($resultado) {
            while ($fila = $resultado->fetch_assoc()) {
                $paises[] = $fila;
            }
        }
        
        $conexion->cerrar();
        return $paises;
    }

    public static function obtenerPorId($id_pais) {
        $conexion = new Conexion();
        $conexion->abrir();
        $dao = new PaisDAO();
        $resultado = $conexion->ejecutar($dao->consultarPorId($id_pais));
        
        $pais = null;
        if ($resultado && $fila = $resultado->fetch_assoc()) {
            $pais = $fila;
        }
        
        $conexion->cerrar();
        return $pais;
    }


public function crear(){
    // 1. Validar que la Confederación no sea 0
    if ($this->id_confederacion <= 0) {
        throw new Exception("Debe seleccionar una confederación válida.");
    }
    $conexion = new Conexion();
    $conexion->abrir();
    
    $paisDAO = new PaisDAO(
        $this->id_pais, 
        $this->nombre, 
        $this->sigla_fifa, 
        $this->bandera_url, 
        $this->id_confederacion
    ); 

    $conexion->ejecutar($paisDAO->insertar());
    $conexion->cerrar();
}
}
?>