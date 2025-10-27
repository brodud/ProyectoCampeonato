<?php
require_once("persistencia/ParticipanteDAO.php");
require_once("persistencia/Conexion.php");

class Participante {
    private $id_campeonato;
    private $id_pais;

    public function __construct($id_campeonato = 0, $id_pais = 0) {
        $this->id_campeonato = $id_campeonato;
        $this->id_pais = $id_pais;
    }

    public function agregar() {
        $conexion = new Conexion();
        $conexion->abrir();
        $dao = new ParticipanteDAO($this->id_campeonato, $this->id_pais);
        $resultado = $conexion->ejecutar($dao->verificarExistencia());
        
        if ($resultado && $resultado->num_rows > 0) {
            $conexion->cerrar();
            throw new Exception("Este equipo ya está agregado al campeonato");
        }
        $conexion->ejecutar($dao->insertar());
        $conexion->cerrar();
    }
}