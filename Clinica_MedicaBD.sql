CREATE DATABASE  IF NOT EXISTS `clinica_medica` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clinica_medica`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: clinica_medica
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asignacionrolesopciones`
--

DROP TABLE IF EXISTS `asignacionrolesopciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignacionrolesopciones` (
  `ID_AsignacionRol` int NOT NULL AUTO_INCREMENT,
  `ID_Rol` int NOT NULL,
  `ID_Opcion` int NOT NULL,
  PRIMARY KEY (`ID_AsignacionRol`),
  KEY `ID_Rol` (`ID_Rol`),
  KEY `ID_Opcion` (`ID_Opcion`),
  CONSTRAINT `asignacionrolesopciones_ibfk_1` FOREIGN KEY (`ID_Rol`) REFERENCES `roles` (`ID_Rol`),
  CONSTRAINT `asignacionrolesopciones_ibfk_2` FOREIGN KEY (`ID_Opcion`) REFERENCES `opciones` (`ID_Opcion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacionrolesopciones`
--

LOCK TABLES `asignacionrolesopciones` WRITE;
/*!40000 ALTER TABLE `asignacionrolesopciones` DISABLE KEYS */;
INSERT INTO `asignacionrolesopciones` VALUES (1,1,1),(2,1,2),(3,1,3);
/*!40000 ALTER TABLE `asignacionrolesopciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos` (
  `ID_Cargo` int NOT NULL AUTO_INCREMENT,
  `Cargo` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (1,'Médico'),(2,'Enfermero'),(3,'Recepcionista');
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citas`
--

DROP TABLE IF EXISTS `citas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citas` (
  `ID_Cita` int NOT NULL AUTO_INCREMENT,
  `ID_Paciente` int NOT NULL,
  `Fecha_Hora` datetime NOT NULL,
  PRIMARY KEY (`ID_Cita`),
  KEY `ID_Paciente` (`ID_Paciente`),
  CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`ID_Paciente`) REFERENCES `pacientes` (`ID_Paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
INSERT INTO `citas` VALUES (1,3,'2024-05-10 08:00:00'),(2,2,'2024-05-12 09:30:00'),(6,1,'2024-05-31 11:05:47'),(8,5,'2024-05-31 17:21:35'),(9,2,'2024-06-02 06:26:28'),(10,6,'2024-06-02 08:15:41');
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `ID_Consulta` int NOT NULL AUTO_INCREMENT,
  `ID_Receta` int NOT NULL,
  `ID_Cita` int NOT NULL,
  `ID_Doctor` int NOT NULL,
  `ID_Consultorio` int NOT NULL,
  `Diagnostico` varchar(400) NOT NULL,
  `Indicaciones` varchar(400) NOT NULL,
  PRIMARY KEY (`ID_Consulta`),
  KEY `ID_Receta` (`ID_Receta`),
  KEY `ID_Cita` (`ID_Cita`),
  KEY `ID_Doctor` (`ID_Doctor`),
  KEY `ID_Consultorio` (`ID_Consultorio`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`ID_Receta`) REFERENCES `receta_medica` (`ID_Receta`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`ID_Cita`) REFERENCES `citas` (`ID_Cita`),
  CONSTRAINT `consulta_ibfk_3` FOREIGN KEY (`ID_Doctor`) REFERENCES `doctor` (`ID_Doctor`),
  CONSTRAINT `consulta_ibfk_4` FOREIGN KEY (`ID_Consultorio`) REFERENCES `consultorio` (`ID_Consultorio`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (5,1,1,1,1,'Common cold','Rest and hydrate'),(6,1,8,1,2,'nnasdm','dada'),(7,1,6,1,1,'dfsdds','sdsds'),(8,1,10,1,1,'nas','as');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultorio`
--

DROP TABLE IF EXISTS `consultorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultorio` (
  `ID_Consultorio` int NOT NULL AUTO_INCREMENT,
  `Disponible` tinyint(1) DEFAULT NULL,
  `NumeroConsultorio` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_Consultorio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultorio`
--

LOCK TABLES `consultorio` WRITE;
/*!40000 ALTER TABLE `consultorio` DISABLE KEYS */;
INSERT INTO `consultorio` VALUES (1,1,'101'),(2,1,'102');
/*!40000 ALTER TABLE `consultorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `ID_Departamento` char(2) NOT NULL,
  `Departamento` varchar(60) NOT NULL,
  `Pais` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_Departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES ('AH','Ahuachapán','El Salvador'),('CA','Cabañas','El Salvador'),('CH','Chalatenango','El Salvador'),('CU','Cuscatlán','El Salvador'),('LL','La Libertad','El Salvador'),('LP','La Paz','El Salvador'),('LU','La Unión','El Salvador'),('MO','Morazán','El Salvador'),('SA','Santa Ana','El Salvador'),('SM','San Miguel','El Salvador'),('SO','Sonsonate','El Salvador'),('SS','San Salvador','El Salvador'),('SV','San Vicente','El Salvador'),('US','Usulután','El Salvador');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones` (
  `ID_Direccion` int NOT NULL AUTO_INCREMENT,
  `Linea1` varchar(100) NOT NULL,
  `Linea2` varchar(100) DEFAULT NULL,
  `ID_Distrito` varchar(5) NOT NULL,
  `CodigoPostal` char(5) DEFAULT NULL,
  PRIMARY KEY (`ID_Direccion`),
  KEY `ID_Distrito` (`ID_Distrito`),
  CONSTRAINT `direcciones_ibfk_1` FOREIGN KEY (`ID_Distrito`) REFERENCES `distritos` (`ID_Distrito`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES (1,'Col Madera, Calle 1, #1N','Frente al parque','SON02','02311'),(2,'Barrio El Caldero, Av 2, #2I','Frente al amate','SOE01','02306'),(3,'Res El Cangrejo, Av 3, #3A','Frente a la playa','SOO01','02302'),(4,'Barrio El Centro, Av 4, #4S','Frente a catedral','SOC01','02301'),(5,'Col La Frontera, Calle 5, #5G','Km 10','AHS03','02113'),(6,'Res Buenavista, Calle 6, #6A','Contiguo a Alcaldia','SAC01','02201'),(7,'Res Altavista, Av 7, #7S','Contiguo al ISSS','SSC03','01101'),(8,'Col Las Margaritas, Pje 20, #2-4','Junto a ANDA','AHS01','02114'),(9,'Urb Las Magnolias, Pol 21, #2-6','Casa de esquina','LLO01','01115'),(10,'Caserio Florencia, 3era Calle, #5','Casa rosada','SON01','02305');
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distritos`
--

DROP TABLE IF EXISTS `distritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distritos` (
  `ID_Distrito` varchar(5) NOT NULL,
  `Distrito` varchar(60) NOT NULL,
  `ID_Municipio` char(3) NOT NULL,
  PRIMARY KEY (`ID_Distrito`),
  KEY `ID_Municipio` (`ID_Municipio`),
  CONSTRAINT `distritos_ibfk_1` FOREIGN KEY (`ID_Municipio`) REFERENCES `municipios` (`ID_Municipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distritos`
--

LOCK TABLES `distritos` WRITE;
/*!40000 ALTER TABLE `distritos` DISABLE KEYS */;
INSERT INTO `distritos` VALUES ('AHC01','Ahuachapán','AHC'),('AHC02','Apaneca','AHC'),('AHC03','Concepción de Ataco','AHC'),('AHC04','Tacuba','AHC'),('AHN01','Atiquizaya','AHN'),('AHN02','El Refugio','AHN'),('AHN03','San Lorenzo','AHN'),('AHN04','Turín','AHN'),('AHS01','Guaymango','AHS'),('AHS02','Jujutla','AHS'),('AHS03','San Francisco Menéndez','AHS'),('AHS04','San Pedro Puxtla','AHS'),('CAE01','Sensuntepeque','CAE'),('CAE02','Victoria','CAE'),('CAE03','Dolores','CAE'),('CAE04','Guacotecti','CAE'),('CAE05','San Isidro','CAE'),('CAO01','Ilobasco','CAO'),('CAO02','Tejutepeque','CAO'),('CAO03','Jutiapa','CAO'),('CAO04','Cinquera','CAO'),('CHC01','Nueva Concepción','CHC'),('CHC02','Tejutla','CHC'),('CHC03','La Reina','CHC'),('CHC04','Agua Caliente','CHC'),('CHC05','Dulce Nombre de María','CHC'),('CHC06','El Paraíso','CHC'),('CHC07','San Fernando','CHC'),('CHC08','San Francisco Morazán','CHC'),('CHC09','San Rafael','CHC'),('CHC10','Santa Rita','CHC'),('CHN01','La Palma','CHN'),('CHN02','Citalá','CHN'),('CHN03','San Ignacio','CHN'),('CHS01','Chalatenango','CHS'),('CHS02','Arcatao','CHS'),('CHS03','Azacualpa','CHS'),('CHS04','Comalapa','CHS'),('CHS05','Concepción Quezaltepeque','CHS'),('CHS06','El Carrizal','CHS'),('CHS07','La Laguna','CHS'),('CHS08','Las Vueltas','CHS'),('CHS09','Nombre de Jesús','CHS'),('CHS10','Nueva Trinidad','CHS'),('CHS11','Ojos de Agua','CHS'),('CHS12','Potonico','CHS'),('CHS13','San Antonio de La Cruz','CHS'),('CHS14','San Antonio Los Ranchos','CHS'),('CHS15','San Francisco Lempa','CHS'),('CHS16','San Isidro Labrador','CHS'),('CHS17','San José Cancasque','CHS'),('CHS18','San Miguel de Mercedes','CHS'),('CHS19','San José Las Flores','CHS'),('CHS20','San Luis del Carmen','CHS'),('CUN01','Suchitoto','CUN'),('CUN02','San José Guayabal','CUN'),('CUN03','Oratorio de Concepción','CUN'),('CUN04','San Bartolomé Perulapía','CUN'),('CUN05','San Pedro Perulapán','CUN'),('CUS01','Cojutepeque','CUS'),('CUS02','San Rafael Cedros','CUS'),('CUS03','Candelaria','CUS'),('CUS04','Monte San Juan','CUS'),('CUS05','El Carmen','CUS'),('CUS06','San Cristobal','CUS'),('CUS07','Santa Cruz Michapa','CUS'),('CUS08','San Ramón','CUS'),('CUS09','El Rosario','CUS'),('CUS10','Santa Cruz Analquito','CUS'),('CUS11','Tenancingo','CUS'),('LLC01','San Juan Opico','LLC'),('LLC02','Ciudad Arce','LLC'),('LLE01','Antiguo Cuscatlán','LLE'),('LLE02','Huizúcar','LLE'),('LLE03','Nuevo Cuscatlán','LLE'),('LLE04','San José Villanueva','LLE'),('LLE05','Zaragoza','LLE'),('LLN01','Quezaltepeque','LLN'),('LLN02','San Matías','LLN'),('LLN03','San Pablo Tacachico','LLN'),('LLO01','Colón','LLO'),('LLO02','Jayaque','LLO'),('LLO03','Sacacoyo','LLO'),('LLO04','Tepecoyo','LLO'),('LLO05','Talnique','LLO'),('LLS01','Comasagua','LLS'),('LLS02','Santa Tecla','LLS'),('LLT01','Chiltiupán','LLT'),('LLT02','Jicalapa','LLT'),('LLT03','La Libertad','LLT'),('LLT04','Tamanique','LLT'),('LLT05','Teotepeque','LLT'),('LPC01','El Rosario','LPC'),('LPC02','Jerusalén','LPC'),('LPC03','Mercedes La Ceiba','LPC'),('LPC04','Paraíso de Osorio','LPC'),('LPC05','San Antonio Masahuat','LPC'),('LPC06','San Emigdio','LPC'),('LPC07','San Juan Tepezontes','LPC'),('LPC08','San Luís La Herradura','LPC'),('LPC09','San Miguel Tepezontes','LPC'),('LPC10','San Pedro Nonualco','LPC'),('LPC11','Santa María Ostuma','LPC'),('LPC12','Santiago Nonualco','LPC'),('LPE01','San Juan Nonualco','LPE'),('LPE02','San Rafael Obrajuelo','LPE'),('LPE03','Zacatecoluca','LPE'),('LPO01','Cuyultitan','LPO'),('LPO02','Olocuilta','LPO'),('LPO03','San Juan Talpa','LPO'),('LPO04','San Luis Talpa','LPO'),('LPO05','San Pedro Masahuat','LPO'),('LPO06','Tapalhuaca','LPO'),('LPO07','San Francisco Chinameca','LPO'),('LUN01','Anamorós','LUN'),('LUN02','Bolivar','LUN'),('LUN03','Concepción de Oriente','LUN'),('LUN04','El Sauce','LUN'),('LUN05','Lislique','LUN'),('LUN06','Nueva Esparta','LUN'),('LUN07','Pasaquina','LUN'),('LUN08','Polorós','LUN'),('LUN09','San José La Fuente','LUN'),('LUN10','Santa Rosa de Lima','LUN'),('LUS01','Conchagua','LUS'),('LUS02','El Carmen','LUS'),('LUS03','Intipucá','LUS'),('LUS04','La Unión','LUS'),('LUS05','Meanguera del Golfo','LUS'),('LUS06','San Alejo','LUS'),('LUS07','Yayantique','LUS'),('LUS08','Yucuaiquín','LUS'),('MON01','Arambala','MON'),('MON02','Cacaopera','MON'),('MON03','Corinto','MON'),('MON04','El Rosario','MON'),('MON05','Joateca','MON'),('MON06','Jocoaitique','MON'),('MON07','Meanguera','MON'),('MON08','Perquín','MON'),('MON09','San Fernando','MON'),('MON10','San Isidro','MON'),('MON11','Torola','MON'),('MOS01','Chilanga','MOS'),('MOS02','Delicias de Concepción','MOS'),('MOS03','El Divisadero','MOS'),('MOS04','Gualococti','MOS'),('MOS05','Guatajiagua','MOS'),('MOS06','Jocoro','MOS'),('MOS07','Lolotiquillo','MOS'),('MOS08','Osicala','MOS'),('MOS09','San Carlos','MOS'),('MOS10','San Francisco Gotera','MOS'),('MOS11','San Simón','MOS'),('MOS12','Sensembra','MOS'),('MOS13','Sociedad','MOS'),('MOS14','Yamabal','MOS'),('MOS15','Yoloaiquín','MOS'),('SAC01','Santa Ana','SAC'),('SAE01','Coatepeque','SAE'),('SAE02','El Congo','SAE'),('SAN01','Masahuat','SAN'),('SAN02','Metapán','SAN'),('SAN03','Santa Rosa Guachipilín','SAN'),('SAN04','Texistepeque','SAN'),('SAO01','Candelaria de la Frontera','SAO'),('SAO02','Chalchuapa','SAO'),('SAO03','El Porvenir','SAO'),('SAO04','San Antonio Pajonal','SAO'),('SAO05','San Sebastián Salitrillo','SAO'),('SAO06','Santiago de La Frontera','SAO'),('SMC01','San Miguel','SMC'),('SMC02','Comacarán','SMC'),('SMC03','Uluazapa','SMC'),('SMC04','Moncagua','SMC'),('SMC05','Quelepa','SMC'),('SMC06','Chirilagua','SMC'),('SMN01','Ciudad Barrios','SMN'),('SMN02','Sesori','SMN'),('SMN03','Nuevo Edén de San Juan','SMN'),('SMN04','San Gerardo','SMN'),('SMN05','San Luis de La Reina','SMN'),('SMN06','Carolina','SMN'),('SMN07','San Antonio del Mosco','SMN'),('SMN08','Chapeltique','SMN'),('SMO01','Chinameca','SMO'),('SMO02','Nueva Guadalupe','SMO'),('SMO03','Lolotique','SMO'),('SMO04','San Jorge','SMO'),('SMO05','San Rafael Oriente','SMO'),('SMO06','El Tránsito','SMO'),('SOC01','Sonsonate','SOC'),('SOC02','Sonzacate','SOC'),('SOC03','Nahulingo','SOC'),('SOC04','San Antonio del Monte','SOC'),('SOC05','Santo Domingo de Guzmán','SOC'),('SOE01','Izalco','SOE'),('SOE02','Armenia','SOE'),('SOE03','Caluco','SOE'),('SOE04','San Julián','SOE'),('SOE05','Cuisnahuat','SOE'),('SOE06','Santa Isabel Ishuatán','SOE'),('SON01','Juayúa','SON'),('SON02','Nahuizalco','SON'),('SON03','Salcoatitán','SON'),('SON04','Santa Catarina Masahuat','SON'),('SOO01','Acajutla','SOO'),('SSC01','Ayutuxtepeque','SSC'),('SSC02','Mejicanos','SSC'),('SSC03','San Salvador','SSC'),('SSC04','Cuscatancingo','SSC'),('SSC05','Ciudad Delgado','SSC'),('SSE01','Ilopango','SSE'),('SSE02','San Martín','SSE'),('SSE03','Soyapango','SSE'),('SSE04','Tonacatepeque','SSE'),('SSN01','Aguilares','SSN'),('SSN02','El Paisnal','SSN'),('SSN03','Guazapa','SSN'),('SSO01','Apopa','SSO'),('SSO02','Nejapa','SSO'),('SSS01','Panchimalco','SSS'),('SSS02','Rosario de Mora','SSS'),('SSS03','San Marcos','SSS'),('SSS04','Santo Tomás','SSS'),('SSS05','Santiago Texacuangos','SSS'),('SVN01','Apastepeque','SVN'),('SVN02','Santa Clara','SVN'),('SVN03','San Ildefonso','SVN'),('SVN04','San Esteban Catarina','SVN'),('SVN05','San Sebastián','SVN'),('SVN06','San Lorenzo','SVN'),('SVN07','Santo Domingo','SVN'),('SVS01','San Vicente','SVS'),('SVS02','Guadalupe','SVS'),('SVS03','Verapaz','SVS'),('SVS04','Tepetitán','SVS'),('SVS05','Tecoluca','SVS'),('SVS06','San Cayetano Istepeque','SVS'),('USE01','Usulután','USE'),('USE02','Jucuarán','USE'),('USE03','San Dionisio','USE'),('USE04','Concepción Batres','USE'),('USE05','Santa María','USE'),('USE06','Ozatlán','USE'),('USE07','Tecapán','USE'),('USE08','Santa Elena','USE'),('USE09','California','USE'),('USE10','Ereguayquín','USE'),('USN01','Santiago de María','USN'),('USN02','Alegría','USN'),('USN03','Berlín','USN'),('USN04','Mercedes Umaña','USN'),('USN05','Jucuapa','USN'),('USN06','El triunfo','USN'),('USN07','Estanzuelas','USN'),('USN08','San Buenaventura','USN'),('USN09','Nueva Granada','USN'),('USO01','Jiquilisco','USO'),('USO02','Puerto El Triunfo','USO'),('USO03','San Agustín','USO'),('USO04','San Francisco Javier','USO');
/*!40000 ALTER TABLE `distritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `ID_Doctor` int NOT NULL AUTO_INCREMENT,
  `ID_Especialidad` int NOT NULL,
  `ID_Empleado` int NOT NULL,
  `NumeroLicencia` int NOT NULL,
  PRIMARY KEY (`ID_Doctor`),
  KEY `ID_Empleado` (`ID_Empleado`),
  KEY `ID_Especialidad` (`ID_Especialidad`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleados` (`ID_Empleado`),
  CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`ID_Especialidad`) REFERENCES `especialidad` (`ID_Especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,1,2,123456);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `ID_Empleado` int NOT NULL AUTO_INCREMENT,
  `DUI_Empleado` varchar(10) NOT NULL,
  `ISSS_Empleado` int NOT NULL,
  `NombresEmpleado` varchar(60) NOT NULL,
  `ApellidosEmpleado` varchar(60) NOT NULL,
  `FechaNacEmpleado` date NOT NULL,
  `TelefonoEmpleado` varchar(10) NOT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `ID_Cargo` int NOT NULL,
  `ID_Direccion` int NOT NULL,
  PRIMARY KEY (`ID_Empleado`),
  KEY `ID_Cargo` (`ID_Cargo`),
  KEY `ID_Direccion` (`ID_Direccion`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`ID_Cargo`) REFERENCES `cargos` (`ID_Cargo`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`ID_Direccion`) REFERENCES `direcciones` (`ID_Direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'12345678-9',123456789,'Juan','Pérez','1990-01-15','2222-2222','juan@example.com',1,1),(2,'98765432-1',987654321,'María','López','1992-05-20','3333-3333','maria@example.com',2,2);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `ID_Especialidad` int NOT NULL AUTO_INCREMENT,
  `Especialidad` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_Especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,'Pediatría'),(2,'Cardiología'),(3,'Dermatología');
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `ID_Factura` int NOT NULL AUTO_INCREMENT,
  `ID_Consulta` int NOT NULL,
  `Concepto` varchar(200) NOT NULL,
  `Monto` decimal(10,2) NOT NULL,
  `FechaEmision` date NOT NULL,
  `FechaPago` date NOT NULL,
  `MetodoPago` varchar(200) NOT NULL,
  `SubTotal` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Factura`),
  KEY `ID_Consulta` (`ID_Consulta`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`ID_Consulta`) REFERENCES `consulta` (`ID_Consulta`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,5,'Consultation fee',40.00,'2024-05-10','2024-05-10','Bitcoins',1233.00,1273.00),(2,5,'Consultation fee',50.00,'2024-05-12','2024-05-12','Credit Card',NULL,NULL),(3,5,'de paga',50.00,'2024-05-30','2024-05-31','Bitcoins - Chivo Wallet',NULL,NULL),(4,5,'consultation fee',30.00,'2024-05-31','2024-05-31','Efectivo',NULL,NULL),(5,5,'Consulta gratis',0.00,'2024-05-31','2024-05-31','Efectivo',NULL,NULL),(6,5,'Consulta Casual',15.00,'2024-05-31','2024-05-31','Bitcoins',NULL,NULL),(16,5,'sas',10.00,'2024-05-31','2024-05-31','Bitcoins',0.00,0.00),(20,7,'sad',200.00,'2024-06-02','2024-06-02','Targeta Debito',22.00,222.00);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos` (
  `ID_Insumo` int NOT NULL AUTO_INCREMENT,
  `NombreInsumo` varchar(200) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `CantidadDiponible` int NOT NULL,
  `PrecioUnitario` decimal(10,2) NOT NULL,
  `Proveedor` varchar(200) NOT NULL,
  `FechaVencimiento` date NOT NULL,
  PRIMARY KEY (`ID_Insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
INSERT INTO `medicamentos` VALUES (1,'Paracetamol','Analgesic and antipyretic',100,5.00,'Pharma Distributors','2025-01-01'),(2,'Amoxicillin','Antibiotic',50,10.00,'Med Supplies Inc.','2024-12-01');
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipios` (
  `ID_Municipio` char(3) NOT NULL,
  `Municipio` varchar(60) NOT NULL,
  `ID_Departamento` char(2) NOT NULL,
  PRIMARY KEY (`ID_Municipio`),
  KEY `ID_Departamento` (`ID_Departamento`),
  CONSTRAINT `municipios_ibfk_1` FOREIGN KEY (`ID_Departamento`) REFERENCES `departamentos` (`ID_Departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
INSERT INTO `municipios` VALUES ('AHC','Ahuachapán Centro','AH'),('AHN','Ahuachapán Norte','AH'),('AHS','Ahuachapán Sur','AH'),('CAE','Cabañas Este','CA'),('CAO','Cabañas Oeste','CA'),('CHC','Chalatenango Centro','CH'),('CHN','Chalatenango Norte','CH'),('CHS','Chalatenango Sur','CH'),('CUN','Cuscatlán Norte','CU'),('CUS','Cuscatlán Sur','CU'),('LLC','La Libertad Centro','LL'),('LLE','La Libertad Este','LL'),('LLN','La Libertad Norte','LL'),('LLO','La Libertad Oeste','LL'),('LLS','La Libertad Sur','LL'),('LLT','La Libertad Costa','LL'),('LPC','La Paz Centro','LP'),('LPE','La Paz Este','LP'),('LPO','La Paz Oeste','LP'),('LUN','La Unión Norte','LU'),('LUS','La Unión Sur','LU'),('MON','Morazán Norte','MO'),('MOS','Morazán Sur','MO'),('SAC','Santa Ana Centro','SA'),('SAE','Santa Ana Este','SA'),('SAN','Santa Ana Norte','SA'),('SAO','Santa Ana Oeste','SA'),('SMC','San Miguel Centro','SM'),('SMN','San Miguel Norte','SM'),('SMO','San Miguel Oeste','SM'),('SOC','Sonsonate Centro','SO'),('SOE','Sonsonate Este','SO'),('SON','Sonsonate Norte','SO'),('SOO','Sonsonate Oeste','SO'),('SSC','San Salvador Centro','SS'),('SSE','San Salvador Este','SS'),('SSN','San Salvador Norte','SS'),('SSO','San Salvador Oeste','SS'),('SSS','San Salvador Sur','SS'),('SVN','San Vicente Norte','SV'),('SVS','San Vicente Sur','SV'),('USE','Usulután Este','US'),('USN','Usulután Norte','US'),('USO','Usulután Oeste','US');
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones`
--

DROP TABLE IF EXISTS `opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opciones` (
  `ID_Opcion` int NOT NULL AUTO_INCREMENT,
  `NombreOpcion` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_Opcion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones`
--

LOCK TABLES `opciones` WRITE;
/*!40000 ALTER TABLE `opciones` DISABLE KEYS */;
INSERT INTO `opciones` VALUES (1,'Ver Pacientes'),(2,'Agregar Pacientes'),(3,'Editar Pacientes'),(4,'Eliminar Pacientes');
/*!40000 ALTER TABLE `opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `ID_Paciente` int NOT NULL AUTO_INCREMENT,
  `NombresPaciente` varchar(200) NOT NULL,
  `ApellidosPaciente` varchar(200) NOT NULL,
  `FechaNac` date NOT NULL,
  `Genero` char(1) DEFAULT NULL,
  `ID_Direccion` int NOT NULL,
  `Telefono` int NOT NULL,
  `CorreoElectronico` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_Paciente`),
  KEY `ID_Direccion` (`ID_Direccion`),
  CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`ID_Direccion`) REFERENCES `direcciones` (`ID_Direccion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES (1,'Carlos','García','1985-08-10','M',1,77777777,'carlos@example.com'),(2,'Ana','Martínez','1990-12-05','F',2,88888888,'ana@example.com'),(3,'Salvador0','De Asis0','2029-05-30','M',2,77666679,'deasis22@gmail.com9'),(5,'Jorge','Perez','2024-05-31','M',1,77889902,'Perez@gmail.com'),(6,'Pedro Gonzales','Fernando ','2024-06-02','M',9,222333444,'pedro@gmail.com');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta_medica`
--

DROP TABLE IF EXISTS `receta_medica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta_medica` (
  `ID_Receta` int NOT NULL AUTO_INCREMENT,
  `ID_Insumo` int NOT NULL,
  `Indicaciones` varchar(200) NOT NULL,
  `Cantidad` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Receta`),
  KEY `ID_Insumo` (`ID_Insumo`),
  CONSTRAINT `receta_medica_ibfk_1` FOREIGN KEY (`ID_Insumo`) REFERENCES `medicamentos` (`ID_Insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta_medica`
--

LOCK TABLES `receta_medica` WRITE;
/*!40000 ALTER TABLE `receta_medica` DISABLE KEYS */;
INSERT INTO `receta_medica` VALUES (1,1,'Take 1 tablet every 6 hours for pain',10.00),(2,2,'Take 1 capsule every 8 hours for infection',5.00);
/*!40000 ALTER TABLE `receta_medica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `ID_Rol` int NOT NULL AUTO_INCREMENT,
  `NombreRol` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin'),(2,'Doctor'),(3,'Enfermera'),(4,'Recepcionista');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `ID_Usuario` int NOT NULL AUTO_INCREMENT,
  `ID_Empleado` int NOT NULL,
  `ID_Rol` int NOT NULL,
  `Usuario` varchar(60) NOT NULL,
  `Clave` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  KEY `ID_Empleado` (`ID_Empleado`),
  KEY `ID_Rol` (`ID_Rol`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleados` (`ID_Empleado`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`ID_Rol`) REFERENCES `roles` (`ID_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,1,'admin','admin123'),(2,2,2,'doctor1','doctor123');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `usuariosview`
--

DROP TABLE IF EXISTS `usuariosview`;
/*!50001 DROP VIEW IF EXISTS `usuariosview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `usuariosview` AS SELECT 
 1 AS `ID_Usuario`,
 1 AS `ID_Empleado`,
 1 AS `NombreEmpleado`,
 1 AS `ID_Rol`,
 1 AS `NombreRol`,
 1 AS `Usuario`,
 1 AS `Clave`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `verpermisos`
--

DROP TABLE IF EXISTS `verpermisos`;
/*!50001 DROP VIEW IF EXISTS `verpermisos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `verpermisos` AS SELECT 
 1 AS `NombreRol`,
 1 AS `NombreOpcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_citas`
--

DROP TABLE IF EXISTS `vista_citas`;
/*!50001 DROP VIEW IF EXISTS `vista_citas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_citas` AS SELECT 
 1 AS `ID_Cita`,
 1 AS `NombresPaciente`,
 1 AS `ApellidosPaciente`,
 1 AS `Fecha_Hora`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_doctor`
--

DROP TABLE IF EXISTS `vista_doctor`;
/*!50001 DROP VIEW IF EXISTS `vista_doctor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_doctor` AS SELECT 
 1 AS `ID_Doctor`,
 1 AS `ID_Empleado`,
 1 AS `NombresEmpleado`,
 1 AS `ApellidosEmpleado`,
 1 AS `TelefonoEmpleado`,
 1 AS `NumeroLicencia`,
 1 AS `Especialidad`,
 1 AS `Correo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistaempleados`
--

DROP TABLE IF EXISTS `vistaempleados`;
/*!50001 DROP VIEW IF EXISTS `vistaempleados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaempleados` AS SELECT 
 1 AS `ID_Empleado`,
 1 AS `DUI_EMpleado`,
 1 AS `ISSS_Empleado`,
 1 AS `NombresEmpleado`,
 1 AS `ApellidosEmpleado`,
 1 AS `FechaNacEmpleado`,
 1 AS `TelefonoEmpleado`,
 1 AS `Correo`,
 1 AS `Cargo`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'clinica_medica'
--

--
-- Dumping routines for database 'clinica_medica'
--

--
-- Final view structure for view `usuariosview`
--

/*!50001 DROP VIEW IF EXISTS `usuariosview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usuariosview` AS select `u`.`ID_Usuario` AS `ID_Usuario`,`e`.`ID_Empleado` AS `ID_Empleado`,`e`.`NombresEmpleado` AS `NombreEmpleado`,`r`.`ID_Rol` AS `ID_Rol`,`r`.`NombreRol` AS `NombreRol`,`u`.`Usuario` AS `Usuario`,`u`.`Clave` AS `Clave` from ((`usuarios` `u` join `empleados` `e` on((`u`.`ID_Empleado` = `e`.`ID_Empleado`))) join `roles` `r` on((`u`.`ID_Rol` = `r`.`ID_Rol`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `verpermisos`
--

/*!50001 DROP VIEW IF EXISTS `verpermisos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `verpermisos` AS select `roles`.`NombreRol` AS `NombreRol`,`opciones`.`NombreOpcion` AS `NombreOpcion` from ((`asignacionrolesopciones` join `roles` on((`asignacionrolesopciones`.`ID_Rol` = `roles`.`ID_Rol`))) join `opciones` on((`asignacionrolesopciones`.`ID_Opcion` = `opciones`.`ID_Opcion`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_citas`
--

/*!50001 DROP VIEW IF EXISTS `vista_citas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_citas` AS select `c`.`ID_Cita` AS `ID_Cita`,`p`.`NombresPaciente` AS `NombresPaciente`,`p`.`ApellidosPaciente` AS `ApellidosPaciente`,`c`.`Fecha_Hora` AS `Fecha_Hora` from (`citas` `c` join `pacientes` `p` on((`c`.`ID_Paciente` = `p`.`ID_Paciente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_doctor`
--

/*!50001 DROP VIEW IF EXISTS `vista_doctor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_doctor` AS select `doc`.`ID_Doctor` AS `ID_Doctor`,`e`.`ID_Empleado` AS `ID_Empleado`,`e`.`NombresEmpleado` AS `NombresEmpleado`,`e`.`ApellidosEmpleado` AS `ApellidosEmpleado`,`e`.`TelefonoEmpleado` AS `TelefonoEmpleado`,`doc`.`NumeroLicencia` AS `NumeroLicencia`,`esp`.`Especialidad` AS `Especialidad`,`e`.`Correo` AS `Correo` from ((`doctor` `doc` join `empleados` `e` on((`e`.`ID_Empleado` = `doc`.`ID_Empleado`))) join `especialidad` `esp` on((`esp`.`ID_Especialidad` = `doc`.`ID_Especialidad`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistaempleados`
--

/*!50001 DROP VIEW IF EXISTS `vistaempleados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaempleados` AS select `e`.`ID_Empleado` AS `ID_Empleado`,`e`.`DUI_Empleado` AS `DUI_EMpleado`,`e`.`ISSS_Empleado` AS `ISSS_Empleado`,`e`.`NombresEmpleado` AS `NombresEmpleado`,`e`.`ApellidosEmpleado` AS `ApellidosEmpleado`,`e`.`FechaNacEmpleado` AS `FechaNacEmpleado`,`e`.`TelefonoEmpleado` AS `TelefonoEmpleado`,`e`.`Correo` AS `Correo`,`c`.`Cargo` AS `Cargo` from (`empleados` `e` join `cargos` `c` on((`c`.`ID_Cargo` = `e`.`ID_Empleado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-02 12:21:45
