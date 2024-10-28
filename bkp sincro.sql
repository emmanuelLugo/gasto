/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.27-log : Database - gasto_system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gasto_system` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `gasto_system`;

/*Table structure for table `bs_moeda` */

DROP TABLE IF EXISTS `bs_moeda`;

CREATE TABLE `bs_moeda` (
  `ID_MOEDA` int(11) NOT NULL AUTO_INCREMENT,
  `DS_MOEDA` varchar(60) NOT NULL,
  `PRECISAO` int(11) NOT NULL,
  PRIMARY KEY (`ID_MOEDA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bs_moeda` */

/*Table structure for table `fin_caixa` */

DROP TABLE IF EXISTS `fin_caixa`;

CREATE TABLE `fin_caixa` (
  `ID_CAIXA` int(11) NOT NULL AUTO_INCREMENT,
  `OBSERVACAO` varchar(120) NOT NULL,
  `DT_ABERTURA` datetime NOT NULL,
  `BO_ABERTO` tinyint(1) NOT NULL,
  `DT_FECHAMENTO` datetime DEFAULT NULL,
  `VL_CAIXA` decimal(20,3) DEFAULT NULL,
  `VL_GASTO` decimal(20,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`ID_CAIXA`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `fin_caixa` */

insert  into `fin_caixa`(`ID_CAIXA`,`OBSERVACAO`,`DT_ABERTURA`,`BO_ABERTO`,`DT_FECHAMENTO`,`VL_CAIXA`,`VL_GASTO`) values (1,'SALARIO DE NOVIEMBRE','2024-11-10 16:11:56',0,'2024-10-28 10:36:34',4000000.000,2800000.000),(5,'MES DE OCTUBRE (24/10)','2024-10-24 16:14:44',0,'2024-10-27 20:04:28',4000000.000,1650000.000),(6,'CUENTA UENO','2024-10-24 16:24:09',1,NULL,5360089.000,518077.000);

/*Table structure for table `fin_classificacao_gasto` */

DROP TABLE IF EXISTS `fin_classificacao_gasto`;

CREATE TABLE `fin_classificacao_gasto` (
  `ID_CLASSIFICACAO_GASTO` int(11) NOT NULL AUTO_INCREMENT,
  `DS_CLASSIFICACAO_GASTO` varchar(120) NOT NULL,
  `BO_ATIVO` tinyint(1) NOT NULL,
  `ID_TIPO_GASTO` int(11) NOT NULL,
  PRIMARY KEY (`ID_CLASSIFICACAO_GASTO`),
  KEY `CLASS_FK_TIPO` (`ID_TIPO_GASTO`),
  CONSTRAINT `CLASS_FK_TIPO` FOREIGN KEY (`ID_TIPO_GASTO`) REFERENCES `fin_tipo_gasto` (`ID_TIPO_GASTO`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `fin_classificacao_gasto` */

insert  into `fin_classificacao_gasto`(`ID_CLASSIFICACAO_GASTO`,`DS_CLASSIFICACAO_GASTO`,`BO_ATIVO`,`ID_TIPO_GASTO`) values (13,'AHORRO',1,3),(14,'COMBUSTIBLE',1,2),(15,'INTERNET',1,1),(16,'COOPERATIVA',1,1),(17,'TERRENO',1,1),(18,'MOTO / AUTO',1,2),(19,'ALMUERZO / CENA',1,2),(20,'SUPERMERCADO ',1,2),(21,'IRRELEVANTES ',1,2),(22,'CASA ',1,2),(23,'PERDIDA/ VUELTO',1,2);

/*Table structure for table `fin_entrada_caixa` */

DROP TABLE IF EXISTS `fin_entrada_caixa`;

CREATE TABLE `fin_entrada_caixa` (
  `ID_ENTRADA_CAIXA` int(11) NOT NULL AUTO_INCREMENT,
  `OBS_ENTRADA` varchar(60) NOT NULL,
  `ID_MOEDA` int(11) NOT NULL,
  `VL_ENTRADA` decimal(20,3) NOT NULL,
  `DT_ENTRADA` datetime NOT NULL,
  `USUARIO` varchar(60) DEFAULT NULL,
  `BO_CANCELADO` tinyint(1) NOT NULL,
  `DT_CANCELAMENTO` datetime DEFAULT NULL,
  `USUARIO_CANCELAMENTO` varchar(60) DEFAULT NULL,
  `ID_CAIXA` int(11) NOT NULL,
  PRIMARY KEY (`ID_ENTRADA_CAIXA`),
  KEY `ENTRADA_CAIXA_FK_MOEDA` (`ID_MOEDA`),
  KEY `ENTRADA_CAIXA_FK_CAIXA` (`ID_CAIXA`),
  CONSTRAINT `ENTRADA_CAIXA_FK_CAIXA` FOREIGN KEY (`ID_CAIXA`) REFERENCES `fin_caixa` (`ID_CAIXA`),
  CONSTRAINT `ENTRADA_CAIXA_FK_MOEDA` FOREIGN KEY (`ID_MOEDA`) REFERENCES `bs_moeda` (`ID_MOEDA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `fin_entrada_caixa` */

