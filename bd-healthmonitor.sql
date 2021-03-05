-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2021 at 01:13 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd-healthmonitor`
--

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duty_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`id`, `name`, `plate_no`, `owner`, `duty_date`, `created_at`, `updated_at`) VALUES
(1, 'Shamoly', 'ctg-12321', 'Md Kamal', '02-01-2021', '2021-01-28 11:41:37', '2021-01-28 11:41:37'),
(12, 'Tori', 'chi-46322', 'Arafat Ullah', '10-Feb-2020', '2021-01-30 01:35:01', '2021-01-30 03:31:48'),
(22, 'Ena', 'RJ-4324', 'Emon Khan', '23-01-2021', '2021-01-30 02:37:16', '2021-01-30 02:37:16'),
(24, 'BRTC', 'dha-35345', 'Nayeem Uddin', '23-01-2021', '2021-01-30 03:30:24', '2021-01-30 03:30:24'),
(25, 'S Alam', 'CHA-46365', 'Alam', '27-01-2020', '2021-01-30 03:47:01', '2021-01-30 03:47:35'),
(28, 'Provat', 'Kh-45345', 'Arif uddin', '21-02-2020', '2021-01-31 00:13:27', '2021-01-31 00:13:27');

-- --------------------------------------------------------

--
-- Table structure for table `bus_drivers`
--

CREATE TABLE `bus_drivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `busId` int(11) NOT NULL,
  `driverId` int(11) NOT NULL,
  `status` varchar(121) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startDate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bus_drivers`
--

INSERT INTO `bus_drivers` (`id`, `busId`, `driverId`, `status`, `startDate`, `created_at`, `updated_at`) VALUES
(5, 22, 2, 'Danger', '22-12-2020', '2021-01-31 02:45:29', '2021-01-31 16:04:50'),
(6, 1, 2, 'Safe', '11-01-2020', '2021-01-31 02:49:41', '2021-01-31 02:49:41'),
(8, 25, 3, 'Danger', '21-12-2020', '2021-01-31 03:01:32', '2021-01-31 03:47:11'),
(15, 1, 5, 'Safe', '25-02-20', '2021-01-31 03:59:23', '2021-01-31 16:07:27'),
(18, 25, 5, 'Safe', '25-05-20', '2021-01-31 16:05:16', '2021-01-31 16:05:16');

-- --------------------------------------------------------

--
-- Table structure for table `bus_driver_logs`
--

CREATE TABLE `bus_driver_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `busId` int(11) NOT NULL,
  `driverId` int(11) NOT NULL,
  `startDate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endDate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bus_driver_logs`
--

