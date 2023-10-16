-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 16, 2023 at 02:44 AM
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
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
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
(1, 6, 1, 'Indian Curry', NULL, 'Ingredients:\r\n\r\nFor the Curry Paste:\r\n\r\n2 cloves garlic, minced\r\n1-inch piece of ginger, grated\r\n1 small onion, chopped\r\n1-2 red or green chilies (adjust to your spice preference)\r\n1 tsp ground cumin\r\n1 tsp ground coriander\r\n1 tsp turmeric\r\n1 tsp paprika\r\nSalt to taste\r\n2-3 tbsp water (for blending)\r\nFor the Curry:\r\n\r\n2 tbsp vegetable oil\r\n1 small eggplant, diced\r\n1 bell pepper, diced\r\n1 zucchini, diced\r\n1 cup cauliflower florets\r\n1 can (15 oz) of chickpeas, drained and rinsed\r\n1 can (15 oz) of diced tomatoes\r\n1 can (13.5 oz) of coconut milk\r\n1 cup vegetable broth\r\nFresh cilantro for garnish\r\nCooked rice or naan for serving\r\nInstructions:\r\n\r\nPrepare the Curry Paste:\r\n\r\nIn a blender or food processor, combine all the ingredients for the curry paste. Blend until you have a smooth paste. Add a bit more water if needed to achieve the desired consistency.\r\nCook the Vegetables:\r\n\r\nHeat the vegetable oil in a large, deep skillet or pot over medium heat.\r\nAdd the diced eggplant and cook for 5 minutes, stirring occasionally until it starts to soften.\r\nAdd the bell pepper, zucchini, and cauliflower. Cook for another 5 minutes, until the vegetables are slightly tender.\r\nAdd Curry Paste and Chickpeas:\r\n\r\nStir in the curry paste and cook for 2-3 minutes, stirring frequently to coat the vegetables.\r\nAdd Tomatoes and Coconut Milk:\r\n\r\nPour in the diced tomatoes and coconut milk. Stir well to combine.\r\nAdd the drained chickpeas and vegetable broth. Stir again.\r\nSimmer:\r\n\r\nReduce the heat to low, cover the pot, and let the curry simmer for 15-20 minutes, or until the vegetables are tender. Stir occasionally.\r\nSeason and Serve:\r\n\r\nTaste the curry and adjust the seasoning with salt, as needed.\r\nServe the vegan curry over cooked rice or with naan bread. Garnish with fresh cilantro.\r\nFeel free to adjust the type and quantity of vegetables to suit your preferences. You can also add tofu, tempeh, or other vegan protein sources if desired. Enjoy your homemade vegan curry!', '2023-10-15 20:15:12', '2023-10-15 20:15:12');

-- --------------------------------------------------------

--
-- Table structure for table `listings_1`
--

CREATE TABLE `listings_1` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `tags` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `listings_1`
--

