
DROP DATABASE IF EXISTS notas_de_texto_db;
CREATE DATABASE notas_de_texto_db;
USE notas_de_texto_db;

-- Table structure for table `categorias`

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;


LOCK TABLES `categorias` WRITE;

INSERT INTO `categorias` VALUES (3,'Arte'),(8,'Ciencia'),(4,'Cocina'),(1,'Deportes'),(9,'Educación'),(6,'Entretenimiento'),(5,'Música'),(10,'Salud'),(7,'Tecnología'),(2,'Viajes');

UNLOCK TABLES;

-- Table structure for table `usuarios`

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;


LOCK TABLES `usuarios` WRITE;

INSERT INTO `usuarios` VALUES (1,'Jessica','Cardeño','jessicacarde@yahoo.es'),(2,'Édison','Higuita','edi1234h@hotmail.com'),(3,'Juana','Pérez','juanisperez@gmail.com'),(4,'Mario','Baracus','mariobara@yahoo.es'),(5,'Anibal','Osorio','osorioanibal@outlook.com'),(6,'Lucia','Cifuentes','lucicifu56@gmail.com'),(7,'Pedro','Arrieta','pedroarri78@hotmail.es'),(8,'Juan','Arboleda','juanarbol123@yahoo.com'),(9,'Margarita','Bolaños','margara789@outlook.com'),(10,'Cesar','Aristizabal','aristicesar28@gmail.com');

UNLOCK TABLES;

-- Table structure for table `notas`

DROP TABLE IF EXISTS `notas`;

CREATE TABLE `notas` (
  `idNota` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `fecha_Creacion` date NOT NULL,
  `fecha_Ultima_Modificacion` date NOT NULL,
  `descripcion` text NOT NULL,
  `valido_Eliminar` tinyint(1) NOT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idNota`),
  KEY `idUsuario_idx` (`idUsuario`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;


LOCK TABLES `notas` WRITE;

INSERT INTO `notas` VALUES (1,'Ac odio tempor orci dapibus','2012-06-15','2020-02-08','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eros in cursus turpis massa tincidunt. Erat imperdiet sed euismod nisi. Ipsum faucibus vitae aliquet nec ullamcorper sit amet. Auctor augue mauris augue neque gravida in fermentum et.',1,3),(2,'Nunc id cursus metus aliquam','2021-10-09','2022-09-20','Etiam erat velit scelerisque in dictum non. Bibendum ut tristique et egestas quis ipsum suspendisse ultrices. Egestas tellus rutrum tellus pellentesque. Leo in vitae turpis massa. Risus quis varius quam quisque id diam vel quam. Enim nunc faucibus a pellentesque sit amet porttitor.',1,5),(3,'dictum fusce ut placerat orci','2001-04-17','2013-09-03','Adipiscing diam donec adipiscing tristique risus nec. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Hac habitasse platea dictumst vestibulum rhoncus est pellentesque elit ullamcorper. Sed blandit libero volutpat sed cras.',1,9),(4,'Sapien et ligula ullamcorper malesuada','2009-10-10','2021-11-11','Sit amet venenatis urna cursus eget nunc. Enim nulla aliquet porttitor lacus luctus accumsan tortor. Amet est placerat in egestas erat imperdiet sed euismod. Suspendisse potenti nullam ac tortor.',1,2),(5,'Cras adipiscing enim eu turpis','2022-01-01','2022-04-01','Congue quisque egestas diam in arcu cursus euismod quis viverra. Lorem ipsum dolor sit amet consectetur adipiscing. Eget sit amet tellus cras. Porta nibh venenatis cras sed felis eget. Sed viverra ipsum nunc aliquet bibendum enim.',1,4),(6,'Amet tellus cras adipiscing enim','2017-12-05','2018-10-08','Maecenas ultricies mi eget mauris pharetra et. Dignissim enim sit amet venenatis urna cursus eget nunc scelerisque. Eget nullam non nisi est. Id volutpat lacus laoreet non curabitur gravida arcu ac.',1,7),(7,'Enim neque volutpat ac tincidunt','2019-05-27','2020-03-20','Id semper risus in hendrerit gravida rutrum quisque. At urna condimentum mattis pellentesque id. Sit amet consectetur adipiscing elit ut aliquam.',1,8),(8,'Egestas erat imperdiet sed euismod','2021-05-30','2021-11-25','Mi quis hendrerit dolor magna eget est lorem. Fermentum dui faucibus in ornare quam. Vel pretium lectus quam id leo in vitae turpis massa. Dui id ornare arcu odio ut sem nulla. Sed nisi lacus sed viverra.',1,6),(9,'Commodo quis imperdiet massa tincidunt','2017-09-28','2019-07-08','Vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt lobortis. Varius morbi enim nunc faucibus a pellentesque sit amet porttitor.',1,1),(10,'Neque convallis a cras semper','2016-06-20','2018-07-12','Ullamcorper a lacus vestibulum sed arcu non odio. Sed viverra tellus in hac habitasse. Nunc sed blandit libero volutpat. Massa tincidunt dui ut ornare lectus sit. Eu tincidunt tortor aliquam nulla facilisi cras fermentum odio.',1,3);

UNLOCK TABLES;

-- Table structure for table `nota_categoria`

DROP TABLE IF EXISTS `nota_categoria`;

CREATE TABLE `nota_categoria` (
  `idNota_Categoria` int NOT NULL AUTO_INCREMENT,
  `idNota` int NOT NULL,
  `idCategoria` int NOT NULL,
  PRIMARY KEY (`idNota_Categoria`),
  KEY `idNota_idx` (`idNota`),
  KEY `idCategoria_idx` (`idCategoria`),
  CONSTRAINT `idCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`),
  CONSTRAINT `idNota` FOREIGN KEY (`idNota`) REFERENCES `notas` (`idNota`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;


LOCK TABLES `nota_categoria` WRITE;

INSERT INTO `nota_categoria` VALUES (1,6,8),(2,2,5),(3,9,7),(4,1,6),(5,10,4),(6,2,10),(7,3,6),(8,5,5),(9,4,1),(10,2,7);

UNLOCK TABLES;




