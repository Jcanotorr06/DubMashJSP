-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for dubmash
CREATE DATABASE IF NOT EXISTS `dubmash` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dubmash`;

-- Dumping structure for procedure dubmash.BuscarMemesTemasSeguidos
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarMemesTemasSeguidos`(
	IN `Id_Usuario_ses` INT

)
BEGIN
	SELECT
		pub.Id, pub.Titulo, pub.Imagen, usu.Id AS 'Id_Usuario', usu.Usuario, usu.Color, usu.Imagen AS 'Imagen_Usuario', tem.Id AS 'Id_Tema', tem.Nombre AS 'Nombre_Tema'
	FROM tema_seguido AS temseg
	JOIN publicacion AS pub on temseg.Id_Tema = pub.Id_Tema
	JOIN tema AS tem ON tem.Id = pub.Id_Tema
	JOIN usuario as usu on usu.Id = pub.Id_Usuario
	WHERE temseg.Id_Usuario = Id_Usuario_ses;
END//
DELIMITER ;

-- Dumping structure for procedure dubmash.BuscarMemesUsuario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarMemesUsuario`(
	IN `Id_Usuario_u` INT

)
BEGIN
	SELECT
		*
	FROM publicacion
	WHERE publicacion.Id_Usuario = Id_Usuario_u;
END//
DELIMITER ;

-- Dumping structure for procedure dubmash.BuscarMemesUsuariosSeguidos
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarMemesUsuariosSeguidos`(
	IN `Id_Usuario_ses` INT

)
BEGIN
	SELECT
		pub.Id, pub.Titulo, pub.Imagen, usu.Id AS 'Id_Usuario', usu.Usuario, usu.Color, usu.Imagen AS 'Imagen_Usuario', tem.Id AS 'Id_Tema', tem.Nombre AS 'Nombre_Tema'
	FROM usuario_seguido AS useg
	JOIN usuario AS usu ON useg.Id_Seguido = usu.Id
	JOIN publicacion AS pub on usu.Id = pub.Id_Usuario
	JOIN tema AS tem ON tem.Id = pub.Id_Tema
	WHERE useg.Id_Usuario = Id_Usuario_ses
	OR usu.Id = Id_Usuario_ses;
END//
DELIMITER ;

-- Dumping structure for procedure dubmash.BuscarPerfil
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPerfil`(
	IN `Nombre_Usuario` VARCHAR(50)




)
BEGIN
	DECLARE Seguidores INT DEFAULT 0;
	DECLARE Seguidos INT DEFAULT 0;
	DECLARE Publicaciones INT DEFAULT 0;
		
	Call CantidadPublicaciones(Nombre_Usuario, Publicaciones);
	Call CantidadSeguidos(Nombre_Usuario, Seguidos);
	Call CantidadSeguidores(Nombre_Usuario, Seguidores);
	Select 
			Id, Nombre,Usuario, Imagen, Color, Seguidores, Seguidos, Publicaciones
		From usuario
	WHERE Usuario = Nombre_Usuario;
END//
DELIMITER ;

-- Dumping structure for procedure dubmash.BuscarPerfilId
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarPerfilId`(
	IN `Id_Usuario` INT
)
BEGIN
	Select 
			Id, Nombre,Usuario, Imagen, Color
		From usuario
	WHERE Id = Id_Usuario;
END//
DELIMITER ;

-- Dumping structure for procedure dubmash.BuscarTemasSugeridos
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarTemasSugeridos`(
	IN `Id_Usuario_ses` INT



)
BEGIN
	SELECT
		tem.Id, tem.Nombre, tem.URL_Imagen
	FROM tema AS tem
	ORDER BY tem.Id;
END//
DELIMITER ;

-- Dumping structure for procedure dubmash.BuscarUsuariosSeguidos
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarUsuariosSeguidos`(
	IN `Id_Usuario_ses` INT
)
BEGIN
	SELECT
		usu.Id, usu.Usuario, usu.Color, usu.Imagen
	FROM usuario_seguido AS useg
	JOIN usuario AS usu ON useg.Id_Seguido = usu.Id
	WHERE useg.Id_Usuario = Id_Usuario_ses;
END//
DELIMITER ;

