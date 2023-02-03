-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 03 Lut 2023, 17:54
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 8.1.10

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `courseName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courseTeacherId` bigint(20) UNSIGNED NOT NULL,
  `courseGroupId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `courses`
--

INSERT INTO `courses` (`id`, `courseName`, `courseTeacherId`, `courseGroupId`, `created_at`, `updated_at`) VALUES
(1, 'SE_course', 1, 1, NULL, NULL),
(2, 'WF_course', 2, 2, NULL, NULL),
(3, 'WF_course', 3, 3, NULL, NULL),
(4, 'EH_course', 4, 4, NULL, NULL),
(5, 'Matematyka', 2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `grades`
--

CREATE TABLE `grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `grade` int(11) NOT NULL,
  `gradeStudentId` bigint(20) UNSIGNED NOT NULL,
  `gradeCourseId` bigint(20) UNSIGNED NOT NULL,
  `gradeTeacherId` bigint(20) UNSIGNED NOT NULL,
  `gradeComment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `grades`
--

INSERT INTO `grades` (`id`, `grade`, `gradeStudentId`, `gradeCourseId`, `gradeTeacherId`, `gradeComment`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, 1, 'Iure ducimus eum ut.', NULL, NULL),
(2, 3, 2, 1, 1, 'Quod veniam.', NULL, NULL),
(3, 6, 3, 1, 1, 'Nesciunt ea esse.', NULL, NULL),
(4, 3, 4, 1, 1, 'Sint quo ex.', NULL, NULL),
(5, 5, 5, 1, 1, 'Omnis dolorum ex.', NULL, NULL),
(6, 2, 6, 1, 1, 'Qui veniam ad sunt.', NULL, NULL),
(7, 6, 7, 2, 2, 'Nihil autem et.', NULL, NULL),
(8, 1, 8, 2, 2, 'Velit pariatur.', NULL, NULL),
(9, 3, 9, 2, 2, 'Fugit eaque non.', NULL, NULL),
(10, 2, 10, 2, 2, 'Aut aperiam.', NULL, NULL),
(11, 5, 11, 2, 2, 'Rerum esse est.', NULL, NULL),
(12, 3, 12, 2, 2, 'Corrupti asperiores.', NULL, NULL),
(13, 4, 13, 3, 3, 'Voluptatem.', NULL, NULL),
(14, 6, 14, 3, 3, 'Non nobis sequi.', NULL, NULL),
(15, 2, 15, 3, 3, 'Aut provident.', NULL, NULL),
(16, 2, 16, 3, 3, 'Earum quis totam.', NULL, NULL),
(17, 2, 17, 3, 3, 'Iste laboriosam.', NULL, NULL),
(18, 3, 18, 3, 3, 'Beatae ut quasi.', NULL, NULL),
(19, 1, 19, 4, 4, 'Qui assumenda.', NULL, NULL),
(20, 1, 20, 4, 4, 'Repellendus.', NULL, NULL),
(21, 1, 21, 4, 4, 'Totam odio quia.', NULL, NULL),
(22, 4, 22, 4, 4, 'Blanditiis ipsum.', NULL, NULL),
(23, 3, 23, 4, 4, 'Facere eos numquam.', NULL, NULL),
(24, 5, 24, 4, 4, 'Doloremque animi.', NULL, NULL),
(25, 3, 1, 1, 1, 'fghfgh', NULL, NULL),
(26, 4, 1, 1, 1, 'dgfgdgd', NULL, NULL),
(27, 4, 1, 5, 2, 'ghghghh', NULL, NULL);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `gradesByStudentsAndCourses`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `gradesByStudentsAndCourses` (
`studentId` bigint(20) unsigned
,`studentName` varchar(511)
,`grades` mediumtext
,`gradesAvg` decimal(14,4)
,`gradesSum` decimal(32,0)
,`gradesCount` bigint(21)
,`courseId` bigint(20) unsigned
,`courseName` varchar(255)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `gradesWithTeachersNames`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `gradesWithTeachersNames` (
`gradeId` bigint(20) unsigned
,`grade` int(11)
,`gradeStudentId` bigint(20) unsigned
,`gradeCourseId` bigint(20) unsigned
,`gradeTeacherId` bigint(20) unsigned
,`gradeComment` varchar(255)
,`teacherName` varchar(511)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `groupName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `groups`
--

