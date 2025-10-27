<?php
class AdminDAO {
    private $id;
    private $nombre;
    private $apellido;
    private $correo;
    private $contraseña;

    public function __construct($id=0, $nombre="", $apellido="", $correo="", $contraseña=""){
        $this -> id = $id;
        $this -> nombre = $nombre;
        $this -> apellido = $apellido;
        $this -> correo = $correo;
        $this -> contraseña = $contraseña;
    }
    
    public function autenticar(){
        return "select id_admin
                from g8_administrador
            where correo = '" . $this -> correo . "' and contraseña = md5('" . $this -> contraseña . "')";
    }
    
    public function consultarPorId(){
        return "select nombre, apellido, correo
                from g8_administrador 
                where id_admin = '" . $this -> id . "'";
    }
}

?>
