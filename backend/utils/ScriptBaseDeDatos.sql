-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para catacitas
CREATE DATABASE IF NOT EXISTS `catacitas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `catacitas`;

-- Volcando estructura para tabla catacitas.cita
CREATE TABLE IF NOT EXISTS `cita` (
  `idCita` int NOT NULL AUTO_INCREMENT,
  `estado` int NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `duracion` int NOT NULL,
  `idCliente` int NOT NULL,
  `idBarbero` int NOT NULL,
  `total_pagar` float DEFAULT NULL,
  `nombreProductor` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`idCita`),
  KEY `idCliente` (`idCliente`),
  KEY `idBarbero` (`idBarbero`),
  CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`idBarbero`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla catacitas.cita: ~2 rows (aproximadamente)
INSERT INTO `cita` (`idCita`, `estado`, `fecha_creacion`, `fecha`, `hora`, `duracion`, `idCliente`, `idBarbero`, `total_pagar`, `nombreProductor`) VALUES
	(23, 0, '2024-02-26', '2024-02-26', '09:01:00', 60, 3, 5, 120, 'Juan Perez'),
	(24, 3, '2024-02-26', '2024-02-26', '13:05:00', 60, 3, 2, 120, 'luisa martinez');

-- Volcando estructura para tabla catacitas.cita_servicio
CREATE TABLE IF NOT EXISTS `cita_servicio` (
  `idCita` int NOT NULL,
  `idServicio` int NOT NULL,
  PRIMARY KEY (`idCita`,`idServicio`),
  KEY `idServicio` (`idServicio`),
  CONSTRAINT `cita_servicio_ibfk_1` FOREIGN KEY (`idCita`) REFERENCES `cita` (`idCita`),
  CONSTRAINT `cita_servicio_ibfk_2` FOREIGN KEY (`idServicio`) REFERENCES `servicio` (`idServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla catacitas.cita_servicio: ~2 rows (aproximadamente)
INSERT INTO `cita_servicio` (`idCita`, `idServicio`) VALUES
	(23, 2),
	(24, 2);

