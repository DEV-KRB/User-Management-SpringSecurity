DROP DATABASE  IF EXISTS `user_directory`;

CREATE DATABASE  IF NOT EXISTS `user_directory`;
USE `user_directory`;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--
-- NOTE: The passwords are encrypted using BCrypt
--
-- A generation tool is avail at: http://www.luv2code.com/generate-bcrypt-password
--
-- Default passwords here are: fun123
--

INSERT INTO `users` 
VALUES 
('Kavya','{bcrypt}$2a$10$DtAaY4m9A9OV6RKO.a2io.MW7oJRnaSgD./AixFJXPmFoL02imYgu',1),
('Devendra Rao','{bcrypt}$2a$10$DtAaY4m9A9OV6RKO.a2io.MW7oJRnaSgD./AixFJXPmFoL02imYgu',1),
('Ata B','{bcrypt}$2a$10$DtAaY4m9A9OV6RKO.a2io.MW7oJRnaSgD./AixFJXPmFoL02imYgu',1);


--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` 
VALUES 
('Kavya','ROLE_Founder'),
('Devendra Rao','ROLE_Co-Founder'),
('Ata B','ROLE_Co-Founder');


