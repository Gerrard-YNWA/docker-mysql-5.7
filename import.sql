DROP TABLE IF EXISTS `USER`;
CREATE TABLE `USER` (
	`userId`  int(11) NOT NULL AUTO_INCREMENT,
	`email` varchar(50) DEFAULT NULL, 
	`mobile` varchar(20) DEFAULT NULL,
	`password` varchar(50) NOT NULL, 
	PRIMARY KEY(`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE USER AUTO_INCREMENT=1000000000;
