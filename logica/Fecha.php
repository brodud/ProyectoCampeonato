<?php
require_once(__DIR__ . '/../persistencia/FechaDAO.php');
require_once(__DIR__ . '/../persistencia/Conexion.php');
require_once(__DIR__ . '/Participante.php'); 
require_once(__DIR__ . '/Partido.php'); 

class Fecha {
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

    // Genera calendario Round-Robin
  public static function generarCalendario($id_campeonato, $fecha_inicio_base, $estadio_default_id) {
        $conexion = new Conexion();
        $conexion->abrir();
        $conn = $conexion->getConexion();
        
        // Consultar los equipos del campeonato
        $participantes_data = Participante::obtenerPorCampeonato($id_campeonato);
        $equipos = array_column($participantes_data, 'id_pais');
        $N = count($equipos);

        if ($N < 2) {
            $conexion->cerrar();
            throw new Exception("Debe haber al menos 2 equipos para generar el calendario.");
        }

        // Iniciar transacción (por si algo falla, se revierte todo)
        $conn->begin_transaction();

        try {
            // Eliminar fechas anteriores (si existían)
            $limpiezaDAO = new FechaDAO(0, 0, '', $id_campeonato);
            $conn->query($limpiezaDAO->eliminarPorCampeonato());

            // Copia de equipos para armar el calendario
            $equipos_copia = $equipos;
            $dummy = -1; // Representa un dummy  si hay cantidad impar

            // Si hay número impar de equipos, se agrega el dummy
            if ($N % 2 != 0) {
                $equipos_copia[] = $dummy;
                $N++;
            }

            $rondas = $N - 1;
            $pivote = array_shift($equipos_copia); // primer equipo fijo
            $rotadores = $equipos_copia; // los demás rotan
            
            $fecha_actual = new DateTime($fecha_inicio_base);
            $intervalo = new DateInterval('P7D'); // cada ronda es semanal

            // Generar todas las rondas
            for ($ronda = 1; $ronda <= $rondas; $ronda++) {

                // Registrar la fecha (ronda)
                $fechaDAO = new FechaDAO(0, $ronda, $fecha_actual->format('Y-m-d'), $id_campeonato);
                $stmt_fecha = $conn->prepare($fechaDAO->insertar());
                $stmt_fecha->execute();
                $id_fecha = $conn->insert_id;
                $stmt_fecha->close();

                if (!$id_fecha) {
                    throw new Exception("Error creando la fecha número $ronda");
                }

                // Generar los partidos de la ronda
                $equipos_ronda = array_merge([$pivote], $rotadores);

                for ($i = 0; $i < $N / 2; $i++) {
                    $local = $equipos_ronda[$i];
                    $visitante = $equipos_ronda[$N - 1 - $i];

                    // Si alguno es el "dummy", no se genera partido
                    if ($local == $dummy || $visitante == $dummy) {
                        continue;
                    }

                    // Crear el partido
                    $partido = new Partido(
                        0,
                        $id_fecha,
                        $local,
                        $visitante,
                        $estadio_default_id,
                        $fecha_actual->format('Y-m-d'),
                        '16:00:00'
                    );

                    $partido->crear($conexion);
                }

                // Rotar los equipos para la siguiente ronda
                $ultimo = array_pop($rotadores);
                array_unshift($rotadores, $ultimo);

                // Avanzar una semana
                $fecha_actual->add($intervalo);
            }

            $conn->commit();

        } catch (Exception $e) {
            // Si algo falla, revertir todo
            $conn->rollback();
            throw new Exception("Error generando calendario: " . $e->getMessage());
        } finally {
            $conexion->cerrar();
        }
    }

    //Obtiene todas las fechas (rondas) de un campeonato
    public static function obtenerFechasPorCampeonato($id_campeonato) {
        $conexion = new Conexion();
        $conexion->abrir();

        $sql = "SELECT id_fecha, numero_fecha, fecha_real 
                FROM g8_fecha 
                WHERE id_campeonato = " . (int)$id_campeonato . "
                ORDER BY numero_fecha ASC";

        $resultado = $conexion->ejecutar($sql);
        $fechas = [];

        while ($fila = $resultado->fetch_assoc()) {
            $fechas[] = (object) $fila;
        }

        $conexion->cerrar();
        return $fechas;
    }
}