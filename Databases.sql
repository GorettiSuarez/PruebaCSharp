-- MySQL dump 10.13  Distrib 5.7.21, for Win32 (AMD64)
--
-- Host: localhost    Database: clientsdb
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `dni` varchar(45) NOT NULL,
  `photo` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idClients_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Table for clients ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (2,'Pepe','Cabrera','3456789X','https://www.dropbox.com/s/1fgbioxa610ve2h/cat-pet-animal-domestic-104827.jpeg?dl=0'),(3,'Dani','Perez','000000X','https://www.dropbox.com/s/t3eg18wed4bsjnp/pexels-photo-416160.jpeg?dl=0'),(5,'nombre22','apellido22','4244444W','https://www.dropbox.com/s/t3eg18wed4bsjnp/pexels-photo-416160.jpeg?dl=0'),(6,'kk','Sanchez','34dd6789X','https://www.dropbox.com/s/t3eg18wed4bsjnp/pexels-photo-416160.jpeg?dl=0'),(7,'ELDELAIMAGEN','Sanchez','34dd6789X','https://www.dropbox.com/s/jaxpkrmhd5zqyqq/kitty-cat-kitten-pet-45201.jpeg?dl=0'),(8,'hola','Sanchez','34dd6789X','https://www.anipedia.net/imagenes/donde-viven-los-gatos.jpg'),(10,'hola','Sanchez','34dd6789X','https://www.anipedia.net/imagenes/donde-viven-los-gatos.jpg'),(11,'hola','Sanchez','34dd6789X','https://www.anipedia.net/imagenes/donde-viven-los-gatos.jpg'),(12,'hola','Sanchez','34dd6789X','https://www.anipedia.net/imagenes/donde-viven-los-gatos.jpg'),(13,'JEJE','Sanchez','34dd6789X','https://www.anipedia.net/imagenes/donde-viven-los-gatos.jpg'),(14,'JEJE','Sanchez','34dd6789X','https://www.anipedia.net/imagenes/donde-viven-los-gatos.jpg'),(15,'JEJE','Sanchez','34dd6789X','https://www.anipedia.net/imagenes/donde-viven-los-gatos.jpg'),(16,'JEJE','Sanchez','34dd6789X','https://www.anipedia.net/imagenes/donde-viven-los-gatos.jpg');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `idorders` int(11) NOT NULL AUTO_INCREMENT,
  `idclient` int(11) NOT NULL,
  `idproduct` int(11) NOT NULL,
  PRIMARY KEY (`idorders`),
  KEY `idclient_idx` (`idclient`),
  KEY `idproduct_idx` (`idproduct`),
  CONSTRAINT `idclient` FOREIGN KEY (`idclient`) REFERENCES `clients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idproduct` FOREIGN KEY (`idproduct`) REFERENCES `products` (`idproducts`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (10,2,2),(11,3,1),(12,2,2),(14,2,2),(15,2,2),(16,3,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `idproducts` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idproducts`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'nada'),(2,'hola'),(3,'cereza'),(4,'manzana'),(5,'pera');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-16 17:38:24
-- MySQL dump 10.13  Distrib 5.7.21, for Win32 (AMD64)
--
-- Host: localhost    Database: apiusersdb
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `__migrationhistory`
--

DROP TABLE IF EXISTS `__migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__migrationhistory` (
  `MigrationId` varchar(100) NOT NULL,
  `ContextKey` varchar(200) NOT NULL,
  `Model` longblob NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`,`ContextKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__migrationhistory`
--

LOCK TABLES `__migrationhistory` WRITE;
/*!40000 ALTER TABLE `__migrationhistory` DISABLE KEYS */;
INSERT INTO `__migrationhistory` VALUES ('201803151149110_InitialCreate','WebApplication3.Migrations.Configuration','‹\0\0\0\0\0\0\Ý\\[o\ã¶~?Àù‚‹\Ô\Ê\å\ìžm`w‘:\Éip6¬³m\ß´D;\ÂJ¤*Qi‚¢¿¬ýIýJ”,ñ¢‹­\Ø\Îb…E¿‡\äp8\Ì\ßþ5~ÿ\Ö#ŽŸ’‰}4:´-L\\\êùd9±S¶øöýþûÿk|\á…O\ÖO\Ý	§ƒ–$™\ØŒE§Ž“¸8D\É(ôÝ˜&tÁF.\r\äQ\çøðð;\ç\è\ÈÁ\0a–e?¦„ù!\Î>\àsJ‰‹#–¢\àšz8HD9\Ô\Ì2T\ë…8‰‹\'ö\Ïx~E\ï\"¢œŒò¶uø¤™\á`a[ˆ\Ê2‚\ÓO	ž±˜’\å,‚\Ü?G\è(H°\è\ÃéŠ¼kwywœU\Ã\ÊMFÃž€G\'B?Ž\Ü|--Û¥þ@ƒ iö\Ì{iqb_y8+úHP€\Ìðt\ZÄœxb_—,Î’\è³Q\Ñp”C^\Æ\0÷¿ŒªˆV\çv¥=ù¿kš,ñ„\à”\Å(8°\î\Ò9õÿñó=ý‚\É\ä\äh¾8y÷\æ-òN\ÞþŸ¼©öú\ntµ(º‹i„c\r/\ÊþÛ–So\ç\È\r\Ëf•6¹VÀ–`j\Ø\Ö5zú€É’=À¤9~g[—þöŠa\\Ÿˆ3	\Z±8…Ï›4\Ð<Àe½\ÓÈ“ÿ\ßÀõø\Í\ÛA¸Þ G™\r½\Ä&Nó\ê#²\Ú\äÁò\éU\ïÏ‚\ì2¦!ÿ®\ÛW^ûyF\Ó\Øå¡F’{/1«K7vV\Æ\ÛÉ¤9\Ôðf] \î¿isIUóÖ’ò­3\nÛž\r…¼/Ë·³\ÅU¶ ®‘&ƒ\ÓoX#	\áÀ’\èV&t\ÔÕ„t\ík^/B\ä,‰¸€G²ð\ã—½ü‚\"\Ò[\æ;”$°\"x?¢\ä¡Atø9€\è3\ì¦1êŒ¡0zqnw”\à›4œsû\ß¯Á†\æþ7z‰\\F\ã\Â[mŒ÷º_h\Ê.ˆwŽþ\Ä\Ü\Þûaw€A\Ä9s]œ$—`\ÌØ›Rp¸À+\ÂNŽ{\ÃñEj\×.\É4@~¨÷I¤\åôsAºòKôŠob \Óù\'M¢~ KŸtµ 5‹šS´Š*\ÈúŠ\ÊÁºI*(Í‚f­r\æTƒy|\Ù\r\ïòe°û\ïóm¶y›Ö‚Š\Zg°B\âÿa‚cXÆ¼;\ÄŽ\Éjº¬»p²\á\ãL_|o\Ê8ý„‚thVkÍ†l~6d°û?21¡ø\Ñ÷¸W\Ò\á T|\'zý«}\ÎI’m{:Ôº¹m\æ\ÛYL\Ó\å,I¨\ëg³@Œºü\à\ÃY\íÑŒ¼7rD:†\îó-J o¶lT·\ä˜a\ë\Ì\ÍC„S”¸\ÈS\ÕòzV\ì¨\ZÁV‘‘ºp\ß(<Á\Òq\Ì!~J`¦ú„©\Ó\Â\'®¡ UKRËŽ[\ï{\ÉC®9\Ç&œa«&º0\×B¸\0%iP\Ú44v*\×lˆ¯\Õ4\æm.\ìjÜ•ø\ÄVl²\Åw6Ø¥ð\ß^\Ä0›5¶\ãlVIŒA½]¨8«t5\0ù\à²o*˜*\\ª­h]c;0ÐºJ^\æGÔ®\ã/W÷\Í<\ë\å\ío\ë\êÚm\Öô±g¦™ûžÐ†A«\æy>\ç•ø‰ig §8Ÿ%\ÂÕ•M„ƒ\Ï0«‡lVþ®\ÖušAd#j\\Z¨¸T€”	\ÕC¸\"–\×(ð\"zÀq·FX±öK°P±«×¢Bó\å©lœNe\ÏJkPŒ¼\Óa¡‚£1yñªw¼ƒRLqYU1]|\á>\Þp¥cb0\Z\Ô\â¹\Z”Ttfp-¦Ù®%C\Ö\Ç%\ÛHK’ûd\ÐRÑ™Áµ$l´]I\Z§ ‡[°‘Š\ê[ø@“­ˆt”»MY7vòŒ)Q0v©U\ãkE>YVR­D‰5\Ëó¬¦\ß\Îú\'…9†\ã&š¤RÚ’£1Zb©Xƒ¤—~œ°s\Ä\Ðñ8\Ï\Ô2\í\ÞjXþ–\Õ\íS\Äb(¨ùï¼…\á¿¶ßª‰À¹„^†Ü«\ÉB\é\Z\Ð7·xú\nP¬‰\ÞOi†\Ä\ìd™[\çwx\Õöy‰Š0v$ù\'JÑ˜\â\ê\Ö\Õ\ßipÔ‰1\à@•~\Ìúƒe†0©¼ðB«J7y¦f”\"PUE1¯v6x&‡¦÷€\ÉþbÿñjEx™ù%’Tª\0¢¨\'F%\ÏA«\ÔuG­§¢T1\ë5\Ý¥|“*¤T\ÕC\ÊjVIM\Èj\ÅZx\ê)ºsPóHª\èjmwdMFIZS½¶Ff¹®;ª&\é¤\n¬©îŽ½\Ê@‘\Ò=\ÞÁŒ§˜¶°ü°»\ÙfÀx™Uq˜-°r§_ª÷\Ä·ö\n˜(\ßK‹2žø6²¨<Î±™E0\Ì+P\íF¼¾\05^\ã›1k\×ÜµE¾\éšßŒ\×\Ïn_\Ô:”CŸLRr/\Ò!o,\\\íl”XNb[…\Z\'öõó\ì\×`\Ä\ëG\Ù\Ïi\àc¾ž×ˆøœ°<·\Ã~3ú¯ôFg\Þ\Ë8I\âš«\é\ÑL}Ì¶¥EQ\ì> XÍ™\Ø\àM\É\nT	G_?M\ìß³V§YdƒÿÊŠ¬«\äñM¡\â>N±õ‡š:LŽ}ókO_Dt\×\ê\Õ/Ÿó¦\Öm\æ\Ô:”t¹\Î\×\ßIô’&oº4k¿žx½ªö$A‹*Mˆõ_ \Ì)\ry~P,»‡\ê\'–öuÁº`š\Ç@\r£4\ÓÃ€µÀŒ¯<ødÙ«€»»~þ°ö°o\çõoÖ’\Ôø`À\'l\ã\ç\ÝW¢¢\åw\Í\Ñh«R¦\ç\Öt\ër/w½=)Y\Ù\ëNz5\éº\Ò9\Õk\Ø\Ã+KGl[\Ôd†½Kƒ~ñ\ã}\É*^\å{\ì6™x›ù\Ã\rwC_U\Úð$ºiwvŸ¼m[3q÷<Ã²_\nðž›H\ç\Ú}¢ï¶\Í\ß\Ýsc\ë•Î»g¶¶«ýsÇ–\Öy\Ýyr®šgd¸Œ\ÑÛ’oóˆ9ó\çŒ ÷(ó7“úl¯¦L\Õ†+3Ssš™\ÌX™8\n_…¢™m¿¾Š\r¿±³‚¦™­!9³‰·XÿyšfÞ†”\Ç]¤\rk“u©\Ü-\ëXS&\ÔkJ®õ¤%+½\Ígm¼YMYÁƒ(¥6{—Ã¯\'	x•9uz$ýª÷¼°wVþ\ä\"\ìß‰¿\\Að?ÀH°[\Û5Kš+² \Å\æ-ITHškÌ[\êY\ÌürTó\Èrö\è;\Ùñ+Ž9ö®\ÈmÊ¢”A—q8j/\î4ñ\Ï2›\ë2o#þ•\Ñ\Ó\çú[òC\ê^)÷¥&&d€\àÞ…ˆ\ãò±d<ž»|.‘n(\é$\ÔW:E÷8Œ\0Kn\É=\âudóû€—\È}^E\0M \íQWûø\ÜG\Ë…‰ÀXµ‡O°a/|úþ¬œ¹yT\0\0','6.1.3-40302');
/*!40000 ALTER TABLE `__migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetroles`
--

DROP TABLE IF EXISTS `aspnetroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetroles` (
  `Id` varchar(128) NOT NULL,
  `Name` varchar(256) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetroles`
--

LOCK TABLES `aspnetroles` WRITE;
/*!40000 ALTER TABLE `aspnetroles` DISABLE KEYS */;
INSERT INTO `aspnetroles` VALUES ('1','Admin'),('2','Common'),('3','Restricted');
/*!40000 ALTER TABLE `aspnetroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserclaims`
--

DROP TABLE IF EXISTS `aspnetuserclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(128) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `ApplicationUser_Claims` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserclaims`
--

LOCK TABLES `aspnetuserclaims` WRITE;
/*!40000 ALTER TABLE `aspnetuserclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserlogins`
--

DROP TABLE IF EXISTS `aspnetuserlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(128) NOT NULL,
  `ProviderKey` varchar(128) NOT NULL,
  `UserId` varchar(128) NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`,`UserId`),
  KEY `ApplicationUser_Logins` (`UserId`),
  CONSTRAINT `ApplicationUser_Logins` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserlogins`
--

LOCK TABLES `aspnetuserlogins` WRITE;
/*!40000 ALTER TABLE `aspnetuserlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetuserlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetuserroles`
--

DROP TABLE IF EXISTS `aspnetuserroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(128) NOT NULL,
  `RoleId` varchar(128) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IdentityRole_Users` (`RoleId`),
  CONSTRAINT `ApplicationUser_Roles` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `IdentityRole_Users` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetuserroles`
--

LOCK TABLES `aspnetuserroles` WRITE;
/*!40000 ALTER TABLE `aspnetuserroles` DISABLE KEYS */;
INSERT INTO `aspnetuserroles` VALUES ('7076ce9c-89e9-4d29-be96-b3dc7c5ae943','1'),('ce78871d-123f-487e-9038-8dc20f81052d','1'),('65331424-5b8b-4af9-a9e3-27db67a722cb','2'),('be8d839c-49d4-49f2-a878-b0f1f86b9a6e','2');
/*!40000 ALTER TABLE `aspnetuserroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(128) NOT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext,
  `SecurityStamp` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEndDateUtc` datetime DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `UserName` varchar(256) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES ('65331424-5b8b-4af9-a9e3-27db67a722cb','test22@test.com',0,'ADREbED2rsJLwpRiKApafhH5WL/9XM7blxgKMCK3y7sngT+gfD6+QQWvETbilfmxAg==','7581eda1-dc27-4e84-8212-5e361d6a4927',NULL,0,0,NULL,0,0,'test22@test.com'),('7076ce9c-89e9-4d29-be96-b3dc7c5ae943','testi@test.com',0,'ANZzlyq7ODU0pVbJzRYc6grS/9LeuSgRPYrsSXhXW23dSdS1Ce7DAPnkxNDV4wVaBA==','55c9456d-839e-4d84-9d4f-36fea7f22057',NULL,0,0,NULL,0,0,'testi@test.com'),('be8d839c-49d4-49f2-a878-b0f1f86b9a6e','test@test.cbom',0,'AEdyXt4+GUeOPbdLih1A4wuMxu2Qycza8YL5HiBSBzxmEZWoUBX04k00IyM3CEGaoA==','d55ebd2f-d435-472f-8c4c-44dc1d7ea0a2',NULL,0,0,NULL,0,0,'test@test.cbom'),('ce78871d-123f-487e-9038-8dc20f81052d','yo@test.com',0,'AG2p6t+05rykdwg7EH7cXaGfZWKrIeLRkVQDHcSdDxccrP/raiGoDb/P31h5GcmIyA==','1fa31811-c7a9-422c-a6d4-e71895b47688',NULL,0,0,NULL,0,0,'yo@test.com'),('f06482f6-302b-439a-8e1a-950b3319cd99','testss@test.cbom',0,'ALI1bzTjR3cNyWJ9YYL0DoWvjwCerAUmdWx5qBZSRHqY5BOoJt3joEYu7mpNPXP1SA==','8128be45-9a43-417f-85be-4c2c8004abbb',NULL,0,0,NULL,0,0,'testss@test.cbom');
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_applications`
--

DROP TABLE IF EXISTS `my_aspnet_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_applications`
--

LOCK TABLES `my_aspnet_applications` WRITE;
/*!40000 ALTER TABLE `my_aspnet_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_aspnet_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_membership`
--

DROP TABLE IF EXISTS `my_aspnet_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_membership` (
  `userId` int(11) NOT NULL,
  `Email` varchar(128) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `Password` varchar(128) NOT NULL,
  `PasswordKey` char(32) DEFAULT NULL,
  `PasswordFormat` tinyint(4) DEFAULT NULL,
  `PasswordQuestion` varchar(255) DEFAULT NULL,
  `PasswordAnswer` varchar(255) DEFAULT NULL,
  `IsApproved` tinyint(1) DEFAULT NULL,
  `LastActivityDate` datetime DEFAULT NULL,
  `LastLoginDate` datetime DEFAULT NULL,
  `LastPasswordChangedDate` datetime DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `IsLockedOut` tinyint(1) DEFAULT NULL,
  `LastLockedOutDate` datetime DEFAULT NULL,
  `FailedPasswordAttemptCount` int(10) unsigned DEFAULT NULL,
  `FailedPasswordAttemptWindowStart` datetime DEFAULT NULL,
  `FailedPasswordAnswerAttemptCount` int(10) unsigned DEFAULT NULL,
  `FailedPasswordAnswerAttemptWindowStart` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='2';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_membership`
--

LOCK TABLES `my_aspnet_membership` WRITE;
/*!40000 ALTER TABLE `my_aspnet_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_aspnet_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_paths`
--

DROP TABLE IF EXISTS `my_aspnet_paths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_paths` (
  `applicationId` int(11) NOT NULL,
  `pathId` varchar(36) NOT NULL,
  `path` varchar(256) NOT NULL,
  `loweredPath` varchar(256) NOT NULL,
  PRIMARY KEY (`pathId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_paths`
--

LOCK TABLES `my_aspnet_paths` WRITE;
/*!40000 ALTER TABLE `my_aspnet_paths` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_aspnet_paths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_personalizationallusers`
--

DROP TABLE IF EXISTS `my_aspnet_personalizationallusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_personalizationallusers` (
  `pathId` varchar(36) NOT NULL,
  `pageSettings` blob NOT NULL,
  `lastUpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`pathId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_personalizationallusers`
--

LOCK TABLES `my_aspnet_personalizationallusers` WRITE;
/*!40000 ALTER TABLE `my_aspnet_personalizationallusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_aspnet_personalizationallusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_personalizationperuser`
--

DROP TABLE IF EXISTS `my_aspnet_personalizationperuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_personalizationperuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationId` int(11) NOT NULL,
  `pathId` varchar(36) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `pageSettings` blob NOT NULL,
  `lastUpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_personalizationperuser`
--

LOCK TABLES `my_aspnet_personalizationperuser` WRITE;
/*!40000 ALTER TABLE `my_aspnet_personalizationperuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_aspnet_personalizationperuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_profiles`
--

DROP TABLE IF EXISTS `my_aspnet_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_profiles` (
  `userId` int(11) NOT NULL,
  `valueindex` longtext,
  `stringdata` longtext,
  `binarydata` longblob,
  `lastUpdatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_profiles`
--

LOCK TABLES `my_aspnet_profiles` WRITE;
/*!40000 ALTER TABLE `my_aspnet_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_aspnet_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_roles`
--

DROP TABLE IF EXISTS `my_aspnet_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_roles`
--

LOCK TABLES `my_aspnet_roles` WRITE;
/*!40000 ALTER TABLE `my_aspnet_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_aspnet_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_schemaversion`
--

DROP TABLE IF EXISTS `my_aspnet_schemaversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_schemaversion` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_schemaversion`
--

LOCK TABLES `my_aspnet_schemaversion` WRITE;
/*!40000 ALTER TABLE `my_aspnet_schemaversion` DISABLE KEYS */;
INSERT INTO `my_aspnet_schemaversion` VALUES (10);
/*!40000 ALTER TABLE `my_aspnet_schemaversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_sessioncleanup`
--

DROP TABLE IF EXISTS `my_aspnet_sessioncleanup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_sessioncleanup` (
  `LastRun` datetime NOT NULL,
  `IntervalMinutes` int(11) NOT NULL,
  `ApplicationId` int(11) NOT NULL,
  PRIMARY KEY (`ApplicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_sessioncleanup`
--

LOCK TABLES `my_aspnet_sessioncleanup` WRITE;
/*!40000 ALTER TABLE `my_aspnet_sessioncleanup` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_aspnet_sessioncleanup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_sessions`
--

DROP TABLE IF EXISTS `my_aspnet_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_sessions` (
  `SessionId` varchar(191) NOT NULL,
  `ApplicationId` int(11) NOT NULL,
  `Created` datetime NOT NULL,
  `Expires` datetime NOT NULL,
  `LockDate` datetime NOT NULL,
  `LockId` int(11) NOT NULL,
  `Timeout` int(11) NOT NULL,
  `Locked` tinyint(1) NOT NULL,
  `SessionItems` longblob,
  `Flags` int(11) NOT NULL,
  PRIMARY KEY (`SessionId`,`ApplicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_sessions`
--

LOCK TABLES `my_aspnet_sessions` WRITE;
/*!40000 ALTER TABLE `my_aspnet_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_aspnet_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_sitemap`
--

DROP TABLE IF EXISTS `my_aspnet_sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_sitemap` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  `Url` varchar(512) DEFAULT NULL,
  `Roles` varchar(1000) DEFAULT NULL,
  `ParentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_sitemap`
--

LOCK TABLES `my_aspnet_sitemap` WRITE;
/*!40000 ALTER TABLE `my_aspnet_sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_aspnet_sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_users`
--

DROP TABLE IF EXISTS `my_aspnet_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationId` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `isAnonymous` tinyint(1) NOT NULL DEFAULT '1',
  `lastActivityDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_users`
--

LOCK TABLES `my_aspnet_users` WRITE;
/*!40000 ALTER TABLE `my_aspnet_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_aspnet_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_aspnet_usersinroles`
--

DROP TABLE IF EXISTS `my_aspnet_usersinroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_aspnet_usersinroles` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_aspnet_usersinroles`
--

LOCK TABLES `my_aspnet_usersinroles` WRITE;
/*!40000 ALTER TABLE `my_aspnet_usersinroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_aspnet_usersinroles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-16 17:38:25