INSERT INTO `groups` (`id`, `groupName`, `created_at`, `updated_at`) VALUES
(1, 'CongoTechnikum Informatyczne, klasa 1', NULL, NULL),
(2, 'ChadTechnikum Informatyczne, klasa 1', NULL, NULL),
(3, 'ArmeniaTechnikum Informatyczne, klasa 1', NULL, NULL),
(4, 'ArgentinaTechnikum Informatyczne, klasa 1', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_01_19_140042_create_sessions_table', 1),
(5, '2023_01_26_200521_create_groups_table', 1),
(6, '2023_01_26_200620_create_teachers_table', 1),
(7, '2023_01_26_200818_create_students_table', 1),
(8, '2023_01_26_201000_create_users_table', 1),
(9, '2023_01_26_202611_create_courses_table', 1),
(10, '2023_01_26_203033_create_tasks_table', 1),
(11, '2023_01_26_204016_create_grades_table', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `studentGroupId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `students`
--

INSERT INTO `students` (`id`, `studentGroupId`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(2, 1, NULL, NULL),
(3, 1, NULL, NULL),
(4, 1, NULL, NULL),
(5, 1, NULL, NULL),
(6, 1, NULL, NULL),
(7, 2, NULL, NULL),
(8, 2, NULL, NULL),
(9, 2, NULL, NULL),
(10, 2, NULL, NULL),
(11, 2, NULL, NULL),
(12, 2, NULL, NULL),
(13, 3, NULL, NULL),
(14, 3, NULL, NULL),
(15, 3, NULL, NULL),
(16, 3, NULL, NULL),
(17, 3, NULL, NULL),
(18, 3, NULL, NULL),
(19, 4, NULL, NULL),
(20, 4, NULL, NULL),
(21, 4, NULL, NULL),
(22, 4, NULL, NULL),
(23, 4, NULL, NULL),
(24, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `studentsByCourses`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `studentsByCourses` (
`studentId` bigint(20) unsigned
,`studentName` varchar(511)
,`courseId` bigint(20) unsigned
,`courseName` varchar(255)
,`studentGroupId` bigint(20) unsigned
,`groupName` varchar(255)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `studentsGrades`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `studentsGrades` (
`studentId` bigint(20) unsigned
,`studentName` varchar(511)
,`grade` int(11)
,`gradeComment` varchar(255)
,`teacherName` varchar(511)
,`gradeCourseId` bigint(20) unsigned
,`courseName` varchar(255)
,`gradesAvg` decimal(14,4)
,`gradesSum` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `studentsWithGradesByCourses`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `studentsWithGradesByCourses` (
`studentId` bigint(20) unsigned
,`studentName` varchar(511)
,`courseId` bigint(20) unsigned
,`studentGroupId` bigint(20) unsigned
,`groupName` varchar(255)
,`grades` mediumtext
,`gradesAvg` decimal(14,4)
,`gradesSum` decimal(32,0)
,`gradesCount` bigint(21)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `taskDescription` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taskCourseId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `tasks`
--

INSERT INTO `tasks` (`id`, `taskDescription`, `taskCourseId`, `created_at`, `updated_at`) VALUES
(1, 'Consequatur sit.', 1, NULL, NULL),
(2, 'Ut culpa quis.', 1, NULL, NULL),
(3, 'Neque aut ducimus.', 1, NULL, NULL),
(4, 'Voluptatum et.', 1, NULL, NULL),
(5, 'Necessitatibus ab.', 1, NULL, NULL),
(6, 'Velit labore.', 1, NULL, NULL),
(7, 'Unde voluptatibus.', 2, NULL, NULL),
(8, 'Tempore neque vitae.', 2, NULL, NULL),
(9, 'Veritatis odio.', 2, NULL, NULL),
(10, 'Similique nam quam.', 2, NULL, NULL),
(11, 'Non quos ut odio.', 2, NULL, NULL),
(12, 'Dolor qui fugit.', 2, NULL, NULL),
(13, 'Illo esse vel.', 3, NULL, NULL),
(14, 'Rerum nihil et iste.', 3, NULL, NULL),
(15, 'Eligendi animi.', 3, NULL, NULL),
(16, 'Et nobis omnis.', 3, NULL, NULL),
(17, 'Eaque rerum quidem.', 3, NULL, NULL),
(18, 'Dolorum modi.', 3, NULL, NULL),
(19, 'Totam ut rerum nemo.', 4, NULL, NULL),
(20, 'Assumenda autem ut.', 4, NULL, NULL),
(21, 'Distinctio quia ad.', 4, NULL, NULL),
(22, 'Ullam labore.', 4, NULL, NULL),
(23, 'Rerum nihil.', 4, NULL, NULL),
(24, 'Quos ea ex dolorem.', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `teachers`
--

INSERT INTO `teachers` (`id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL),
(2, NULL, NULL),
(3, NULL, NULL),
(4, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `studentId` bigint(20) UNSIGNED DEFAULT NULL,
  `teacherId` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `email`, `password`, `role`, `studentId`, `teacherId`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(3, 'Ms. Celestine Schowalter', 'Lisandro Reichert', 'heathcote.london@example.net', '`#k/RosNvGQDq}d?V]', 'student', 2, NULL, 'KrSwpXfCJo', '2023-01-30 10:45:20', NULL, NULL),
(4, 'Ryann Hilpert', 'Florine Hermiston II', 'eleanora19@example.org', '-L3`i_Koc[)JE@', 'student', 3, NULL, 'Bti9tkw17k', '2023-01-30 10:45:20', NULL, NULL),
(5, 'Mr. Levi Gusikowski', 'Destiney Anderson DDS', 'garett30@example.com', '\'cYn5_Z', 'student', 4, NULL, 'NvbsLIoQZb', '2023-01-30 10:45:20', NULL, NULL),
(6, 'Lamar Hand', 'Barrett Huels', 'shanahan.abigail@example.org', '(kHw%l\\#/', 'student', 5, NULL, 'jQ6OwMh5z7', '2023-01-30 10:45:20', NULL, NULL),
(7, 'Dr. Jessica Considine', 'Bud Hettinger V', 'finn.dooley@example.org', 'xy\"W!g=^+', 'student', 6, NULL, 'ba7JoTkp3v', '2023-01-30 10:45:20', NULL, NULL),
(8, 'Mrs. Verla Hettinger', 'Fatima Okuneva', 'stan.schimmel@example.org', '/>C\'aN{fHG', 'teacher', NULL, 2, 'TcnYqEoluG', '2023-01-30 10:45:53', NULL, NULL),
(9, 'Deion Anderson DVM', 'Mrs. Jackeline Will', 'edgardo.conroy@example.net', 'LH,O;W{x<j%u', 'student', 7, NULL, 'akGr8LlFPJ', '2023-01-30 10:45:53', NULL, NULL),
(10, 'Quinton Lehner', 'Lamont Kuhlman', 'pledner@example.com', '#2@&J:>\\F', 'student', 8, NULL, '5ujlKtWcqE', '2023-01-30 10:45:53', NULL, NULL),
(11, 'Tracey Ankunding', 'Kianna Hahn', 'macie.leuschke@example.com', ']9vRrER0jx4', 'student', 9, NULL, 'owphWodm0S', '2023-01-30 10:45:53', NULL, NULL),
(12, 'Miss Olga Dibbert DVM', 'Danielle Jakubowski DDS', 'ward.jesse@example.org', 'E!J4ECLD$/SKx&DZl', 'student', 10, NULL, 'UAQoQ79WcJ', '2023-01-30 10:45:53', NULL, NULL),
(13, 'Mrs. Bettie Kuhlman', 'Claudine Gleason', 'jwisoky@example.com', '\'9E#g?Q', 'student', 11, NULL, 'WxdVofvcvH', '2023-01-30 10:45:53', NULL, NULL),
(14, 'Myrtle Fisher', 'Yasmin Hamill V', 'schulist.crawford@example.org', '\"*KEfquBV\'', 'student', 12, NULL, '89D8ornhbP', '2023-01-30 10:45:53', NULL, NULL),
(15, 'Mateusz', 'Rusak', 'rusakkk@live.com', '$2y$10$jGh1Xprhrc3dk0XM15CL7.cYBM9XZz8.VUMacD1uaFVEy5nINhKI6', 'teacher', NULL, 1, NULL, NULL, NULL, NULL),
(16, 'Miss Agustina Klein DDS', 'Owen Balistreri', 'gayle.konopelski@example.org', '$2y$10$hmEQniullxE6Bb29OcvLeuYo6xWEESfFl3ZdPA.ZMjZ.Ufu.5nUYi', 'teacher', NULL, 3, 'cST5sjWiFF', '2023-01-30 21:09:39', NULL, NULL),
(17, 'Citlalli Veum', 'Travis Moore', 'monahan.douglas@example.org', '$2y$10$EOdioiG5C2G7CQ7VABhz4eDcadU14ALdtuucL59V/sVyM7YXG.o7m', 'student', 13, NULL, 'RbKiqopdO1', '2023-01-30 21:09:39', NULL, NULL),
(18, 'Fabiola Rogahn', 'Miss Noemi Boehm', 'greenholt.silas@example.net', '$2y$10$ipMJjFgJWrqKz/S.hRBsS.zpn5Klv2RuDjVrshi/099AtIVSAHpsK', 'student', 14, NULL, 'Qe7d2rSCqQ', '2023-01-30 21:09:39', NULL, NULL),
(19, 'Isai Walsh', 'Dr. Schuyler Miller III', 'pfisher@example.org', '$2y$10$1aV4fX9feMBqd7TTKLw2UeGJ7Kv3ouOaIAIUycv11HE86dnI3nTuK', 'student', 15, NULL, 'CaNko7xBLn', '2023-01-30 21:09:39', NULL, NULL),
(20, 'Mrs. Glenda Wisoky III', 'Toby McCullough Sr.', 'deja05@example.org', '$2y$10$s4wVzWZmAXgUXfGPt4vxR.Zjm0SRXoZbN5WInci9lSTwemLNi4Xvq', 'student', 16, NULL, 'zTxVYS4Ehs', '2023-01-30 21:09:39', NULL, NULL),
(21, 'Allan Hodkiewicz', 'Golda Kiehn', 'ofelia31@example.org', '$2y$10$phU/OL3zq2axYwVjVQ24IeSCl4qI7x5rXRjtJJlffYtwIS4xh.s96', 'student', 17, NULL, 'xU2miSQ8te', '2023-01-30 21:09:39', NULL, NULL),
(22, 'Leonardo Reichert', 'Mr. Bradford Bernier', 'era44@example.com', '$2y$10$k7dlit3vrbpX8n7K8Wh/P.TjO4zVoS45HocakDe0N7v978V5gSdvm', 'student', 18, NULL, 'mvJ2vNapHT', '2023-01-30 21:09:39', NULL, NULL),
(23, 'Prof. Jeanne Mueller II', 'Theron Bernhard DVM', 'donnelly.kory@example.org', '$2y$10$2fftF0kyfziddpVrJyacluQEtug0CKBIFc/46mDxY3NBJQEYSvw.G', 'teacher', NULL, 4, 'PEw0fObuM8', '2023-01-31 08:46:03', NULL, NULL),
(24, 'Holly Johnson', 'Winnifred Konopelski IV', 'hansen.sydnie@example.org', '$2y$10$RXYzU9KWpKf5rFQdi5YpMeDyqRHCFXtTKZV3ex/4XJdMUva1zeUiS', 'student', 19, NULL, 'w41crivzFS', '2023-01-31 08:46:03', NULL, NULL),
(25, 'Athena Schamberger', 'Prof. Cade Reilly PhD', 'rmayer@example.com', '$2y$10$mrwk9kSA/UnSZQs96ayAyOPTr3nYsrrij3.y8U8nQrwHYh..DUaQO', 'student', 20, NULL, 'fpvY2vCz8y', '2023-01-31 08:46:03', NULL, NULL),
(26, 'Vito Mills', 'Winfield Abshire', 'areichel@example.com', '$2y$10$spEscHPsedfasQx51/jUp.0Li.IGn0YHxvyiUr6GDT/uVccztBfyy', 'student', 21, NULL, '60M27WtbWt', '2023-01-31 08:46:03', NULL, NULL),
(27, 'Mr. Dario Swaniawski', 'Alfonzo Langworth', 'vella.zieme@example.net', '$2y$10$XZ.uM69H7dzjFDiIp2Ij0ehTbx.fIjBpvEvUdlp9oikptZ4RmEegq', 'student', 22, NULL, 'O9UXvocTUk', '2023-01-31 08:46:03', NULL, NULL),
(28, 'Cynthia Wyman', 'Mrs. Robyn Hoppe', 'flatley.lessie@example.net', '$2y$10$AbwND/CMWMFrIhE10nAg7..AqfXepn7aCAh6PjXjabey4YnpZbVWO', 'student', 23, NULL, '2pYqvvorfI', '2023-01-31 08:46:03', NULL, NULL),
(29, 'Zella Grady', 'Burley Brown', 'sophie98@example.net', '$2y$10$i6..URuGvfEi/QqurGvExuRvSEnljmo/aqMld34vtWA8ObpwYlc1u', 'student', 24, NULL, 'Fc0CEfr1gA', '2023-01-31 08:46:03', NULL, NULL),
(30, 'Marcin', 'Brzoska', 'mbrzosk2@stu.vistula.edu.pl', '$2y$10$awB8a6nuNKoacPC59v8CRuv4yRnQPoiExemfs9T48X/zhI6uQo/Pe', 'student', 1, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura widoku `gradesByStudentsAndCourses`
--
DROP TABLE IF EXISTS `gradesByStudentsAndCourses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gradesByStudentsAndCourses`  AS SELECT `students`.`id` AS `studentId`, concat_ws(' ',`users`.`name`,`users`.`surname`) AS `studentName`, group_concat(`grades`.`grade` separator ', ') AS `grades`, avg(`grades`.`grade`) AS `gradesAvg`, sum(`grades`.`grade`) AS `gradesSum`, count(`grades`.`grade`) AS `gradesCount`, `courses`.`id` AS `courseId`, `courses`.`courseName` AS `courseName` FROM ((((`users` join `students`) join `courses`) join `grades`) join `groups`) WHERE `students`.`studentGroupId` = `groups`.`id` AND `courses`.`courseGroupId` = `groups`.`id` AND `grades`.`gradeCourseId` = `courses`.`id` AND `students`.`id` = `grades`.`gradeStudentId` AND `students`.`id` = `users`.`studentId` AND `users`.`role` = 'student' GROUP BY `students`.`id`, `courses`.`id``id`  ;

-- --------------------------------------------------------

--
-- Struktura widoku `gradesWithTeachersNames`
--
DROP TABLE IF EXISTS `gradesWithTeachersNames`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gradesWithTeachersNames`  AS SELECT `grades`.`id` AS `gradeId`, `grades`.`grade` AS `grade`, `grades`.`gradeStudentId` AS `gradeStudentId`, `grades`.`gradeCourseId` AS `gradeCourseId`, `grades`.`gradeTeacherId` AS `gradeTeacherId`, `grades`.`gradeComment` AS `gradeComment`, concat_ws(' ',`users`.`name`,`users`.`surname`) AS `teacherName` FROM ((`grades` join `teachers`) join `users`) WHERE `grades`.`gradeTeacherId` = `teachers`.`id` AND `teachers`.`id` = `users`.`teacherId` ORDER BY `grades`.`id` ASC  ;

-- --------------------------------------------------------

--
-- Struktura widoku `studentsByCourses`
--
DROP TABLE IF EXISTS `studentsByCourses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studentsByCourses`  AS SELECT `students`.`id` AS `studentId`, concat_ws(' ',`users`.`name`,`users`.`surname`) AS `studentName`, `courses`.`id` AS `courseId`, `courses`.`courseName` AS `courseName`, `students`.`studentGroupId` AS `studentGroupId`, `groups`.`groupName` AS `groupName` FROM (((`users` join `students`) join `courses`) join `groups`) WHERE `students`.`studentGroupId` = `courses`.`courseGroupId` AND `groups`.`id` = `courses`.`courseGroupId` AND `students`.`id` = `users`.`studentId` AND `users`.`role` = 'student' GROUP BY `courses`.`id`, `students`.`id``id`  ;

-- --------------------------------------------------------

--
-- Struktura widoku `studentsGrades`
--
DROP TABLE IF EXISTS `studentsGrades`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studentsGrades`  AS SELECT `A`.`studentId` AS `studentId`, `A`.`studentName` AS `studentName`, `B`.`grade` AS `grade`, `B`.`gradeComment` AS `gradeComment`, `B`.`teacherName` AS `teacherName`, `B`.`gradeCourseId` AS `gradeCourseId`, `courses`.`courseName` AS `courseName`, `A`.`gradesAvg` AS `gradesAvg`, `A`.`gradesSum` AS `gradesSum` FROM (((((`students` join `courses`) join `studentsWithGradesByCourses` `A`) join `groups`) join `gradesWithTeachersNames` `B`) join `users`) WHERE `students`.`id` = `B`.`gradeStudentId` AND `users`.`studentId` = `students`.`id` AND `students`.`studentGroupId` = `groups`.`id` AND `courses`.`courseGroupId` = `groups`.`id` AND `A`.`studentId` = `students`.`id` AND `B`.`gradeCourseId` = `courses`.`id` AND `A`.`courseId` = `courses`.`id` AND `A`.`studentGroupId` = `groups`.`id` ORDER BY `A`.`studentId` ASC  ;

-- --------------------------------------------------------

--
-- Struktura widoku `studentsWithGradesByCourses`
--
DROP TABLE IF EXISTS `studentsWithGradesByCourses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `studentsWithGradesByCourses`  AS SELECT `studentsByCourses`.`studentId` AS `studentId`, `studentsByCourses`.`studentName` AS `studentName`, `studentsByCourses`.`courseId` AS `courseId`, `studentsByCourses`.`studentGroupId` AS `studentGroupId`, `studentsByCourses`.`groupName` AS `groupName`, `gradesByStudentsAndCourses`.`grades` AS `grades`, `gradesByStudentsAndCourses`.`gradesAvg` AS `gradesAvg`, `gradesByStudentsAndCourses`.`gradesSum` AS `gradesSum`, `gradesByStudentsAndCourses`.`gradesCount` AS `gradesCount` FROM (`studentsByCourses` left join `gradesByStudentsAndCourses` on(`studentsByCourses`.`studentId` = `gradesByStudentsAndCourses`.`studentId` and `studentsByCourses`.`courseId` = `gradesByStudentsAndCourses`.`courseId`)) ORDER BY `studentsByCourses`.`studentId` ASC  ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_courseteacherid_foreign` (`courseTeacherId`),
  ADD KEY `courses_coursegroupid_foreign` (`courseGroupId`);

--
-- Indeksy dla tabeli `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeksy dla tabeli `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grades_gradestudentid_foreign` (`gradeStudentId`),
  ADD KEY `grades_gradecourseid_foreign` (`gradeCourseId`),
  ADD KEY `grades_gradeteacherid_foreign` (`gradeTeacherId`);

--
-- Indeksy dla tabeli `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indeksy dla tabeli `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeksy dla tabeli `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeksy dla tabeli `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_studentgroupid_foreign` (`studentGroupId`);

--
-- Indeksy dla tabeli `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_taskcourseid_foreign` (`taskCourseId`);

--
-- Indeksy dla tabeli `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_studentid_foreign` (`studentId`),
  ADD KEY `users_teacherid_foreign` (`teacherId`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT dla tabeli `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT dla tabeli `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT dla tabeli `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_coursegroupid_foreign` FOREIGN KEY (`courseGroupId`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_courseteacherid_foreign` FOREIGN KEY (`courseTeacherId`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_gradecourseid_foreign` FOREIGN KEY (`gradeCourseId`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `grades_gradestudentid_foreign` FOREIGN KEY (`gradeStudentId`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grades_gradeteacherid_foreign` FOREIGN KEY (`gradeTeacherId`) REFERENCES `teachers` (`id`);

--
-- Ograniczenia dla tabeli `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_studentgroupid_foreign` FOREIGN KEY (`studentGroupId`) REFERENCES `groups` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_taskcourseid_foreign` FOREIGN KEY (`taskCourseId`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Ograniczenia dla tabeli `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_studentid_foreign` FOREIGN KEY (`studentId`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `users_teacherid_foreign` FOREIGN KEY (`teacherId`) REFERENCES `teachers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
