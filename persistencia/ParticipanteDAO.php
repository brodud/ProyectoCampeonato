<?php

class ParticipanteDAO {
    private $id_campeonato;
    private $id_pais;

    public function __construct($id_campeonato = 0, $id_pais = 0) {
        $this->id_campeonato = $id_campeonato;
        $this->id_pais = $id_pais;
    }

    public function insertar() {
        return "INSERT INTO g5_participante (id_campeonato, id_pais) 
                VALUES ('" . $this->id_campeonato . "', '" . $this->id_pais . "')";
    }

    public function eliminar() {
        return "DELETE FROM g5_participante 
                WHERE id_campeonato = '" . $this->id_campeonato . "' 
                AND id_pais = '" . $this->id_pais . "'";
    }

    public function verificarExistencia() {
        return "SELECT * FROM g5_participante 
                WHERE id_campeonato = '" . $this->id_campeonato . "' 
                AND id_pais = '" . $this->id_pais . "'";
    }

    public function consultarPorCampeonato() {
        return "SELECT p.id_pais, p.nombre, p.sigla_fifa, p.bandera_url, 
                       c.nombre as confederacion, c.sigla as sigla_conf
                FROM g5_participante part
                INNER JOIN g5_pais p ON part.id_pais = p.id_pais
                INNER JOIN g5_confederacion c ON p.id_confederacion = c.id_confederacion
                WHERE part.id_campeonato = '" . $this->id_campeonato . "'
                ORDER BY p.nombre";
    }

    public function contarParticipantes() {
        return "SELECT COUNT(*) as total FROM g5_participante 
                WHERE id_campeonato = '" . $this->id_campeonato . "'";
    }
}
?>