-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 17, 2023 at 05:16 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `larablog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Vegeterian dish', '2023-10-15 15:11:12', '2023-10-15 15:11:12'),
(2, 'Fish', '2023-10-15 16:35:57', '2023-10-15 16:35:57'),
(3, 'Beef steak', '2023-10-15 16:54:30', '2023-10-15 16:54:30');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `listings`
--

CREATE TABLE `listings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `listings`
--

INSERT INTO `listings` (`id`, `user_id`, `category_id`, `title`, `logo`, `description`, `created_at`, `updated_at`) VALUES
(1, 7, 1, 'Jackfruity pasta', NULL, 'a really incredible one', NULL, '2023-10-17 12:49:32'),
(11, 5, 2, 'Cod steak', NULL, 'wild-caught', '2023-10-17 11:25:06', '2023-10-17 11:30:12'),
(12, 7, 1, 'cucumber pizza', NULL, 'a very healthy and non-diary pizza', '2023-10-17 12:08:45', '2023-10-17 12:08:45'),
(13, 7, 3, 'Angus medalions', NULL, 'an english specials', '2023-10-17 12:30:57', '2023-10-17 12:30:57'),
(15, 7, 2, 'tuna and trout', NULL, 'crazy combo', '2023-10-17 12:51:45', '2023-10-17 12:51:45'),
(16, 10, 1, 'just some watermelon', NULL, 'very hydrating', '2023-10-17 12:59:34', '2023-10-17 12:59:34'),
(17, 1, 2, 'handroll', NULL, 'a lovely japanese snack', '2023-10-17 13:09:20', '2023-10-17 13:09:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_12_135749_larabeats_2.0', 1),
(6, '2023_10_15_170814_category', 1),
(16, '2023_10_16_101605_listings', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bio` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `bio`) VALUES
(1, 'Rosalia Koss Sr.', 'carolanne85@example.net', '2023-10-12 22:07:29', '$2y$10$qLes.wknSGkuP2S6hGJG9.d05fR0Xv7r3jZlykbdMRerTgtTOa0ky', 'Q4z1Vxx5if', '2023-10-12 22:07:29', '2023-10-15 11:54:52', 'an amazing cook! Her pasta is purely incredible!'),
(2, 'Prof. Odie Stamm MD', 'ckoepp@example.net', '2023-10-12 22:07:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FQeGz5dTyf', '2023-10-12 22:07:29', '2023-10-12 22:07:29', 'Odie is a home cook whose culinary skills have gained a massive following on social media. He\'s a self-taught enthusiast who shares her passion for cooking through her blog and YouTube channel. Odie\'s relatable approach and delicious, budget-friendly recipes have made her a go-to source for home cooks looking to impress their friends and family.'),
(3, 'Brody Boehm', 'ztorphy@example.net', '2023-10-12 22:07:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'uXhBbx1mZY', '2023-10-12 22:07:29', '2023-10-12 22:07:29', 'Brody is a master of the sweet arts, specializing in pastry and desserts. He trained at the world-famous Le Cordon Bleu in Paris and has worked in prestigious patisseries in France. His creations, from delicate macarons to decadent chocolate cakes, are works of art. Andre\'s confectionery boutique in London is a destination for those with a sweet tooth.'),
(4, 'Helen Grant', 'winifred97@example.com', '2023-10-12 22:07:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2lRERzElR4', '2023-10-12 22:07:29', '2023-10-12 22:07:29', 'Helen is a plant-based culinary artist known for her innovative vegan creations. She\'s a graduate of the Culinary Institute of America and has worked in top vegan restaurants worldwide. Mia\'s dishes are celebrated for their creativity, flavor, and commitment to sustainability. Her cookbook, \"Green Gastronomy,\" has inspired many to embrace a vegan lifestyle.'),
(5, 'Kaitlyn Boyer', 'harvey.durgan@example.org', '2023-10-12 22:07:29', '$2y$10$8k3ylSi/DCIhVQFb3kwLQuDsxOiUj4iLipwkcau8FkD/SBmUr5jJS', 'dTaMRVVFlnsXzbXpr7GxAh2vlmSkap1qgbMk8aCfWwDp0TH22wV0x4b7K0Co', '2023-10-12 22:07:29', '2023-10-17 11:38:45', 'a barbecue pitmaster and competition BBQ champion. Hailing from Texas, she\'s an expert in the art of slow-cooked, smoky meats. She has won numerous awards for her mouthwatering brisket, ribs, and pulled pork. Her passion for barbecue is evident in her popular YouTube channel, where she shares her smoking and grilling tips.'),
(6, 'Rebeca Jacobs', 'carey56@example.org', '2023-10-12 22:07:29', '$2y$10$XLLdjH37mwTRD3l/EkiKCOfu217h6IKfRN30dw0TPaZBANRkkx.We', '4FLbQPeQPwffFaLJ1eJF2ls8GGBtabV0wIzZWLWgnKQYTbR2qlEuDIki6aTn', '2023-10-12 22:07:29', '2023-10-15 11:56:34', '\"Sushi Sensei,\" is a renowned sushi master with a lifelong dedication to the art of sushi. With three generations of sushi chefs in his family, she combines traditional Japanese techniques with a modern twist. She owns a famous sushi bar in Tokyo, where his omakase menus are highly sought after by sushi enthusiasts worldwide.'),
(7, 'Simon', 'sduranowski1@gmail.com', NULL, '$2y$10$xUcyZpLMnzdExdMqaCth/./NQHfrd03AIqdb2oKBXCmmlwZDJoL/a', NULL, '2023-10-12 22:32:48', '2023-10-15 22:41:54', 'Simon is a classically trained French chef with over 20 years of experience in fine dining. He honed her skills at Michelin-starred restaurants in Paris before opening her own acclaimed bistro in New York City. Her signature dishes combine French techniques with locally sourced ingredients, creating a culinary experience that\'s both elegant and approachable.'),
(8, 'bogus gateway', 'contact.qco2@gmail.com', NULL, '', NULL, '2023-10-16 09:05:28', '2023-10-16 09:35:50', 'hey whatsup food enthusiasts'),
(9, 'gigi l\'esperanza', '1111@2222.com', NULL, '$2y$10$ew1CvX0rFfnakiEdaCw6vecnySFhNfGCQDr5nH5FLsnT7vdAJJ9BK', NULL, '2023-10-17 11:45:27', '2023-10-17 11:45:27', 'a passionate creator'),
(10, 'tt l\'ambretta', '1111@3333.com', NULL, '$2y$10$pQ2PaJXbZ0m5oxx.uK6e..OAa7kc.oicNce1Gh9PRt3hhsNojD4jC', NULL, '2023-10-17 12:54:28', '2023-10-17 12:54:28', 'i love foood like for real');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `listings`
--
ALTER TABLE `listings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `listings_user_id_foreign` (`user_id`),
  ADD KEY `listings_category_id_foreign` (`category_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `listings`
--
ALTER TABLE `listings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `listings`
--
ALTER TABLE `listings`
  ADD CONSTRAINT `listings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `listings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
