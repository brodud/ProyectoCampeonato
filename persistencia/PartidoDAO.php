<?php
class PartidoDAO {
    private $id_fecha;
    private $id_local;
    private $id_visitante;
    private $id_estadio;
    private $fecha_partido;
    private $hora_partido;

    public function __construct($id_fecha=0, $id_local=0, $id_visitante=0, $id_estadio=0, $fecha_partido='', $hora_partido='') {
        $this->id_fecha = $id_fecha;
        $this->id_local = $id_local;
        $this->id_visitante = $id_visitante;
        $this->id_estadio = $id_estadio;
        $this->fecha_partido = $fecha_partido;
        $this->hora_partido = $hora_partido;
    }

    public function insertar() {
        return "INSERT INTO g5_partido (id_fecha, id_local, id_visitante, id_estadio, fecha_partido, hora_partido, estado) 
                VALUES (" . $this->id_fecha . ", " . $this->id_local . ", " . $this->id_visitante . ", " . $this->id_estadio . ", 
                        '" . $this->fecha_partido . "', '" . $this->hora_partido . "', 'pendiente')";
    }

    public function consultarPartidosPorFecha($id_fecha) {
        return "SELECT id_local, id_visitante, fecha_partido, hora_partido 
                FROM g5_partido 
                WHERE id_fecha = " . (int)$id_fecha . 
                " ORDER BY hora_partido ASC";
    }
    
}
?>