-- Dumping structure for procedure dubmash.BuscarUsuariosSugeridos
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarUsuariosSugeridos`(
	IN `Id_Usuario_ses` INT

)
BEGIN
	SELECT 
		usu.Id, usu.Usuario, usu.Color, usu.Imagen
	FROM usuario as usu
	WHERE usu.Id not in(
		SELECT 
			useg.Id_Seguido
		FROM usuario_seguido as useg
		WHERE useg.Id_Usuario = Id_Usuario_ses
	) 
	AND usu.Id != Id_Usuario_ses
	ORDER BY usu.Id
	LIMIT 5;
END//
DELIMITER ;

-- Dumping structure for procedure dubmash.CantidadPublicaciones
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `CantidadPublicaciones`(
	IN `Nombre_Usuario` VARCHAR(50)
,
	IN `Cantidad` INT
)
BEGIN
	SELECT 
		COUNT(*) 
	INTO Cantidad 
	FROM publicacion as pub
	JOIN  usuario as usu on usu.Id = pub.Id_Usuario
	WHERE usu.Usuario = Nombre_Usuario;
END//
DELIMITER ;

-- Dumping structure for procedure dubmash.CantidadSeguidores
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `CantidadSeguidores`(
	IN `Nombre_Usuario` VARCHAR(50)
,
	OUT `Cantidad` INT

)
BEGIN
	SELECT 
		COUNT(*)
	INTO Cantidad
	FROM usuario_seguido as useg
	JOIN  usuario as usu on usu.Id = useg.Id_Seguido
	WHERE usu.Usuario = Nombre_Usuario;
END//
DELIMITER ;

-- Dumping structure for procedure dubmash.CantidadSeguidos
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `CantidadSeguidos`(
	IN `Nombre_Usuario` VARCHAR(50)
,
	OUT `Cantidad` INT


)
BEGIN
	SELECT 
		COUNT(*)
	INTO Cantidad 
	FROM usuario_seguido as useg
	JOIN  usuario as usu on usu.Id = useg.Id_Usuario
	WHERE usu.Usuario = Nombre_Usuario;
END//
DELIMITER ;

-- Dumping structure for table dubmash.comentario
CREATE TABLE IF NOT EXISTS `comentario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Comentario` varchar(500) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `Id_Meme` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Comentario_Id_Usuario_FK` (`Id_Usuario`),
  KEY `Comentario_Id_Meme_FK` (`Id_Meme`),
  CONSTRAINT `Comentario_Id_Meme_FK` FOREIGN KEY (`Id_Meme`) REFERENCES `publicacion` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Comentario_Id_Usuario_FK` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table dubmash.comentario: ~5 rows (approximately)
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` (`Id`, `Comentario`, `Id_Usuario`, `Id_Meme`) VALUES
	(1, 'comentario de prueba 1', 1, 2),
	(3, 'comentario de prueba 2', 1, 2),
	(4, 'comentario de prueba 3', 9, 2),
	(5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 9, 1),
	(6, 'NOOOOOOO', 1, 3);
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;

-- Dumping structure for procedure dubmash.DejarSeguirTema
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `DejarSeguirTema`(
	IN `Id_Usuario_ses` INT,
	IN `Id_Tema_seg` INT
)
BEGIN
	DELETE FROM tema_seguido
	WHERE Id_Usuario = Id_Usuario_ses
	AND Id_Tema = Id_Tema_seg;
END//
DELIMITER ;

-- Dumping structure for procedure dubmash.DejarSeguirUsuario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `DejarSeguirUsuario`(
	IN `Id_Usuario_ses` INT,
	IN `Id_Usuario_seg` INT
)
BEGIN
	DELETE 
		FROM usuario_seguido
	WHERE
		Id_Usuario = Id_Usuario_ses
	AND
		Id_Seguido = Id_Usuario_seg;
END//
DELIMITER ;

