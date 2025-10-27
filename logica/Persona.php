<?php
abstract class Persona {
    protected $id;
    protected $nombre;
    protected $apellido;
    protected $correo;
    protected $contraseña;
    
    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }
    
   
    /**
     * @return mixed
     */
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * @return mixed
     */
    public function getApellido()
    {
        return $this->apellido;
    }

    /**
     * @return mixed
     */
    public function getCorreo()
    {
        return $this->correo;
    }

    /**
     * @return mixed
     */
    public function getcontraseña()
    {
        return $this->contraseña;
    }

    /**
     * @param mixed $nombre
     */
    public function setId($id)
    {
        $this->id= $id;
    }
    
    /**
     * @param mixed $nombre
     */
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;
    }

    /**
     * @param mixed $apellido
     */
    public function setApellido($apellido)
    {
        $this->apellido = $apellido;
    }

    /**
     * @param mixed $correo
     */
    public function setCorreo($correo)
    {
        $this->correo = $correo;
    }

    /**
     * @param mixed $contraseña
     */
    public function setcontraseña($contraseña)
    {
        $this->contraseña = $contraseña;
    }

    public function __construct($id=0, $nombre="", $apellido="", $correo="", $contraseña=""){
        $this -> id = $id;
        $this -> nombre = $nombre;
        $this -> apellido = $apellido;
        $this -> correo = $correo;
        $this -> contraseña = $contraseña;
    }
}
?>