INSERT INTO `listings_1` (`id`, `user_id`, `title`, `logo`, `tags`, `company`, `location`, `email`, `website`, `description`, `created_at`, `updated_at`, `category`, `category_id`) VALUES
(2, 7, 'Ribeye steak', 'logos/U59sBfXeW7QPyFBf2fwIX0XscNqQ7bZGtBG0jlU4.jpg', 'zend, laminas, perl', 'crazy', 'Seattle, WA', 'Sduranowski1@gmail.com', 'www.google.gr', 'Ingredients:\r\n\r\n2 boneless ribeye or New York strip steaks (1 to 1.5 inches thick)\r\n2 tablespoons olive oil\r\nSalt and freshly ground black pepper\r\n2 cloves of garlic (optional)\r\nFresh rosemary or thyme sprigs (optional)\r\nButter (optional)\r\nInstructions:\r\n\r\nPreparation:\r\n\r\nTake the steaks out of the refrigerator and let them sit at room temperature for about 30 minutes before cooking.\r\nPreheat your oven to 400°F (200°C).\r\nSeasoning:\r\n\r\nSeason both sides of each steak generously with salt and freshly ground black pepper.\r\nIf you like, you can also add minced garlic, and fresh rosemary or thyme to enhance the flavor.\r\nSearing:\r\n\r\nHeat a heavy skillet (preferably cast iron) over high heat until it\'s smoking hot.\r\nAdd the olive oil to the skillet and swirl it around to coat the bottom.\r\nCarefully place the steaks in the skillet and sear them for 2-3 minutes on each side until you get a nice brown crust.\r\nFinishing in the Oven:\r\n\r\nIf you want your steak rare, you can skip this step, but if you prefer medium-rare to medium, transfer the skillet with the seared steaks to the preheated oven.\r\nCook in the oven for 4-5 minutes for medium-rare, or longer if you prefer a more well-done steak.\r\nResting:\r\n\r\nRemove the skillet from the oven and transfer the steaks to a plate.\r\nLet them rest for about 5 minutes. Resting allows the juices to redistribute and results in a juicier steak.\r\nOptional Butter Basting:\r\n\r\nIf you like, you can add a pat of butter to the hot skillet and baste the steaks by spooning the melted butter over them.\r\nServing:\r\n\r\nSlice the steak against the grain and serve hot.\r\nFeel free to customize this recipe to your liking and serve it with your favorite side dishes. Enjoy your delicious steak!', '2023-10-12 22:34:36', '2023-10-15 17:26:01', '2', 1);

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_09_12_135749_larabeats_2.0', 1),
(6, '2023_09_25_133746_create_products_table', 1),
(7, '2023_09_25_134010_create_orders_table', 1),
(8, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(9, '2023_10_15_151225_create_categories_table', 2),
(10, '2023_10_15_161754_add_category_to_users', 2),
(11, '2023_10_15_163407_add_category_to_listings', 3),
(12, '2023_10_15_163657_category', 4),
(13, '2023_10_15_170814_category', 5),
(14, '2023_10_15_192920_posts', 6),
(15, '2023_10_15_211055_add_bio_to_users', 7);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL,
  `total_price` decimal(6,2) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `image` varchar(1024) DEFAULT NULL,
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
(5, 'Kaitlin Boyer', 'harvey.durgan@example.org', '2023-10-12 22:07:29', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EkMzZ0CbQS', '2023-10-12 22:07:29', '2023-10-12 22:07:29', 'a barbecue pitmaster and competition BBQ champion. Hailing from Texas, she\'s an expert in the art of slow-cooked, smoky meats. She has won numerous awards for her mouthwatering brisket, ribs, and pulled pork. Her passion for barbecue is evident in her popular YouTube channel, where she shares her smoking and grilling tips.'),
(6, 'Rebeca Jacobs', 'carey56@example.org', '2023-10-12 22:07:29', '$2y$10$XLLdjH37mwTRD3l/EkiKCOfu217h6IKfRN30dw0TPaZBANRkkx.We', '4FLbQPeQPwffFaLJ1eJF2ls8GGBtabV0wIzZWLWgnKQYTbR2qlEuDIki6aTn', '2023-10-12 22:07:29', '2023-10-15 11:56:34', '\"Sushi Sensei,\" is a renowned sushi master with a lifelong dedication to the art of sushi. With three generations of sushi chefs in his family, she combines traditional Japanese techniques with a modern twist. She owns a famous sushi bar in Tokyo, where his omakase menus are highly sought after by sushi enthusiasts worldwide.'),
(7, 'Simon', 'sduranowski1@gmail.com', NULL, '$2y$10$xUcyZpLMnzdExdMqaCth/./NQHfrd03AIqdb2oKBXCmmlwZDJoL/a', NULL, '2023-10-12 22:32:48', '2023-10-15 22:41:54', 'Simon is a classically trained French chef with over 20 years of experience in fine dining. He honed her skills at Michelin-starred restaurants in Paris before opening her own acclaimed bistro in New York City. Her signature dishes combine French techniques with locally sourced ingredients, creating a culinary experience that\'s both elegant and approachable.');

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listings_1`
--
ALTER TABLE `listings_1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_id` (`category_id`),
  ADD KEY `listings_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
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
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `listings_1`
--
ALTER TABLE `listings_1`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `listings_1`
--
ALTER TABLE `listings_1`
  ADD CONSTRAINT `listings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