-- Dumping structure for procedure dubmash.EditarPerfil
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditarPerfil`(
	IN `Id_Usuario_ses` INT,
	IN `Color_ses` CHAR(7),
	IN `Imagen_ses` VARCHAR(255)


)
BEGIN
	UPDATE usuario
	SET
		usuario.Imagen = Imagen_ses,
		usuario.Color = Color_ses
	WHERE
		usuario.Id = Id_Usuario_ses;
END//
DELIMITER ;

-- Dumping structure for table dubmash.guardado
CREATE TABLE IF NOT EXISTS `guardado` (
  `Id_Usuario` int(11) NOT NULL,
  `Id_Meme` int(11) NOT NULL,
  PRIMARY KEY (`Id_Usuario`,`Id_Meme`),
  KEY `Guardado_Id_Meme_FK` (`Id_Meme`),
  CONSTRAINT `Guardado_Id_Meme_FK` FOREIGN KEY (`Id_Meme`) REFERENCES `publicacion` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Guardado_Id_Usuario_FK` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table dubmash.guardado: ~0 rows (approximately)
/*!40000 ALTER TABLE `guardado` DISABLE KEYS */;
/*!40000 ALTER TABLE `guardado` ENABLE KEYS */;

-- Dumping structure for table dubmash.likes
CREATE TABLE IF NOT EXISTS `likes` (
  `Id_Usuario` int(11) NOT NULL,
  `Id_Meme` int(11) NOT NULL,
  PRIMARY KEY (`Id_Usuario`,`Id_Meme`),
  KEY `Like_Id_Meme_FK` (`Id_Meme`),
  CONSTRAINT `Like_Id_Meme_FK` FOREIGN KEY (`Id_Meme`) REFERENCES `publicacion` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Like_Id_Usuario_FK` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table dubmash.likes: ~2 rows (approximately)
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` (`Id_Usuario`, `Id_Meme`) VALUES
	(1, 3),
	(9, 1),
	(9, 3);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;

-- Dumping structure for table dubmash.publicacion
CREATE TABLE IF NOT EXISTS `publicacion` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(50) NOT NULL,
  `Imagen` varchar(255) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `Id_Tema` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Publicacion_Id_Tema_FK` (`Id_Tema`),
  KEY `Publicacion_Id_Usuario_FK` (`Id_Usuario`),
  CONSTRAINT `Publicacion_Id_Tema_FK` FOREIGN KEY (`Id_Tema`) REFERENCES `tema` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Publicacion_Id_Usuario_FK` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table dubmash.publicacion: ~2 rows (approximately)
/*!40000 ALTER TABLE `publicacion` DISABLE KEYS */;
INSERT INTO `publicacion` (`Id`, `Titulo`, `Imagen`, `Id_Usuario`, `Id_Tema`) VALUES
	(1, 'MEME PRUEBA', 'https://i.redd.it/2xige1iiiz971.jpg', 1, 5),
	(2, 'MEME PRUEBA 2', 'https://i.redd.it/lcibd5ez91a71.jpg', 1, 6),
	(3, 'ITS COMMING HOME', 'https://i.redd.it/17uiao4ha6a71.jpg', 12, 10);
/*!40000 ALTER TABLE `publicacion` ENABLE KEYS */;

-- Dumping structure for procedure dubmash.SeguirTema
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SeguirTema`(
	IN `Id_Usuario_ses` INT,
	IN `Id_Tema_seg` INT
)
BEGIN
	INSERT INTO tema_seguido
	VALUES(Id_Usuario_ses, Id_Tema_seg);
END//
DELIMITER ;

-- Dumping structure for procedure dubmash.SeguirUsuario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SeguirUsuario`(
	IN `Id_Usuario_ses` INT,
	IN `Id_Usuario_seg` INT
)
BEGIN
	INSERT INTO usuario_seguido
		VALUES(Id_Usuario_ses, Id_Usuario_seg);
END//
DELIMITER ;

-- Dumping structure for table dubmash.tema
CREATE TABLE IF NOT EXISTS `tema` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `URL_Imagen` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Nombre` (`Nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Dumping data for table dubmash.tema: ~12 rows (approximately)
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
INSERT INTO `tema` (`Id`, `Nombre`, `URL_Imagen`) VALUES
	(1, 'Gracioso', 'https://miscmedia-9gag-fun.9cache.com/images/thumbnail-facebook/1557376304.186_U5U7u5_100x100wp.webp'),
	(2, 'NSFW', 'https://miscmedia-9gag-fun.9cache.com/images/thumbnail-facebook/1557297099.4728_VeSAvU_100x100wp.webp'),
	(3, 'WTF', 'https://miscmedia-9gag-fun.9cache.com/images/thumbnail-facebook/1557310702.1267_UgysAp_100x100wp.webp'),
	(4, 'Anime', 'https://miscmedia-9gag-fun.9cache.com/images/thumbnail-facebook/1557310356.2625_y8EVa2_100x100wp.webp'),
	(5, 'Random', 'https://miscmedia-9gag-fun.9cache.com/images/thumbnail-facebook/1481541784.8502_e8ARAR_100x100wp.webp'),
	(6, 'Animales', 'https://miscmedia-9gag-fun.9cache.com/images/thumbnail-facebook/1557391851.3248_Za4UdA_100x100wp.webp'),
	(7, 'Caricaturas', 'https://miscmedia-9gag-fun.9cache.com/images/thumbnail-facebook/1557399125.5971_HYGaTE_100x100wp.webp'),
	(8, 'Politicos', 'https://miscmedia-9gag-fun.9cache.com/images/thumbnail-facebook/1557286889.2504_mEVy2A_100x100wp.webp'),
	(9, 'Deportes', 'https://miscmedia-9gag-fun.9cache.com/images/thumbnail-facebook/1557286774.0983_eGARyH_100x100wp.webp'),
	(10, 'Humor Negro', 'https://miscmedia-9gag-fun.9cache.com/images/thumbnail-facebook/1557453152.4514_U2asE8_100x100wp.webp'),
	(11, 'Videojuegos', 'https://miscmedia-9gag-fun.9cache.com/images/thumbnail-facebook/1557286928.6604_uTYgug_100x100wp.webp'),
	(12, 'Peliculas', 'https://miscmedia-9gag-fun.9cache.com/images/thumbnail-facebook/1557216707.0007_ESESyM_100x100wp.webp'),
	(13, 'Ciencia y Tecnologia', 'https://miscmedia-9gag-fun.9cache.com/images/thumbnail-facebook/1557286779.394_WYru9a_100x100wp.webp');
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;

-- Dumping structure for table dubmash.tema_seguido
CREATE TABLE IF NOT EXISTS `tema_seguido` (
  `Id_Usuario` int(11) NOT NULL,
  `Id_Tema` int(11) NOT NULL,
  PRIMARY KEY (`Id_Usuario`,`Id_Tema`),
  KEY `Tema_Seguido_Id_Tema_FK` (`Id_Tema`),
  CONSTRAINT `Tema_Seguido_Id_Tema_FK` FOREIGN KEY (`Id_Tema`) REFERENCES `tema` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Tema_Seguido_Id_Usuario_FK` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table dubmash.tema_seguido: ~5 rows (approximately)
/*!40000 ALTER TABLE `tema_seguido` DISABLE KEYS */;
INSERT INTO `tema_seguido` (`Id_Usuario`, `Id_Tema`) VALUES
	(1, 2),
	(1, 3),
	(1, 5),
	(1, 11),
	(15, 6);
/*!40000 ALTER TABLE `tema_seguido` ENABLE KEYS */;

-- Dumping structure for table dubmash.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Usuario` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Contraseña` varchar(50) NOT NULL,
  `Nacimiento` date NOT NULL,
  `Color` char(7) NOT NULL DEFAULT '#0000FF',
  `Imagen` varchar(255) NOT NULL DEFAULT 'https://raw.githubusercontent.com/Jcanotorr06/RedSocial-Memes/main/media/default_duck.jpg',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Usuario` (`Usuario`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table dubmash.usuario: ~9 rows (approximately)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`Id`, `Nombre`, `Usuario`, `Email`, `Contraseña`, `Nacimiento`, `Color`, `Imagen`) VALUES
	(1, 'Administrador', 'admin', 'admin@dubmash.com', 'password', '1900-12-31', '#9900FF', 'https://static-cdn.jtvnw.net/jtv_user_pictures/997615a1-351b-425f-9ca9-380b87fa9d6d-profile_image-600x600.png'),
	(8, 'Prueba 7', 'prueba7', 'prueba7@dubmash.com', 'password', '2001-06-20', '#0000FF', 'https://raw.githubusercontent.com/Jcanotorr06/RedSocial-Memes/main/media/default_duck.jpg'),
	(9, 'Prueba8', 'prueba8', 'prueba8@dubmash.com', 'password', '2001-06-20', '#FF6F00', 'https://mir-s3-cdn-cf.behance.net/project_modules/disp/dd642260673917.5a5603488c6f3.jpg'),
	(10, 'Prueba9', 'prueba9', 'prueba9@dubmash.com', 'password', '2001-06-20', '#0000FF', 'https://raw.githubusercontent.com/Jcanotorr06/RedSocial-Memes/main/media/default_duck.jpg'),
	(11, 'Prueba10', 'prueba10', 'prueba10@dubmash.com', 'password', '2001-06-20', '#C25BB6', 'https://cdn.3ind.com/telegram-tg143840.jpg'),
	(12, 'Prueba11', 'prueba11', 'prueba11@dubmash.com', 'password', '2001-06-20', '#B48AD6', 'https://pbs.twimg.com/media/Dm1ncIyXsAAdIkq?format=jpg&name=900x900'),
	(13, 'Prueba12', 'prueba12', 'prueba12@dubmash.com', 'password', '2001-06-20', '#0000FF', 'https://raw.githubusercontent.com/Jcanotorr06/RedSocial-Memes/main/media/default_duck.jpg'),
	(14, 'Prueba13', 'prueba13', 'prueba13@dubmash.com', 'password', '2001-06-20', '#0000FF', 'https://raw.githubusercontent.com/Jcanotorr06/RedSocial-Memes/main/media/default_duck.jpg'),
	(15, 'Prueba14', 'prueba14', 'prueba14@dubmash.com', 'password', '2001-06-20', '#0000FF', 'https://raw.githubusercontent.com/Jcanotorr06/RedSocial-Memes/main/media/default_duck.jpg'),
	(16, 'Prueba15', 'prueba15', 'prueba15@dubmash.com', 'password', '2001-06-20', '#0000FF', 'https://raw.githubusercontent.com/Jcanotorr06/RedSocial-Memes/main/media/default_duck.jpg');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Dumping structure for table dubmash.usuario_seguido
CREATE TABLE IF NOT EXISTS `usuario_seguido` (
  `Id_Usuario` int(11) NOT NULL,
  `Id_Seguido` int(11) NOT NULL,
  PRIMARY KEY (`Id_Usuario`,`Id_Seguido`),
  KEY `Usuario_Seguido_Id_Seguido_FK` (`Id_Seguido`),
  CONSTRAINT `Usuario_Seguido_Id_Seguido_FK` FOREIGN KEY (`Id_Seguido`) REFERENCES `usuario` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Usuario_Seguido_Id_Usuario_FK` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table dubmash.usuario_seguido: ~4 rows (approximately)
/*!40000 ALTER TABLE `usuario_seguido` DISABLE KEYS */;
INSERT INTO `usuario_seguido` (`Id_Usuario`, `Id_Seguido`) VALUES
	(1, 8),
	(1, 9),
	(1, 13),
	(9, 1);
/*!40000 ALTER TABLE `usuario_seguido` ENABLE KEYS */;

-- Dumping structure for procedure dubmash.ValidarInicio
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarInicio`(
	IN `nombre_usuario` VARCHAR(50),
	IN `contraseña_usuario` VARCHAR(50)

)
    READS SQL DATA
    COMMENT 'Valida el inicio de sesion'
BEGIN
	SELECT
		*
	FROM usuario
	WHERE Usuario = nombre_usuario AND Contraseña = contraseña_usuario;
END//
DELIMITER ;

-- Dumping structure for procedure dubmash.ValidarTemaSeguido
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarTemaSeguido`(
	IN `Id_Usuario_ses` INT,
	IN `Id_Tema_seg` INT
)
BEGIN
	SELECT COUNT(*) AS rowcount
	FROM tema_seguido
	WHERE Id_Usuario = Id_Usuario_ses
	AND Id_Tema = Id_Tema_seg;
END//
DELIMITER ;

-- Dumping structure for procedure dubmash.ValidarUsuarioSeguido
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidarUsuarioSeguido`(
	IN `Id_Usuario_ses` INT,
	IN `Id_Usuario_seg` INT

)
BEGIN
	SELECT
		COUNT(*) as rowcount
	FROM usuario_seguido as useg
	WHERE useg.Id_Usuario = Id_Usuario_ses
	AND useg.Id_Seguido = Id_Usuario_seg;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
