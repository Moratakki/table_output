-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               11.5.2-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных hospital
CREATE DATABASE IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_bin */;
USE `hospital`;

-- Дамп структуры для таблица hospital.departments
CREATE TABLE IF NOT EXISTS `departments` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_name` (`department_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Дамп данных таблицы hospital.departments: ~5 rows (приблизительно)
INSERT INTO `departments` (`department_id`, `department_name`, `created_at`) VALUES
	(1, 'Терапевтическое отделение', '2024-11-14 18:01:04'),
	(2, 'Хирургическое отделение', '2024-11-14 18:01:04'),
	(3, 'Кардиологическое отделение', '2024-11-14 18:01:04'),
	(4, 'Неврологическое отделение', '2024-12-20 11:35:52'),
	(5, 'Офтальмологическое отделение', '2024-12-20 11:35:52');

-- Дамп структуры для таблица hospital.doctors
CREATE TABLE IF NOT EXISTS `doctors` (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `specialty` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Дамп данных таблицы hospital.doctors: ~5 rows (приблизительно)
INSERT INTO `doctors` (`doctor_id`, `first_name`, `last_name`, `specialty`, `created_at`) VALUES
	(1, 'Ольга', 'Сидорова', 'Терапевт', '2024-11-14 18:01:04'),
	(2, 'Алексей', 'Кузнецов', 'Хирург', '2024-11-14 18:01:04'),
	(3, 'Елена', 'Федорова', 'Кардиолог', '2024-11-14 18:01:04'),
	(4, 'Анна', 'Ковалева', 'Невролог', '2024-12-20 11:35:52'),
	(5, 'Сергей', 'Петров', 'Офтальмолог', '2024-12-20 11:35:52');

-- Дамп структуры для таблица hospital.initialexaminations
CREATE TABLE IF NOT EXISTS `initialexaminations` (
  `examination_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `examination_date` datetime NOT NULL,
  `initial_findings` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`examination_id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `initialexaminations_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `initialexaminations_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Дамп данных таблицы hospital.initialexaminations: ~0 rows (приблизительно)

-- Дамп структуры для таблица hospital.patientadmissions
CREATE TABLE IF NOT EXISTS `patientadmissions` (
  `admission_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `ward_id` int(11) DEFAULT NULL,
  `admission_date` datetime NOT NULL,
  `discharge_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`admission_id`),
  KEY `patient_id` (`patient_id`),
  KEY `ward_id` (`ward_id`),
  CONSTRAINT `patientadmissions_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patientadmissions_ibfk_2` FOREIGN KEY (`ward_id`) REFERENCES `wards` (`ward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Дамп данных таблицы hospital.patientadmissions: ~0 rows (приблизительно)

-- Дамп структуры для таблица hospital.patients
CREATE TABLE IF NOT EXISTS `patients` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `passport_number` varchar(20) NOT NULL,
  `insurance_policy_number` varchar(30) NOT NULL,
  `insurance_company` varchar(100) NOT NULL,
  `reason_for_admission` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`patient_id`),
  UNIQUE KEY `passport_number` (`passport_number`),
  UNIQUE KEY `insurance_policy_number` (`insurance_policy_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Дамп данных таблицы hospital.patients: ~2 rows (приблизительно)
INSERT INTO `patients` (`patient_id`, `first_name`, `last_name`, `date_of_birth`, `passport_number`, `insurance_policy_number`, `insurance_company`, `reason_for_admission`, `created_at`) VALUES
	(1, 'Олег', 'Сергеев', '1980-05-20', '4567890123', 'D4567890123', 'Страховая Компания Memento Mori', 'Головная боль, требуется обследование', '2024-12-20 11:35:52'),
	(2, 'Татьяна', 'Иванова', '1995-12-15', '5678901234', 'E5678901234', 'Страховая компания "АльфаСтрахование"', 'Проблемы со зрением, требуется консультация', '2024-12-20 11:35:52');

-- Дамп структуры для таблица hospital.patients_archive
CREATE TABLE IF NOT EXISTS `patients_archive` (
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `passport_number` varchar(20) NOT NULL,
  `insurance_policy_number` varchar(30) NOT NULL,
  `insurance_company` varchar(100) NOT NULL,
  `reason_for_admission` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Дамп данных таблицы hospital.patients_archive: ~3 rows (приблизительно)
INSERT INTO `patients_archive` (`patient_id`, `first_name`, `last_name`, `date_of_birth`, `passport_number`, `insurance_policy_number`, `insurance_company`, `reason_for_admission`, `created_at`) VALUES
	(1, 'Иван', 'Иванов', '1985-03-15', '1234567890', 'A1234567890', 'Страховая компания "РосГосСтрах"', 'Грипп, высокая температура', '2024-11-14 18:01:04'),
	(3, 'Дмитрий', 'Смирнов', '1975-11-10', '3456789012', 'C3456789012', 'Страховая компания "ВСК"', 'Хронические болезни сердца', '2024-11-14 18:01:04'),
	(4, 'Олег', 'Сергеев', '1980-05-20', '4567890123', 'D4567890123', 'Страховая компания "РосГосСтрах"', 'Головная боль, требуется обследование', '2024-12-20 11:35:52');

-- Дамп структуры для таблица hospital.wards
CREATE TABLE IF NOT EXISTS `wards` (
  `ward_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `room_number` varchar(10) NOT NULL,
  `capacity` int(11) DEFAULT NULL CHECK (`capacity` between 1 and 4),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ward_id`),
  UNIQUE KEY `room_number` (`room_number`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `wards_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Дамп данных таблицы hospital.wards: ~5 rows (приблизительно)
INSERT INTO `wards` (`ward_id`, `department_id`, `room_number`, `capacity`, `created_at`) VALUES
	(1, 1, '101', 2, '2024-11-14 18:01:04'),
	(2, 2, '202', 4, '2024-11-14 18:01:04'),
	(3, 3, '303', 3, '2024-11-14 18:01:04'),
	(4, 1, '104', 3, '2024-12-20 11:35:52'),
	(5, 2, '205', 2, '2024-12-20 11:35:52');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
