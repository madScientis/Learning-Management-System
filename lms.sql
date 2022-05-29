-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               8.0.24 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6272
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table lms.address
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `line1` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `line2` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_city1_idx` (`city_id`),
  CONSTRAINT `fk_address_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table lms.address: ~2 rows (approximately)
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` (`id`, `line1`, `line2`, `city_id`) VALUES
	(1, 'No.77', 'Kosgama', 1),
	(2, 'No.241', 'Kosgama', 2),
	(3, 'No.53', 'Balika Rd', 3),
	(4, 'No.241', 'Pahala Kosgama', 1),
	(5, 'No.220', 'Kandy Rd', 4);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;

-- Dumping structure for table lms.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table lms.city: ~2 rows (approximately)
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`id`, `name`) VALUES
	(1, 'Kosgama'),
	(2, 'Awissawella'),
	(3, 'Colombo'),
	(4, 'Kandy');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

-- Dumping structure for table lms.class
CREATE TABLE IF NOT EXISTS `class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table lms.class: ~4 rows (approximately)
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` (`id`, `name`) VALUES
	(1, 'A'),
	(2, 'B'),
	(3, 'C'),
	(4, 'D');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;

-- Dumping structure for table lms.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table lms.gender: ~2 rows (approximately)
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` (`id`, `name`) VALUES
	(1, 'Male'),
	(2, 'Female');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;

-- Dumping structure for table lms.grade
CREATE TABLE IF NOT EXISTS `grade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table lms.grade: ~6 rows (approximately)
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` (`id`, `name`) VALUES
	(1, '6'),
	(2, '7'),
	(3, '8'),
	(4, '9'),
	(5, '10'),
	(6, '11'),
	(7, '12');
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;

-- Dumping structure for table lms.grade_has_class
CREATE TABLE IF NOT EXISTS `grade_has_class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grade_id` int NOT NULL,
  `class_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grade_has_class_class1_idx` (`class_id`),
  KEY `fk_grade_has_class_grade1_idx` (`grade_id`),
  CONSTRAINT `fk_grade_has_class_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `fk_grade_has_class_grade1` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table lms.grade_has_class: ~4 rows (approximately)
/*!40000 ALTER TABLE `grade_has_class` DISABLE KEYS */;
INSERT INTO `grade_has_class` (`id`, `grade_id`, `class_id`) VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 1, 2),
	(4, 7, 4),
	(5, 5, 3),
	(6, 7, 1);
/*!40000 ALTER TABLE `grade_has_class` ENABLE KEYS */;

-- Dumping structure for table lms.guardian
CREATE TABLE IF NOT EXISTS `guardian` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `mobile` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table lms.guardian: ~2 rows (approximately)
/*!40000 ALTER TABLE `guardian` DISABLE KEYS */;
INSERT INTO `guardian` (`id`, `name`, `mobile`) VALUES
	(1, 'Jagath', '0773766098'),
	(2, 'Sunera', '0783119424'),
	(3, 'Abc', '0711970660'),
	(4, 'Champika', '0764870660'),
	(5, 'qqq', '0776787654');
/*!40000 ALTER TABLE `guardian` ENABLE KEYS */;

-- Dumping structure for table lms.period
CREATE TABLE IF NOT EXISTS `period` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table lms.period: ~0 rows (approximately)
/*!40000 ALTER TABLE `period` DISABLE KEYS */;
INSERT INTO `period` (`id`, `name`) VALUES
	(1, 'First'),
	(2, 'Second'),
	(3, 'Third'),
	(4, 'Fourth'),
	(5, 'Fifth'),
	(6, 'Sixth'),
	(7, 'Seventh'),
	(8, 'Eighth');
/*!40000 ALTER TABLE `period` ENABLE KEYS */;

-- Dumping structure for table lms.status
CREATE TABLE IF NOT EXISTS `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table lms.status: ~0 rows (approximately)
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` (`id`, `name`) VALUES
	(1, 'Active'),
	(2, 'Inactive');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;

-- Dumping structure for table lms.student
CREATE TABLE IF NOT EXISTS `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `mobile` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `gender_id` int NOT NULL,
  `address_id` int NOT NULL,
  `guardian_id` int NOT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  `grade_has_class_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_student_gender1_idx` (`gender_id`),
  KEY `fk_student_address1_idx` (`address_id`),
  KEY `fk_student_status1_idx` (`status_id`),
  KEY `fk_student_guardian1_idx` (`guardian_id`),
  KEY `fk_student_grade_has_class1_idx` (`grade_has_class_id`),
  CONSTRAINT `fk_student_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_student_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  CONSTRAINT `fk_student_grade_has_class1` FOREIGN KEY (`grade_has_class_id`) REFERENCES `grade_has_class` (`id`),
  CONSTRAINT `fk_student_guardian1` FOREIGN KEY (`guardian_id`) REFERENCES `guardian` (`id`),
  CONSTRAINT `fk_student_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table lms.student: ~3 rows (approximately)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`id`, `name`, `mobile`, `gender_id`, `address_id`, `guardian_id`, `status_id`, `grade_has_class_id`) VALUES
	(1, 'Sunera', '0783119424', 1, 1, 1, 1, 1),
	(2, 'Pubudu', '0771158916', 1, 3, 3, 1, 4),
	(4, 'Sahan', '0775678767', 1, 3, 5, 1, 6);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- Dumping structure for table lms.subject
