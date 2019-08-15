-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-08-2019 a las 22:29:12
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parqueadero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `celadores`
--

CREATE TABLE `celadores` (
  `codCelador` varchar(10) NOT NULL,
  `nombreCela` varchar(20) NOT NULL,
  `celularCela` varchar(10) NOT NULL,
  `passwordCela` varchar(10) NOT NULL,
  `rol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `celadores`
--

INSERT INTO `celadores` (`codCelador`, `nombreCela`, `celularCela`, `passwordCela`, `rol`) VALUES
('2118765', 'Ramon Rojas', '3158774100', 'Ramon21', 'celador'),
('2142600', 'Maria Perez', '3112343586', 'Maria21', 'celador'),
('2156783', 'Pedro Pedraza', '3208756755', 'Pedro21', 'celador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conductores`
--

CREATE TABLE `conductores` (
  `cedConductor` varchar(10) NOT NULL,
  `nombreCond` varchar(20) NOT NULL,
  `rol` varchar(15) NOT NULL,
  `passwordCond` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `conductores`
--

INSERT INTO `conductores` (`cedConductor`, `nombreCond`, `rol`, `passwordCond`) VALUES
('10101010', 'Margie Ariza', 'Estudiante', 'Margie10'),
('109876655', 'Mario Gomez', 'Administrativo', 'Mario10'),
('1098781314', 'Ana Cecilia', 'Profesor', 'Ana10'),
('30303030', 'Daniel Florez', 'Administrativo', 'Daniel30'),
('54545454', 'Fabio Cuevas', 'Profesor', 'Fabio54'),
('63457898', 'Jorge Galviz', 'Estudiante', 'Jorge63'),
('6543343', 'Monica Fonseca', 'Visitante', 'Monica65');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idFactura` varchar(10) NOT NULL,
  `tarifa` int(4) NOT NULL,
  `idZonas` varchar(10) NOT NULL,
  `placa` varchar(6) NOT NULL,
  `fechaHoraEnt` datetime NOT NULL,
  `fechaHoraSal` datetime DEFAULT NULL,
  `saldo` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idFactura`, `tarifa`, `idZonas`, `placa`, `fechaHoraEnt`, `fechaHoraSal`, `saldo`) VALUES
('fact10', 1500, 'zona3', 'YDF547', '2019-08-07 17:15:39', '2019-08-07 17:18:54', 'pagado'),
('fact20', 1500, 'zona3', 'YYY879', '2019-08-07 17:22:50', '2019-08-07 17:24:12', 'pagado'),
('fact3', 1500, 'zona3', 'YYY879', '2019-08-03 15:17:00', '2019-08-03 23:20:00', 'pagado'),
('fact30', 1500, 'zona3', 'YYY879', '2019-08-07 17:24:32', '2019-08-07 17:25:19', 'pagado'),
('fact4', 1500, 'zona1', 'DYF234', '2019-08-07 14:11:06', '2019-08-07 16:31:54', 'pagado'),
('fact40', 1500, 'zona1', 'DYF234', '2019-08-09 11:44:44', '2019-08-09 11:47:25', 'pagado'),
('fact5', 1500, 'zona3', 'GFD456', '2019-08-07 14:11:59', '2019-08-07 17:09:03', 'pagado'),
('fact60', 500, 'zona2', 'JJJ879', '2019-08-14 05:14:03', NULL, 'pendiente'),
('fact76', 1500, 'zona3', 'MON123', '2019-08-15 09:40:50', '2019-08-15 09:50:25', 'pagado'),
('fact87', 1500, 'zona3', 'MON111', '2019-08-15 09:43:09', NULL, 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `placa` varchar(6) NOT NULL,
  `color` varchar(20) NOT NULL,
  `referencia` varchar(20) NOT NULL,
  `cedConductor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`placa`, `color`, `referencia`, `cedConductor`) VALUES
('DYF234', 'Negro', 'Mazda', '63457898'),
('GFD456', 'Fuscia', 'Kia', '10101010'),
('JJJ879', 'Blanco', 'Mazda', '54545454'),
('JOR633', 'Marron', 'Tesla', '63457898'),
('MAR101', 'Negro', 'BMW', '10101010'),
('MON111', 'Rojo', 'Tesla', '6543343'),
('MON123', 'Plata', 'BMW', '6543343'),
('WSC945', 'Rojo', 'Audi', '109876655'),
('YDF547', 'Plateado', 'Toyota', '1098781314'),
('YYY879', 'Azul', 'Ford', '30303030');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas`
--

CREATE TABLE `zonas` (
  `idZonas` varchar(10) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `tipoVehiculo` varchar(15) NOT NULL,
  `cupoMaximo` int(3) NOT NULL,
  `disponibles` int(3) NOT NULL,
  `codCelador` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `zonas`
--

INSERT INTO `zonas` (`idZonas`, `nombre`, `tipoVehiculo`, `cupoMaximo`, `disponibles`, `codCelador`) VALUES
('zona1', 'Camilo Torres', 'Carro', 200, 147, '2142600'),
('zona2', 'Musica', 'Motos', 150, 119, '2118765'),
('zona3', 'Bienestar', 'Carro', 180, 13, '2156783');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `celadores`
--
ALTER TABLE `celadores`
  ADD PRIMARY KEY (`codCelador`);

--
-- Indices de la tabla `conductores`
--
ALTER TABLE `conductores`
  ADD PRIMARY KEY (`cedConductor`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `idZona` (`idZonas`),
  ADD KEY `placa` (`placa`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `cedConductor` (`cedConductor`);

--
-- Indices de la tabla `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`idZonas`),
  ADD KEY `codCelador` (`codCelador`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`placa`) REFERENCES `vehiculos` (`placa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facturas_ibfk_3` FOREIGN KEY (`idZonas`) REFERENCES `zonas` (`idZonas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `vehiculos_ibfk_1` FOREIGN KEY (`cedConductor`) REFERENCES `conductores` (`cedConductor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `zonas`
--
ALTER TABLE `zonas`
  ADD CONSTRAINT `zonas_ibfk_1` FOREIGN KEY (`codCelador`) REFERENCES `celadores` (`codCelador`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
