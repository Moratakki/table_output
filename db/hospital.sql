-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 14 2025 г., 20:14
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hospital`
--

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `specialty_name` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `specialty_name`, `created_at`) VALUES
(1, 'Терапевтическое отделение', 'Терапевт', '2024-11-14 18:01:04'),
(2, 'Хирургическое отделение', 'Хирург', '2024-11-14 18:01:04'),
(3, 'Кардиологическое отделение', 'Кардиолог', '2024-11-14 18:01:04'),
(4, 'Неврологическое отделение', 'Невролог', '2024-12-20 11:35:52'),
(5, 'Офтальмологическое отделение', 'Офтальмолог', '2024-12-20 11:35:52');

-- --------------------------------------------------------

--
-- Структура таблицы `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `specialty` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `first_name`, `last_name`, `specialty`, `created_at`) VALUES
(3, 'Елена', 'Федорова', 'Кардиолог', '2024-11-14 15:01:04'),
(4, 'Анна', 'Ковалева', 'Невролог', '2024-12-20 08:35:52'),
(5, 'Сергей', 'Петров', 'Офтальмолог', '2024-12-20 08:35:52'),
(8, 'Семён', 'Лобанов', 'Терапевт', '2025-03-10 13:54:53'),
(9, 'Кевин', 'Митник', 'Хирург', '2025-03-10 13:55:47');

-- --------------------------------------------------------

--
-- Структура таблицы `initialexaminations`
--

CREATE TABLE `initialexaminations` (
  `examination_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `examination_date` datetime NOT NULL,
  `initial_findings` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `patientadmissions`
--

CREATE TABLE `patientadmissions` (
  `admission_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `ward_id` int(11) DEFAULT NULL,
  `admission_date` datetime NOT NULL,
  `discharge_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `passport_number` varchar(20) NOT NULL,
  `insurance_policy_number` varchar(30) NOT NULL,
  `insurance_company` varchar(100) NOT NULL,
  `reason_for_admission` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `patients`
--

INSERT INTO `patients` (`patient_id`, `first_name`, `last_name`, `date_of_birth`, `passport_number`, `insurance_policy_number`, `insurance_company`, `reason_for_admission`, `created_at`) VALUES
(1, 'Олег', 'Сергеев', '1980-05-20', '4567890123', 'D4567890123', 'Страховая Компания Memento Mori', 'Головная боль, требуется обследование', '2024-12-20 11:35:52'),
(2, 'Татьяна', 'Иванова', '1995-12-15', '5678901234', 'E5678901234', 'Страховая компания \"АльфаСтрахование\"', 'Проблемы со зрением, требуется консультация', '2024-12-20 11:35:52');

-- --------------------------------------------------------

--
-- Структура таблицы `patients_archive`
--

CREATE TABLE `patients_archive` (
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `passport_number` varchar(20) NOT NULL,
  `insurance_policy_number` varchar(30) NOT NULL,
  `insurance_company` varchar(100) NOT NULL,
  `reason_for_admission` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `patients_archive`
--

INSERT INTO `patients_archive` (`patient_id`, `first_name`, `last_name`, `date_of_birth`, `passport_number`, `insurance_policy_number`, `insurance_company`, `reason_for_admission`, `created_at`) VALUES
(1, 'Иван', 'Иванов', '1985-03-15', '1234567890', 'A1234567890', 'Страховая компания \"РосГосСтрах\"', 'Грипп, высокая температура', '2024-11-14 18:01:04'),
(3, 'Дмитрий', 'Смирнов', '1975-11-10', '3456789012', 'C3456789012', 'Страховая компания \"ВСК\"', 'Хронические болезни сердца', '2024-11-14 18:01:04'),
(4, 'Олег', 'Сергеев', '1980-05-20', '4567890123', 'D4567890123', 'Страховая компания \"РосГосСтрах\"', 'Головная боль, требуется обследование', '2024-12-20 11:35:52');

-- --------------------------------------------------------

--
-- Структура таблицы `wards`
--

CREATE TABLE `wards` (
  `ward_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `room_number` varchar(10) NOT NULL,
  `capacity` int(11) DEFAULT NULL CHECK (`capacity` between 1 and 4),
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `wards`
--

INSERT INTO `wards` (`ward_id`, `department_id`, `room_number`, `capacity`, `created_at`) VALUES
(1, 1, '101', 2, '2024-11-14 18:01:04'),
(2, 2, '202', 4, '2024-11-14 18:01:04'),
(3, 3, '303', 3, '2024-11-14 18:01:04'),
(4, 1, '104', 3, '2024-12-20 11:35:52'),
(5, 2, '205', 2, '2024-12-20 11:35:52');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD UNIQUE KEY `department_name` (`department_name`);

--
-- Индексы таблицы `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Индексы таблицы `initialexaminations`
--
ALTER TABLE `initialexaminations`
  ADD PRIMARY KEY (`examination_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Индексы таблицы `patientadmissions`
--
ALTER TABLE `patientadmissions`
  ADD PRIMARY KEY (`admission_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `ward_id` (`ward_id`);

--
-- Индексы таблицы `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`),
  ADD UNIQUE KEY `passport_number` (`passport_number`),
  ADD UNIQUE KEY `insurance_policy_number` (`insurance_policy_number`);

--
-- Индексы таблицы `patients_archive`
--
ALTER TABLE `patients_archive`
  ADD PRIMARY KEY (`patient_id`);

--
-- Индексы таблицы `wards`
--
ALTER TABLE `wards`
  ADD PRIMARY KEY (`ward_id`),
  ADD UNIQUE KEY `room_number` (`room_number`),
  ADD KEY `department_id` (`department_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `initialexaminations`
--
ALTER TABLE `initialexaminations`
  MODIFY `examination_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `patientadmissions`
--
ALTER TABLE `patientadmissions`
  MODIFY `admission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `wards`
--
ALTER TABLE `wards`
  MODIFY `ward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `initialexaminations`
--
ALTER TABLE `initialexaminations`
  ADD CONSTRAINT `initialexaminations_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `initialexaminations_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`);

--
-- Ограничения внешнего ключа таблицы `patientadmissions`
--
ALTER TABLE `patientadmissions`
  ADD CONSTRAINT `patientadmissions_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patientadmissions_ibfk_2` FOREIGN KEY (`ward_id`) REFERENCES `wards` (`ward_id`);

--
-- Ограничения внешнего ключа таблицы `wards`
--
ALTER TABLE `wards`
  ADD CONSTRAINT `wards_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
