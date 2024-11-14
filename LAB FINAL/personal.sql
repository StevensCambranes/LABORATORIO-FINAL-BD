-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2024 a las 21:48:32
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
-- Base de datos: `personal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `clave_Depto` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `presupuesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`clave_Depto`, `nombre`, `presupuesto`) VALUES
(1, 'Personal', 80000),
(2, 'Almacén', 70000),
(3, 'Contabilidad', 60000),
(4, 'Manufactura', 50000),
(5, 'Empaque', 30000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `clave_Empleado` varchar(8) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `clave_Depto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`clave_Empleado`, `nombre`, `apellidos`, `clave_Depto`) VALUES
('EMP01', 'Armando', 'López', 2),
('EMP02', 'Tatiana', 'Vargas', 1),
('EMP03', 'Laura', 'Iturria', 3),
('EMP04', 'Juan', 'Pérez', 4),
('EMP05', 'Iván', 'López', 4),
('EMP06', 'Margarita', 'Hernández', 1),
('EMP07', 'Jesús', 'Pérez', 3),
('EMP08', 'Tonatiuh', 'Flores', 2),
('EMP09', 'Juan', 'López', 4),
('EMP10', 'José', 'Hernández', 5);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistagrandespresupuestos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistagrandespresupuestos` (
`clave_Depto` int(11)
,`nombre` varchar(30)
,`presupuesto` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistapersonal`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistapersonal` (
`clave_Empleado` varchar(8)
,`nombre` varchar(30)
,`apellidos` varchar(30)
,`clave_Depto` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistapersonalperez`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistapersonalperez` (
`clave_Empleado` varchar(8)
,`nombre` varchar(30)
,`apellidos` varchar(30)
,`clave_Depto` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vistagrandespresupuestos`
--
DROP TABLE IF EXISTS `vistagrandespresupuestos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistagrandespresupuestos`  AS SELECT `departamento`.`clave_Depto` AS `clave_Depto`, `departamento`.`nombre` AS `nombre`, `departamento`.`presupuesto` AS `presupuesto` FROM `departamento` WHERE `departamento`.`presupuesto` >= 50000 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistapersonal`
--
DROP TABLE IF EXISTS `vistapersonal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistapersonal`  AS SELECT `empleado`.`clave_Empleado` AS `clave_Empleado`, `empleado`.`nombre` AS `nombre`, `empleado`.`apellidos` AS `apellidos`, `empleado`.`clave_Depto` AS `clave_Depto` FROM `empleado` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistapersonalperez`
--
DROP TABLE IF EXISTS `vistapersonalperez`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistapersonalperez`  AS SELECT `empleado`.`clave_Empleado` AS `clave_Empleado`, `empleado`.`nombre` AS `nombre`, `empleado`.`apellidos` AS `apellidos`, `empleado`.`clave_Depto` AS `clave_Depto` FROM `empleado` WHERE `empleado`.`apellidos` = 'Pérez' ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`clave_Depto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`clave_Empleado`),
  ADD KEY `FK_clave_Depto` (`clave_Depto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `clave_Depto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_clave_Depto` FOREIGN KEY (`clave_Depto`) REFERENCES `departamento` (`clave_Depto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
