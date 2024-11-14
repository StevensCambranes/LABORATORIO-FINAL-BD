-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2024 a las 21:48:19
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
-- Base de datos: `futbolbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `demarcacion`
--

CREATE TABLE `demarcacion` (
  `Id` int(11) NOT NULL,
  `Demarcacion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Nombre_Oficial` varchar(100) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `CP` char(5) DEFAULT NULL,
  `Provincia` int(11) DEFAULT NULL,
  `Pais` int(11) DEFAULT NULL,
  `Direccion_Internet` varchar(255) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Peñas` int(11) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Fax` varchar(15) DEFAULT NULL,
  `Otras_Secciones` varchar(255) DEFAULT NULL,
  `Fecha_de_fundacion` date DEFAULT NULL,
  `Historia` text DEFAULT NULL,
  `Himno` varchar(255) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `Localidad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadios`
--

CREATE TABLE `estadios` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Capacidad` int(11) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `CP` char(5) DEFAULT NULL,
  `Provincia` int(11) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Inauguracion` date DEFAULT NULL,
  `Propietario` varchar(100) DEFAULT NULL,
  `Dimensiones` varchar(50) DEFAULT NULL,
  `Otras_instalaciones` varchar(255) DEFAULT NULL,
  `Localidad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `Id` int(11) NOT NULL,
  `Nombre_Futbolistico` varchar(100) DEFAULT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Apellidos` varchar(100) DEFAULT NULL,
  `Fecha_de_nacimiento` date DEFAULT NULL,
  `Lugar_Nacimiento` varchar(100) DEFAULT NULL,
  `Provincia` int(11) DEFAULT NULL,
  `Pais` int(11) DEFAULT NULL,
  `Pie` int(11) DEFAULT NULL,
  `Demarcacion` int(11) DEFAULT NULL,
  `Situacion` int(11) DEFAULT NULL,
  `Altura` decimal(4,2) DEFAULT NULL,
  `Peso` decimal(5,2) DEFAULT NULL,
  `Cantera` int(11) DEFAULT NULL,
  `Internacional` tinyint(1) DEFAULT NULL,
  `Historial` text DEFAULT NULL,
  `Representante` int(11) DEFAULT NULL,
  `Pais_Nacionalidad` int(11) DEFAULT NULL,
  `Retirado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `Id` int(11) NOT NULL,
  `Pais` varchar(100) NOT NULL,
  `Abreviatura` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pie`
--

CREATE TABLE `pie` (
  `Id` int(11) NOT NULL,
  `Pie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `Id` int(11) NOT NULL,
  `Provincia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representantes`
--

CREATE TABLE `representantes` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `situacionnacionalidad`
--

CREATE TABLE `situacionnacionalidad` (
  `Id` int(11) NOT NULL,
  `Situacion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `demarcacion`
--
ALTER TABLE `demarcacion`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Provincia` (`Provincia`),
  ADD KEY `Pais` (`Pais`);

--
-- Indices de la tabla `estadios`
--
ALTER TABLE `estadios`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Provincia` (`Provincia`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Provincia` (`Provincia`),
  ADD KEY `Pais` (`Pais`),
  ADD KEY `Pie` (`Pie`),
  ADD KEY `Demarcacion` (`Demarcacion`),
  ADD KEY `Situacion` (`Situacion`),
  ADD KEY `Representante` (`Representante`),
  ADD KEY `Pais_Nacionalidad` (`Pais_Nacionalidad`),
  ADD KEY `Cantera` (`Cantera`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `pie`
--
ALTER TABLE `pie`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `situacionnacionalidad`
--
ALTER TABLE `situacionnacionalidad`
  ADD PRIMARY KEY (`Id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`Provincia`) REFERENCES `provincias` (`Id`),
  ADD CONSTRAINT `equipos_ibfk_2` FOREIGN KEY (`Pais`) REFERENCES `paises` (`Id`);

--
-- Filtros para la tabla `estadios`
--
ALTER TABLE `estadios`
  ADD CONSTRAINT `estadios_ibfk_1` FOREIGN KEY (`Provincia`) REFERENCES `provincias` (`Id`);

--
-- Filtros para la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`Provincia`) REFERENCES `provincias` (`Id`),
  ADD CONSTRAINT `jugadores_ibfk_2` FOREIGN KEY (`Pais`) REFERENCES `paises` (`Id`),
  ADD CONSTRAINT `jugadores_ibfk_3` FOREIGN KEY (`Pie`) REFERENCES `pie` (`Id`),
  ADD CONSTRAINT `jugadores_ibfk_4` FOREIGN KEY (`Demarcacion`) REFERENCES `demarcacion` (`Id`),
  ADD CONSTRAINT `jugadores_ibfk_5` FOREIGN KEY (`Situacion`) REFERENCES `situacionnacionalidad` (`Id`),
  ADD CONSTRAINT `jugadores_ibfk_6` FOREIGN KEY (`Representante`) REFERENCES `representantes` (`Id`),
  ADD CONSTRAINT `jugadores_ibfk_7` FOREIGN KEY (`Pais_Nacionalidad`) REFERENCES `paises` (`Id`),
  ADD CONSTRAINT `jugadores_ibfk_8` FOREIGN KEY (`Cantera`) REFERENCES `equipos` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
