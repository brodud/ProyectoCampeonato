<?php

class PaisDAO {
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
    
    public function insertar() {
        $sql = "INSERT INTO g5_pais (nombre, sigla_fifa, bandera_url, id_confederacion)
                VALUES ('" . $this->nombre . "', 
                        '" . $this->sigla_fifa . "', 
                        '" . $this->bandera_url . "', 
                        " . $this->id_confederacion . ")";
        
        return $sql;
    }
    

    public function consultarTodos() {
        return "SELECT p.id_pais, p.nombre, p.sigla_fifa, p.bandera_url,
                       c.nombre as confederacion, c.sigla as sigla_conf
                FROM g5_pais p
                INNER JOIN g5_confederacion c ON p.id_confederacion = c.id_confederacion
                ORDER BY c.nombre, p.nombre";
    }

    public function consultarNoParticipantes($id_campeonato) {
        return "SELECT p.id_pais, p.nombre, p.sigla_fifa, p.bandera_url,
                       c.nombre as confederacion, c.sigla as sigla_conf
                FROM g5_pais p
                INNER JOIN g5_confederacion c ON p.id_confederacion = c.id_confederacion
                WHERE p.id_pais NOT IN (
                    SELECT id_pais FROM g5_participante WHERE id_campeonato = '" . $id_campeonato . "'
                )
                ORDER BY c.nombre, p.nombre";
    }

    public function consultarPorId($id_pais) {
        return "SELECT p.*, c.nombre as confederacion, c.sigla as sigla_conf
                FROM g5_pais p
                INNER JOIN g5_confederacion c ON p.id_confederacion = c.id_confederacion
                WHERE p.id_pais = '" . $id_pais . "'";
    }

    public function consultarPorConfederacion($id_confederacion) {
        return "SELECT * FROM g5_pais 
                WHERE id_confederacion = '" . $id_confederacion . "'
                ORDER BY nombre";
    }

}
?>