<?php
class ConfederacionDAO {
    private $id_confederacion;
    private $nombre;
    private $sigla;
    private $logo_url;

    public function __construct($id_confederacion=0, $nombre="", $sigla="", $logo_url=""){
        $this->id_confederacion = $id_confederacion;
        $this->nombre = $nombre;
        $this->sigla = $sigla;
        $this->logo_url = $logo_url;
    }

    public function consultarTodos(){
        return "SELECT * FROM g5_confederacion";
    }
}   