CREATE TABLE IF NOT EXISTS `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table lms.subject: ~4 rows (approximately)
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` (`id`, `name`) VALUES
	(1, 'Sinhala'),
	(2, 'Science'),
	(3, 'Mathematics'),
	(4, 'Physics');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;

-- Dumping structure for table lms.teacher
CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `mobile` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `address_id` int NOT NULL,
  `gender_id` int NOT NULL,
  `status_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_teacher_address1_idx` (`address_id`),
  KEY `fk_teacher_gender1_idx` (`gender_id`),
  KEY `fk_teacher_status1_idx` (`status_id`),
  CONSTRAINT `fk_teacher_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_teacher_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  CONSTRAINT `fk_teacher_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table lms.teacher: ~2 rows (approximately)
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`id`, `name`, `mobile`, `email`, `address_id`, `gender_id`, `status_id`) VALUES
	(1, 'abc', '0771365449', 'abc@gmail.com', 1, 2, 1),
	(3, 'XYZ', '0775654345', 'xyz@gmail.com', 1, 1, 1);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;

-- Dumping structure for table lms.teacher_has_subject
CREATE TABLE IF NOT EXISTS `teacher_has_subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int NOT NULL,
  `subject_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_teacher_has_subject_subject1_idx` (`subject_id`),
  KEY `fk_teacher_has_subject_teacher1_idx` (`teacher_id`),
  CONSTRAINT `fk_teacher_has_subject_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `fk_teacher_has_subject_teacher1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table lms.teacher_has_subject: ~0 rows (approximately)
/*!40000 ALTER TABLE `teacher_has_subject` DISABLE KEYS */;
INSERT INTO `teacher_has_subject` (`id`, `teacher_id`, `subject_id`) VALUES
	(1, 1, 1),
	(2, 1, 4);
/*!40000 ALTER TABLE `teacher_has_subject` ENABLE KEYS */;

-- Dumping structure for table lms.teacher_has_subject_has_class
CREATE TABLE IF NOT EXISTS `teacher_has_subject_has_class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_has_subject_id` int NOT NULL,
  `grade_has_class_id` int NOT NULL,
  `period_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_teacher_has_subject_has_class_teacher_has_subject1_idx` (`teacher_has_subject_id`),
  KEY `fk_teacher_has_subject_has_class_grade_has_class1_idx` (`grade_has_class_id`),
  KEY `FK_teacher_has_subject_has_class_period` (`period_id`),
  CONSTRAINT `fk_teacher_has_subject_has_class_grade_has_class1` FOREIGN KEY (`grade_has_class_id`) REFERENCES `grade_has_class` (`id`),
  CONSTRAINT `FK_teacher_has_subject_has_class_period` FOREIGN KEY (`period_id`) REFERENCES `period` (`id`),
  CONSTRAINT `fk_teacher_has_subject_has_class_teacher_has_subject1` FOREIGN KEY (`teacher_has_subject_id`) REFERENCES `teacher_has_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table lms.teacher_has_subject_has_class: ~0 rows (approximately)
/*!40000 ALTER TABLE `teacher_has_subject_has_class` DISABLE KEYS */;
INSERT INTO `teacher_has_subject_has_class` (`id`, `teacher_has_subject_id`, `grade_has_class_id`, `period_id`) VALUES
	(1, 1, 1, 1),
	(2, 2, 4, 1);
/*!40000 ALTER TABLE `teacher_has_subject_has_class` ENABLE KEYS */;

-- Dumping structure for table lms.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table lms.user: ~0 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`) VALUES
	(1, 'pubudu', '123');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
