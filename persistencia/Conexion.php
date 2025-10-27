<?php

class Conexion{
    private $conexion;
    private $resultado;
    
public function abrir(){
        if($_SERVER['REMOTE_ADDR'] == "::1"){
            $this -> conexion = new mysqli("localhost", "root", "", "campeonato_futbol");
        }else{
            $this -> conexion = new mysqli("localhost", "itiud_aplint", "GYesgQ118&", "itiud_aplint");
        }        
        if ($this->conexion->connect_error) {
            throw new Exception("Fallo de conexión a MySQLi: " . $this->conexion->connect_error);
        }
    }
    
    public function getConexion(){
        //  objeto mysqli para usar begin_transaction, commit, etc.
        return $this->conexion;
    }
    
    public function cerrar(){
        $this -> conexion -> close();
    }
    
    public function ejecutar($sentencia){
        
        $this -> resultado = $this -> conexion -> query($sentencia);
        if($this -> resultado === false){
            throw new Exception("Error en la consulta: " . $this -> conexion -> error);
        }
        return $this -> resultado;
    }
    
    public function registro(){
        return $this -> resultado -> fetch_row();
    }
    
    public function filas(){
        return $this -> resultado -> num_rows;
    }
    
}


?>