/*Table structure for table `fin_gasto` */

DROP TABLE IF EXISTS `fin_gasto`;

CREATE TABLE `fin_gasto` (
  `ID_GASTO` int(11) NOT NULL AUTO_INCREMENT,
  `DS_GASTO` varchar(120) NOT NULL,
  `VL_GASTO` decimal(20,3) NOT NULL,
  `ID_MOEDA` int(11) DEFAULT NULL,
  `ID_CAIXA` int(11) NOT NULL,
  `ID_CLASSIFICACAO` int(11) NOT NULL,
  `DT_GASTO` datetime DEFAULT NULL,
  `BO_CANCELADO` tinyint(1) DEFAULT NULL,
  `DT_CANCELAMENTO` datetime DEFAULT NULL,
  `USUARIO` varchar(120) DEFAULT NULL,
  `USUARIO_CANCELAMENTO` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_GASTO`),
  KEY `GASTO_FK_CAIXA` (`ID_CAIXA`),
  KEY `GASTO_FK_CLASSIFICACAO` (`ID_CLASSIFICACAO`),
  CONSTRAINT `GASTO_FK_CAIXA` FOREIGN KEY (`ID_CAIXA`) REFERENCES `fin_caixa` (`ID_CAIXA`),
  CONSTRAINT `GASTO_FK_CLASSIFICACAO` FOREIGN KEY (`ID_CLASSIFICACAO`) REFERENCES `fin_classificacao_gasto` (`ID_CLASSIFICACAO_GASTO`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

/*Data for the table `fin_gasto` */

insert  into `fin_gasto`(`ID_GASTO`,`DS_GASTO`,`VL_GASTO`,`ID_MOEDA`,`ID_CAIXA`,`ID_CLASSIFICACAO`,`DT_GASTO`,`BO_CANCELADO`,`DT_CANCELAMENTO`,`USUARIO`,`USUARIO_CANCELAMENTO`) values (51,'KAREN ',15000.000,NULL,5,14,'2024-10-24 16:15:23',0,NULL,'R',NULL),(52,'MENSUALIDAD+ INSTALACIÓN ',350000.000,NULL,5,15,'2024-10-10 16:15:50',0,NULL,'R',NULL),(53,'PAGO TOTAL',700000.000,NULL,5,16,'2024-10-24 16:16:08',0,NULL,'R',NULL),(54,'PAGO',550000.000,NULL,5,17,'2024-10-23 16:16:41',0,NULL,'R',NULL),(55,'LLANTÉ EN LA MOTO ',35000.000,NULL,5,18,'2024-10-23 16:17:41',0,NULL,'R',NULL),(56,'PAGO',150000.000,NULL,1,15,'2024-10-10 17:01:38',0,NULL,'R',NULL),(57,'PAGO',550000.000,NULL,1,17,'2024-10-10 17:02:22',0,NULL,'R',NULL),(58,'AHORRO',2100000.000,NULL,1,13,'2024-10-10 17:02:59',0,NULL,'R',NULL),(59,'COMPRAS PARA L CENA EN LA MISIONERA ',85989.000,NULL,6,20,'2024-10-24 08:35:01',0,NULL,'R',NULL),(60,'PRUEBA DESPUÉS BORRAR',152000.000,NULL,6,20,'2024-10-25 11:49:18',1,'2024-10-25 11:49:41','R','R'),(61,'AÇAÍ ',15000.000,NULL,6,21,'2024-10-25 16:06:23',0,NULL,'R',NULL),(62,'PIZZA DON PAOLI',83000.000,NULL,6,19,'2024-10-25 21:40:44',0,NULL,'R',NULL),(63,'COMPR DE ENCHUFES EN SANTO DOMINGO',116788.000,NULL,6,21,'2024-10-26 12:10:06',0,NULL,'R',NULL),(64,'MATERIALES PARA INSTALAR LAVARROPA',32000.000,NULL,6,22,'2024-10-26 16:10:32',0,NULL,'R',NULL),(65,'PAGO MANO OBRA INSTALACIÓN LAVARROPAS ',50000.000,NULL,6,22,'2024-10-26 16:26:24',0,NULL,'R',NULL),(66,'VUELTO DEL 100 MIL.. CANCELAR DESPUES',18000.000,NULL,6,22,'2024-10-26 18:47:20',1,'2024-10-26 19:37:34','R','R'),(67,'COMPRA DE COSAS',18000.000,NULL,6,20,'2024-10-26 19:38:05',0,NULL,'R',NULL),(68,'COMPRA DE AUTITO PARA MATHEO DE NUESTRA CASA',38300.000,NULL,6,21,'2024-10-27 19:56:07',0,NULL,'R',NULL),(69,'2 HAMBURGUESAS DE LA SALTEÑA',36000.000,NULL,6,19,'2024-10-27 22:19:25',0,NULL,'R',NULL),(70,'COCA COLA Y KETCHUP',29000.000,NULL,6,19,'2024-10-27 22:19:51',0,NULL,'R',NULL),(71,'COMPRA DE YOGURT ',14000.000,NULL,6,20,'2024-10-28 09:00:33',0,NULL,'R',NULL);

/*Table structure for table `fin_gasto_image` */

DROP TABLE IF EXISTS `fin_gasto_image`;

CREATE TABLE `fin_gasto_image` (
  `ID_GASTO_IMAGE` int(11) DEFAULT NULL,
  `ID_GASTO` int(11) DEFAULT NULL,
  `URL_IMAGE` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `fin_gasto_image` */

/*Table structure for table `fin_tipo_gasto` */

DROP TABLE IF EXISTS `fin_tipo_gasto`;

CREATE TABLE `fin_tipo_gasto` (
  `ID_TIPO_GASTO` int(11) NOT NULL AUTO_INCREMENT,
  `DS_TIPO_GASTO` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_TIPO_GASTO`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `fin_tipo_gasto` */

insert  into `fin_tipo_gasto`(`ID_TIPO_GASTO`,`DS_TIPO_GASTO`) values (1,'GASTO FIJO'),(2,'GASTO VARIABLE'),(3,'AHORRO');

/*Table structure for table `sys_empresa` */

DROP TABLE IF EXISTS `sys_empresa`;

CREATE TABLE `sys_empresa` (
  `ID_EMPRESA` int(11) NOT NULL AUTO_INCREMENT,
  `DS_EMPRESA` varchar(60) DEFAULT NULL,
  `URL_FOTO` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID_EMPRESA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sys_empresa` */

insert  into `sys_empresa`(`ID_EMPRESA`,`DS_EMPRESA`,`URL_FOTO`) values (1,'TEST','icono.png');

/*Table structure for table `sys_licencia` */

DROP TABLE IF EXISTS `sys_licencia`;

CREATE TABLE `sys_licencia` (
  `ID_LICENCIA` int(11) NOT NULL AUTO_INCREMENT,
  `SERIE` varchar(120) DEFAULT NULL,
  `BO_ATIVO` tinyint(1) NOT NULL,
  `DT_ULTIMO_LOGIN` date DEFAULT NULL,
  `DT_EXPIRACAO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_LICENCIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_licencia` */

/*Table structure for table `sys_usuario` */

DROP TABLE IF EXISTS `sys_usuario`;

CREATE TABLE `sys_usuario` (
  `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(60) NOT NULL,
  `NOME_USUARIO` varchar(60) DEFAULT NULL,
  `SENHA` varchar(60) DEFAULT NULL,
  `DT_ULTIMO_LOGIN` datetime DEFAULT NULL,
  `BO_ATIVO` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sys_usuario` */

insert  into `sys_usuario`(`ID_USUARIO`,`LOGIN`,`NOME_USUARIO`,`SENHA`,`DT_ULTIMO_LOGIN`,`BO_ATIVO`) values (1,'R','MANUEL','$2a$10$RVNux2biVHCPC3iZGzEdtOvd8X81zIFb4VHtm5wQlQ8RePOjycdpm','2024-10-28 14:04:55',1);

/* Trigger structure for table `fin_gasto` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update_vl_gasto_after_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `update_vl_gasto_after_insert` AFTER INSERT ON `fin_gasto` FOR EACH ROW BEGIN
       IF NEW.bo_cancelado = FALSE THEN
        UPDATE fin_caixa
        SET VL_GASTO = VL_GASTO + NEW.vl_gasto
        WHERE id_caixa = NEW.id_caixa;
    END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `fin_gasto` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update_vl_gasto_after_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `update_vl_gasto_after_update` AFTER UPDATE ON `fin_gasto` FOR EACH ROW BEGIN
    
     IF OLD.bo_cancelado = FALSE THEN
        -- Si el gasto estaba activo antes, lo restamos del total
        UPDATE fin_caixa
        SET VL_GASTO = VL_GASTO - OLD.vl_gasto
        WHERE id_caixa = OLD.id_caixa;
    END IF;
    IF NEW.bo_cancelado = FALSE THEN
        -- Si el gasto sigue activo, lo añadimos al total (puede ser el mismo o un nuevo valor)
        UPDATE fin_caixa
        SET VL_GASTO = VL_GASTO + NEW.vl_gasto
        WHERE id_caixa = NEW.id_caixa;
    END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `fin_gasto` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update_vl_gasto_after_delete` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `update_vl_gasto_after_delete` AFTER DELETE ON `fin_gasto` FOR EACH ROW BEGIN
	 IF OLD.bo_cancelado = FALSE THEN
        UPDATE fin_caixa
        SET VL_GASTO = VL_GASTO - OLD.vl_gasto
        WHERE id_caixa = OLD.id_caixa;
    END IF;
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
