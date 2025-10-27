<?php
class CampeonatoDAO {
    private $id_campeonato;
    private $nombre;
    private $anio;
    private $imagen_url;
    private $fecha_inicio;
    private $fecha_fin;
    private $id_admin;

    public function __construct($id_campeonato=0, $nombre="", $anio=0, $imagen_url="", $fecha_inicio=null, $fecha_fin=null, $id_admin=0){
        $this->id_campeonato = $id_campeonato;
        $this->nombre = $nombre;
        $this->anio = $anio;
        $this->imagen_url = $imagen_url;
        $this->fecha_inicio = $fecha_inicio;
        $this->fecha_fin = $fecha_fin;
        $this->id_admin = $id_admin;
    }
    

    public function insertar(){
        $imagen_url = (!empty($this->imagen_url)) ? "'" . $this->imagen_url . "'" : "NULL";
        $fecha_inicio = (!empty($this->fecha_inicio)) ? "'" . $this->fecha_inicio . "'" : "NULL";
        $fecha_fin = (!empty($this->fecha_fin)) ? "'" . $this->fecha_fin . "'" : "NULL";
        
        $sql= "INSERT INTO g8_campeonato (nombre, anio, imagen_url, fecha_inicio, fecha_fin, id_admin)
            VALUES ('" . $this->nombre . "', " . $this->anio . ", " . $imagen_url . ", " .
            $fecha_inicio . ", " . $fecha_fin . ", " . $this->id_admin . ")";

    return $sql;
    }
    public function consultarTodos($id_admin){
        
        $sql= "SELECT id_campeonato, nombre, anio, imagen_url, fecha_inicio, fecha_fin, id_admin 
                FROM g8_campeonato 
                WHERE id_admin = '" . $id_admin . "'";
        return $sql;       
    }

    public function consultarPorId(){
        return "SELECT id_campeonato, nombre, anio, imagen_url, fecha_inicio, fecha_fin, id_admin 
                FROM g8_campeonato 
                WHERE id_campeonato = '" . $this->id_campeonato . "'";
    }
}
?>
