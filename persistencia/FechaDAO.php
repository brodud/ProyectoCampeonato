<?php
class FechaDAO {
    private $id_fecha;
    private $numero_fecha;
    private $fecha_real;
    private $id_campeonato;

    public function __construct($id_fecha=0, $numero_fecha=0, $fecha_real='', $id_campeonato=0) {
        $this->id_fecha = $id_fecha;
        $this->numero_fecha = $numero_fecha;
        $this->fecha_real = $fecha_real;
        $this->id_campeonato = $id_campeonato;
    }

    public function insertar() {
        return "INSERT INTO g8_fecha (numero_fecha, fecha_real, id_campeonato) 
            VALUES (" . $this->numero_fecha . ", '" . $this->fecha_real . "', " . $this->id_campeonato . ")";
    }

    // Método de limpieza
    public function eliminarPorCampeonato() {
        return "DELETE FROM g8_fecha WHERE id_campeonato = " . $this->id_campeonato;
    }
}
?>