<?php
require_once(__DIR__ . '/../persistencia/Conexion.php');
require_once(__DIR__ . '/../persistencia/PartidoDAO.php');
require_once(__DIR__ . '/Pais.php');

class Partido {
    private $id_partido;
    private $id_fecha;
    private $id_local;
    private $id_visitante;
    private $id_estadio;
    private $fecha_partido;
    private $hora_partido;
 
    public function __construct($id=0, $fecha=0, $local=0, $visitante=0, $estadio=0, $fecha_part='', $hora='') {
        $this->id_partido = $id;
        $this->id_fecha = $fecha;
        $this->id_local = $local;
        $this->id_visitante = $visitante;
        $this->id_estadio = $estadio;
        $this->fecha_partido = $fecha_part;
        $this->hora_partido = $hora;
    }

    public function crear($conexion) {
        $dao = new PartidoDAO(
            $this->id_fecha, $this->id_local, $this->id_visitante, 
            $this->id_estadio, $this->fecha_partido, $this->hora_partido
        );
        $conexion->ejecutar($dao->insertar());
    }

    public static function obtenerPartidosPorFecha($id_fecha) {
        $conexion = new Conexion();
        $conexion->abrir();
        
        $sql = "SELECT id_local, id_visitante, fecha_partido, hora_partido 
                FROM g8_partido 
                WHERE id_fecha = " . (int)$id_fecha . 
                " ORDER BY hora_partido ASC";
                
        $resultado = $conexion->ejecutar($sql);
        $partidos = [];
        
        while ($fila = $resultado->fetch_assoc()) {
            $partido = (object) $fila;
            
            $local = Pais::obtenerPorId($partido->id_local);
            $visitante = Pais::obtenerPorId($partido->id_visitante);
            
            $partido->nombre_local = $local['nombre'] ?? 'Desconocido';
            $partido->nombre_visitante = $visitante['nombre'] ?? 'Desconocido';
            
            $partidos[] = $partido;
        }
        
        $conexion->cerrar();
        return $partidos;
    }
}
?>