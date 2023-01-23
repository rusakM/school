-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 23 Sty 2023, 18:55
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `school`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `courses`
--

CREATE TABLE `courses` (
  `courseId` int(11) NOT NULL,
  `courseName` text NOT NULL,
  `courseTeacherId` int(11) NOT NULL,
  `courseGroupId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `courses`
--

INSERT INTO `courses` (`courseId`, `courseName`, `courseTeacherId`, `courseGroupId`) VALUES
(1, 'BG_course', 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `grades`
--

CREATE TABLE `grades` (
  `gradeId` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `gradeStudentId` int(11) NOT NULL,
  `gradeComment` text NOT NULL,
  `gradeCourseId` int(11) NOT NULL,
  `gradeTimestamp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `grades`
--

INSERT INTO `grades` (`gradeId`, `grade`, `gradeStudentId`, `gradeComment`, `gradeCourseId`, `gradeTimestamp`) VALUES
(1, 3, 1, 'Placeat aut.', 1, '2023-01-23'),
(2, 1, 2, 'Aut tempore nihil.', 1, '2023-01-23'),
(3, 5, 3, 'Quo tempora est.', 1, '2023-01-23'),
(4, 1, 4, 'Eaque voluptates.', 1, '2023-01-23'),
(5, 6, 5, 'Quas saepe neque.', 1, '2023-01-23'),
(6, 4, 6, 'Officia ut.', 1, '2023-01-23');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `groups`
--

CREATE TABLE `groups` (
  `groupId` int(11) NOT NULL,
  `groupName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `groups`
--

INSERT INTO `groups` (`groupId`, `groupName`) VALUES
(1, 'Cape Verde_grupa');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `students`
--

CREATE TABLE `students` (
  `ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Surname` text NOT NULL,
  `Password` text NOT NULL,
  `studentGroupId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `students`
--

INSERT INTO `students` (`ID`, `Name`, `Surname`, `Password`, `studentGroupId`) VALUES
(1, 'Dedric', 'Mertz', 'szkola1', 1),
(2, 'Ahmad', 'Daugherty', 'szkola1', 1),
(3, 'Wellington', 'Baumbach', 'szkola1', 1),
(4, 'Jamie', 'Kerluke', 'szkola1', 1),
(5, 'Trevor', 'Hirthe', 'szkola1', 1),
(6, 'Madge', 'Hirthe', 'szkola1', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tasks`
--

CREATE TABLE `tasks` (
  `taskId` int(11) NOT NULL,
  `taskDescription` text NOT NULL,
  `taskCourseId` int(11) NOT NULL,
  `taskTimestamp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `tasks`
--

INSERT INTO `tasks` (`taskId`, `taskDescription`, `taskCourseId`, `taskTimestamp`) VALUES
(1, 'Enim voluptatum.', 1, '2023-01-23'),
(2, 'Aut suscipit.', 1, '2023-01-23'),
(3, 'Et dolore nihil.', 1, '2023-01-23'),
(4, 'Veniam consectetur.', 1, '2023-01-23'),
(5, 'Incidunt omnis.', 1, '2023-01-23'),
(6, 'Ut ducimus sequi.', 1, '2023-01-23');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `teachers`
--

CREATE TABLE `teachers` (
  `ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Surname` text NOT NULL,
  `Password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `teachers`
--

INSERT INTO `teachers` (`ID`, `Name`, `Surname`, `Password`) VALUES
(1, 'Jaquelin', 'Marquardt', '5(3#f:(O@');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`courseId`),
  ADD KEY `courseTeacherId` (`courseTeacherId`),
  ADD KEY `courseGroupId` (`courseGroupId`);

--
-- Indeksy dla tabeli `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`gradeId`),
  ADD KEY `gradeCourseId` (`gradeCourseId`),
  ADD KEY `gradeStudentId` (`gradeStudentId`);

--
-- Indeksy dla tabeli `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`groupId`);

--
-- Indeksy dla tabeli `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `studentGroupId` (`studentGroupId`);

--
-- Indeksy dla tabeli `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`taskId`),
  ADD KEY `taskCourseId` (`taskCourseId`);

--
-- Indeksy dla tabeli `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `courses`
--
ALTER TABLE `courses`
  MODIFY `courseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `grades`
--
ALTER TABLE `grades`
  MODIFY `gradeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `groups`
--
ALTER TABLE `groups`
  MODIFY `groupId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `students`
--
ALTER TABLE `students`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `tasks`
--
ALTER TABLE `tasks`
  MODIFY `taskId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `teachers`
--
ALTER TABLE `teachers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`courseTeacherId`) REFERENCES `teachers` (`ID`),
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`courseGroupId`) REFERENCES `groups` (`groupId`);

--
-- Ograniczenia dla tabeli `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`gradeCourseId`) REFERENCES `courses` (`courseId`),
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`gradeStudentId`) REFERENCES `students` (`ID`);

--
-- Ograniczenia dla tabeli `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`studentGroupId`) REFERENCES `groups` (`groupId`);

--
-- Ograniczenia dla tabeli `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`taskCourseId`) REFERENCES `courses` (`courseId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
