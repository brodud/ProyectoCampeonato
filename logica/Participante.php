<?php
require_once(__DIR__ . '/../persistencia/ParticipanteDAO.php');
require_once(__DIR__ . '/../persistencia/Conexion.php');


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
        
        // Verificar si ya existe
        $dao = new ParticipanteDAO($this->id_campeonato, $this->id_pais);
        $resultado = $conexion->ejecutar($dao->verificarExistencia());
        
        if ($resultado && $resultado->num_rows > 0) {
            $conexion->cerrar();
            throw new Exception("Este equipo ya está agregado al campeonato");
        }
        
        // Agregar participante
        $conexion->ejecutar($dao->insertar());
        $conexion->cerrar();
    }

    public function eliminar() {
        $conexion = new Conexion();
        $conexion->abrir();
        $dao = new ParticipanteDAO($this->id_campeonato, $this->id_pais);
        $conexion->ejecutar($dao->eliminar());
        $conexion->cerrar();
    }

    public static function obtenerPorCampeonato($id_campeonato) {
        $conexion = new Conexion();
        $conexion->abrir();
        $dao = new ParticipanteDAO($id_campeonato, 0);
        $resultado = $conexion->ejecutar($dao->consultarPorCampeonato());
        
        $equipos = [];
        if ($resultado) {
            while ($fila = $resultado->fetch_assoc()) {
                $equipos[] = $fila;
            }
        }
        
        $conexion->cerrar();
        return $equipos;
    }

    public static function contarPorCampeonato($id_campeonato) {
        $conexion = new Conexion();
        $conexion->abrir();
        $dao = new ParticipanteDAO($id_campeonato, 0);
        $resultado = $conexion->ejecutar($dao->contarParticipantes());
        
        $total = 0;
        if ($resultado && $fila = $resultado->fetch_assoc()) {
            $total = $fila['total'];
        }
        
        $conexion->cerrar();
        return $total;
    }
}
?>