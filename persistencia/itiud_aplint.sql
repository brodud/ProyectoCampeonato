-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 10.123.0.165:3306
-- Tiempo de generación: 19-10-2025 a las 00:49:52
-- Versión del servidor: 8.4.5
-- Versión de PHP: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `itiud_aplint`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Admin`
--

CREATE TABLE `Admin` (
  `idAdmin` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `clave` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Admin`
--

INSERT INTO `Admin` (`idAdmin`, `nombre`, `apellido`, `correo`, `clave`) VALUES
(1, 'Hector', 'Florez', 'hf@ce.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Carrito`
--

CREATE TABLE `Carrito` (
  `cantidad` int NOT NULL,
  `Cliente_idCliente` int NOT NULL,
  `Producto_idProducto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cliente`
--

CREATE TABLE `Cliente` (
  `idCliente` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `correo` varchar(150) NOT NULL,
  `clave` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `Cliente`
--

INSERT INTO `Cliente` (`idCliente`, `nombre`, `apellido`, `fechaNacimiento`, `correo`, `clave`) VALUES
(1, 'Thomas', 'Aguirre', '2006-03-16', 'teaguirrec@udistrital.edu.co', '202cb962ac59075b964b07152d234b70'),
(2, 'Mateo ', 'Cardenas', '2025-04-05', 'Mcardenasp@udistrita.edu.co', '202cb962ac59075b964b07152d234b70'),
(3, 'Luisa', 'Parra', '2000-03-12', 'lfparrav@udistrital.edu.co', '3f08311e8579fdd7a72718e0eb8cd8c7'),
(4, 'Jonathan Sebastian', 'Bernal Vargas', '1990-10-21', 'asd@gmail.com', '202cb962ac59075b964b07152d234b70'),
(5, 'Angel', 'Gonzalez', '2025-07-10', 'angelgonzalez@correo.zzz', '81dc9bdb52d04dc20036dbd8313ed055'),
(6, 'Eduard Jeam Pierre ', 'Quintero Garcia', '2002-10-18', 'eq@xd.com', '202cb962ac59075b964b07152d234b70'),
(7, 'Anderson', 'Piratoba', '2003-06-17', 'alhombro13@gmail.com', '202cb962ac59075b964b07152d234b70'),
(8, 'Jose', 'Gonzalez', '2003-01-11', 'joligogo7@gmail.com', '402cc2e72d639f869c3ff02156615f71'),
(9, 'Emmanuel', 'Arevalo', '2005-12-27', 'eaf@correo.com', '202cb962ac59075b964b07152d234b70'),
(10, 'marlon', 'pulido', '2002-04-12', 'davidciam.12@gmail.com', '202cb962ac59075b964b07152d234b70'),
(11, 'Oscar Daniel', 'Colorado Yara', '2000-04-05', 'oscar@coreo.com', '202cb962ac59075b964b07152d234b70'),
(12, 'Natalia', 'Herrera', '2002-11-11', 'natalia@gmail.com', '202cb962ac59075b964b07152d234b70'),
(13, 'Juan ', 'Montilla', '2002-08-12', 'juan@correo.com', '202cb962ac59075b964b07152d234b70'),
(14, 'Natalia', 'Guzman', '2005-07-11', 'nata@gmail.com', '202cb962ac59075b964b07152d234b70'),
(15, 'Brayan', 'Rodriguez', '1999-11-01', 'baro@gmail.com', '202cb962ac59075b964b07152d234b70'),
(16, 'Brandon Steven', 'Oviedo Ortiz', '2002-07-25', 'stebra555@gmail.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Factura`
--

CREATE TABLE `Factura` (
  `idFactura` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `valorTotal` int NOT NULL,
  `Cliente_idCliente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FacturaProducto`
--

CREATE TABLE `FacturaProducto` (
  `cantidad` int NOT NULL,
  `precioVenta` decimal(10,2) NOT NULL,
  `Factura_idFactura` int NOT NULL,
  `Producto_idProducto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g1_admin`
--

CREATE TABLE `g1_admin` (
  `id_admin` int NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `clave` varchar(150) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `g1_admin`
--

INSERT INTO `g1_admin` (`id_admin`, `nombre`, `correo`, `clave`) VALUES
(1, 'pepe', 'pp@lm.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g1_campeonato`
--

CREATE TABLE `g1_campeonato` (
  `id_campeonato` int NOT NULL,
  `id_usuario` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_tipo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `g1_campeonato`
--

INSERT INTO `g1_campeonato` (`id_campeonato`, `id_usuario`, `nombre`, `id_tipo`) VALUES
(2, 1, 'Champions League v1', 1),
(3, 1, 'Champions League v2', 1),
(5, 1, 'Champions League v3', 1),
(6, 1, 'Champions League v4', 1),
(7, 1, 'Champions League 789456', 1),
(8, 1, 'Champions League v6', 1),
(9, 1, 'campeonatofinal', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g1_campeonato_equipos`
--

CREATE TABLE `g1_campeonato_equipos` (
  `id_campeonato` int NOT NULL,
  `id_equipo` int NOT NULL,
  `puntuacion` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `g1_campeonato_equipos`
--

INSERT INTO `g1_campeonato_equipos` (`id_campeonato`, `id_equipo`, `puntuacion`) VALUES
(2, 1, 0),
(2, 2, 0),
(2, 3, 0),
(2, 4, 0),
(2, 5, 0),
(2, 6, 0),
(2, 21, 0),
(2, 22, 0),
(2, 23, 0),
(2, 24, 0),
(2, 25, 0),
(2, 26, 0),
(3, 1, 0),
(3, 2, 0),
(3, 3, 0),
(3, 4, 0),
(3, 5, 0),
(3, 8, 0),
(3, 26, 0),
(5, 1, 0),
(5, 2, 0),
(5, 3, 0),
(6, 1, 0),
(6, 2, 0),
(6, 3, 0),
(6, 4, 0),
(6, 5, 0),
(6, 21, 0),
(6, 22, 0),
(6, 23, 0),
(6, 24, 0),
(7, 1, 0),
(7, 2, 0),
(7, 3, 0),
(7, 5, 0),
(7, 8, 0),
(7, 21, 0),
(7, 22, 0),
(7, 23, 0),
(7, 24, 0),
(7, 41, 0),
(7, 42, 0),
(7, 43, 0),
(7, 44, 0),
(7, 47, 0),
(7, 51, 0),
(7, 56, 0),
(7, 58, 0),
(8, 1, 0),
(8, 2, 0),
(8, 3, 0),
(8, 5, 0),
(8, 6, 0),
(8, 7, 0),
(8, 8, 0),
(8, 9, 0),
(8, 10, 0),
(8, 11, 0),
(8, 12, 0),
(8, 13, 0),
(8, 14, 0),
(8, 15, 0),
(8, 16, 0),
(8, 17, 0),
(8, 18, 0),
(8, 19, 0),
(8, 20, 0),
(8, 21, 0),
(8, 22, 0),
(8, 23, 0),
(8, 24, 0),
(8, 25, 0),
(8, 26, 0),
(8, 28, 0),
(8, 30, 0),
(8, 35, 0),
(9, 1, 0),
(9, 3, 0),
(9, 7, 0),
(9, 9, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g1_equipo`
--

CREATE TABLE `g1_equipo` (
  `id_equipo` int NOT NULL,
  `nombre` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `id_liga` int NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `g1_equipo`
--

INSERT INTO `g1_equipo` (`id_equipo`, `nombre`, `id_liga`, `img`) VALUES
(1, 'Real Madrid', 1, 'https://a.espncdn.com/i/teamlogos/soccer/500/86.png'),
(2, 'Barcelona', 1, 'https://a.espncdn.com/i/teamlogos/soccer/500/83.png'),
(3, 'Atlético de Madrid', 1, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/1068.png'),
(4, 'Sevilla', 1, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/1068.png'),
(5, 'Valencia', 1, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/94.png'),
(6, 'Villarreal', 1, 'https://a.espncdn.com/i/teamlogos/soccer/500/102.png'),
(7, 'Real Sociedad', 1, 'https://a.espncdn.com/i/teamlogos/soccer/500-dark/89.png'),
(8, 'Athletic Club', 1, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/93.png'),
(9, 'Getafe', 1, 'https://a.espncdn.com/i/teamlogos/soccer/500/2922.png'),
(10, 'Celta de Vigo', 1, 'https://a.espncdn.com/i/teamlogos/soccer/500-dark/85.png'),
(11, 'Betis', 1, 'https://a.espncdn.com/i/teamlogos/soccer/500-dark/244.png'),
(12, 'Osasuna', 1, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/97.png'),
(13, 'Espanyol', 1, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/88.png'),
(14, 'Mallorca', 1, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/84.png'),
(15, 'Granada', 1, 'https://a.espncdn.com/i/teamlogos/soccer/500-dark/3747.png'),
(16, 'Alavés', 1, 'https://a.espncdn.com/i/teamlogos/soccer/500/96.png'),
(17, 'Girona', 1, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/9812.png'),
(18, 'Las Palmas', 1, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/98.png'),
(19, 'Rayo Vallecano', 1, 'https://a.espncdn.com/i/teamlogos/soccer/500-dark/101.png'),
(20, 'Cádiz', 1, 'https://a.espncdn.com/i/teamlogos/soccer/500-dark/3842.png'),
(21, 'Manchester City', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/382.png'),
(22, 'Liverpool', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/364.png'),
(23, 'Arsenal', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/359.png'),
(24, 'Manchester United', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/360.png'),
(25, 'Chelsea', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/363.png'),
(26, 'Tottenham Hotspur', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/367.png'),
(27, 'Newcastle United', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/362.png'),
(28, 'Aston Villa', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/362.png'),
(29, 'Brighton & Hove Albion', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/397.png'),
(30, 'West Ham United', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/371.png'),
(31, 'Brentford', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/403.png'),
(32, 'Crystal Palace', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/387.png'),
(33, 'Fulham', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/402.png'),
(34, 'Wolverhampton', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/394.png'),
(35, 'Everton', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/368.png'),
(36, 'Nottingham Forest', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/395.png'),
(37, 'Bournemouth', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/381.png'),
(38, 'Leeds United', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/357.png'),
(39, 'Leicester City', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/338.png'),
(40, 'Sheffield United', 2, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/372.png'),
(41, 'España', 3, 'https://a.espncdn.com/i/teamlogos/soccer/500/86.png'),
(42, 'Francia', 3, 'https://a.espncdn.com/i/teamlogos/soccer/500/86.png'),
(43, 'Alemania', 3, 'https://a.espncdn.com/i/teamlogos/soccer/500/86.png'),
(44, 'Italia', 3, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/642.png'),
(45, 'Inglaterra', 3, 'https://a.espncdn.com/i/teamlogos/soccer/500/86.png'),
(46, 'Portugal', 3, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/660.png'),
(47, 'Países Bajos', 3, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/655.png'),
(48, 'Argentina', 3, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/620.png'),
(49, 'Brasil', 3, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/632.png'),
(50, 'Uruguay', 3, 'https://a.espncdn.com/i/teamlogos/soccer/500/86.png'),
(51, 'Colombia', 3, 'https://a.espncdn.com/i/teamlogos/soccer/500/132.png'),
(52, 'Chile', 3, 'https://a.espncdn.com/i/teamlogos/soccer/500/124.png'),
(53, 'México', 3, 'https://a.espncdn.com/i/teamlogos/soccer/500/11420.png'),
(54, 'Estados Unidos', 3, 'https://a.espncdn.com/i/teamlogos/soccer/500/134.png'),
(55, 'Canadá', 3, 'https://a.espncdn.com/i/teamlogos/soccer/500/131.png'),
(56, 'Japón', 3, 'https://a.espncdn.com/i/teamlogos/soccer/500/3841.png'),
(57, 'Corea del Sur', 3, 'https://a.espncdn.com/i/teamlogos/soccer/500/125.png'),
(58, 'Australia', 3, 'https://a.espncdn.com/i/teamlogos/soccer/500/126.png'),
(59, 'Croacia', 3, 'https://a.espncdn.com/i/teamlogos/soccer/500/619.png'),
(60, 'Marruecos', 3, 'https://a.espncdn.com/i/teamlogos/soccer/500/7911.png'),
(61, 'Juventus', 4, 'https://a.espncdn.com/i/teamlogos/soccer/500/7911.png'),
(62, 'Inter de Milán', 4, 'https://a.espncdn.com/i/teamlogos/soccer/500/137.png'),
(63, 'AC Milan', 4, 'https://a.espncdn.com/i/teamlogos/soccer/500/598.png'),
(64, 'Napoli', 4, 'https://a.espncdn.com/i/teamlogos/soccer/500/3841.png'),
(65, 'Roma', 4, 'https://a.espncdn.com/i/teamlogos/soccer/500/138.png'),
(66, 'Lazio', 4, 'https://a.espncdn.com/i/teamlogos/soccer/500/2950.png'),
(67, 'Atalanta', 4, 'https://a.espncdn.com/i/teamlogos/soccer/500/268.png'),
(68, 'Fiorentina', 4, 'https://a.espncdn.com/i/teamlogos/soccer/500/86.png'),
(69, 'Torino', 4, 'https://a.espncdn.com/i/teamlogos/soccer/500/109.png'),
(70, 'Bologna', 4, 'https://a.espncdn.com/i/teamlogos/soccer/500/119.png'),
(71, 'Sassuolo', 4, 'https://a.espncdn.com/i/teamlogos/soccer/500/86.png'),
(72, 'Udinese', 4, 'https://a.espncdn.com/i/teamlogos/soccer/500/86.png'),
(73, 'Monza', 4, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/658.png'),
(74, 'Empoli', 4, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/658.png'),
(75, 'Lecce', 4, 'https://a.espncdn.com/i/teamlogos/soccer/500/86.png'),
(76, 'Verona', 4, 'https://a.espncdn.com/i/teamlogos/soccer/500/86.png'),
(77, 'Genoa', 4, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/656.png'),
(78, 'Cagliari', 4, 'https://a.espncdn.com/i/teamlogos/soccer/500/86.png'),
(79, 'Salernitana', 4, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/658.png'),
(80, 'Parma', 4, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/656.png'),
(81, 'Bayern Múnich', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(82, 'Borussia Dortmund', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(83, 'RB Leipzig', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(84, 'Bayer Leverkusen', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(85, 'Eintracht Frankfurt', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(86, 'VfL Wolfsburgo', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(87, 'Borussia Mönchengladbach', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(88, 'Freiburg', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(89, 'Union Berlín', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(90, 'Mainz 05', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(91, 'Stuttgart', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(92, 'Augsburgo', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(93, 'Colonia', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(94, 'Bochum', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(95, 'Hoffenheim', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(96, 'Hertha Berlín', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(97, 'Schalke 04', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(98, 'Hannover 96', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(99, 'Hamburgo', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png'),
(100, 'Núremberg', 5, 'https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/132.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g1_fase`
--

CREATE TABLE `g1_fase` (
  `id_fase` int NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `g1_fase`
--

INSERT INTO `g1_fase` (`id_fase`, `nombre`) VALUES
(1, 'todos contra todos'),
(2, 'fase de grupos'),
(3, 'octavos'),
(4, 'cuartos'),
(5, 'semifinal'),
(6, 'final');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g1_fecha`
--

CREATE TABLE `g1_fecha` (
  `id_fecha` int NOT NULL,
  `id_campeonato` int NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `g1_fecha`
--

INSERT INTO `g1_fecha` (`id_fecha`, `id_campeonato`, `fecha`) VALUES
(78, 2, '2025-10-15'),
(79, 2, '2025-10-16'),
(80, 2, '2025-10-18'),
(81, 2, '2025-10-19'),
(82, 2, '2025-10-20'),
(83, 2, '2025-10-21'),
(84, 2, '2025-10-22'),
(85, 2, '2025-10-23'),
(86, 2, '2025-10-24'),
(87, 2, '2025-10-25'),
(88, 2, '2025-10-26'),
(89, 3, '2025-10-15'),
(90, 3, '2025-10-16'),
(91, 3, '2025-10-17'),
(92, 3, '2025-10-18'),
(93, 3, '2025-10-19'),
(94, 3, '2025-10-20'),
(95, 3, '2025-10-21'),
(99, 5, '2025-10-15'),
(100, 5, '2025-10-16'),
(101, 5, '2025-10-17'),
(102, 6, '2025-10-15'),
(103, 6, '2025-10-16'),
(104, 6, '2025-10-18'),
(105, 6, '2025-10-21'),
(106, 6, '2025-10-22'),
(107, 6, '2025-10-23'),
(108, 6, '2025-10-24'),
(109, 6, '2025-10-25'),
(110, 6, '2025-10-26'),
(111, 7, '2025-10-16'),
(112, 7, '2025-10-17'),
(113, 7, '2025-10-18'),
(114, 7, '2025-10-19'),
(115, 7, '2025-10-20'),
(116, 7, '2025-10-21'),
(117, 7, '2025-10-22'),
(118, 7, '2025-10-23'),
(119, 7, '2025-10-24'),
(120, 7, '2025-10-25'),
(121, 7, '2025-10-26'),
(122, 7, '2025-10-27'),
(123, 7, '2025-10-28'),
(124, 7, '2025-10-29'),
(125, 7, '2025-10-30'),
(126, 7, '2025-10-31'),
(127, 7, '2025-11-01'),
(128, 8, '2025-10-17'),
(129, 8, '2025-10-18'),
(130, 8, '2025-10-19'),
(131, 8, '2025-10-20'),
(132, 8, '2025-10-21'),
(133, 8, '2025-10-22'),
(134, 8, '2025-10-30'),
(135, 8, '2025-11-01'),
(136, 8, '2025-11-03'),
(137, 8, '2025-11-04'),
(138, 8, '2025-11-05'),
(139, 8, '2025-11-13'),
(140, 8, '2025-11-14'),
(141, 8, '2025-11-15'),
(142, 8, '2025-11-16'),
(143, 8, '2025-11-17'),
(144, 8, '2025-11-18'),
(145, 8, '2025-11-19'),
(146, 8, '2025-11-20'),
(147, 8, '2025-11-21'),
(148, 8, '2025-11-22'),
(149, 8, '2025-11-30'),
(150, 8, '2025-12-01'),
(151, 8, '2025-12-03'),
(152, 8, '2025-12-10'),
(153, 8, '2025-12-11'),
(154, 8, '2025-12-19'),
(155, 9, '2025-10-18'),
(156, 9, '2025-10-25'),
(157, 9, '2025-10-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g1_liga`
--

CREATE TABLE `g1_liga` (
  `id_liga` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `g1_liga`
--

INSERT INTO `g1_liga` (`id_liga`, `nombre`) VALUES
(1, 'La Liga'),
(2, 'Premier League'),
(3, 'Internacional'),
(4, 'Serie A'),
(5, 'Bundesliga');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g1_partido`
--

CREATE TABLE `g1_partido` (
  `id_partido` int NOT NULL,
  `id_eq_local` int NOT NULL,
  `id_eq_visit` int NOT NULL,
  `id_fase` int NOT NULL,
  `id_fecha` int NOT NULL,
  `goles_local` int NOT NULL,
  `goles_visit` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `g1_partido`
--

INSERT INTO `g1_partido` (`id_partido`, `id_eq_local`, `id_eq_visit`, `id_fase`, `id_fecha`, `goles_local`, `goles_visit`) VALUES
(1, 1, 26, 1, 78, 0, 0),
(2, 2, 25, 1, 78, 0, 0),
(3, 3, 24, 1, 78, 0, 0),
(4, 4, 23, 1, 78, 0, 0),
(5, 5, 22, 1, 78, 0, 0),
(6, 6, 21, 1, 78, 0, 0),
(7, 1, 25, 1, 79, 0, 0),
(8, 26, 24, 1, 79, 0, 0),
(9, 2, 23, 1, 79, 0, 0),
(10, 3, 22, 1, 79, 0, 0),
(11, 4, 21, 1, 79, 0, 0),
(12, 5, 6, 1, 79, 0, 0),
(13, 1, 24, 1, 80, 0, 0),
(14, 25, 23, 1, 80, 0, 0),
(15, 26, 22, 1, 80, 0, 0),
(16, 2, 21, 1, 80, 0, 0),
(17, 3, 6, 1, 80, 0, 0),
(18, 4, 5, 1, 80, 0, 0),
(19, 1, 23, 1, 81, 0, 0),
(20, 24, 22, 1, 81, 0, 0),
(21, 25, 21, 1, 81, 0, 0),
(22, 26, 6, 1, 81, 0, 0),
(23, 2, 5, 1, 81, 0, 0),
(24, 3, 4, 1, 81, 0, 0),
(25, 1, 22, 1, 82, 0, 0),
(26, 23, 21, 1, 82, 0, 0),
(27, 24, 6, 1, 82, 0, 0),
(28, 25, 5, 1, 82, 0, 0),
(29, 26, 4, 1, 82, 0, 0),
(30, 2, 3, 1, 82, 0, 0),
(31, 1, 21, 1, 83, 0, 0),
(32, 22, 6, 1, 83, 0, 0),
(33, 23, 5, 1, 83, 0, 0),
(34, 24, 4, 1, 83, 0, 0),
(35, 25, 3, 1, 83, 0, 0),
(36, 26, 2, 1, 83, 0, 0),
(37, 1, 6, 1, 84, 0, 0),
(38, 21, 5, 1, 84, 0, 0),
(39, 22, 4, 1, 84, 0, 0),
(40, 23, 3, 1, 84, 0, 0),
(41, 24, 2, 1, 84, 0, 0),
(42, 25, 26, 1, 84, 0, 0),
(43, 1, 5, 1, 85, 0, 0),
(44, 6, 4, 1, 85, 0, 0),
(45, 21, 3, 1, 85, 0, 0),
(46, 22, 2, 1, 85, 0, 0),
(47, 23, 26, 1, 85, 0, 0),
(48, 24, 25, 1, 85, 0, 0),
(49, 1, 4, 1, 86, 0, 0),
(50, 5, 3, 1, 86, 0, 0),
(51, 6, 2, 1, 86, 0, 0),
(52, 21, 26, 1, 86, 0, 0),
(53, 22, 25, 1, 86, 0, 0),
(54, 23, 24, 1, 86, 0, 0),
(55, 1, 3, 1, 87, 0, 0),
(56, 4, 2, 1, 87, 0, 0),
(57, 5, 26, 1, 87, 0, 0),
(58, 6, 25, 1, 87, 0, 0),
(59, 21, 24, 1, 87, 0, 0),
(60, 22, 23, 1, 87, 0, 0),
(61, 1, 2, 1, 88, 0, 0),
(62, 3, 26, 1, 88, 0, 0),
(63, 4, 25, 1, 88, 0, 0),
(64, 5, 24, 1, 88, 0, 0),
(65, 6, 23, 1, 88, 0, 0),
(66, 21, 22, 1, 88, 0, 0),
(67, 2, 26, 1, 89, 0, 0),
(68, 3, 8, 1, 89, 0, 0),
(69, 4, 5, 1, 89, 0, 0),
(70, 1, 26, 1, 90, 0, 0),
(71, 2, 5, 1, 90, 0, 0),
(72, 3, 4, 1, 90, 0, 0),
(73, 1, 8, 1, 91, 0, 0),
(74, 26, 5, 1, 91, 0, 0),
(75, 2, 3, 1, 91, 0, 0),
(76, 1, 5, 1, 92, 0, 0),
(77, 8, 4, 1, 92, 0, 0),
(78, 26, 3, 1, 92, 0, 0),
(79, 1, 4, 1, 93, 0, 0),
(80, 5, 3, 1, 93, 0, 0),
(81, 8, 2, 1, 93, 0, 0),
(82, 1, 3, 1, 94, 0, 0),
(83, 4, 2, 1, 94, 0, 0),
(84, 8, 26, 1, 94, 0, 0),
(85, 1, 2, 1, 95, 0, 0),
(86, 4, 26, 1, 95, 0, 0),
(87, 5, 8, 1, 95, 0, 0),
(88, 2, 3, 1, 99, 0, 0),
(89, 1, 3, 1, 100, 0, 0),
(90, 1, 2, 1, 101, 0, 0),
(91, 2, 24, 1, 102, 0, 0),
(92, 3, 23, 1, 102, 0, 0),
(93, 4, 22, 1, 102, 0, 0),
(94, 5, 21, 1, 102, 0, 0),
(95, 1, 24, 1, 103, 0, 0),
(96, 2, 22, 1, 103, 0, 0),
(97, 3, 21, 1, 103, 0, 0),
(98, 4, 5, 1, 103, 0, 0),
(99, 1, 23, 1, 104, 0, 0),
(100, 24, 22, 1, 104, 0, 0),
(101, 2, 5, 1, 104, 0, 0),
(102, 3, 4, 1, 104, 0, 0),
(103, 1, 22, 1, 105, 0, 0),
(104, 23, 21, 1, 105, 0, 0),
(105, 24, 5, 1, 105, 0, 0),
(106, 2, 3, 1, 105, 0, 0),
(107, 1, 21, 1, 106, 0, 0),
(108, 22, 5, 1, 106, 0, 0),
(109, 23, 4, 1, 106, 0, 0),
(110, 24, 3, 1, 106, 0, 0),
(111, 1, 5, 1, 107, 0, 0),
(112, 21, 4, 1, 107, 0, 0),
(113, 22, 3, 1, 107, 0, 0),
(114, 23, 2, 1, 107, 0, 0),
(115, 1, 4, 1, 108, 0, 0),
(116, 5, 3, 1, 108, 0, 0),
(117, 21, 2, 1, 108, 0, 0),
(118, 23, 24, 1, 108, 0, 0),
(119, 1, 3, 1, 109, 0, 0),
(120, 4, 2, 1, 109, 0, 0),
(121, 21, 24, 1, 109, 0, 0),
(122, 22, 23, 1, 109, 0, 0),
(123, 1, 2, 1, 110, 0, 0),
(124, 4, 24, 1, 110, 0, 0),
(125, 5, 23, 1, 110, 0, 0),
(126, 21, 22, 1, 110, 0, 0),
(127, 2, 58, 1, 111, 0, 0),
(128, 3, 56, 1, 111, 0, 0),
(129, 5, 51, 1, 111, 0, 0),
(130, 8, 47, 1, 111, 0, 0),
(131, 21, 44, 1, 111, 0, 0),
(132, 22, 43, 1, 111, 0, 0),
(133, 23, 42, 1, 111, 0, 0),
(134, 24, 41, 1, 111, 0, 0),
(135, 1, 58, 1, 112, 0, 0),
(136, 2, 51, 1, 112, 0, 0),
(137, 3, 47, 1, 112, 0, 0),
(138, 5, 44, 1, 112, 0, 0),
(139, 8, 43, 1, 112, 0, 0),
(140, 21, 42, 1, 112, 0, 0),
(141, 22, 41, 1, 112, 0, 0),
(142, 23, 24, 1, 112, 0, 0),
(143, 1, 56, 1, 113, 0, 0),
(144, 58, 51, 1, 113, 0, 0),
(145, 2, 44, 1, 113, 0, 0),
(146, 3, 43, 1, 113, 0, 0),
(147, 5, 42, 1, 113, 0, 0),
(148, 8, 41, 1, 113, 0, 0),
(149, 21, 24, 1, 113, 0, 0),
(150, 22, 23, 1, 113, 0, 0),
(151, 1, 51, 1, 114, 0, 0),
(152, 56, 47, 1, 114, 0, 0),
(153, 58, 44, 1, 114, 0, 0),
(154, 2, 42, 1, 114, 0, 0),
(155, 3, 41, 1, 114, 0, 0),
(156, 5, 24, 1, 114, 0, 0),
(157, 8, 23, 1, 114, 0, 0),
(158, 21, 22, 1, 114, 0, 0),
(159, 1, 47, 1, 115, 0, 0),
(160, 51, 44, 1, 115, 0, 0),
(161, 56, 43, 1, 115, 0, 0),
(162, 58, 42, 1, 115, 0, 0),
(163, 2, 24, 1, 115, 0, 0),
(164, 3, 23, 1, 115, 0, 0),
(165, 5, 22, 1, 115, 0, 0),
(166, 8, 21, 1, 115, 0, 0),
(167, 1, 44, 1, 116, 0, 0),
(168, 47, 43, 1, 116, 0, 0),
(169, 51, 42, 1, 116, 0, 0),
(170, 56, 41, 1, 116, 0, 0),
(171, 58, 24, 1, 116, 0, 0),
(172, 2, 22, 1, 116, 0, 0),
(173, 3, 21, 1, 116, 0, 0),
(174, 5, 8, 1, 116, 0, 0),
(175, 1, 43, 1, 117, 0, 0),
(176, 44, 42, 1, 117, 0, 0),
(177, 47, 41, 1, 117, 0, 0),
(178, 51, 24, 1, 117, 0, 0),
(179, 56, 23, 1, 117, 0, 0),
(180, 58, 22, 1, 117, 0, 0),
(181, 2, 8, 1, 117, 0, 0),
(182, 3, 5, 1, 117, 0, 0),
(183, 1, 42, 1, 118, 0, 0),
(184, 43, 41, 1, 118, 0, 0),
(185, 44, 24, 1, 118, 0, 0),
(186, 47, 23, 1, 118, 0, 0),
(187, 51, 22, 1, 118, 0, 0),
(188, 56, 21, 1, 118, 0, 0),
(189, 58, 8, 1, 118, 0, 0),
(190, 2, 3, 1, 118, 0, 0),
(191, 1, 41, 1, 119, 0, 0),
(192, 42, 24, 1, 119, 0, 0),
(193, 43, 23, 1, 119, 0, 0),
(194, 44, 22, 1, 119, 0, 0),
(195, 47, 21, 1, 119, 0, 0),
(196, 51, 8, 1, 119, 0, 0),
(197, 56, 5, 1, 119, 0, 0),
(198, 58, 3, 1, 119, 0, 0),
(199, 1, 24, 1, 120, 0, 0),
(200, 41, 23, 1, 120, 0, 0),
(201, 42, 22, 1, 120, 0, 0),
(202, 43, 21, 1, 120, 0, 0),
(203, 44, 8, 1, 120, 0, 0),
(204, 47, 5, 1, 120, 0, 0),
(205, 51, 3, 1, 120, 0, 0),
(206, 56, 2, 1, 120, 0, 0),
(207, 1, 23, 1, 121, 0, 0),
(208, 24, 22, 1, 121, 0, 0),
(209, 41, 21, 1, 121, 0, 0),
(210, 42, 8, 1, 121, 0, 0),
(211, 43, 5, 1, 121, 0, 0),
(212, 44, 3, 1, 121, 0, 0),
(213, 47, 2, 1, 121, 0, 0),
(214, 56, 58, 1, 121, 0, 0),
(215, 1, 22, 1, 122, 0, 0),
(216, 23, 21, 1, 122, 0, 0),
(217, 24, 8, 1, 122, 0, 0),
(218, 41, 5, 1, 122, 0, 0),
(219, 42, 3, 1, 122, 0, 0),
(220, 43, 2, 1, 122, 0, 0),
(221, 47, 58, 1, 122, 0, 0),
(222, 51, 56, 1, 122, 0, 0),
(223, 1, 21, 1, 123, 0, 0),
(224, 22, 8, 1, 123, 0, 0),
(225, 23, 5, 1, 123, 0, 0),
(226, 24, 3, 1, 123, 0, 0),
(227, 41, 2, 1, 123, 0, 0),
(228, 43, 58, 1, 123, 0, 0),
(229, 44, 56, 1, 123, 0, 0),
(230, 47, 51, 1, 123, 0, 0),
(231, 1, 8, 1, 124, 0, 0),
(232, 21, 5, 1, 124, 0, 0),
(233, 22, 3, 1, 124, 0, 0),
(234, 23, 2, 1, 124, 0, 0),
(235, 41, 58, 1, 124, 0, 0),
(236, 42, 56, 1, 124, 0, 0),
(237, 43, 51, 1, 124, 0, 0),
(238, 44, 47, 1, 124, 0, 0),
(239, 1, 5, 1, 125, 0, 0),
(240, 8, 3, 1, 125, 0, 0),
(241, 21, 2, 1, 125, 0, 0),
(242, 23, 58, 1, 125, 0, 0),
(243, 24, 56, 1, 125, 0, 0),
(244, 41, 51, 1, 125, 0, 0),
(245, 42, 47, 1, 125, 0, 0),
(246, 43, 44, 1, 125, 0, 0),
(247, 1, 3, 1, 126, 0, 0),
(248, 5, 2, 1, 126, 0, 0),
(249, 21, 58, 1, 126, 0, 0),
(250, 22, 56, 1, 126, 0, 0),
(251, 23, 51, 1, 126, 0, 0),
(252, 24, 47, 1, 126, 0, 0),
(253, 41, 44, 1, 126, 0, 0),
(254, 42, 43, 1, 126, 0, 0),
(255, 1, 2, 1, 127, 0, 0),
(256, 5, 58, 1, 127, 0, 0),
(257, 8, 56, 1, 127, 0, 0),
(258, 21, 51, 1, 127, 0, 0),
(259, 22, 47, 1, 127, 0, 0),
(260, 23, 44, 1, 127, 0, 0),
(261, 24, 43, 1, 127, 0, 0),
(262, 41, 42, 1, 127, 0, 0),
(263, 1, 35, 1, 128, 0, 0),
(264, 2, 30, 1, 128, 0, 0),
(265, 3, 28, 1, 128, 0, 0),
(266, 5, 26, 1, 128, 0, 0),
(267, 6, 25, 1, 128, 0, 0),
(268, 7, 24, 1, 128, 0, 0),
(269, 8, 23, 1, 128, 0, 0),
(270, 9, 22, 1, 128, 0, 0),
(271, 10, 21, 1, 128, 0, 0),
(272, 11, 20, 1, 128, 0, 0),
(273, 12, 19, 1, 128, 0, 0),
(274, 13, 18, 1, 128, 0, 0),
(275, 14, 17, 1, 128, 0, 0),
(276, 15, 16, 1, 128, 0, 0),
(277, 1, 30, 1, 129, 0, 0),
(278, 35, 28, 1, 129, 0, 0),
(279, 2, 26, 1, 129, 0, 0),
(280, 3, 25, 1, 129, 0, 0),
(281, 5, 24, 1, 129, 0, 0),
(282, 6, 23, 1, 129, 0, 0),
(283, 7, 22, 1, 129, 0, 0),
(284, 8, 21, 1, 129, 0, 0),
(285, 9, 20, 1, 129, 0, 0),
(286, 10, 19, 1, 129, 0, 0),
(287, 11, 18, 1, 129, 0, 0),
(288, 12, 17, 1, 129, 0, 0),
(289, 13, 16, 1, 129, 0, 0),
(290, 14, 15, 1, 129, 0, 0),
(291, 1, 28, 1, 130, 0, 0),
(292, 30, 26, 1, 130, 0, 0),
(293, 35, 25, 1, 130, 0, 0),
(294, 2, 24, 1, 130, 0, 0),
(295, 3, 23, 1, 130, 0, 0),
(296, 5, 22, 1, 130, 0, 0),
(297, 6, 21, 1, 130, 0, 0),
(298, 7, 20, 1, 130, 0, 0),
(299, 8, 19, 1, 130, 0, 0),
(300, 9, 18, 1, 130, 0, 0),
(301, 10, 17, 1, 130, 0, 0),
(302, 11, 16, 1, 130, 0, 0),
(303, 12, 15, 1, 130, 0, 0),
(304, 13, 14, 1, 130, 0, 0),
(305, 1, 26, 1, 131, 0, 0),
(306, 28, 25, 1, 131, 0, 0),
(307, 30, 24, 1, 131, 0, 0),
(308, 35, 23, 1, 131, 0, 0),
(309, 2, 22, 1, 131, 0, 0),
(310, 3, 21, 1, 131, 0, 0),
(311, 5, 20, 1, 131, 0, 0),
(312, 6, 19, 1, 131, 0, 0),
(313, 7, 18, 1, 131, 0, 0),
(314, 8, 17, 1, 131, 0, 0),
(315, 9, 16, 1, 131, 0, 0),
(316, 10, 15, 1, 131, 0, 0),
(317, 11, 14, 1, 131, 0, 0),
(318, 12, 13, 1, 131, 0, 0),
(319, 1, 25, 1, 132, 0, 0),
(320, 26, 24, 1, 132, 0, 0),
(321, 28, 23, 1, 132, 0, 0),
(322, 30, 22, 1, 132, 0, 0),
(323, 35, 21, 1, 132, 0, 0),
(324, 2, 20, 1, 132, 0, 0),
(325, 3, 19, 1, 132, 0, 0),
(326, 5, 18, 1, 132, 0, 0),
(327, 6, 17, 1, 132, 0, 0),
(328, 7, 16, 1, 132, 0, 0),
(329, 8, 15, 1, 132, 0, 0),
(330, 9, 14, 1, 132, 0, 0),
(331, 10, 13, 1, 132, 0, 0),
(332, 11, 12, 1, 132, 0, 0),
(333, 1, 24, 1, 133, 0, 0),
(334, 25, 23, 1, 133, 0, 0),
(335, 26, 22, 1, 133, 0, 0),
(336, 28, 21, 1, 133, 0, 0),
(337, 30, 20, 1, 133, 0, 0),
(338, 35, 19, 1, 133, 0, 0),
(339, 2, 18, 1, 133, 0, 0),
(340, 3, 17, 1, 133, 0, 0),
(341, 5, 16, 1, 133, 0, 0),
(342, 6, 15, 1, 133, 0, 0),
(343, 7, 14, 1, 133, 0, 0),
(344, 8, 13, 1, 133, 0, 0),
(345, 9, 12, 1, 133, 0, 0),
(346, 10, 11, 1, 133, 0, 0),
(347, 1, 23, 1, 134, 0, 0),
(348, 24, 22, 1, 134, 0, 0),
(349, 25, 21, 1, 134, 0, 0),
(350, 26, 20, 1, 134, 0, 0),
(351, 28, 19, 1, 134, 0, 0),
(352, 30, 18, 1, 134, 0, 0),
(353, 35, 17, 1, 134, 0, 0),
(354, 2, 16, 1, 134, 0, 0),
(355, 3, 15, 1, 134, 0, 0),
(356, 5, 14, 1, 134, 0, 0),
(357, 6, 13, 1, 134, 0, 0),
(358, 7, 12, 1, 134, 0, 0),
(359, 8, 11, 1, 134, 0, 0),
(360, 9, 10, 1, 134, 0, 0),
(361, 1, 22, 1, 135, 0, 0),
(362, 23, 21, 1, 135, 0, 0),
(363, 24, 20, 1, 135, 0, 0),
(364, 25, 19, 1, 135, 0, 0),
(365, 26, 18, 1, 135, 0, 0),
(366, 28, 17, 1, 135, 0, 0),
(367, 30, 16, 1, 135, 0, 0),
(368, 35, 15, 1, 135, 0, 0),
(369, 2, 14, 1, 135, 0, 0),
(370, 3, 13, 1, 135, 0, 0),
(371, 5, 12, 1, 135, 0, 0),
(372, 6, 11, 1, 135, 0, 0),
(373, 7, 10, 1, 135, 0, 0),
(374, 8, 9, 1, 135, 0, 0),
(375, 1, 21, 1, 136, 0, 0),
(376, 22, 20, 1, 136, 0, 0),
(377, 23, 19, 1, 136, 0, 0),
(378, 24, 18, 1, 136, 0, 0),
(379, 25, 17, 1, 136, 0, 0),
(380, 26, 16, 1, 136, 0, 0),
(381, 28, 15, 1, 136, 0, 0),
(382, 30, 14, 1, 136, 0, 0),
(383, 35, 13, 1, 136, 0, 0),
(384, 2, 12, 1, 136, 0, 0),
(385, 3, 11, 1, 136, 0, 0),
(386, 5, 10, 1, 136, 0, 0),
(387, 6, 9, 1, 136, 0, 0),
(388, 7, 8, 1, 136, 0, 0),
(389, 1, 20, 1, 137, 0, 0),
(390, 21, 19, 1, 137, 0, 0),
(391, 22, 18, 1, 137, 0, 0),
(392, 23, 17, 1, 137, 0, 0),
(393, 24, 16, 1, 137, 0, 0),
(394, 25, 15, 1, 137, 0, 0),
(395, 26, 14, 1, 137, 0, 0),
(396, 28, 13, 1, 137, 0, 0),
(397, 30, 12, 1, 137, 0, 0),
(398, 35, 11, 1, 137, 0, 0),
(399, 2, 10, 1, 137, 0, 0),
(400, 3, 9, 1, 137, 0, 0),
(401, 5, 8, 1, 137, 0, 0),
(402, 6, 7, 1, 137, 0, 0),
(403, 1, 19, 1, 138, 0, 0),
(404, 20, 18, 1, 138, 0, 0),
(405, 21, 17, 1, 138, 0, 0),
(406, 22, 16, 1, 138, 0, 0),
(407, 23, 15, 1, 138, 0, 0),
(408, 24, 14, 1, 138, 0, 0),
(409, 25, 13, 1, 138, 0, 0),
(410, 26, 12, 1, 138, 0, 0),
(411, 28, 11, 1, 138, 0, 0),
(412, 30, 10, 1, 138, 0, 0),
(413, 35, 9, 1, 138, 0, 0),
(414, 2, 8, 1, 138, 0, 0),
(415, 3, 7, 1, 138, 0, 0),
(416, 5, 6, 1, 138, 0, 0),
(417, 1, 18, 1, 139, 0, 0),
(418, 19, 17, 1, 139, 0, 0),
(419, 20, 16, 1, 139, 0, 0),
(420, 21, 15, 1, 139, 0, 0),
(421, 22, 14, 1, 139, 0, 0),
(422, 23, 13, 1, 139, 0, 0),
(423, 24, 12, 1, 139, 0, 0),
(424, 25, 11, 1, 139, 0, 0),
(425, 26, 10, 1, 139, 0, 0),
(426, 28, 9, 1, 139, 0, 0),
(427, 30, 8, 1, 139, 0, 0),
(428, 35, 7, 1, 139, 0, 0),
(429, 2, 6, 1, 139, 0, 0),
(430, 3, 5, 1, 139, 0, 0),
(431, 1, 17, 1, 140, 0, 0),
(432, 18, 16, 1, 140, 0, 0),
(433, 19, 15, 1, 140, 0, 0),
(434, 20, 14, 1, 140, 0, 0),
(435, 21, 13, 1, 140, 0, 0),
(436, 22, 12, 1, 140, 0, 0),
(437, 23, 11, 1, 140, 0, 0),
(438, 24, 10, 1, 140, 0, 0),
(439, 25, 9, 1, 140, 0, 0),
(440, 26, 8, 1, 140, 0, 0),
(441, 28, 7, 1, 140, 0, 0),
(442, 30, 6, 1, 140, 0, 0),
(443, 35, 5, 1, 140, 0, 0),
(444, 2, 3, 1, 140, 0, 0),
(445, 1, 16, 1, 141, 0, 0),
(446, 17, 15, 1, 141, 0, 0),
(447, 18, 14, 1, 141, 0, 0),
(448, 19, 13, 1, 141, 0, 0),
(449, 20, 12, 1, 141, 0, 0),
(450, 21, 11, 1, 141, 0, 0),
(451, 22, 10, 1, 141, 0, 0),
(452, 23, 9, 1, 141, 0, 0),
(453, 24, 8, 1, 141, 0, 0),
(454, 25, 7, 1, 141, 0, 0),
(455, 26, 6, 1, 141, 0, 0),
(456, 28, 5, 1, 141, 0, 0),
(457, 30, 3, 1, 141, 0, 0),
(458, 35, 2, 1, 141, 0, 0),
(459, 1, 15, 1, 142, 0, 0),
(460, 16, 14, 1, 142, 0, 0),
(461, 17, 13, 1, 142, 0, 0),
(462, 18, 12, 1, 142, 0, 0),
(463, 19, 11, 1, 142, 0, 0),
(464, 20, 10, 1, 142, 0, 0),
(465, 21, 9, 1, 142, 0, 0),
(466, 22, 8, 1, 142, 0, 0),
(467, 23, 7, 1, 142, 0, 0),
(468, 24, 6, 1, 142, 0, 0),
(469, 25, 5, 1, 142, 0, 0),
(470, 26, 3, 1, 142, 0, 0),
(471, 28, 2, 1, 142, 0, 0),
(472, 30, 35, 1, 142, 0, 0),
(473, 1, 14, 1, 143, 0, 0),
(474, 15, 13, 1, 143, 0, 0),
(475, 16, 12, 1, 143, 0, 0),
(476, 17, 11, 1, 143, 0, 0),
(477, 18, 10, 1, 143, 0, 0),
(478, 19, 9, 1, 143, 0, 0),
(479, 20, 8, 1, 143, 0, 0),
(480, 21, 7, 1, 143, 0, 0),
(481, 22, 6, 1, 143, 0, 0),
(482, 23, 5, 1, 143, 0, 0),
(483, 24, 3, 1, 143, 0, 0),
(484, 25, 2, 1, 143, 0, 0),
(485, 26, 35, 1, 143, 0, 0),
(486, 28, 30, 1, 143, 0, 0),
(487, 1, 13, 1, 144, 0, 0),
(488, 14, 12, 1, 144, 0, 0),
(489, 15, 11, 1, 144, 0, 0),
(490, 16, 10, 1, 144, 0, 0),
(491, 17, 9, 1, 144, 0, 0),
(492, 18, 8, 1, 144, 0, 0),
(493, 19, 7, 1, 144, 0, 0),
(494, 20, 6, 1, 144, 0, 0),
(495, 21, 5, 1, 144, 0, 0),
(496, 22, 3, 1, 144, 0, 0),
(497, 23, 2, 1, 144, 0, 0),
(498, 24, 35, 1, 144, 0, 0),
(499, 25, 30, 1, 144, 0, 0),
(500, 26, 28, 1, 144, 0, 0),
(501, 1, 12, 1, 145, 0, 0),
(502, 13, 11, 1, 145, 0, 0),
(503, 14, 10, 1, 145, 0, 0),
(504, 15, 9, 1, 145, 0, 0),
(505, 16, 8, 1, 145, 0, 0),
(506, 17, 7, 1, 145, 0, 0),
(507, 18, 6, 1, 145, 0, 0),
(508, 19, 5, 1, 145, 0, 0),
(509, 20, 3, 1, 145, 0, 0),
(510, 21, 2, 1, 145, 0, 0),
(511, 22, 35, 1, 145, 0, 0),
(512, 23, 30, 1, 145, 0, 0),
(513, 24, 28, 1, 145, 0, 0),
(514, 25, 26, 1, 145, 0, 0),
(515, 1, 11, 1, 146, 0, 0),
(516, 12, 10, 1, 146, 0, 0),
(517, 13, 9, 1, 146, 0, 0),
(518, 14, 8, 1, 146, 0, 0),
(519, 15, 7, 1, 146, 0, 0),
(520, 16, 6, 1, 146, 0, 0),
(521, 17, 5, 1, 146, 0, 0),
(522, 18, 3, 1, 146, 0, 0),
(523, 19, 2, 1, 146, 0, 0),
(524, 20, 35, 1, 146, 0, 0),
(525, 21, 30, 1, 146, 0, 0),
(526, 22, 28, 1, 146, 0, 0),
(527, 23, 26, 1, 146, 0, 0),
(528, 24, 25, 1, 146, 0, 0),
(529, 1, 10, 1, 147, 0, 0),
(530, 11, 9, 1, 147, 0, 0),
(531, 12, 8, 1, 147, 0, 0),
(532, 13, 7, 1, 147, 0, 0),
(533, 14, 6, 1, 147, 0, 0),
(534, 15, 5, 1, 147, 0, 0),
(535, 16, 3, 1, 147, 0, 0),
(536, 17, 2, 1, 147, 0, 0),
(537, 18, 35, 1, 147, 0, 0),
(538, 19, 30, 1, 147, 0, 0),
(539, 20, 28, 1, 147, 0, 0),
(540, 21, 26, 1, 147, 0, 0),
(541, 22, 25, 1, 147, 0, 0),
(542, 23, 24, 1, 147, 0, 0),
(543, 1, 9, 1, 148, 0, 0),
(544, 10, 8, 1, 148, 0, 0),
(545, 11, 7, 1, 148, 0, 0),
(546, 12, 6, 1, 148, 0, 0),
(547, 13, 5, 1, 148, 0, 0),
(548, 14, 3, 1, 148, 0, 0),
(549, 15, 2, 1, 148, 0, 0),
(550, 16, 35, 1, 148, 0, 0),
(551, 17, 30, 1, 148, 0, 0),
(552, 18, 28, 1, 148, 0, 0),
(553, 19, 26, 1, 148, 0, 0),
(554, 20, 25, 1, 148, 0, 0),
(555, 21, 24, 1, 148, 0, 0),
(556, 22, 23, 1, 148, 0, 0),
(557, 1, 8, 1, 149, 0, 0),
(558, 9, 7, 1, 149, 0, 0),
(559, 10, 6, 1, 149, 0, 0),
(560, 11, 5, 1, 149, 0, 0),
(561, 12, 3, 1, 149, 0, 0),
(562, 13, 2, 1, 149, 0, 0),
(563, 14, 35, 1, 149, 0, 0),
(564, 15, 30, 1, 149, 0, 0),
(565, 16, 28, 1, 149, 0, 0),
(566, 17, 26, 1, 149, 0, 0),
(567, 18, 25, 1, 149, 0, 0),
(568, 19, 24, 1, 149, 0, 0),
(569, 20, 23, 1, 149, 0, 0),
(570, 21, 22, 1, 149, 0, 0),
(571, 1, 7, 1, 150, 0, 0),
(572, 8, 6, 1, 150, 0, 0),
(573, 9, 5, 1, 150, 0, 0),
(574, 10, 3, 1, 150, 0, 0),
(575, 11, 2, 1, 150, 0, 0),
(576, 12, 35, 1, 150, 0, 0),
(577, 13, 30, 1, 150, 0, 0),
(578, 14, 28, 1, 150, 0, 0),
(579, 15, 26, 1, 150, 0, 0),
(580, 16, 25, 1, 150, 0, 0),
(581, 17, 24, 1, 150, 0, 0),
(582, 18, 23, 1, 150, 0, 0),
(583, 19, 22, 1, 150, 0, 0),
(584, 20, 21, 1, 150, 0, 0),
(585, 1, 6, 1, 151, 0, 0),
(586, 7, 5, 1, 151, 0, 0),
(587, 8, 3, 1, 151, 0, 0),
(588, 9, 2, 1, 151, 0, 0),
(589, 10, 35, 1, 151, 0, 0),
(590, 11, 30, 1, 151, 0, 0),
(591, 12, 28, 1, 151, 0, 0),
(592, 13, 26, 1, 151, 0, 0),
(593, 14, 25, 1, 151, 0, 0),
(594, 15, 24, 1, 151, 0, 0),
(595, 16, 23, 1, 151, 0, 0),
(596, 17, 22, 1, 151, 0, 0),
(597, 18, 21, 1, 151, 0, 0),
(598, 19, 20, 1, 151, 0, 0),
(599, 1, 5, 1, 152, 0, 0),
(600, 6, 3, 1, 152, 0, 0),
(601, 7, 2, 1, 152, 0, 0),
(602, 8, 35, 1, 152, 0, 0),
(603, 9, 30, 1, 152, 0, 0),
(604, 10, 28, 1, 152, 0, 0),
(605, 11, 26, 1, 152, 0, 0),
(606, 12, 25, 1, 152, 0, 0),
(607, 13, 24, 1, 152, 0, 0),
(608, 14, 23, 1, 152, 0, 0),
(609, 15, 22, 1, 152, 0, 0),
(610, 16, 21, 1, 152, 0, 0),
(611, 17, 20, 1, 152, 0, 0),
(612, 18, 19, 1, 152, 0, 0),
(613, 1, 3, 1, 153, 0, 0),
(614, 5, 2, 1, 153, 0, 0),
(615, 6, 35, 1, 153, 0, 0),
(616, 7, 30, 1, 153, 0, 0),
(617, 8, 28, 1, 153, 0, 0),
(618, 9, 26, 1, 153, 0, 0),
(619, 10, 25, 1, 153, 0, 0),
(620, 11, 24, 1, 153, 0, 0),
(621, 12, 23, 1, 153, 0, 0),
(622, 13, 22, 1, 153, 0, 0),
(623, 14, 21, 1, 153, 0, 0),
(624, 15, 20, 1, 153, 0, 0),
(625, 16, 19, 1, 153, 0, 0),
(626, 17, 18, 1, 153, 0, 0),
(627, 1, 2, 1, 154, 0, 0),
(628, 3, 35, 1, 154, 0, 0),
(629, 5, 30, 1, 154, 0, 0),
(630, 6, 28, 1, 154, 0, 0),
(631, 7, 26, 1, 154, 0, 0),
(632, 8, 25, 1, 154, 0, 0),
(633, 9, 24, 1, 154, 0, 0),
(634, 10, 23, 1, 154, 0, 0),
(635, 11, 22, 1, 154, 0, 0),
(636, 12, 21, 1, 154, 0, 0),
(637, 13, 20, 1, 154, 0, 0),
(638, 14, 19, 1, 154, 0, 0),
(639, 15, 18, 1, 154, 0, 0),
(640, 16, 17, 1, 154, 0, 0),
(641, 1, 9, 1, 155, 0, 0),
(642, 3, 7, 1, 155, 0, 0),
(643, 1, 7, 1, 156, 0, 0),
(644, 9, 3, 1, 156, 0, 0),
(645, 1, 3, 1, 157, 0, 0),
(646, 7, 9, 1, 157, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g1_tipo`
--

CREATE TABLE `g1_tipo` (
  `id_tipo` int NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `g1_tipo`
--

INSERT INTO `g1_tipo` (`id_tipo`, `nombre`) VALUES
(1, 'Liga'),
(2, 'Eliminatoria'),
(3, 'Mixta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g1_usuario`
--

CREATE TABLE `g1_usuario` (
  `id_usuario` int NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `clave` varchar(150) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `g1_usuario`
--

INSERT INTO `g1_usuario` (`id_usuario`, `nombre`, `correo`, `clave`) VALUES
(1, 'tato', 'tato@lm.com', '202cb962ac59075b964b07152d234b70'),
(2, 'perico', 'perico@lm.com', '202cb962ac59075b964b07152d234b70'),
(3, 'perico2', 'perico2@lm.com', '202cb962ac59075b964b07152d234b70'),
(4, 'JOHAN CAMILO CARDENA', 'jcamilo@lm.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g2Administrador`
--

CREATE TABLE `g2Administrador` (
  `idAdministrador` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `contraseña` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `g2Administrador`
--

INSERT INTO `g2Administrador` (`idAdministrador`, `nombre`, `apellido`, `correo`, `contraseña`) VALUES
(2023157801, 'Natalia', 'Herrera Gomez', 'nhg@campbol.com', '123'),
(2023157802, 'Natalia', 'Guzman Forero', 'ngf@campbol.com', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g2Campeonato`
--

CREATE TABLE `g2Campeonato` (
  `idCampeonato` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `año` year NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFinal` date NOT NULL,
  `Confederacion_idConfederacion` int NOT NULL,
  `Administrador_idAdministrador` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `g2Campeonato`
--

INSERT INTO `g2Campeonato` (`idCampeonato`, `nombre`, `año`, `fechaInicio`, `fechaFinal`, `Confederacion_idConfederacion`, `Administrador_idAdministrador`) VALUES
(1, 'Eliminatorias AFC 2026', '2023', '2023-10-12', '2025-06-11', 1, 2023157801),
(2, 'Eliminatorias CAF 2026', '2023', '2023-11-13', '2025-11-18', 2, 2023157802),
(3, 'Eliminatorias CONCAF 2026', '2023', '2023-03-23', '2025-09-09', 3, 2023157801),
(4, 'Eliminatorias CONMEBOL 2026', '2023', '2023-09-07', '2025-11-09', 4, 2023157802),
(5, 'Eliminatorias OFC 2026', '2024', '2024-09-05', '2025-03-25', 5, 2023157801),
(6, 'Eliminatorias UEFA 2026', '2025', '2025-03-20', '2025-11-18', 6, 2023157802),
(7, 'Copa Asiática', '2024', '2024-01-12', '2024-02-10', 1, 2023157801),
(8, 'Copa Africana de Naciones', '2023', '2023-01-13', '2023-02-11', 2, 2023157802),
(9, 'Copa Oro', '2023', '2023-06-24', '2023-07-16', 3, 2023157801),
(10, 'Copa América', '2024', '2024-06-20', '2024-07-14', 4, 2023157802),
(11, 'Nations Cup Oceania', '2023', '2023-06-10', '2023-06-25', 5, 2023157801),
(12, 'Eurocopa', '2024', '2024-06-14', '2024-07-14', 6, 2023157802);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g2Confederacion`
--

CREATE TABLE `g2Confederacion` (
  `idConfederacion` int NOT NULL,
  `nombre` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `g2Confederacion`
--

INSERT INTO `g2Confederacion` (`idConfederacion`, `nombre`) VALUES
(1, 'AFC'),
(2, 'CAF'),
(3, 'CONCACAF'),
(4, 'CONMEBOL'),
(5, 'OFC'),
(6, 'UEFA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g2Equipo`
--

CREATE TABLE `g2Equipo` (
  `idEquipo` varchar(3) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `bandera` varchar(45) NOT NULL,
  `Confederacion_idConfederacion` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `g2Equipo`
--

INSERT INTO `g2Equipo` (`idEquipo`, `pais`, `bandera`, `Confederacion_idConfederacion`) VALUES
('ARG', 'Argentina', 'banderas/argentina.png', 4),
('AUS', 'Australia', 'banderas/australia.png', 1),
('BRA', 'Brasil', 'banderas/brasil.png', 4),
('CAN', 'Canadá', 'banderas/canada.png', 3),
('CHI', 'Chile', 'banderas/chile.png', 4),
('CMR', 'Camerún', 'banderas/camerun.png', 2),
('COL', 'Colombia', 'banderas/colombia.png', 4),
('CRC', 'Costa Rica', 'banderas/costa_rica.png', 3),
('ECU', 'Ecuador', 'banderas/ecuador.png', 4),
('EGY', 'Egipto', 'banderas/egipto.png', 2),
('ENG', 'Inglaterra', 'banderas/inglaterra.png', 6),
('ESP', 'España', 'banderas/espana.png', 6),
('FIJ', 'Fiyi', 'banderas/fiyi.png', 5),
('FRA', 'Francia', 'banderas/francia.png', 6),
('GER', 'Alemania', 'banderas/alemania.png', 6),
('GHA', 'Ghana', 'banderas/ghana.png', 2),
('IRN', 'Irán', 'banderas/iran.png', 1),
('ITA', 'Italia', 'banderas/italia.png', 6),
('JAM', 'Jamaica', 'banderas/jamaica.png', 3),
('JPN', 'Japón', 'banderas/japon.png', 1),
('KOR', 'Corea del Sur', 'banderas/corea_sur.png', 1),
('KSA', 'Arabia Saudita', 'banderas/arabia_saudita.png', 1),
('MAR', 'Marruecos', 'banderas/marruecos.png', 2),
('MEX', 'México', 'banderas/mexico.png', 3),
('NED', 'Países Bajos', 'banderas/paises_bajos.png', 6),
('NGA', 'Nigeria', 'banderas/nigeria.png', 2),
('NZL', 'Nueva Zelanda', 'banderas/nueva_zelanda.png', 5),
('PAN', 'Panamá', 'banderas/panama.png', 3),
('PNG', 'Papúa Nueva Guinea', 'banderas/papua_nueva_guinea.png', 5),
('QAT', 'Catar', 'banderas/qatar.png', 1),
('SEN', 'Senegal', 'banderas/senegal.png', 2),
('SLB', 'Islas Salomón', 'banderas/islas_salomon.png', 5),
('TAH', 'Tahití', 'banderas/tahiti.png', 5),
('URU', 'Uruguay', 'banderas/uruguay.png', 4),
('USA', 'Estados Unidos', 'banderas/estados_unidos.png', 3),
('VAN', 'Vanuatu', 'banderas/vanuatu.png', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g2EquipoCampeonato`
--

CREATE TABLE `g2EquipoCampeonato` (
  `Campeonato_idCampeonato` int NOT NULL,
  `Equipo_idEquipo` varchar(3) NOT NULL,
  `puntos` int NOT NULL,
  `golesFavor` int NOT NULL,
  `golesContra` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `g2EquipoCampeonato`
--

INSERT INTO `g2EquipoCampeonato` (`Campeonato_idCampeonato`, `Equipo_idEquipo`, `puntos`, `golesFavor`, `golesContra`) VALUES
(1, 'BRA', 9, 7, 2),
(2, 'ARG', 10, 5, 3),
(3, 'FRA', 12, 8, 1),
(4, 'JPN', 11, 6, 2),
(6, 'MEX', 8, 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g2Estadio`
--

CREATE TABLE `g2Estadio` (
  `idEstadio` int NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `Pais_idPais` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `g2Estadio`
--

INSERT INTO `g2Estadio` (`idEstadio`, `nombre`, `Pais_idPais`) VALUES
(1, 'Saitama Stadium', 'JPN'),
(2, 'Tokyo National Stadium', 'JPN'),
(3, 'Seoul World Cup Stadium', 'KOR'),
(4, 'Busan Asiad Stadium', 'KOR'),
(5, 'Azadi Stadium', 'IRN'),
(6, 'Yadegar-e Emam Stadium', 'IRN'),
(7, 'Stadium Australia', 'AUS'),
(8, 'Marvel Stadium', 'AUS'),
(9, 'King Fahd International Stadium', 'KSA'),
(10, 'King Abdullah Sports City', 'KSA'),
(11, 'Lusail Stadium', 'QAT'),
(12, 'Al Bayt Stadium', 'QAT'),
(13, 'Stade Léopold Sédar Senghor', 'SEN'),
(14, 'Stade Lat Dior', 'SEN'),
(15, 'Stade Mohamed V', 'MAR'),
(16, 'Stade de Marrakech', 'MAR'),
(17, 'Cairo International Stadium', 'EGY'),
(18, 'Borg El Arab Stadium', 'EGY'),
(19, 'Abuja National Stadium', 'NGA'),
(20, 'Teslim Balogun Stadium', 'NGA'),
(21, 'Stade Ahmadou Ahidjo', 'CMR'),
(22, 'Japoma Stadium', 'CMR'),
(23, 'Baba Yara Stadium', 'GHA'),
(24, 'Cape Coast Stadium', 'GHA'),
(25, 'MetLife Stadium', 'USA'),
(26, 'SoFi Stadium', 'USA'),
(27, 'Estadio Azteca', 'MEX'),
(28, 'Estadio BBVA', 'MEX'),
(29, 'BMO Field', 'CAN'),
(30, 'BC Place', 'CAN'),
(31, 'Estadio Nacional', 'CRC'),
(32, 'Estadio Saprissa', 'CRC'),
(33, 'National Stadium Kingston', 'JAM'),
(34, 'Catherine Hall Stadium', 'JAM'),
(35, 'Estadio Rommel Fernández', 'PAN'),
(36, 'Estadio Universitario de Panamá', 'PAN'),
(37, 'Maracaná', 'BRA'),
(38, 'Arena Corinthians', 'BRA'),
(39, 'Estadio Monumental', 'ARG'),
(40, 'La Bombonera', 'ARG'),
(41, 'Estadio Centenario', 'URU'),
(42, 'Estadio Campeón del Siglo', 'URU'),
(43, 'Estadio Metropolitano', 'COL'),
(44, 'Estadio Atanasio Girardot', 'COL'),
(45, 'Estadio Nacional', 'CHI'),
(46, 'Estadio Monumental de Santiago', 'CHI'),
(47, 'Estadio Rodrigo Paz Delgado', 'ECU'),
(48, 'Estadio Monumental Banco Pichincha', 'ECU'),
(49, 'Eden Park', 'NZL'),
(50, 'Sky Stadium', 'NZL'),
(51, 'Lawson Tama Stadium', 'SLB'),
(52, 'Town Ground Stadium', 'SLB'),
(53, 'Churchill Park', 'FIJ'),
(54, 'ANZ National Stadium', 'FIJ'),
(55, 'Sir John Guise Stadium', 'PNG'),
(56, 'Laiwaden Oval', 'PNG'),
(57, 'Stade Pater Te Hono Nui', 'TAH'),
(58, 'Stade Punaruu', 'TAH'),
(59, 'Korman Stadium', 'VAN'),
(60, 'Luganville Soccer City', 'VAN'),
(61, 'Stade de France', 'FRA'),
(62, 'Parc des Princes', 'FRA'),
(63, 'Santiago Bernabéu', 'ESP'),
(64, 'Camp Nou', 'ESP'),
(65, 'Allianz Arena', 'GER'),
(66, 'Signal Iduna Park', 'GER'),
(67, 'Wembley Stadium', 'ENG'),
(68, 'Old Trafford', 'ENG'),
(69, 'San Siro', 'ITA'),
(70, 'Stadio Olimpico', 'ITA'),
(71, 'Johan Cruyff Arena', 'NED'),
(72, 'De Kuip', 'NED');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g2Pais`
--

CREATE TABLE `g2Pais` (
  `id_Pais` varchar(3) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `g2Pais`
--

INSERT INTO `g2Pais` (`id_Pais`, `nombre`) VALUES
('ARG', 'Argentina'),
('AUS', 'Australia'),
('BRA', 'Brasil'),
('CAN', 'Canadá'),
('CHI', 'Chile'),
('CMR', 'Camerún'),
('COL', 'Colombia'),
('CRC', 'Costa Rica'),
('ECU', 'Ecuador'),
('EGY', 'Egipto'),
('ENG', 'Inglaterra'),
('ESP', 'España'),
('FIJ', 'Fiyi'),
('FRA', 'Francia'),
('GER', 'Alemania'),
('GHA', 'Ghana'),
('IRN', 'Irán'),
('ITA', 'Italia'),
('JAM', 'Jamaica'),
('JPN', 'Japón'),
('KOR', 'Corea del Sur'),
('KSA', 'Arabia Saudita'),
('MAR', 'Marruecos'),
('MEX', 'México'),
('NED', 'Países Bajos'),
('NGA', 'Nigeria'),
('NZL', 'Nueva Zelanda'),
('PAN', 'Panamá'),
('PNG', 'Papúa Nueva Guinea'),
('QAT', 'Catar'),
('SEN', 'Senegal'),
('SLB', 'Islas Salomón'),
('TAH', 'Tahití'),
('URU', 'Uruguay'),
('USA', 'Estados Unidos'),
('VAN', 'Vanuatu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g2Partido`
--

CREATE TABLE `g2Partido` (
  `idPartido` int NOT NULL,
  `hora` time NOT NULL,
  `fecha` date NOT NULL,
  `golesVisitante` int NOT NULL,
  `golesLocal` int NOT NULL,
  `Campeonato_idCampeonato` int NOT NULL,
  `Estadio_idEstadio` int NOT NULL,
  `Equipo_Visitante` varchar(3) NOT NULL,
  `Equipo_Local` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `g2Partido`
--

INSERT INTO `g2Partido` (`idPartido`, `hora`, `fecha`, `golesVisitante`, `golesLocal`, `Campeonato_idCampeonato`, `Estadio_idEstadio`, `Equipo_Visitante`, `Equipo_Local`) VALUES
(1, '18:00:00', '2024-10-12', 0, 0, 2, 25, 'ARG', 'COL'),
(2, '20:45:00', '2024-09-08', 1, 3, 3, 69, 'GER', 'ENG'),
(3, '17:30:00', '2024-11-16', 2, 1, 4, 1, 'JPN', 'KOR'),
(4, '16:00:00', '2025-03-25', 3, 0, 5, 13, 'EGY', 'NGA'),
(5, '19:00:00', '2024-09-05', 2, 2, 6, 31, 'USA', 'MEX'),
(6, '13:00:00', '2025-02-10', 1, 1, 7, 57, 'NZL', 'FIJ'),
(7, '18:30:00', '2025-03-18', 2, 2, 9, 71, 'ESP', 'ITA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g3admin`
--

CREATE TABLE `g3admin` (
  `idAdmin` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `clave` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `g3admin`
--

INSERT INTO `g3admin` (`idAdmin`, `nombre`, `apellido`, `correo`, `clave`) VALUES
(1, 'Jonathan', 'Bernal', 'asd@tc.com', '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g3campeonato`
--

CREATE TABLE `g3campeonato` (
  `idCampeonato` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `G3Estado_idEstado` int NOT NULL,
  `G3Admin_idAdmin` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `g3campeonato`
--

INSERT INTO `g3campeonato` (`idCampeonato`, `nombre`, `fecha_inicio`, `fecha_final`, `G3Estado_idEstado`, `G3Admin_idAdmin`) VALUES
(1, 'Eliminatorias Conmebol', '2025-03-01', '2025-11-30', 1, 1),
(2, 'Eliminatorias UEFA', '2025-03-10', '2025-11-25', 1, 1),
(3, 'Eliminatorias Concacaf', '2025-04-05', '2025-10-20', 1, 1),
(4, 'Eliminatorias CAF', '2025-02-15', '2025-09-30', 3, 1),
(5, 'Eliminatorias AFC', '2025-03-20', '2025-10-10', 3, 1),
(6, 'Eliminatorias OFC', '2025-05-01', '2025-08-20', 3, 1),
(7, 'Copa del Mundo FIFA', '2026-06-01', '2026-07-10', 2, 1),
(8, 'Copa America', '2024-06-10', '2024-07-20', 3, 1),
(9, 'Eurocopa', '2024-06-15', '2024-07-15', 3, 1),
(10, 'Copa Oro', '2025-07-01', '2025-07-25', 3, 1),
(11, 'Copa Africana de Naciones', '2025-01-10', '2025-02-05', 3, 1),
(12, 'Copa Asiatica', '2023-01-15', '2023-02-10', 3, 1),
(13, 'Copa de Oceania', '2024-05-01', '2024-05-25', 3, 1),
(14, 'Nations League UEFA', '2024-09-01', '2025-06-10', 3, 1),
(15, 'Nations League Concacaf', '2024-09-15', '2025-05-20', 3, 1),
(16, 'Mundial Sub 20', '2025-05-10', '2025-06-15', 3, 1),
(17, 'Mundial Sub 17', '2025-10-01', '2025-11-10', 1, 1),
(18, 'Copa Libertadores', '2025-02-10', '2025-11-25', 1, 1),
(19, 'Copa Sudamericana', '2025-03-01', '2025-10-30', 1, 1),
(20, 'Champions League', '2025-02-14', '2025-06-07', 3, 1),
(21, 'Europa League', '2025-02-15', '2025-05-28', 3, 1),
(22, 'Conference League', '2025-02-20', '2025-05-24', 3, 1),
(23, 'Copa Intercontinental', '2025-12-10', '2025-12-20', 2, 1),
(24, 'Mundial de Clubes', '2025-06-10', '2025-06-30', 3, 1),
(25, 'Copa America Femenina', '2026-07-01', '2026-07-30', 2, 1),
(26, 'Mundial Femenino', '2027-07-10', '2027-08-20', 2, 1),
(27, 'Copa Oro Femenina', '2025-09-01', '2025-09-25', 3, 1),
(28, 'Eurocopa Femenina', '2025-06-10', '2025-07-10', 3, 1),
(29, 'Clasificatorio Olimpico', '2023-01-10', '2023-03-10', 3, 1),
(30, 'Juegos Olimpicos de Futbol', '2028-07-20', '2028-08-10', 2, 1),
(31, 'Copa Mundial Femenina Sub-20', '2026-09-05', '2026-09-27', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g3equipo`
--

CREATE TABLE `g3equipo` (
  `idEquipo` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `G3Admin_idAdmin` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `g3equipo`
--

INSERT INTO `g3equipo` (`idEquipo`, `nombre`, `G3Admin_idAdmin`) VALUES
(1, 'Argentina', 1),
(2, 'Brasil', 1),
(3, 'Alemania', 1),
(4, 'Italia', 1),
(5, 'Francia', 1),
(6, 'Uruguay', 1),
(7, 'Inglaterra', 1),
(8, 'Espana', 1),
(9, 'Portugal', 1),
(10, 'Paises Bajos', 1),
(11, 'Croacia', 1),
(12, 'Belgica', 1),
(13, 'Mexico', 1),
(14, 'Estados Unidos', 1),
(15, 'Suecia', 1),
(16, 'Suiza', 1),
(17, 'Dinamarca', 1),
(18, 'Polonia', 1),
(19, 'Rusia', 1),
(20, 'Corea del Sur', 1),
(21, 'Japon', 1),
(22, 'Colombia', 1),
(23, 'Chile', 1),
(24, 'Paraguay', 1),
(25, 'Peru', 1),
(26, 'Ecuador', 1),
(27, 'Camerun', 1),
(28, 'Nigeria', 1),
(29, 'Senegal', 1),
(30, 'Marruecos', 1),
(31, 'Ghana', 1),
(32, 'Arabia Saudita', 1),
(33, 'Iran', 1),
(34, 'Australia', 1),
(35, 'Turquia', 1),
(36, 'Republica Checa', 1),
(37, 'Serbia', 1),
(38, 'Escocia', 1),
(39, 'Gales', 1),
(40, 'Ucrania', 1),
(41, 'Noruega', 1),
(42, 'Rumania', 1),
(43, 'Hungria', 1),
(44, 'Austria', 1),
(45, 'Grecia', 1),
(46, 'Irlanda', 1),
(47, 'Sudafrica', 1),
(48, 'Canada', 1),
(49, 'Qatar', 1),
(50, 'Nueva Zelanda', 1),
(51, 'Costa Rica', 1),
(52, 'Honduras', 1),
(53, 'Panama', 1),
(54, 'Jamaica', 1),
(55, 'Trinidad y Tobago', 1),
(56, 'Egipto', 1),
(57, 'Tunez', 1),
(58, 'Argelia', 1),
(59, 'Mali', 1),
(60, 'Burkina Faso', 1),
(61, 'Republica Democratica del Congo', 1),
(62, 'Cabo Verde', 1),
(63, 'Islandia', 1),
(64, 'Eslovaquia', 1),
(65, 'Eslovenia', 1),
(66, 'Finlandia', 1),
(67, 'Bulgaria', 1),
(68, 'Israel', 1),
(69, 'China', 1),
(70, 'India', 1),
(71, 'Indonesia', 1),
(72, 'Nueva Guinea', 1),
(73, 'Venezuela', 1),
(74, 'Bolivia', 1),
(75, 'El Salvador', 1),
(76, 'Haiti', 1),
(77, 'Kazajistan', 1),
(78, 'Filipinas', 1),
(79, 'Costa de Marfil', 1),
(80, 'Tailandia', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g3equipo_has_g3campeonato`
--

CREATE TABLE `g3equipo_has_g3campeonato` (
  `G3Equipo_idEquipo` int NOT NULL,
  `G3Campeonato_idCampeonato` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `g3equipo_has_g3campeonato`
--

INSERT INTO `g3equipo_has_g3campeonato` (`G3Equipo_idEquipo`, `G3Campeonato_idCampeonato`) VALUES
(1, 1),
(2, 1),
(3, 1),
(7, 1),
(8, 1),
(9, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(3, 2),
(4, 2),
(5, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(13, 3),
(14, 3),
(22, 3),
(23, 3),
(50, 3),
(51, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 3),
(27, 4),
(28, 4),
(29, 4),
(30, 4),
(31, 4),
(56, 4),
(57, 4),
(58, 4),
(59, 4),
(60, 4),
(32, 5),
(33, 5),
(34, 5),
(35, 5),
(36, 5),
(37, 5),
(38, 5),
(39, 5),
(40, 5),
(41, 5),
(47, 6),
(48, 6),
(49, 6),
(50, 6),
(70, 6),
(71, 6),
(72, 6),
(73, 6),
(74, 6),
(75, 6),
(1, 7),
(2, 7),
(3, 7),
(4, 7),
(5, 7),
(6, 7),
(7, 7),
(8, 7),
(9, 7),
(10, 7),
(1, 8),
(2, 8),
(8, 8),
(9, 8),
(22, 8),
(23, 8),
(24, 8),
(25, 8),
(26, 8),
(73, 8),
(3, 9),
(4, 9),
(5, 9),
(9, 9),
(10, 9),
(11, 9),
(12, 9),
(13, 9),
(14, 9),
(15, 9),
(13, 10),
(14, 10),
(50, 10),
(51, 10),
(52, 10),
(53, 10),
(54, 10),
(55, 10),
(56, 10),
(57, 10),
(27, 11),
(28, 11),
(29, 11),
(30, 11),
(31, 11),
(56, 11),
(57, 11),
(58, 11),
(59, 11),
(60, 11),
(32, 12),
(33, 12),
(34, 12),
(35, 12),
(36, 12),
(37, 12),
(38, 12),
(39, 12),
(40, 12),
(41, 12),
(47, 13),
(48, 13),
(49, 13),
(50, 13),
(70, 13),
(71, 13),
(72, 13),
(73, 13),
(74, 13),
(75, 13),
(3, 14),
(4, 14),
(5, 14),
(8, 14),
(9, 14),
(10, 14),
(11, 14),
(12, 14),
(13, 14),
(14, 14),
(13, 15),
(14, 15),
(22, 15),
(23, 15),
(50, 15),
(51, 15),
(52, 15),
(53, 15),
(54, 15),
(55, 15),
(1, 16),
(2, 16),
(3, 16),
(5, 16),
(8, 16),
(9, 16),
(22, 16),
(23, 16),
(24, 16),
(25, 16),
(1, 17),
(2, 17),
(3, 17),
(4, 17),
(5, 17),
(6, 17),
(7, 17),
(8, 17),
(9, 17),
(10, 17),
(1, 18),
(2, 18),
(22, 18),
(23, 18),
(24, 18),
(25, 18),
(26, 18),
(73, 18),
(74, 18),
(75, 18),
(1, 19),
(8, 19),
(9, 19),
(22, 19),
(23, 19),
(24, 19),
(25, 19),
(26, 19),
(27, 19),
(28, 19),
(3, 20),
(4, 20),
(5, 20),
(8, 20),
(9, 20),
(10, 20),
(11, 20),
(12, 20),
(13, 20),
(14, 20),
(3, 21),
(4, 21),
(5, 21),
(8, 21),
(9, 21),
(10, 21),
(11, 21),
(12, 21),
(13, 21),
(14, 21),
(3, 22),
(4, 22),
(5, 22),
(8, 22),
(9, 22),
(10, 22),
(11, 22),
(12, 22),
(13, 22),
(14, 22),
(1, 23),
(3, 23),
(4, 23),
(5, 23),
(6, 23),
(7, 23),
(8, 23),
(9, 23),
(10, 23),
(11, 23),
(1, 24),
(3, 24),
(4, 24),
(5, 24),
(6, 24),
(7, 24),
(8, 24),
(9, 24),
(10, 24),
(11, 24),
(1, 25),
(2, 25),
(8, 25),
(9, 25),
(22, 25),
(23, 25),
(24, 25),
(25, 25),
(26, 25),
(73, 25),
(1, 26),
(3, 26),
(4, 26),
(5, 26),
(8, 26),
(9, 26),
(10, 26),
(11, 26),
(12, 26),
(13, 26),
(13, 27),
(14, 27),
(50, 27),
(51, 27),
(52, 27),
(53, 27),
(54, 27),
(55, 27),
(56, 27),
(57, 27),
(3, 28),
(4, 28),
(5, 28),
(8, 28),
(9, 28),
(10, 28),
(11, 28),
(12, 28),
(13, 28),
(14, 28),
(1, 29),
(2, 29),
(3, 29),
(4, 29),
(5, 29),
(6, 29),
(7, 29),
(8, 29),
(9, 29),
(10, 29),
(1, 30),
(2, 30),
(3, 30),
(4, 30),
(5, 30),
(6, 30),
(7, 30),
(8, 30),
(9, 30),
(10, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g3estado`
--

CREATE TABLE `g3estado` (
  `idEstado` int NOT NULL,
  `estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `g3estado`
--

INSERT INTO `g3estado` (`idEstado`, `estado`) VALUES
(1, 'Activo'),
(2, 'Proximo'),
(3, 'Culminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g3fechapartidos`
--

CREATE TABLE `g3fechapartidos` (
  `idFechaPartidos` int NOT NULL,
  `FechaPartido` date NOT NULL,
  `Hora` datetime NOT NULL,
  `G3Campeonato_idCampeonato` int NOT NULL,
  `G3Admin_idAdmin` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g3partido`
--

CREATE TABLE `g3partido` (
  `idPartido` int NOT NULL,
  `golesVisitantes` int NOT NULL,
  `golesLocal` int NOT NULL,
  `G3Equipo_idEquipo` int NOT NULL,
  `G3Equipo_idEquipo1` int NOT NULL,
  `G3Admin_idAdmin` int NOT NULL,
  `G3FechaPartidos_idFechaPartidos` int NOT NULL,
  `G3Campeonato_idCampeonato` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g5_administrador`
--

CREATE TABLE `g5_administrador` (
  `id_admin` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g5_campeonato`
--

CREATE TABLE `g5_campeonato` (
  `id_campeonato` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `año` year NOT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` enum('pendiente','en curso','finalizado') DEFAULT 'pendiente',
  `id_admin` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g5_confederacion`
--

CREATE TABLE `g5_confederacion` (
  `id_confederacion` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g5_estadio`
--

CREATE TABLE `g5_estadio` (
  `id_estadio` int NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `id_pais` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g5_fecha`
--

CREATE TABLE `g5_fecha` (
  `id_fecha` int NOT NULL,
  `numero_fecha` int NOT NULL,
  `fecha_real` date DEFAULT NULL,
  `id_campeonato` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g5_pais`
--

CREATE TABLE `g5_pais` (
  `id_pais` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `sigla_fifa` varchar(3) NOT NULL,
  `bandera_url` varchar(255) DEFAULT NULL,
  `id_confederacion` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g5_participante`
--

CREATE TABLE `g5_participante` (
  `id_campeonato` int NOT NULL,
  `id_pais` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g5_partido`
--

CREATE TABLE `g5_partido` (
  `id_partido` int NOT NULL,
  `id_fecha` int NOT NULL,
  `id_local` int NOT NULL,
  `id_visitante` int NOT NULL,
  `id_estadio` int NOT NULL,
  `fecha_partido` date NOT NULL,
  `hora_partido` time NOT NULL,
  `goles_local` int DEFAULT '0',
  `goles_visitante` int DEFAULT '0',
  `estado` enum('pendiente','jugado') DEFAULT 'pendiente',
  `imagen_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `g5_tabla_posiciones`
--

CREATE TABLE `g5_tabla_posiciones` (
  `id_posicion` int NOT NULL,
  `id_campeonato` int NOT NULL,
  `id_pais` int NOT NULL,
  `puntos` int DEFAULT '0',
  `goles_favor` int DEFAULT '0',
  `goles_contra` int DEFAULT '0',
  `diferencia_goles` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pedido`
--

CREATE TABLE `Pedido` (
  `idPedido` int NOT NULL,
  `fecha` date NOT NULL,
  `precioCompra` decimal(10,2) NOT NULL,
  `cantidadCompra` int NOT NULL,
  `cantidadBodega` int NOT NULL,
  `Producto_idProducto` int NOT NULL,
  `Admin_idAdmin` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Producto`
--

CREATE TABLE `Producto` (
  `idProducto` int NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `tamaño` int NOT NULL,
  `precioVenta` int NOT NULL,
  `imagen` varchar(45) NOT NULL,
  `Proveedor_idProveedor` int NOT NULL,
  `TipoProducto_idTipoProducto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedor`
--

CREATE TABLE `Proveedor` (
  `idProveedor` int NOT NULL,
  `nombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TipoProducto`
--

CREATE TABLE `TipoProducto` (
  `idTipoProducto` int NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`idAdmin`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `Carrito`
--
ALTER TABLE `Carrito`
  ADD PRIMARY KEY (`Cliente_idCliente`,`Producto_idProducto`),
  ADD KEY `fk_Carrito_Producto1_idx` (`Producto_idProducto`);

--
-- Indices de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `Factura`
--
ALTER TABLE `Factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `fk_Factura_Cliente1_idx` (`Cliente_idCliente`);

--
-- Indices de la tabla `FacturaProducto`
--
ALTER TABLE `FacturaProducto`
  ADD PRIMARY KEY (`Factura_idFactura`,`Producto_idProducto`),
  ADD KEY `fk_FacturaProducto_Factura1_idx` (`Factura_idFactura`),
  ADD KEY `fk_FacturaProducto_Producto1_idx` (`Producto_idProducto`);

--
-- Indices de la tabla `g1_admin`
--
ALTER TABLE `g1_admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `g1_campeonato`
--
ALTER TABLE `g1_campeonato`
  ADD PRIMARY KEY (`id_campeonato`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `g1_campeonato_equipos`
--
ALTER TABLE `g1_campeonato_equipos`
  ADD PRIMARY KEY (`id_campeonato`,`id_equipo`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `g1_equipo`
--
ALTER TABLE `g1_equipo`
  ADD PRIMARY KEY (`id_equipo`),
  ADD KEY `id_liga` (`id_liga`);

--
-- Indices de la tabla `g1_fase`
--
ALTER TABLE `g1_fase`
  ADD PRIMARY KEY (`id_fase`);

--
-- Indices de la tabla `g1_fecha`
--
ALTER TABLE `g1_fecha`
  ADD PRIMARY KEY (`id_fecha`),
  ADD KEY `id_campeonato` (`id_campeonato`);

--
-- Indices de la tabla `g1_liga`
--
ALTER TABLE `g1_liga`
  ADD PRIMARY KEY (`id_liga`);

--
-- Indices de la tabla `g1_partido`
--
ALTER TABLE `g1_partido`
  ADD PRIMARY KEY (`id_partido`);

--
-- Indices de la tabla `g1_tipo`
--
ALTER TABLE `g1_tipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `g1_usuario`
--
ALTER TABLE `g1_usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `g2Administrador`
--
ALTER TABLE `g2Administrador`
  ADD PRIMARY KEY (`idAdministrador`);

--
-- Indices de la tabla `g2Campeonato`
--
ALTER TABLE `g2Campeonato`
  ADD PRIMARY KEY (`idCampeonato`),
  ADD KEY `fk_Campeonato_Cofederacion1_idx` (`Confederacion_idConfederacion`),
  ADD KEY `fk_Campeonato_Administrador1_idx` (`Administrador_idAdministrador`);

--
-- Indices de la tabla `g2Confederacion`
--
ALTER TABLE `g2Confederacion`
  ADD PRIMARY KEY (`idConfederacion`);

--
-- Indices de la tabla `g2Equipo`
--
ALTER TABLE `g2Equipo`
  ADD PRIMARY KEY (`idEquipo`),
  ADD KEY `fk_g2Equipo_g2Confederacion1_idx` (`Confederacion_idConfederacion`);

--
-- Indices de la tabla `g2EquipoCampeonato`
--
ALTER TABLE `g2EquipoCampeonato`
  ADD PRIMARY KEY (`Campeonato_idCampeonato`,`Equipo_idEquipo`),
  ADD KEY `fk_Campeonato_has_Equipo_Campeonato1_idx` (`Campeonato_idCampeonato`),
  ADD KEY `fk_g2EquipoCampeonato_g2Equipo1_idx` (`Equipo_idEquipo`);

--
-- Indices de la tabla `g2Estadio`
--
ALTER TABLE `g2Estadio`
  ADD PRIMARY KEY (`idEstadio`),
  ADD KEY `fk_g2Estadio_g2Pais1_idx` (`Pais_idPais`);

--
-- Indices de la tabla `g2Pais`
--
ALTER TABLE `g2Pais`
  ADD PRIMARY KEY (`id_Pais`);

--
-- Indices de la tabla `g2Partido`
--
ALTER TABLE `g2Partido`
  ADD PRIMARY KEY (`idPartido`),
  ADD KEY `fk_Partido_Campeonato_idx` (`Campeonato_idCampeonato`),
  ADD KEY `fk_Partido_Estadio1_idx` (`Estadio_idEstadio`),
  ADD KEY `fk_g2Partido_g2Equipo1_idx` (`Equipo_Visitante`),
  ADD KEY `fk_g2Partido_g2Equipo2_idx` (`Equipo_Local`);

--
-- Indices de la tabla `g3admin`
--
ALTER TABLE `g3admin`
  ADD PRIMARY KEY (`idAdmin`),
  ADD UNIQUE KEY `correo_UNIQUE` (`correo`);

--
-- Indices de la tabla `g3campeonato`
--
ALTER TABLE `g3campeonato`
  ADD PRIMARY KEY (`idCampeonato`),
  ADD KEY `fk_G3Campeonato_G3Estado1_idx` (`G3Estado_idEstado`),
  ADD KEY `fk_G3Campeonato_G3Admin1_idx` (`G3Admin_idAdmin`);

--
-- Indices de la tabla `g3equipo`
--
ALTER TABLE `g3equipo`
  ADD PRIMARY KEY (`idEquipo`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  ADD UNIQUE KEY `unique_nombre` (`nombre`),
  ADD KEY `fk_G3Equipo_G3Admin1_idx` (`G3Admin_idAdmin`);

--
-- Indices de la tabla `g3equipo_has_g3campeonato`
--
ALTER TABLE `g3equipo_has_g3campeonato`
  ADD PRIMARY KEY (`G3Equipo_idEquipo`,`G3Campeonato_idCampeonato`),
  ADD KEY `fk_G3Equipo_has_G3Campeonato_G3Campeonato1_idx` (`G3Campeonato_idCampeonato`),
  ADD KEY `fk_G3Equipo_has_G3Campeonato_G3Equipo1_idx` (`G3Equipo_idEquipo`);

--
-- Indices de la tabla `g3estado`
--
ALTER TABLE `g3estado`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indices de la tabla `g3fechapartidos`
--
ALTER TABLE `g3fechapartidos`
  ADD PRIMARY KEY (`idFechaPartidos`),
  ADD KEY `fk_G3FechaPartidos_G3Campeonato1_idx` (`G3Campeonato_idCampeonato`),
  ADD KEY `fk_G3FechaPartidos_G3Admin1_idx` (`G3Admin_idAdmin`);

--
-- Indices de la tabla `g3partido`
--
ALTER TABLE `g3partido`
  ADD PRIMARY KEY (`idPartido`),
  ADD KEY `fk_G3Partido_G3Equipo1_idx` (`G3Equipo_idEquipo`),
  ADD KEY `fk_G3Partido_G3Equipo2_idx` (`G3Equipo_idEquipo1`),
  ADD KEY `fk_G3Partido_G3Admin1_idx` (`G3Admin_idAdmin`),
  ADD KEY `fk_G3Partido_G3FechaPartidos1_idx` (`G3FechaPartidos_idFechaPartidos`),
  ADD KEY `fk_G3Partido_G3Campeonato1_idx` (`G3Campeonato_idCampeonato`);

--
-- Indices de la tabla `g5_administrador`
--
ALTER TABLE `g5_administrador`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `g5_campeonato`
--
ALTER TABLE `g5_campeonato`
  ADD PRIMARY KEY (`id_campeonato`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indices de la tabla `g5_confederacion`
--
ALTER TABLE `g5_confederacion`
  ADD PRIMARY KEY (`id_confederacion`),
  ADD UNIQUE KEY `sigla` (`sigla`);

--
-- Indices de la tabla `g5_estadio`
--
ALTER TABLE `g5_estadio`
  ADD PRIMARY KEY (`id_estadio`),
  ADD KEY `id_pais` (`id_pais`);

--
-- Indices de la tabla `g5_fecha`
--
ALTER TABLE `g5_fecha`
  ADD PRIMARY KEY (`id_fecha`),
  ADD UNIQUE KEY `uk_campeonato_fecha` (`id_campeonato`,`numero_fecha`);

--
-- Indices de la tabla `g5_pais`
--
ALTER TABLE `g5_pais`
  ADD PRIMARY KEY (`id_pais`),
  ADD UNIQUE KEY `sigla_fifa` (`sigla_fifa`),
  ADD KEY `id_confederacion` (`id_confederacion`);

--
-- Indices de la tabla `g5_participante`
--
ALTER TABLE `g5_participante`
  ADD PRIMARY KEY (`id_campeonato`,`id_pais`),
  ADD KEY `id_pais` (`id_pais`);

--
-- Indices de la tabla `g5_partido`
--
ALTER TABLE `g5_partido`
  ADD PRIMARY KEY (`id_partido`),
  ADD KEY `id_fecha` (`id_fecha`),
  ADD KEY `id_local` (`id_local`),
  ADD KEY `id_visitante` (`id_visitante`),
  ADD KEY `id_estadio` (`id_estadio`);

--
-- Indices de la tabla `g5_tabla_posiciones`
--
ALTER TABLE `g5_tabla_posiciones`
  ADD PRIMARY KEY (`id_posicion`),
  ADD UNIQUE KEY `uk_posicion_campeonato_pais` (`id_campeonato`,`id_pais`),
  ADD KEY `id_pais` (`id_pais`);

--
-- Indices de la tabla `Pedido`
--
ALTER TABLE `Pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `fk_Pedido_Producto1_idx` (`Producto_idProducto`),
  ADD KEY `fk_Pedido_Admin1_idx` (`Admin_idAdmin`);

--
-- Indices de la tabla `Producto`
--
ALTER TABLE `Producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `fk_Producto_Proveedor_idx` (`Proveedor_idProveedor`),
  ADD KEY `fk_Producto_TipoProducto1_idx` (`TipoProducto_idTipoProducto`);

--
-- Indices de la tabla `Proveedor`
--
ALTER TABLE `Proveedor`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `TipoProducto`
--
ALTER TABLE `TipoProducto`
  ADD PRIMARY KEY (`idTipoProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Admin`
--
ALTER TABLE `Admin`
  MODIFY `idAdmin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  MODIFY `idCliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `Factura`
--
ALTER TABLE `Factura`
  MODIFY `idFactura` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `g1_admin`
--
ALTER TABLE `g1_admin`
  MODIFY `id_admin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `g1_campeonato`
--
ALTER TABLE `g1_campeonato`
  MODIFY `id_campeonato` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `g1_equipo`
--
ALTER TABLE `g1_equipo`
  MODIFY `id_equipo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `g1_fase`
--
ALTER TABLE `g1_fase`
  MODIFY `id_fase` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `g1_fecha`
--
ALTER TABLE `g1_fecha`
  MODIFY `id_fecha` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT de la tabla `g1_liga`
--
ALTER TABLE `g1_liga`
  MODIFY `id_liga` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `g1_partido`
--
ALTER TABLE `g1_partido`
  MODIFY `id_partido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=647;

--
-- AUTO_INCREMENT de la tabla `g1_tipo`
--
ALTER TABLE `g1_tipo`
  MODIFY `id_tipo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `g1_usuario`
--
ALTER TABLE `g1_usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `g2Campeonato`
--
ALTER TABLE `g2Campeonato`
  MODIFY `idCampeonato` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `g2Confederacion`
--
ALTER TABLE `g2Confederacion`
  MODIFY `idConfederacion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `g2Estadio`
--
ALTER TABLE `g2Estadio`
  MODIFY `idEstadio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `g2Partido`
--
ALTER TABLE `g2Partido`
  MODIFY `idPartido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `g3admin`
--
ALTER TABLE `g3admin`
  MODIFY `idAdmin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `g3campeonato`
--
ALTER TABLE `g3campeonato`
  MODIFY `idCampeonato` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `g3equipo`
--
ALTER TABLE `g3equipo`
  MODIFY `idEquipo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `g3estado`
--
ALTER TABLE `g3estado`
  MODIFY `idEstado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `g3fechapartidos`
--
ALTER TABLE `g3fechapartidos`
  MODIFY `idFechaPartidos` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `g3partido`
--
ALTER TABLE `g3partido`
  MODIFY `idPartido` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `g5_administrador`
--
ALTER TABLE `g5_administrador`
  MODIFY `id_admin` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `g5_campeonato`
--
ALTER TABLE `g5_campeonato`
  MODIFY `id_campeonato` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `g5_confederacion`
--
ALTER TABLE `g5_confederacion`
  MODIFY `id_confederacion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `g5_estadio`
--
ALTER TABLE `g5_estadio`
  MODIFY `id_estadio` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `g5_fecha`
--
ALTER TABLE `g5_fecha`
  MODIFY `id_fecha` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `g5_pais`
--
ALTER TABLE `g5_pais`
  MODIFY `id_pais` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `g5_partido`
--
ALTER TABLE `g5_partido`
  MODIFY `id_partido` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `g5_tabla_posiciones`
--
ALTER TABLE `g5_tabla_posiciones`
  MODIFY `id_posicion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Pedido`
--
ALTER TABLE `Pedido`
  MODIFY `idPedido` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Producto`
--
ALTER TABLE `Producto`
  MODIFY `idProducto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Proveedor`
--
ALTER TABLE `Proveedor`
  MODIFY `idProveedor` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `TipoProducto`
--
ALTER TABLE `TipoProducto`
  MODIFY `idTipoProducto` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Carrito`
--
ALTER TABLE `Carrito`
  ADD CONSTRAINT `fk_Carrito_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente` (`idCliente`),
  ADD CONSTRAINT `fk_Carrito_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `Producto` (`idProducto`);

--
-- Filtros para la tabla `Factura`
--
ALTER TABLE `Factura`
  ADD CONSTRAINT `fk_Factura_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `Cliente` (`idCliente`);

--
-- Filtros para la tabla `FacturaProducto`
--
ALTER TABLE `FacturaProducto`
  ADD CONSTRAINT `fk_FacturaProducto_Factura1` FOREIGN KEY (`Factura_idFactura`) REFERENCES `Factura` (`idFactura`),
  ADD CONSTRAINT `fk_FacturaProducto_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `Producto` (`idProducto`);

--
-- Filtros para la tabla `g1_campeonato`
--
ALTER TABLE `g1_campeonato`
  ADD CONSTRAINT `g1_campeonato_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `g1_usuario` (`id_usuario`),
  ADD CONSTRAINT `g1_campeonato_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `g1_tipo` (`id_tipo`);

--
-- Filtros para la tabla `g1_campeonato_equipos`
--
ALTER TABLE `g1_campeonato_equipos`
  ADD CONSTRAINT `g1_campeonato_equipos_ibfk_1` FOREIGN KEY (`id_campeonato`) REFERENCES `g1_campeonato` (`id_campeonato`),
  ADD CONSTRAINT `g1_campeonato_equipos_ibfk_2` FOREIGN KEY (`id_equipo`) REFERENCES `g1_equipo` (`id_equipo`);

--
-- Filtros para la tabla `g1_equipo`
--
ALTER TABLE `g1_equipo`
  ADD CONSTRAINT `g1_equipo_ibfk_1` FOREIGN KEY (`id_liga`) REFERENCES `g1_liga` (`id_liga`);

--
-- Filtros para la tabla `g1_fecha`
--
ALTER TABLE `g1_fecha`
  ADD CONSTRAINT `g1_fecha_ibfk_1` FOREIGN KEY (`id_campeonato`) REFERENCES `g1_campeonato` (`id_campeonato`);

--
-- Filtros para la tabla `g2Campeonato`
--
ALTER TABLE `g2Campeonato`
  ADD CONSTRAINT `fk_Campeonato_Administrador1` FOREIGN KEY (`Administrador_idAdministrador`) REFERENCES `g2Administrador` (`idAdministrador`),
  ADD CONSTRAINT `fk_Campeonato_Cofederacion1` FOREIGN KEY (`Confederacion_idConfederacion`) REFERENCES `g2Confederacion` (`idConfederacion`);

--
-- Filtros para la tabla `g2Equipo`
--
ALTER TABLE `g2Equipo`
  ADD CONSTRAINT `fk_g2Equipo_g2Confederacion1` FOREIGN KEY (`Confederacion_idConfederacion`) REFERENCES `g2Confederacion` (`idConfederacion`);

--
-- Filtros para la tabla `g2EquipoCampeonato`
--
ALTER TABLE `g2EquipoCampeonato`
  ADD CONSTRAINT `fk_Campeonato_has_Equipo_Campeonato1` FOREIGN KEY (`Campeonato_idCampeonato`) REFERENCES `g2Campeonato` (`idCampeonato`),
  ADD CONSTRAINT `fk_g2EquipoCampeonato_g2Equipo1` FOREIGN KEY (`Equipo_idEquipo`) REFERENCES `g2Equipo` (`idEquipo`);

--
-- Filtros para la tabla `g2Estadio`
--
ALTER TABLE `g2Estadio`
  ADD CONSTRAINT `fk_g2Estadio_g2Pais1` FOREIGN KEY (`Pais_idPais`) REFERENCES `g2Pais` (`id_Pais`);

--
-- Filtros para la tabla `g2Pais`
--
ALTER TABLE `g2Pais`
  ADD CONSTRAINT `fk_g2Pais_g2Equipo1` FOREIGN KEY (`id_Pais`) REFERENCES `g2Equipo` (`idEquipo`);

--
-- Filtros para la tabla `g2Partido`
--
ALTER TABLE `g2Partido`
  ADD CONSTRAINT `fk_g2Partido_g2Equipo1` FOREIGN KEY (`Equipo_Visitante`) REFERENCES `g2Equipo` (`idEquipo`),
  ADD CONSTRAINT `fk_g2Partido_g2Equipo2` FOREIGN KEY (`Equipo_Local`) REFERENCES `g2Equipo` (`idEquipo`),
  ADD CONSTRAINT `fk_Partido_Campeonato` FOREIGN KEY (`Campeonato_idCampeonato`) REFERENCES `g2Campeonato` (`idCampeonato`),
  ADD CONSTRAINT `fk_Partido_Estadio1` FOREIGN KEY (`Estadio_idEstadio`) REFERENCES `g2Estadio` (`idEstadio`);

--
-- Filtros para la tabla `g3campeonato`
--
ALTER TABLE `g3campeonato`
  ADD CONSTRAINT `fk_G3Campeonato_G3Admin1` FOREIGN KEY (`G3Admin_idAdmin`) REFERENCES `g3admin` (`idAdmin`),
  ADD CONSTRAINT `fk_G3Campeonato_G3Estado1` FOREIGN KEY (`G3Estado_idEstado`) REFERENCES `g3estado` (`idEstado`);

--
-- Filtros para la tabla `g3equipo`
--
ALTER TABLE `g3equipo`
  ADD CONSTRAINT `fk_G3Equipo_G3Admin1` FOREIGN KEY (`G3Admin_idAdmin`) REFERENCES `g3admin` (`idAdmin`);

--
-- Filtros para la tabla `g3equipo_has_g3campeonato`
--
ALTER TABLE `g3equipo_has_g3campeonato`
  ADD CONSTRAINT `fk_G3Equipo_has_G3Campeonato_G3Campeonato1` FOREIGN KEY (`G3Campeonato_idCampeonato`) REFERENCES `g3campeonato` (`idCampeonato`),
  ADD CONSTRAINT `fk_G3Equipo_has_G3Campeonato_G3Equipo1` FOREIGN KEY (`G3Equipo_idEquipo`) REFERENCES `g3equipo` (`idEquipo`);

--
-- Filtros para la tabla `g3fechapartidos`
--
ALTER TABLE `g3fechapartidos`
  ADD CONSTRAINT `fk_G3FechaPartidos_G3Admin1` FOREIGN KEY (`G3Admin_idAdmin`) REFERENCES `g3admin` (`idAdmin`),
  ADD CONSTRAINT `fk_G3FechaPartidos_G3Campeonato1` FOREIGN KEY (`G3Campeonato_idCampeonato`) REFERENCES `g3campeonato` (`idCampeonato`);

--
-- Filtros para la tabla `g3partido`
--
ALTER TABLE `g3partido`
  ADD CONSTRAINT `fk_G3Partido_G3Admin1` FOREIGN KEY (`G3Admin_idAdmin`) REFERENCES `g3admin` (`idAdmin`),
  ADD CONSTRAINT `fk_G3Partido_G3Campeonato1` FOREIGN KEY (`G3Campeonato_idCampeonato`) REFERENCES `g3campeonato` (`idCampeonato`),
  ADD CONSTRAINT `fk_G3Partido_G3Equipo1` FOREIGN KEY (`G3Equipo_idEquipo`) REFERENCES `g3equipo` (`idEquipo`),
  ADD CONSTRAINT `fk_G3Partido_G3Equipo2` FOREIGN KEY (`G3Equipo_idEquipo1`) REFERENCES `g3equipo` (`idEquipo`),
  ADD CONSTRAINT `fk_G3Partido_G3FechaPartidos1` FOREIGN KEY (`G3FechaPartidos_idFechaPartidos`) REFERENCES `g3fechapartidos` (`idFechaPartidos`);

--
-- Filtros para la tabla `g5_campeonato`
--
ALTER TABLE `g5_campeonato`
  ADD CONSTRAINT `g5_campeonato_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `g5_administrador` (`id_admin`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `g5_estadio`
--
ALTER TABLE `g5_estadio`
  ADD CONSTRAINT `g5_estadio_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `g5_pais` (`id_pais`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `g5_fecha`
--
ALTER TABLE `g5_fecha`
  ADD CONSTRAINT `g5_fecha_ibfk_1` FOREIGN KEY (`id_campeonato`) REFERENCES `g5_campeonato` (`id_campeonato`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `g5_pais`
--
ALTER TABLE `g5_pais`
  ADD CONSTRAINT `g5_pais_ibfk_1` FOREIGN KEY (`id_confederacion`) REFERENCES `g5_confederacion` (`id_confederacion`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `g5_participante`
--
ALTER TABLE `g5_participante`
  ADD CONSTRAINT `g5_participante_ibfk_1` FOREIGN KEY (`id_campeonato`) REFERENCES `g5_campeonato` (`id_campeonato`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `g5_participante_ibfk_2` FOREIGN KEY (`id_pais`) REFERENCES `g5_pais` (`id_pais`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `g5_partido`
--
ALTER TABLE `g5_partido`
  ADD CONSTRAINT `g5_partido_ibfk_1` FOREIGN KEY (`id_fecha`) REFERENCES `g5_fecha` (`id_fecha`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `g5_partido_ibfk_2` FOREIGN KEY (`id_local`) REFERENCES `g5_pais` (`id_pais`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `g5_partido_ibfk_3` FOREIGN KEY (`id_visitante`) REFERENCES `g5_pais` (`id_pais`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `g5_partido_ibfk_4` FOREIGN KEY (`id_estadio`) REFERENCES `g5_estadio` (`id_estadio`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `g5_tabla_posiciones`
--
ALTER TABLE `g5_tabla_posiciones`
  ADD CONSTRAINT `g5_tabla_posiciones_ibfk_1` FOREIGN KEY (`id_campeonato`) REFERENCES `g5_campeonato` (`id_campeonato`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `g5_tabla_posiciones_ibfk_2` FOREIGN KEY (`id_pais`) REFERENCES `g5_pais` (`id_pais`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Pedido`
--
ALTER TABLE `Pedido`
  ADD CONSTRAINT `fk_Pedido_Admin1` FOREIGN KEY (`Admin_idAdmin`) REFERENCES `Admin` (`idAdmin`),
  ADD CONSTRAINT `fk_Pedido_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `Producto` (`idProducto`);

--
-- Filtros para la tabla `Producto`
--
ALTER TABLE `Producto`
  ADD CONSTRAINT `fk_Producto_Proveedor` FOREIGN KEY (`Proveedor_idProveedor`) REFERENCES `Proveedor` (`idProveedor`),
  ADD CONSTRAINT `fk_Producto_TipoProducto1` FOREIGN KEY (`TipoProducto_idTipoProducto`) REFERENCES `TipoProducto` (`idTipoProducto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