INSERT INTO `bus_driver_logs` (`id`, `busId`, `driverId`, `startDate`, `endDate`, `created_at`, `updated_at`) VALUES
(2, 28, 5, '15-06-2020', '31-01-21', '2021-01-31 09:58:48', '2021-01-31 09:58:48'),
(3, 24, 2, '13-02-21', '31-01-21', '2021-01-31 10:00:08', '2021-01-31 10:00:08'),
(4, 1, 3, '12-02-2020', '31-01-21', '2021-01-31 10:39:37', '2021-01-31 10:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `bus_service_logs`
--

CREATE TABLE `bus_service_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `busId` int(11) NOT NULL,
  `dateOfService` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` double NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serviceLog` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bus_service_logs`
--

INSERT INTO `bus_service_logs` (`id`, `busId`, `dateOfService`, `cost`, `reason`, `serviceLog`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, '15-01-2021', 700, 'Sit Maintenance', 'minor service', 'GEC', '2021-01-28 12:39:15', '2021-01-28 12:39:15');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `driver_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `license` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(111) COLLATE utf8mb4_unicode_ci NOT NULL,
  `experience_year` double NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `driver_name`, `license`, `address`, `phone`, `experience_year`, `created_at`, `updated_at`) VALUES
(1, 'Rakib Mahmud', 'Li-723423', 'Muradpur, Chittagong', '01815403333', 3, '2021-01-28 12:03:25', '2021-01-31 04:23:31'),
(2, 'Hakim Ziach', 'Li-821834', 'GEC, Chattogram', '01733455325', 4, '2021-01-30 04:12:11', '2021-01-31 04:25:39'),
(3, 'Zalatan Ibrahimobich', 'Li-554773', 'Raozan, Chittagong', '01829427019', 6, '2021-01-30 04:12:59', '2021-01-31 04:23:44'),
(5, 'Hasan Alam', 'Li-634534', 'Modina Tower, 8 no road', '01874532626', 4, '2021-01-31 03:08:03', '2021-01-31 04:23:53'),
(6, 'Razu Ahmed', 'Li-454369', 'Onnanna Abasikh, Ctg', '01833455325', 1, '2021-02-01 02:00:42', '2021-02-01 02:01:09'),
(7, 'Kamal Uddin', 'Li-89979', 'Pahartoli, CUET', '01733455325', 5, '2021-02-01 23:32:15', '2021-02-01 23:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_01_28_103109_create__buses_table', 1),
(5, '2021_01_28_104511_create_drivers_table', 2),
(6, '2021_01_28_105500_create_bus_drivers_table', 3),
(7, '2021_01_28_110401_create_bus_driver_logs_table', 4),
(8, '2021_01_28_111128_create_bus_service_logs_table', 5),
(9, '2021_02_01_110119_create_notifications_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `channel` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entry_id` int(11) NOT NULL,
  `pulse` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oxygen` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `temperature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_button` tinyint(1) NOT NULL DEFAULT 0,
  `robery_button` tinyint(1) NOT NULL DEFAULT 0,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `channel`, `entry_id`, `pulse`, `oxygen`, `temperature`, `emergency_button`, `robery_button`, `latitude`, `longitude`, `date`, `created_at`, `updated_at`) VALUES
(1, '1293855', 51, '36', '92', '90.38', 0, 0, '', '\r\n\r\n', '2021-02-02T08:19:07Z', '2021-02-09 03:28:41', '2021-02-09 03:28:41'),
(2, '1293855', 52, '0', '0', '90.38', 0, 0, '', '\r\n\r\n', '2021-02-02T08:19:31Z', '2021-02-09 03:28:45', '2021-02-09 03:28:45'),
(3, '1293855', 53, '173', '93', '90.38', 0, 0, '', '\r\n\r\n', '2021-02-02T08:20:31Z', '2021-02-09 03:29:02', '2021-02-09 03:29:02'),
(4, '1293855', 54, '0', '0', '90.38', 0, 0, '', '\r\n\r\n', '2021-02-02T08:20:48Z', '2021-02-09 03:29:04', '2021-02-09 03:29:04'),
(5, '1293855', 55, '0', '0', '90.38', 0, 0, '', '\r\n\r\n', '2021-02-02T08:21:07Z', '2021-02-09 03:29:23', '2021-02-09 03:29:23'),
(6, '1293855', 56, '0', '0', '90.38', 0, 0, '', '\r\n\r\n', '2021-02-02T08:21:29Z', '2021-02-09 03:29:26', '2021-02-09 03:29:26'),
(7, '1293855', 57, '0', '0', '90.38', 0, 0, '', '\r\n\r\n', '2021-02-02T08:21:55Z', '2021-02-09 05:23:53', '2021-02-09 05:23:53'),
(8, '1293855', 58, '0', '0', '90.38', 0, 0, '', '\r\n\r\n', '2021-02-02T08:22:19Z', '2021-02-09 05:24:00', '2021-02-09 05:24:00'),
(9, '1293855', 59, '0', '0', '90.38', 0, 0, '', '\r\n\r\n', '2021-02-02T08:23:21Z', '2021-02-09 05:25:48', '2021-02-09 05:25:48'),
(10, '1293855', 60, '0', '0', '90.38', 0, 0, '', '\r\n\r\n', '2021-02-02T08:23:43Z', '2021-02-09 05:25:50', '2021-02-09 05:25:50'),
(11, '1293855', 61, '49', '82', '90.38', 0, 0, '', '\r\n\r\n', '2021-02-02T08:24:02Z', '2021-02-09 05:57:13', '2021-02-09 05:57:13'),
(12, '1293855', 62, '0', '0', '90.38', 0, 0, '', '\r\n\r\n', '2021-02-02T08:24:23Z', '2021-02-09 05:57:16', '2021-02-09 05:57:16');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$nQ.J0QlWLynYZOTtZdtePOWSUycOzU1riUXXTBcwUUAXyphSjK5F2', NULL, NULL, NULL),
(2, 'helal', 'helal@gmail.com', NULL, '$2y$10$ERa8sQ9llDOFt6kU46CwB.hPklABMxxgp8fq1P1hCZDFIMTlDvWWm', NULL, '2021-02-07 09:20:30', '2021-02-07 09:20:30'),
(3, 'sultan', 'sultan@gmail.com', NULL, '$2y$10$eRXFZYmvKF2KHvJTMc1ssuKsJ/iv8QKJ/yqEeD65eHrA8MqkTOI4S', NULL, '2021-02-09 08:57:50', '2021-02-09 08:57:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus_drivers`
--
ALTER TABLE `bus_drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus_driver_logs`
--
ALTER TABLE `bus_driver_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus_service_logs`
--
ALTER TABLE `bus_service_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `bus_drivers`
--
ALTER TABLE `bus_drivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `bus_driver_logs`
--
ALTER TABLE `bus_driver_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bus_service_logs`
--
ALTER TABLE `bus_service_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
