/*
SQLyog Ultimate v9.02 
MySQL - 5.5.16 : Database - calenderx
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`calenderx` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `calenderx`;

/*Table structure for table `agenda` */

DROP TABLE IF EXISTS `agenda`;

CREATE TABLE `agenda` (
  `IdAgenda` int(11) NOT NULL AUTO_INCREMENT,
  `IdTpCompromisso` int(11) DEFAULT NULL,
  `DtInicio` datetime DEFAULT NULL,
  `DtFim` datetime DEFAULT NULL,
  `DsAssunto` varchar(50) DEFAULT NULL,
  `DsObservacao` longtext,
  `FlRecorrencia` char(1) DEFAULT 'N',
  `FkAgenda` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdAgenda`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `agenda` */

insert  into `agenda`(`IdAgenda`,`IdTpCompromisso`,`DtInicio`,`DtFim`,`DsAssunto`,`DsObservacao`,`FlRecorrencia`,`FkAgenda`) values (1,1,'2012-05-20 15:30:00','2012-05-20 18:30:00','Reunião ','Vai ocorrer em algum lugar','N',NULL),(2,1,'2012-05-18 14:30:00','2012-05-18 16:00:00','Outra Reunião','teste','N',NULL),(3,1,'2012-05-13 12:30:00','2012-05-13 14:30:00','Reunião 1','teste....','N',NULL),(4,1,'2012-05-13 14:45:00','2012-05-13 16:30:00','Reunião 2','outro teste','N',NULL),(5,1,'2012-05-13 17:00:00','2012-05-13 19:30:00','Reunião 3','blabláblá','N',NULL),(6,2,'2012-05-14 14:00:00','2012-05-14 17:00:00','reunião 4','teste','N',NULL),(7,3,'2012-05-15 15:45:00','2012-05-15 17:35:00','teste agenda x','ttetet','N',NULL),(8,3,'2012-05-15 17:45:00','2012-05-15 18:45:00','teste5','tete','N',NULL),(9,3,'2012-05-15 19:45:00','2012-05-15 20:45:00','reunião gustavo ok','tete','N',NULL),(10,1,'2012-05-24 16:30:00','2012-05-24 20:30:00','Ivens na FIT(TAKAI)----','Reunião sobre o trabalho do TAKAI','N',NULL),(11,1,'2012-05-24 16:00:00','2012-05-24 17:00:00','teste','aula do takais','N',NULL),(12,1,'2012-05-21 16:00:00','2012-05-21 20:45:00','teste','auaasdasdkçlaskdas','N',NULL),(13,1,'2012-05-22 16:30:00','2012-05-22 20:00:00','teste','teste','N',NULL),(14,1,'2012-05-25 11:00:00','2012-05-25 23:00:00','teste de gravacção','teste','N',NULL),(24,2,'2012-05-28 18:00:00','2012-05-28 22:30:00','blabla','teste\r\nteste\r\nteste\r\n\r\n','N',NULL),(25,1,'2012-05-29 18:15:00','2012-05-29 21:00:00','teste','','N',NULL);

/*Table structure for table `agendatarefa` */

DROP TABLE IF EXISTS `agendatarefa`;

CREATE TABLE `agendatarefa` (
  `IdAgendaTarefa` int(11) NOT NULL AUTO_INCREMENT,
  `IdAgenda` int(11) NOT NULL,
  `IdTarefa` int(11) NOT NULL,
  PRIMARY KEY (`IdAgendaTarefa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `agendatarefa` */

/*Table structure for table `tarefa` */

DROP TABLE IF EXISTS `tarefa`;

CREATE TABLE `tarefa` (
  `IdTipo` int(11) NOT NULL AUTO_INCREMENT,
  `NmTarefa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tarefa` */

/*Table structure for table `tipocompromisso` */

DROP TABLE IF EXISTS `tipocompromisso`;

CREATE TABLE `tipocompromisso` (
  `IdTipo` int(11) NOT NULL AUTO_INCREMENT,
  `NmCompromisso` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipocompromisso` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