-- Volcando estructura para tabla catacitas.dia
CREATE TABLE IF NOT EXISTS `dia` (
  `idDia` int NOT NULL AUTO_INCREMENT,
  `dia` varchar(45) NOT NULL,
  PRIMARY KEY (`idDia`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla catacitas.dia: ~7 rows (aproximadamente)
INSERT INTO `dia` (`idDia`, `dia`) VALUES
	(1, 'Lunes'),
	(2, 'Martes'),
	(3, 'Miercoles'),
	(4, 'Jueves'),
	(5, 'Viernes'),
	(6, 'Sabado'),
	(7, 'Domingo');

-- Volcando estructura para tabla catacitas.horario
CREATE TABLE IF NOT EXISTS `horario` (
  `idHorario` int NOT NULL AUTO_INCREMENT,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `idBarbero` int NOT NULL,
  `idDia` int NOT NULL,
  PRIMARY KEY (`idHorario`),
  KEY `idBarbero` (`idBarbero`),
  KEY `idDia` (`idDia`),
  CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`idBarbero`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`idDia`) REFERENCES `dia` (`idDia`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla catacitas.horario: ~28 rows (aproximadamente)
INSERT INTO `horario` (`idHorario`, `hora_inicio`, `hora_fin`, `idBarbero`, `idDia`) VALUES
	(2, '10:30:00', '17:00:00', 2, 1),
	(3, '07:00:00', '14:00:00', 2, 2),
	(4, '17:00:00', '20:00:00', 2, 3),
	(5, '08:00:00', '16:00:00', 2, 4),
	(6, '08:00:00', '16:00:00', 2, 5),
	(7, '08:00:00', '12:00:00', 2, 6),
	(8, '08:00:00', '16:00:00', 5, 1),
	(9, '08:00:00', '16:00:00', 5, 2),
	(10, '08:00:00', '16:00:00', 5, 3),
	(11, '08:00:00', '16:00:00', 5, 4),
	(12, '08:00:00', '16:00:00', 5, 5),
	(13, '08:00:00', '10:00:00', 5, 6),
	(14, '08:00:00', '16:00:00', 4, 1),
	(15, '08:00:00', '16:00:00', 4, 2),
	(16, '08:00:00', '16:00:00', 4, 3),
	(17, '08:00:00', '16:00:00', 4, 4),
	(18, '08:00:00', '16:00:00', 4, 5),
	(19, '08:00:00', '16:00:00', 8, 1),
	(20, '08:00:00', '16:00:00', 8, 2),
	(21, '08:00:00', '16:00:00', 8, 3),
	(22, '08:00:00', '16:00:00', 8, 4),
	(23, '08:00:00', '16:00:00', 8, 5),
	(24, '08:00:00', '16:00:00', 8, 6),
	(25, '08:00:00', '16:00:00', 9, 1),
	(26, '08:00:00', '16:00:00', 9, 2),
	(27, '08:00:00', '16:00:00', 9, 3),
	(28, '08:00:00', '16:00:00', 9, 4),
	(29, '08:00:00', '16:00:00', 9, 5);

-- Volcando estructura para tabla catacitas.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `idRol` int NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`idRol`),
  UNIQUE KEY `idRol` (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla catacitas.rol: ~3 rows (aproximadamente)
INSERT INTO `rol` (`idRol`, `nombre`) VALUES
	(1, 'cliente'),
	(2, 'barbero'),
	(3, 'admin');

-- Volcando estructura para tabla catacitas.servicio
CREATE TABLE IF NOT EXISTS `servicio` (
  `idServicio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `duracion` int NOT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  PRIMARY KEY (`idServicio`),
  UNIQUE KEY `idServicio` (`idServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla catacitas.servicio: ~1 rows (aproximadamente)
INSERT INTO `servicio` (`idServicio`, `nombre`, `duracion`, `imagen`, `precio`) VALUES
	(2, 'Servicio Tecnico', 60, 'https://www.menshairstyletrends.com/wp-content/uploads/2020/02/taper-fade-handsome_ransom-819x1024.jpg', 120);

-- Volcando estructura para tabla catacitas.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `ap_paterno` varchar(45) NOT NULL,
  `ap_materno` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(256) NOT NULL,
  `telefono` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `estado` int NOT NULL,
  `idRol` int NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `idUsuario` (`idUsuario`),
  UNIQUE KEY `email` (`email`),
  KEY `idRol` (`idRol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla catacitas.usuario: ~7 rows (aproximadamente)
INSERT INTO `usuario` (`idUsuario`, `nombre`, `ap_paterno`, `ap_materno`, `email`, `password`, `telefono`, `foto`, `estado`, `idRol`) VALUES
	(1, 'Enrique', 'Camarena', 'Garcia', 'admin@gmail.com', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '12345678', 'https://media.gq.com.mx/photos/5bfdcc8f4958a1bc759a27bd/3:2/w_1011,h_674,c_limit/bob%20esponja.jpg', 1, 3),
	(2, 'Bryan', 'Sanchez', 'Lopez', 'bryan@gmail.com', '0bcf62b62f026b799d6245fc98591b58f6428db3a828303791f135360461d4ca', '12345678', 'https://media.gq.com.mx/photos/5bfdcc8f4958a1bc759a27bd/3:2/w_1011,h_674,c_limit/bob%20esponja.jpg', 1, 2),
	(3, 'Lucia', 'Solis', 'Medina', 'secretaria@gmail.com', '3e7100903faebe330d30fd23a5563830568bca178d5210986163528da8fac196', '42910020', 'https://media.revistagq.com/photos/5f3243ee64de88802df64b6a/master/pass/patricio.jpg', 1, 1),
	(4, 'Rony', 'Lopez', 'Perez', 'ronilopez@gmail.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', '98814443', 'https://api.multiavatar.com/Rony.png?apikey=9vCQPGoJqVYelt', 1, 2),
	(5, 'Esly', 'Ardon', 'Sanchez', 'eslyardon@gmail.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', '98814424', 'https://api.multiavatar.com/esly.png?apikey=9vCQPGoJqVYelt', 1, 2),
	(8, 'Juana', 'Lopez', 'Ramirez', 'juanalopez@gmail.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', '99969985', 'https://api.multiavatar.com/esly.png?apikey=9vCQPGoJqVYelt', 1, 2),
	(9, 'Mario', 'Perez', 'Ramirez', 'mario@gmail.com', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', '99969985', 'https://api.multiavatar.com/esly.png?apikey=9vCQPGoJqVYelt', 1, 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
