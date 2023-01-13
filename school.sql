-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 13 Sty 2023, 17:36
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
(1, 'CH_course', 1, 1),
(2, 'PL_course', 2, 2);

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
(1, 1, 1, 'Suscipit nam cumque.', 1, '2023-01-13'),
(2, 6, 1, 'Molestiae assumenda.', 1, '2023-01-13'),
(3, 6, 1, 'Ut eum sed.', 1, '2023-01-13'),
(4, 6, 1, 'Molestias occaecati.', 1, '2023-01-13'),
(5, 3, 1, 'Iure ut culpa quis.', 1, '2023-01-13'),
(6, 1, 2, 'Cumque est enim.', 2, '2023-01-13'),
(7, 1, 3, 'Quasi rerum.', 2, '2023-01-13'),
(8, 5, 4, 'Possimus ullam et.', 2, '2023-01-13'),
(9, 1, 5, 'Facilis est.', 2, '2023-01-13'),
(10, 4, 6, 'Incidunt autem.', 2, '2023-01-13'),
(11, 1, 7, 'Ipsum eos sit nisi.', 2, '2023-01-13');

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
(1, 'Luxembourg_grupa'),
(2, 'Belgium_grupa');

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
(1, 'Benny', 'Weber', 'szkola1', 1),
(2, 'Athena', 'Ward', 'szkola1', 2),
(3, 'Florence', 'Brown', 'szkola1', 2),
(4, 'Carey', 'Ward', 'szkola1', 2),
(5, 'Drake', 'Eichmann', 'szkola1', 2),
(6, 'Aric', 'Lind', 'szkola1', 2),
(7, 'Rasheed', 'Kuhic', 'szkola1', 2);

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
(1, 'Eaque illo et.', 1, '2023-01-13'),
(2, 'Nemo magnam sunt.', 1, '2023-01-13'),
(3, 'Dicta adipisci.', 1, '2023-01-13'),
(4, 'Numquam quas itaque.', 1, '2023-01-13'),
(5, 'Fuga nobis esse aut.', 1, '2023-01-13'),
(6, 'Neque dignissimos.', 2, '2023-01-13'),
(7, 'Neque aut sed ab.', 2, '2023-01-13'),
(8, 'Et voluptates qui.', 2, '2023-01-13'),
(9, 'At a aut dolores.', 2, '2023-01-13'),
(10, 'Et voluptas omnis.', 2, '2023-01-13'),
(11, 'Nulla et pariatur.', 2, '2023-01-13');

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
(1, 'Lola', 'Pfeffer', 'B^a{$M#'),
(2, 'Andres', 'Mills', '7)OHl$b{{?');

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
  MODIFY `courseId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `grades`
--
ALTER TABLE `grades`
  MODIFY `gradeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `groups`
--
ALTER TABLE `groups`
  MODIFY `groupId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `students`
--
ALTER TABLE `students`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `tasks`
--
ALTER TABLE `tasks`
  MODIFY `taskId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `teachers`
--
ALTER TABLE `teachers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
