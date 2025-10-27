<?php
require_once(__DIR__ . '/../persistencia/CampeonatoDAO.php');
require_once(__DIR__ . '/../persistencia/Conexion.php');

class Campeonato {
    private $id_campeonato;
    private $nombre;
    private $anio;
    private $imagen_url;
    private $fecha_inicio;
    private $fecha_fin;
    private $id_admin;

    public function __construct($id=0, $nombre="", $anio=0, $imagen="", $inicio=null, $fin=null, $admin=0){
        $this->id_campeonato = $id;
        $this->nombre = $nombre;
        $this->anio = $anio;
        $this->imagen_url = $imagen;
        $this->fecha_inicio = $inicio;
        $this->fecha_fin = $fin;
        $this->id_admin = $admin;
    }

    public function getId() { return $this->id_campeonato; }
    public function getNombre() { return $this->nombre; }
    public function getAnio() { return $this->anio; }
    public function getImagenUrl() { return $this->imagen_url; }
    public function getFechaInicio() { return $this->fecha_inicio; }
    public function getFechaFin() { return $this->fecha_fin; }
    public function getIdAdmin() { return $this->id_admin; }

    public function crear(){
        $conexion = new Conexion();
        $conexion->abrir();
        
        $dao = new CampeonatoDAO(
            $this->id_campeonato,
            $this->nombre,
            $this->anio,
            $this->imagen_url,
            $this->fecha_inicio,
            $this->fecha_fin,
            $this->id_admin
        );
        
        $conexion->ejecutar($dao->insertar());
        $conexion->cerrar();
    }

    public static function consultar($id_admin = 0){
        $conexion = new Conexion();
        $conexion->abrir();
        $dao = new CampeonatoDAO();
        $resultado = $conexion->ejecutar($dao->consultarTodos($id_admin));
        
        $campeonatos = [];
        while ($fila = $resultado->fetch_assoc()) {
            $campeonatos[] = new Campeonato(
                $fila['id_campeonato'],
                $fila['nombre'],
                $fila['anio'], 
                $fila['imagen_url'],
                $fila['fecha_inicio'],
                $fila['fecha_fin'],
                $fila['id_admin']
            );
        }
        
        $conexion->cerrar();
        return $campeonatos;
    }

    public function consultarPorId(){
        $conexion = new Conexion();
        $conexion->abrir();    
        $dao = new CampeonatoDAO($this->id_campeonato); 
        $conexion->ejecutar($dao->consultarPorId());
        
        $tupla = $conexion->registro(); 
        $conexion->cerrar();
        
        if ($tupla) {
            $this->nombre = $tupla[1];
            $this->anio = $tupla[2];
            $this->imagen_url = $tupla[3];
            $this->fecha_inicio = $tupla[4];
            $this->fecha_fin = $tupla[5];
            $this->id_admin = $tupla[6];
            return true;
        }
        
        return false;
    }   
}
?>