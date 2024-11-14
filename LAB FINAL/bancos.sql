-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2024 a las 21:48:11
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
-- Base de datos: `bancos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `ciudad` varchar(30) NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cedula`, `nombre`, `ciudad`, `telefono`) VALUES
('41', 'Fulana de Tal', 'Guatemala', '200'),
('54', 'Stevens Cambranes', 'Guatemala', '500'),
('67', 'Monica Rojas', 'Medellin', '123'),
('71', 'Francisco Sanchez', 'Cali', '567'),
('78', 'Andres Castellanos', 'Medellin', '568');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cli_cuentas`
--

CREATE TABLE `cli_cuentas` (
  `ced_cliente` varchar(15) NOT NULL,
  `nro_cuenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cli_cuentas`
--

INSERT INTO `cli_cuentas` (`ced_cliente`, `nro_cuenta`) VALUES
('71', 1),
('67', 2),
('71', 3),
('67', 4),
('67', 6),
('67', 7),
('78', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cli_prestamos`
--

CREATE TABLE `cli_prestamos` (
  `ced_cliente` varchar(15) NOT NULL,
  `nro_prestamo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cli_prestamos`
--

INSERT INTO `cli_prestamos` (`ced_cliente`, `nro_prestamo`) VALUES
('71', 22),
('78', 11),
('78', 22),
('78', 33);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `nro_cuenta` int(11) NOT NULL,
  `saldo` double NOT NULL,
  `cod_suc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`nro_cuenta`, `saldo`, `cod_suc`) VALUES
(1, 10000, 10),
(2, 10000, 20),
(3, 10000, 20),
(4, 10000, 40),
(5, 10000, 50),
(6, 10000, 10),
(7, 10000, 10),
(8, 5000, 60),
(9, 6000, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `nro_prestamo` int(11) NOT NULL,
  `valor` double NOT NULL,
  `saldo` double NOT NULL,
  `cod_suc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`nro_prestamo`, `valor`, `saldo`, `cod_suc`) VALUES
(11, 10000, 3000, 30),
(22, 100000, 30000, 10),
(33, 100000, 30000, 40),
(55, 7000, 18000, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `ciudad` varchar(30) NOT NULL,
  `activo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`codigo`, `nombre`, `ciudad`, `activo`) VALUES
(10, 'Poblado', 'Medellin', 100000),
(20, 'San Diego', 'Medellin', 100000),
(30, 'Exito', 'Medellin', 100000),
(40, 'Parque', 'Envigado', 500000),
(50, 'Exito', 'Envigado', 1000000),
(60, 'Exito', 'Bogota', 200000),
(70, 'Centro', 'Bogota', 500000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `cli_cuentas`
--
ALTER TABLE `cli_cuentas`
  ADD PRIMARY KEY (`nro_cuenta`,`ced_cliente`),
  ADD KEY `CLI_CUENTA_CLIENTE_FK` (`ced_cliente`);

--
-- Indices de la tabla `cli_prestamos`
--
ALTER TABLE `cli_prestamos`
  ADD PRIMARY KEY (`ced_cliente`,`nro_prestamo`),
  ADD KEY `CLI_PRES_PRESTAMO_FK` (`nro_prestamo`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`nro_cuenta`),
  ADD KEY `CUENTA_SUCURSAL_FK` (`cod_suc`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`nro_prestamo`),
  ADD KEY `PRESTAMO_SUCURSAL_FK` (`cod_suc`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`codigo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cli_cuentas`
--
ALTER TABLE `cli_cuentas`
  ADD CONSTRAINT `CLI_CUENTA_CLIENTE_FK` FOREIGN KEY (`ced_cliente`) REFERENCES `clientes` (`cedula`),
  ADD CONSTRAINT `CLI_CUENTA_CUENTA_FK` FOREIGN KEY (`nro_cuenta`) REFERENCES `cuentas` (`nro_cuenta`);

--
-- Filtros para la tabla `cli_prestamos`
--
ALTER TABLE `cli_prestamos`
  ADD CONSTRAINT `CLI_PRES_CLIENTE_FK` FOREIGN KEY (`ced_cliente`) REFERENCES `clientes` (`cedula`),
  ADD CONSTRAINT `CLI_PRES_PRESTAMO_FK` FOREIGN KEY (`nro_prestamo`) REFERENCES `prestamos` (`nro_prestamo`);

--
-- Filtros para la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD CONSTRAINT `CUENTA_SUCURSAL_FK` FOREIGN KEY (`cod_suc`) REFERENCES `sucursales` (`codigo`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `PRESTAMO_SUCURSAL_FK` FOREIGN KEY (`cod_suc`) REFERENCES `sucursales` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
