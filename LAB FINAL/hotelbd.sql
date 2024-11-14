-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2024 a las 21:48:26
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotelbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `NUM_CLIENTE` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `NIF` varchar(9) DEFAULT NULL,
  `DOMICILIO` varchar(50) DEFAULT NULL,
  `LOCALIDAD` varchar(50) DEFAULT NULL,
  `PROVINCIA` varchar(50) DEFAULT NULL,
  `COD_POSTAL` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`NUM_CLIENTE`, `NOMBRE`, `NIF`, `DOMICILIO`, `LOCALIDAD`, `PROVINCIA`, `COD_POSTAL`) VALUES
(1, 'Laura Martinez', '12345678A', 'Calle Mayor 1', 'Madrid', 'Madrid', '28001'),
(2, 'Luis Gomez', '23456789B', 'Av. Sol 12', 'Valencia', 'Valencia', '46001'),
(3, 'Ana Perez', '34567890C', 'Paseo Luna 23', 'Barcelona', 'Barcelona', '08001'),
(4, 'Carlos Ruiz', '45678901D', 'Calle Estrella 34', 'Sevilla', 'Sevilla', '41001'),
(5, 'Maria Sanchez', '56789012E', 'Camino Real 45', 'Malaga', 'Malaga', '29001'),
(6, 'Javier Hernandez', '67890123F', 'Av. Libertad 56', 'Granada', 'Granada', '18001'),
(7, 'Sara Lopez', '78901234G', 'Plaza Central 67', 'Bilbao', 'Bizkaia', '48001'),
(8, 'Pablo Torres', '89012345H', 'Av. Verde 78', 'Madrid', 'Madrid', '28002'),
(9, 'Elena Gomez', '90123456I', 'Paseo Azul 89', 'Valencia', 'Valencia', '46002'),
(10, 'Victor Fernandez', '01234567J', 'Camino Sol 90', 'Barcelona', 'Barcelona', '08002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE `hotel` (
  `NUM_HOTEL` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `CATEGORIA` varchar(50) DEFAULT NULL,
  `DOMICILIO` varchar(50) DEFAULT NULL,
  `LOCALIDAD` varchar(50) DEFAULT NULL,
  `PROVINCIA` varchar(50) DEFAULT NULL,
  `COD_POSTAL` varchar(5) DEFAULT NULL,
  `TELEFONO` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `hotel`
--

INSERT INTO `hotel` (`NUM_HOTEL`, `NOMBRE`, `CATEGORIA`, `DOMICILIO`, `LOCALIDAD`, `PROVINCIA`, `COD_POSTAL`, `TELEFONO`) VALUES
(1, 'Hotel Sol', 'A', 'Av. Primavera 123', 'Madrid', 'Madrid', '28001', '911234567'),
(2, 'Hotel Luna', 'B', 'Calle Olmos 456', 'Valencia', 'Valencia', '46001', '962345678'),
(3, 'Hotel Estrella', 'C', 'Paseo Marítimo 789', 'Barcelona', 'Barcelona', '08001', '933456789'),
(4, 'Hotel Cielo', 'A', 'Av. Libertad 101', 'Sevilla', 'Sevilla', '41001', '954567890'),
(5, 'Hotel Playa', 'B', 'Camino Real 202', 'Malaga', 'Malaga', '29001', '952678901'),
(6, 'Hotel Montaña', 'C', 'Calle Bosque 303', 'Granada', 'Granada', '18001', '958789012'),
(7, 'Hotel Lago', 'A', 'Plaza Central 404', 'Bilbao', 'Bizkaia', '48001', '944890123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `NUM_RESERVA` int(11) NOT NULL,
  `NUM_CLIENTE` int(11) DEFAULT NULL,
  `NUM_TIPOHAB` int(11) DEFAULT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `FECHA_INI` date DEFAULT NULL,
  `FECHA_FIN` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`NUM_RESERVA`, `NUM_CLIENTE`, `NUM_TIPOHAB`, `CANTIDAD`, `FECHA_INI`, `FECHA_FIN`) VALUES
(1, 1, 1, 1, '2024-11-01', '2024-11-05'),
(2, 2, 2, 1, '2024-11-10', '2024-11-12'),
(3, 3, 3, 2, '2024-11-08', '2024-11-10'),
(4, 4, 4, 1, '2024-11-05', '2024-11-09'),
(5, 5, 5, 1, '2024-11-02', '2024-11-04'),
(6, 6, 6, 1, '2024-11-12', '2024-11-15'),
(7, 7, 7, 2, '2024-11-18', '2024-11-20'),
(8, 8, 8, 1, '2024-11-03', '2024-11-05'),
(9, 9, 9, 1, '2024-11-14', '2024-11-16'),
(10, 10, 10, 2, '2024-11-07', '2024-11-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_habitacion`
--

CREATE TABLE `tipo_habitacion` (
  `NUM_TIPOHAB` int(11) NOT NULL,
  `NUM_HOTEL` int(11) DEFAULT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `DESCRIPCION` varchar(50) DEFAULT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `MAX_OCUPANTES` int(11) DEFAULT NULL,
  `PRECIO` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_habitacion`
--

INSERT INTO `tipo_habitacion` (`NUM_TIPOHAB`, `NUM_HOTEL`, `NOMBRE`, `DESCRIPCION`, `CANTIDAD`, `MAX_OCUPANTES`, `PRECIO`) VALUES
(1, 1, 'Suite', 'Suite de lujo', 5, 4, 300),
(2, 1, 'Doble', 'Habitación doble estándar', 10, 2, 150),
(3, 2, 'Individual', 'Habitación individual', 15, 1, 80),
(4, 2, 'Triple', 'Habitación triple familiar', 8, 3, 200),
(5, 3, 'Doble Deluxe', 'Doble con vistas', 7, 2, 180),
(6, 3, 'Familiar', 'Habitación familiar', 5, 4, 250),
(7, 4, 'Individual', 'Habitación individual sencilla', 12, 1, 90),
(8, 4, 'Suite Junior', 'Suite Junior con balcón', 6, 3, 220),
(9, 5, 'Economy', 'Habitación económica', 20, 1, 60),
(10, 5, 'Doble', 'Habitación doble', 10, 2, 140),
(11, 6, 'Premium', 'Habitación premium con jacuzzi', 4, 2, 320),
(12, 6, 'Doble', 'Habitación doble estándar', 10, 2, 150),
(13, 7, 'Individual', 'Habitación individual estándar', 15, 1, 85),
(14, 7, 'Familiar', 'Habitación familiar', 8, 4, 180);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`NUM_CLIENTE`);

--
-- Indices de la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`NUM_HOTEL`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`NUM_RESERVA`),
  ADD KEY `NUM_CLIENTE` (`NUM_CLIENTE`),
  ADD KEY `NUM_TIPOHAB` (`NUM_TIPOHAB`);

--
-- Indices de la tabla `tipo_habitacion`
--
ALTER TABLE `tipo_habitacion`
  ADD PRIMARY KEY (`NUM_TIPOHAB`),
  ADD KEY `NUM_HOTEL` (`NUM_HOTEL`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`NUM_CLIENTE`) REFERENCES `cliente` (`NUM_CLIENTE`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`NUM_TIPOHAB`) REFERENCES `tipo_habitacion` (`NUM_TIPOHAB`);

--
-- Filtros para la tabla `tipo_habitacion`
--
ALTER TABLE `tipo_habitacion`
  ADD CONSTRAINT `tipo_habitacion_ibfk_1` FOREIGN KEY (`NUM_HOTEL`) REFERENCES `hotel` (`NUM_HOTEL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
