/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50711
Source Host           : 127.0.0.1:3306
Source Database       : geekpot

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-09-03 22:49:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for lookups
-- ----------------------------
DROP TABLE IF EXISTS `lookups`;
CREATE TABLE `lookups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `endpoint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of lookups
-- ----------------------------
INSERT INTO `lookups` VALUES ('1', '/register', 'POST', 'This endpoint is used to register members. After registration, you will receive an email with yout api_key and api_secret. Both neede to \n                get your access token', 'user', '2016-09-03 22:24:53', '2016-09-03 22:24:53');
INSERT INTO `lookups` VALUES ('2', '/authenticate', 'POST', 'You must pass your api_secret and your api_key to receive your token. Only then you can access another methods ', 'user', '2016-09-03 22:24:53', '2016-09-03 22:24:53');
INSERT INTO `lookups` VALUES ('3', '/lookup', 'POST', 'You must pass your api_secret and your api_key to receive your token. Only then you can access another methods ', 'user', '2016-09-03 22:24:53', '2016-09-03 22:24:53');
INSERT INTO `lookups` VALUES ('4', '/admin/users', 'GET', 'If you are admin, you can see all the details of all users', 'admin', '2016-09-03 22:24:53', '2016-09-03 22:24:53');
INSERT INTO `lookups` VALUES ('5', '/admin/users/{userId}', 'PUT', 'The admin user can update all data of users', 'admin', '2016-09-03 22:24:53', '2016-09-03 22:24:53');
INSERT INTO `lookups` VALUES ('6', '/users/{id}/suspend', 'POST', 'Endpoint used to admin suspend the access of any user', 'admin', '2016-09-03 22:24:53', '2016-09-03 22:24:53');
INSERT INTO `lookups` VALUES ('7', '/users/{id}/', 'DELETE', 'Endpoint used to admin delete any user', 'admin', '2016-09-03 22:24:53', '2016-09-03 22:24:53');
INSERT INTO `lookups` VALUES ('8', '/users-deleted', 'DELETE', 'Endpoint used to list all deleted user', 'admin', '2016-09-03 22:24:53', '2016-09-03 22:24:53');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2016_09_03_063241_create_sessions_table', '1');
INSERT INTO `migrations` VALUES ('2016_09_03_193632_create_lookup_table', '1');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiration_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('9aaa6660-723e-11e6-9e07-43c9ea0ec3bf', '76f31220-723e-11e6-b06e-074876b08668', 'Adzjl2EuZbHVWFkWv3BmmUGHDOXbeiOwJ0km5UEv3iRHuoc8Zc', '2016-09-03 22:43:23', '2016-09-03 22:26:28', '2016-09-03 22:28:23');
INSERT INTO `sessions` VALUES ('fb9ade10-723e-11e6-9434-2741bd72bcbd', '5c958ce0-723e-11e6-b602-a709c3f82123', 'M9eHO63pNY9ys6rfgEayR4Dzi4ByNcg0nOCMHgiILlmL48gAyP', '2016-09-03 22:58:16', '2016-09-03 22:43:12', '2016-09-03 22:43:16');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `api_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `api_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('5c958ce0-723e-11e6-b602-a709c3f82123', 'Admin', 'admin@test.com.br', '$2y$10$XkO/tTLLDNXdL.58mHjug.Kp82ab/WYMNdu59CpsfYmC1mPmjp6.C', 'admin', 'vPhn52wH9oof7o6p7OT75NqYvMVoMI39ymjpZMlgz1tcMjK9WB', 'Qwqnv1vh2f9iRZfcMeaew4qB7wIdTEbLMqqjoNvFAZUYKFvkUL', '1', '2016-09-03 22:24:45', '2016-09-03 22:24:45');
INSERT INTO `users` VALUES ('5ca23ab0-723e-11e6-b179-53a1b2e304a5', 'Catioro', 'catioro@ouro.com', '$2y$10$MbUKs5l2nD4POZSvHlc4Q.8fat7PG0srefkzWCFEA.CSCb0On2oKu', 'admin', '0RJy6MNbHXcOc9u2jp4o5wGO8FBKhtTu4SxwvSW9FBbZ8bodk8', 'TDNWgqk5NTZKc0da2ucsXASZEkrEJ2E9lmoqeUcQWpBGyu6b3X', '0', '2016-09-03 22:24:45', '2016-09-03 22:38:48');
INSERT INTO `users` VALUES ('5cb909e0-723e-11e6-884f-2de812e9bde4', 'Cristal Kunde', 'reilly.jayda@example.org', '$2y$10$2pe77oRQG/5EbvGOvvhhI.JVWMJ.ysRlSJTa1CUe79Koe1zdTxLXe', 'user', 'WY1dGtMkCtNU9lqa52HNmUo260rSIQ8hyAZXC4mH6hAkqpCL5c', 'TEaG4Uq1SN005cZH8WFESXDy7pG2FjWwbGIOmyl5jjTJEhR60Q', '2', '2016-09-03 22:24:45', '2016-09-03 22:24:45');
INSERT INTO `users` VALUES ('5cc5b500-723e-11e6-b6b0-29a9e3a817b2', 'Mr. Prince Stroman I', 'xbeer@example.net', '$2y$10$ASdfjfJIbdVQJ2bg03EGzeSyMKqpp82W7NOhbBbwr6YZVIavJVv/m', 'user', 'kWuvYRcjN7q8VtI4BT8k4c5rVdBDAuCnP0mPxq9HlYnOa34sr1', '6Z1yaDOcFJiCRpbHrFWZSd4CjdoJC2XUVctyoT5fGlvKUHrvTo', '2', '2016-09-03 22:24:45', '2016-09-03 22:24:45');
INSERT INTO `users` VALUES ('5cd24560-723e-11e6-b7fd-6f6f0975095e', 'Prof. Titus Von', 'miller.shane@example.com', '$2y$10$8Ndd6nq9K/z3xE0Fy4Y3de2SmHgBeqU5HJgK7HKKS7i1gtwIMofxW', 'user', 'sQ4zc6e71K9z8YtEgsf52XtCZU2wcg97BOlmeLfiaa6z0NW9iW', 'f7iYxjZGJ68Dmry55IAWn4ImfDzlYcxpDLo0ZJpHdnsP3hti0d', '0', '2016-09-03 22:24:45', '2016-09-03 22:24:45');
INSERT INTO `users` VALUES ('5cdeb800-723e-11e6-9569-b50b351fe2cd', 'Prof. Jordy Predovic MD', 'rath.baylee@example.com', '$2y$10$VuPVAYTTdybp1Xu95QhhG.RAJTJ5X2UCSgOO.4ibsE2IlLXw.XLlq', 'user', 'FncnyDYS11ARUisvYfutzTh6tnMflYT9MetltgshHeatdxviQC', 'YT8hc9jqPb31e09mLPmj42PT70V9yD2MGzO2pyZrPgSPQLHqJQ', '2', '2016-09-03 22:24:45', '2016-09-03 22:24:45');
INSERT INTO `users` VALUES ('5ceb1a00-723e-11e6-a8ba-35da4f0d060e', 'Prof. Jacklyn O\'Connell MD', 'bruen.dovie@example.net', '$2y$10$IEWKh152UhhXtO2kWcErXuXJjFaVmt52GofU1maSmOTlsMY2SWLIS', 'user', 'O7o7aa7TiP2FFVXumy7wtF3kg7QnbRmxFamJZpnYBUJSW8eyW1', 'mpSPivQVqvc43USseOo6ZM4fmm0BB8guj8iat8awiYJ2Oi66K2', '2', '2016-09-03 22:24:45', '2016-09-03 22:24:45');
INSERT INTO `users` VALUES ('5cf783c0-723e-11e6-89b1-f50edaba9d93', 'Mr. Devyn Paucek PhD', 'shakira.raynor@example.net', '$2y$10$.XwW2s9BANEuqG6x/gShV.4HoDy/audw9Xn8xgye3DTjTvj6OvzL.', 'user', 'zGRcqUQev8bsyHBgQo7IFtbmAf1p9mcuXFWI9l1HhITlRMrytL', '5kKMh4093i10drgA7SrvNpq0MGRaVRT6zHk7kbEA9oayd3TS1k', '2', '2016-09-03 22:24:45', '2016-09-03 22:24:45');
INSERT INTO `users` VALUES ('5d03fd40-723e-11e6-8142-590dc5c15bb2', 'Maverick Reinger Sr.', 'ahodkiewicz@example.com', '$2y$10$8EfN/2Cno24zi3JvpaXFxO7T5mUmKcAZRek41A7peXoJqTtSiNJg.', 'user', 'RcAPU5i7t4qJxKvdfbBIwg0h5MgW4awbJJM0HVbVU1IsyaD9Gz', 'VqR2m8vqBCk1Tyrgz6vLghDT0DlxZxBx4BeysV7W6PEvvhmY5I', '1', '2016-09-03 22:24:45', '2016-09-03 22:24:45');
INSERT INTO `users` VALUES ('5d107380-723e-11e6-ac6e-5157c8fb34c6', 'Prof. Helga O\'Kon Sr.', 'graham.amari@example.com', '$2y$10$YWbgls7zXZqFDuU4e5nUBuN.pTxnTZDAtYFY1/SoTtXliswNPkQtO', 'user', 'Z4CS5HGxWApEUaZIS0HJ6hzcDMYFChFzvSiOmOdlDsG93m1oJJ', 'mzPOMIpw7iaDZufq6LrZmCzf3ut4DKPW1HG4o4OwLGTiTOEDf5', '0', '2016-09-03 22:24:45', '2016-09-03 22:24:45');
INSERT INTO `users` VALUES ('5d1cf890-723e-11e6-a83b-614b68c12a32', 'Brendan Schaefer', 'jennie87@example.org', '$2y$10$ELpc/ErTHe1FGjVzYqhxuuNskDSsGEcriBY0MhtUu1G//GaQxP1ie', 'user', 'zG3xq5TyccrDnXtJxvGGLOQYZ3N0tvSWkeZaOz1HZN61GFaHG5', 'OipMoYxx01JD2nsA3BxGERpgoBG4dG1dJBxUNezrXvWhSIFu2g', '0', '2016-09-03 22:24:45', '2016-09-03 22:24:45');
INSERT INTO `users` VALUES ('5d291300-723e-11e6-87ce-83a927016502', 'Arlo Barton', 'qabbott@example.com', '$2y$10$F7YWuNt4dukmvNEwb4hWEOsaefuTtFaT3OZ64BVPlnML6lHGj8i76', 'user', 'oVqgcBENCLpZjkgGyjnvw7UxkyUfmxn5fTARGpPpoz7ED19kkk', 'XvgRHWaJunTXMlj1zg2jLcBrJNHJDoPAsmrBsxeW14quxgGfCl', '1', '2016-09-03 22:24:45', '2016-09-03 22:24:45');
INSERT INTO `users` VALUES ('5d359bc0-723e-11e6-a782-637dc3933f18', 'Price Stiedemann DVM', 'johnston.isabelle@example.net', '$2y$10$QkjuBmlwLd1CGXo4C0MfeuKrM.ybkGaAkgmxRfvt9Om82SUAV1C8G', 'user', 'Ebycy78d67pLxYKu0bd4Pnjl1E1dFKcsZhAz8XrtWuDAbk6dZG', 'K5ZrTLwYsn8nqnTt1GDJB3n5nfugLOnMVtNOgsG6TOd1QIIXAu', '0', '2016-09-03 22:24:45', '2016-09-03 22:24:45');
INSERT INTO `users` VALUES ('5d420ef0-723e-11e6-ac44-eb2eba1386e6', 'Kariane Heidenreich', 'rhettinger@example.net', '$2y$10$9YJxy9WsCyirM/6BbXjEKufT1A7J3aIkGwSHNe/3jlJ3t7PbT7W4y', 'user', 'S0eLXd1eN6ZPC2Pvt0SMOFNdwJHl8bI3bQDgPrJAzk1VSwkNgB', 'i4z1ZkSA6To5UYHqqiPwASuNRyCIWYEtPNZUnbwcLAlr4utfeg', '2', '2016-09-03 22:24:46', '2016-09-03 22:24:46');
INSERT INTO `users` VALUES ('5d4e2870-723e-11e6-b9b6-990d0a3dbda7', 'Dr. Antone Schowalter Jr.', 'ogulgowski@example.org', '$2y$10$xOuOaz45c10ta16k/Zie4eRW4DwVqHVgIChIgZmqxY1IBaD7pd3q2', 'user', 'tan2TgCX3qW0SbkJYkn8ecCUurwJfcC1e6G7RtEHMbHryYckF3', 'ZWUytYDDQSIsTWCobHPGopElZkdeKjcXMIuSitw7YAHwRcCbQO', '0', '2016-09-03 22:24:46', '2016-09-03 22:24:46');
INSERT INTO `users` VALUES ('5d5a4fe0-723e-11e6-871e-7789110de003', 'Mr. Gordon Franecki MD', 'ondricka.felipe@example.com', '$2y$10$9WjBKa3IkQXSyYJ/UvprE.YfMel4bwxhqDOQkThfQY9YjCRZ9ZzES', 'user', 'dxVYS9W4Z9vAr8KPerdIxALv3OZznOVsh7M6yGlbo0e1jDthEp', 'vpHs9yVnE2uu7pMU6UTsmqmMoHFvc3B1kqoZZijluEy8WHzNOn', '1', '2016-09-03 22:24:46', '2016-09-03 22:24:46');
INSERT INTO `users` VALUES ('5d66af00-723e-11e6-95b8-c9d4698a6db9', 'Zita Wisoky', 'aniyah95@example.com', '$2y$10$PSrpONY1wskOXsW/S7i5EuazWPZW/RkfBzsZkusNP/S72xWhIyeLe', 'user', 'rXSudA82oy0jq012qVYCIgYvYaODM0WLd2dGpeC7zVOgQVqhng', '6TpSivwGTNSQBGWzhXnIgqFuXzoL4XPU4cg3wC7a2VOmXoPSM5', '2', '2016-09-03 22:24:46', '2016-09-03 22:24:46');
INSERT INTO `users` VALUES ('5d731c60-723e-11e6-97e2-e323d1c566da', 'Crawford Lang', 'grover.halvorson@example.org', '$2y$10$n9bodtc34qJyjIgIG/BRruHwdCc3A.IBkGvGdyTXnOLJs94ARhBzG', 'user', 'DSH0NXOKXHdN9AWlcoK8eXkWNkm2pWRYLu0tJZkd7Drklq3hgU', 'ZBhhYa5Yv6YJU2a5fGJbvtnt57ecsTuVT1r26TzhNxTEKmT8sc', '2', '2016-09-03 22:24:46', '2016-09-03 22:24:46');
INSERT INTO `users` VALUES ('5d7f8500-723e-11e6-a9d4-3554b7288f0b', 'Christelle Ferry', 'danny71@example.com', '$2y$10$OHxuPEYWSqFJby6qquiLu.8z8W468gOXb3bTYYTazgGaI49NwOTDy', 'user', 'wahUpqvrij684My2egTUbzyYxR1hDDtRN1vmuLO4CdGhO1ylsc', 'Qv2H6QWtRp06jyaJ7Z01YlGsEQxLgVzIQYmkAjjIM1RVHpfq9P', '1', '2016-09-03 22:24:46', '2016-09-03 22:24:46');
INSERT INTO `users` VALUES ('5d8bf7e0-723e-11e6-8f19-513e796f124c', 'Daphne Greenfelder', 'botsford.darlene@example.net', '$2y$10$.L1qpdnZs5HU39mh3X56xucZgTtHyxxdisCaT.0MmRp83mJBvLM6.', 'user', 'ehQ9TU6tN99J8TOdwcR3uEFrr88vKEMkUKGZA2OkMVeCdVoxtc', '9W0M5H04TWOuuH8Tq1mpnwqSdo8WrV9wJYvwqlCV886zXwq2ts', '2', '2016-09-03 22:24:46', '2016-09-03 22:24:46');
INSERT INTO `users` VALUES ('5d989020-723e-11e6-9ac9-0d4639acfed3', 'Abbigail Fritsch', 'hector03@example.com', '$2y$10$inb3xnWsUh5bjuZ41qr.Z.hyC4JDW0pDRKQcxdgtkgXVpCT84xn2.', 'user', 'Bmltg5HeYi0q6PMhZ2xuzD2c0bVvNDNuDbovYQlalWBZKFMPCA', 'UebVxkCAAKL31WustCVmMM10lOLvd0v6dI9hZ5SjOYdvn1oZ5r', '2', '2016-09-03 22:24:46', '2016-09-03 22:24:46');
INSERT INTO `users` VALUES ('5da4e290-723e-11e6-8d79-77f0a6941f9a', 'Joaquin Cronin', 'stoltenberg.alex@example.com', '$2y$10$D9gggGqzpgFxMZoGSJkcu.OLDqqO9j.PqPdfV1yRt6ZTmW07mDuCG', 'user', 'GUvOtRoWBFHZ7blI2cZuCl0UsxtyVo48YAscdzAaVEU7IB0CL2', '7u2iQU9H8TVo6fFnlqiJRapOQEYDebY9OLYZa2JuQGcjiVKWNk', '0', '2016-09-03 22:24:46', '2016-09-03 22:24:46');
INSERT INTO `users` VALUES ('5db15c40-723e-11e6-a877-d52d117212bc', 'Austen Waelchi', 'bayer.julien@example.com', '$2y$10$vTXhzNhaU2hWr5CjOtXUN.69qETekKflD5s40kJzvSzLwEXrhrXd6', 'user', 'DNTxINvoImMWvquIBkTroI94wGWJbuzmoKLiB4NLGLrqNnyq3q', 'CCuy9Z1cMCuhFQh4KgJymnY8q0hdOkA9Edvj4lcUJLRx7CtK2H', '0', '2016-09-03 22:24:46', '2016-09-03 22:24:46');
INSERT INTO `users` VALUES ('5dbda5a0-723e-11e6-88c8-917cb1172029', 'Prof. Santa Zieme', 'reese.gleichner@example.com', '$2y$10$FhzGn2GD3oqgoJE8Ly0lieaw9XTdK4tw5H1.km6gGxzUt4kRHHF2m', 'user', 'hxepmqycmVnGr2ynUQGHadjkA4GY4u1kGwgrfNx9x89i52SEaz', '1ZFSKEN9wHekrsOIsmxjt7psqCJjB0MMkdbg5ck5w7RtgGRVZL', '0', '2016-09-03 22:24:46', '2016-09-03 22:24:46');
INSERT INTO `users` VALUES ('5dc9bbc0-723e-11e6-8611-390749798c25', 'Imelda Howe III', 'arlene.marvin@example.com', '$2y$10$zLSHogikIqTOkiN/uAT3POs88FxXXiXh3bw7hqrUVp7qaV9Hfs4oS', 'user', '7qoJBB1DxChs2Tw9JlmvEZWovUcmvHSN6H0nf7Bpj7jMP2kNxG', 'xr5HZ63l4H6uTDykQlHUpEuffVAa7MFI5foJbR08U4bXIxUnQl', '0', '2016-09-03 22:24:46', '2016-09-03 22:24:46');
INSERT INTO `users` VALUES ('5dd67670-723e-11e6-9793-1d85192c1437', 'Arlo Heaney', 'shyanne.reichel@example.net', '$2y$10$J7hiRymxeyeL/zLGI/FNbuoOVrFprDf5HqX.ll81/gfD5hcF.EK/y', 'user', 'wIib6x1BZB67CNKuB1vVq818GdcdnNgliYu7yXdzZ6Yjqy0Ygg', 'jRsFuLDNROX4QWdzb6UOhSyPLE87AI4MSDxLlPtSWCXu8Ty4DC', '2', '2016-09-03 22:24:47', '2016-09-03 22:24:47');
INSERT INTO `users` VALUES ('5de30350-723e-11e6-9035-dff3b90d224d', 'Dr. Vincenzo Wolf', 'brekke.tyree@example.net', '$2y$10$VDkpKHDX/.VwKdwLiNXDuOF6PM1UI854Bj3RSmsrb8ae/.G6ITKe2', 'user', 'sxjbWFyESVdTGx9vhf7VpGP39uyoGGnJQ8w5008b5bQtZZwvEF', '84qY2KHcPtJz0zmaXZg7nBfkHNO3oiiUcYRkbFDCpIr8wQcMBh', '0', '2016-09-03 22:24:47', '2016-09-03 22:24:47');
INSERT INTO `users` VALUES ('5def6260-723e-11e6-80a9-3561203eff0f', 'Prof. Della Runte', 'bferry@example.com', '$2y$10$1zz9eNEbWfWtbSSvsxZZsOwgF3ArEbmosKKt1xNVFQXtzSJU1acsW', 'user', 'QHEhmR5m04qS8Ln8arV81xwgODBFvDio3zTtOOJXMVHV8oU9pF', 'O5ciKVGWHO1RCx5TIuVJ9Q40AIMEgv9qTpKNsTk7AXDfHObQSU', '2', '2016-09-03 22:24:47', '2016-09-03 22:24:47');
INSERT INTO `users` VALUES ('5dfb7ec0-723e-11e6-bbd1-e758bcb56484', 'Makayla Abernathy', 'ruecker.kayleigh@example.net', '$2y$10$ibqAlKl2z4RWqwt4nR/oQeZgbaBn8fXNOVZLESKVbR3HYQHLs3v1y', 'user', 'G9mmYdNyI2RdgSYCq26puaEjJp6oVvt2hplHiO3bIyUJn8CkpJ', 'VrdfODC9yrvN151AEEgZUMPkLOBUbQ5D9xFX8JGnwKUdyw3BI9', '0', '2016-09-03 22:24:47', '2016-09-03 22:24:47');
INSERT INTO `users` VALUES ('5e081730-723e-11e6-ba63-e97a4ea40ae0', 'Prof. Eldon Ernser Sr.', 'jeanie75@example.com', '$2y$10$bP97OxyS3KyqCIXfsg.uueLKqLWdft2cMWV3kMpgs1Bf0iKFrNsfq', 'user', 'n2gyTVINPIyBr1I81IGbsQaH2DFh5DoGm2FDzMztdh9FqspxBn', '4Ka2L3ne9FbtDVyoBf7qg9t3tMJGp6v0R3ADmN1rXcmTTPo7tU', '2', '2016-09-03 22:24:47', '2016-09-03 22:24:47');
INSERT INTO `users` VALUES ('5e146b60-723e-11e6-b60a-9f646cd84d82', 'Green Quigley', 'scotty.reynolds@example.org', '$2y$10$HLPEmxTrRxSU4WY6SEUu/eOFssPKQeW5HeKoXW0t2tZbRhUF88aPq', 'user', 'IfJSTDTwTXCwTiRjEjsbj52vuPFNNhFNonNCim8ALbq5WWwRTN', 'HEVelXkzinXWNVMvrghVOPBSI3JOyrmVO1weXnHSrBYwRYpCA1', '1', '2016-09-03 22:24:47', '2016-09-03 22:24:47');
INSERT INTO `users` VALUES ('5e208ad0-723e-11e6-894a-53b36f645b9b', 'Armani Jenkins', 'slang@example.net', '$2y$10$dWbgM1DmmJYqID1jPDovAOxjENeFYzexNxBi7Lxz6JZBxhA47w.PO', 'user', 'C5ijXM5zOSarQSCAQ1zEILnRncG1BbeinxalBJicWRXXvmjUD8', 'mtytBRIEg5pOBD1iXwPaNOFPn7LRoVSaqC3SyECi0ilxX8UPJS', '0', '2016-09-03 22:24:47', '2016-09-03 22:24:47');
INSERT INTO `users` VALUES ('5e2cf590-723e-11e6-a766-315a22d452b7', 'Annabell Miller', 'brock06@example.net', '$2y$10$GykU1vDO1FNFSMy8pu7Ftefk8MEhCtwDVoVJXUd1x0Y7ZkxKe.vJK', 'user', '7gd3YASDL1pLHjz7RkFMRYMpbENPQTvvbjsgCEzkUYGZqM3OoF', 'qUheZJKFvnKfybhS6Qkyevcw8jJfzwemBhjN1YsM8UIYoNH2RT', '2', '2016-09-03 22:24:47', '2016-09-03 22:24:47');
INSERT INTO `users` VALUES ('5e3972c0-723e-11e6-baeb-496730cceaca', 'Emma Legros', 'camren80@example.net', '$2y$10$QBHqjKw0metDw00EcywrX.IJBI5t67BpLKWTlXlnqjFvEoG/.cQnK', 'user', 'TqBoToSL9sczUq5VALxrZDHHNf20eTfhKZu6Jfa0sJhoeelnDI', 'r58C33IYpuGbtkOxdCmTAsr9fV5dPNZcl8YeaC2o4SumW4pko6', '2', '2016-09-03 22:24:47', '2016-09-03 22:24:47');
INSERT INTO `users` VALUES ('5e459a10-723e-11e6-a7b5-4d91af2096fa', 'Junior Rice', 'gulgowski.marguerite@example.net', '$2y$10$RJsryiFGJsGDasifHtoCcOn7PJatTUcdDxfIYfb1.4fYsfaSLXShy', 'user', 'sCDRIdx4qI6uriq55o4Jo1ffXE4To65PCCthEpAC0buLkBqlnt', 'saWL4C9PDGbwVOgIecFkP6mviZdEj5f1fbePpfMRMhMKtgLYzg', '2', '2016-09-03 22:24:47', '2016-09-03 22:24:47');
INSERT INTO `users` VALUES ('5e520570-723e-11e6-96e2-21d7ff92df1a', 'Reese Schiller PhD', 'denesik.chloe@example.net', '$2y$10$pnfoGlCKExTASxIdm6w8Qe8zIRyYEsRV02k1Pcq3xD8KmfttWIG3y', 'user', '8agNTHwxdrXXAui03EXIwmhr6Z7gyVPWuA1xUS2Wrtf4lnTom8', 'hjVJvemGHV90X1D8IexUgtArxlHNf5x75NRJ921afmIwHnKCKQ', '1', '2016-09-03 22:24:47', '2016-09-03 22:24:47');
INSERT INTO `users` VALUES ('5e5e78f0-723e-11e6-bb95-8f7c89aa934c', 'Prof. Angelo Zieme', 'macy78@example.com', '$2y$10$nHLL8ieg4fIFAvax4O1ejOQIZM0n3RqCrfJ.Oww2KFlYUB1PUn3z.', 'user', 'fjt9r454VBBgpyVW2y1EZZi7u7pItneAIuCxVAhWr9hvjuoLxw', 'u8ofeTW0Mq84XNzY0J4o33SZeu9KIYLbkkEzEYv7Q2RxKOSd3s', '2', '2016-09-03 22:24:47', '2016-09-03 22:24:47');
INSERT INTO `users` VALUES ('5e6adc00-723e-11e6-b552-c13bbd061fde', 'Meagan Wilderman', 'annabel07@example.net', '$2y$10$sLm7R3opFoadVLpl3r6K8OBhV4gqh1WdtSLMeWyyqu6GQEF6g3Skq', 'user', 'RvLr8XT7fewc7abod3agNT4pJd7LzExEmHV0eEOEN1lKlIHrJ5', 'IvXS521HPOz8kyRPw3Zf15Ms0zDxlE3C67ljS0jrV1z9BKy0f0', '0', '2016-09-03 22:24:47', '2016-09-03 22:24:47');
INSERT INTO `users` VALUES ('5e772a80-723e-11e6-bfc4-6dd532739679', 'Oma Sanford', 'jennifer.wuckert@example.com', '$2y$10$bbRn0M3ntMd7dLhVCWJjguKZtzcyb3CJ8m/1KTTgnQRj4c3qpNtxy', 'user', '8e1qYsFkqEtKzHAviiVVTRhlzd9gtwv7GmiSqG1t4aJwjRWmfX', 'nnWp114xcNXKGXxomajkjpYXsZeS0Q8Bm7loeSmoWIgrMvIIj1', '1', '2016-09-03 22:24:48', '2016-09-03 22:24:48');
INSERT INTO `users` VALUES ('5e835a60-723e-11e6-a5da-73dd187c258b', 'Derrick Nitzsche', 'crystel95@example.com', '$2y$10$dpvKjVJhJ0GGb/c7tektVen1vP7Su68VCXF9UmUt87xkOEn2wdhOy', 'user', 'J55nlokdUezydNJ9kAJSR2kAtTy2aKYJFLo6mlvDWU5A9EctU8', 'GfsWtV8wvZW58Y7mmcFdebrcL98LhYp6bD0j7gkYVh4BHw9Unz', '1', '2016-09-03 22:24:48', '2016-09-03 22:24:48');
INSERT INTO `users` VALUES ('5e8f9ea0-723e-11e6-9d68-7f3f6acc368c', 'Ms. Coralie Rippin', 'hlemke@example.com', '$2y$10$C9KPJ5o9LlApUwUsH4gA6.QHRnM6aSEMML42Q7TGzgn1kQ9aZ5NRi', 'user', '8JEWo5WQTuQaqYFQkNrkjAgHjvhxhtiK6vZaPFbZdaePr5oR4i', 'Zc8Zf1SinuCaryTFPCgxcq1uvfs4qA3mqowdkp2anUlQbR7qsm', '2', '2016-09-03 22:24:48', '2016-09-03 22:24:48');
INSERT INTO `users` VALUES ('5e9c0030-723e-11e6-80e7-9f66d91f3861', 'Mariano Reynolds', 'keaton62@example.com', '$2y$10$V5gu.hz1iituCXfCkstDreFtMQfTFk0AE8.eD9b1VbcVKlcQVcNgi', 'user', 'NGiTx5tnycGtHWYBiR5MQ7LreHFPY8ebmU8uEb0efdOT9IVAoa', 'RVskMMktXaHcoQo6QH29dZW470LhQjm6Pk4VExH3GyLJ2WJxNr', '1', '2016-09-03 22:24:48', '2016-09-03 22:24:48');
INSERT INTO `users` VALUES ('5ea82ce0-723e-11e6-ba64-234445fdd7a8', 'Eunice Pagac IV', 'deckow.zion@example.net', '$2y$10$qEiAr7UQVvZNcye17IeqSOmPgd2nHKd8EfKwyk/HEPdyEFVKlQE82', 'user', 'St9kRIBBehSBxtxZNu3zi43cKg6Gmh1fr014V1BYB0M3wH0qea', 'AnixuuXgaoqxHLzRvFndxpmqrBz9QtNanBIJ9683caJQ83d2xc', '0', '2016-09-03 22:24:48', '2016-09-03 22:24:48');
INSERT INTO `users` VALUES ('5eb48830-723e-11e6-8b3b-85f7eaac11a3', 'Akeem Bashirian', 'mabelle92@example.com', '$2y$10$fnHGC9QxYlnQ3VVn9Zdic.XlAQGClc2ztMU6QZrpoNyi8LLYhhBEm', 'user', 'cOlCsASuPD8Odc3mXdeCz0G3FEEHa7RLlO7emtHrsXnAGbSomN', 'CZdNR5RtH5NmHunE2MlVtPD3WbdMN5g3UL1bUGJNKxshIPykGf', '2', '2016-09-03 22:24:48', '2016-09-03 22:24:48');
INSERT INTO `users` VALUES ('5ec10a80-723e-11e6-a1d0-3557f9df0815', 'Shanny Ryan', 'fritchie@example.com', '$2y$10$lYsbBo5FBqiYlodzt85zlOR3oeQhu6O4IC7AXb8Gegp11pLxK5inq', 'user', 'x6iQD12CW9W492Cxj9LByU56fbdBDtpDh76Z7mIroVKZnaS1cN', 'MQOl9tOpa9OmL7XY2184fPhiWOUdbjsTrvKF0ASSxpbUoPftN7', '2', '2016-09-03 22:24:48', '2016-09-03 22:24:48');
INSERT INTO `users` VALUES ('5ecd6f30-723e-11e6-8e1e-b1e5178b8138', 'Josianne Kub', 'lucious63@example.org', '$2y$10$EsoNZPaDyPX/guOU0Um0Bu1qBeRxbMR6Bd9z0f8seCtAGbUh76mCe', 'user', 'B9jbKlOYyqoTFoFMgHIWDKBdmlh3iE8DshRmCFrUG58cpy7x12', 'iLiV2B5RWWPmLhhkIElIB2iLb8qRCpDM2CTMi4XYHDLVRKUiON', '0', '2016-09-03 22:24:48', '2016-09-03 22:24:48');
INSERT INTO `users` VALUES ('5ed9f920-723e-11e6-b99c-0f862c004f72', 'Prof. Kianna Daugherty', 'dean.schimmel@example.net', '$2y$10$mI3V7xPrdJ8GNxYZUvS1y.FxE5StijUgcVk2YapQIfPBqwNis3/oi', 'user', 'QqTfLHmCrSo33ik9P4yGyEWJTMaIvIIvDn1HvKTy1Hy5WJIBvQ', 'Cjd07f3AKjpOtRNmuJJ11On0Fr5VGTCDCcSTyYl042g4UwGWu2', '1', '2016-09-03 22:24:48', '2016-09-03 22:24:48');
INSERT INTO `users` VALUES ('5ee68870-723e-11e6-80cb-0dfef390e1f8', 'Marc Smitham', 'wisoky.hope@example.com', '$2y$10$O2NnTA2frMhBJve03k39guRBemvbyxrGpcF3XdMWBb3jgJhM26ht.', 'user', 'hPHQLyUTQCjwHmjnvI343ssU59MExdYPueuMV3VFxItgYvATC7', 'FslSn737YlP5lQ0qNVmffxTmvHV5D544z4iQFNJmEyWDgi1DsI', '0', '2016-09-03 22:24:48', '2016-09-03 22:24:48');
INSERT INTO `users` VALUES ('5ef2b000-723e-11e6-b951-0501540cb3a6', 'Melany Strosin', 'carolyne.wisoky@example.org', '$2y$10$lcTeNpZGx9IgKzIoFIQl6.xk2gBZFgSw7DYbRFN4mEIjxfYkXnJhG', 'user', 'ot17OPaWvO6VaZKPvktbjU4JmWynWIuXfJ9frug8wCKYABlxPR', 'mOpa8zGe6cieFdONvTT0MgnoIMlldzxW5AucErECYXOhMg6rKb', '1', '2016-09-03 22:24:48', '2016-09-03 22:24:48');
INSERT INTO `users` VALUES ('5efed4d0-723e-11e6-a928-59172cdfbf1b', 'Milford Considine', 'blanche28@example.org', '$2y$10$GZfVDARWmG2JCb3L8NomROsGC6HzfFC5IWEgT.g9DJ3cZbQZ3PHo6', 'user', 'xs0Je7P5HHkQIeQ44ZEpnvoESmzr5swZqpf9SUzrtyAbfxYTkI', 'D14mFbZWshZJBU3Tc3SmsMU4lo6RFJp7dw0lCIhitHGVmsNvG2', '2', '2016-09-03 22:24:48', '2016-09-03 22:24:48');
INSERT INTO `users` VALUES ('5f0b5f60-723e-11e6-aaf2-f5e64bc13261', 'Loma Koss', 'casper.lisandro@example.net', '$2y$10$bTnBixpoXFtn83BPQJaHwOha7d7b4IFIBdEXuZn0OPg2mXJe0bch2', 'user', '6PTvWOoOiMABJGk6xDoC2CqlIulkIt7JCoEh5oWV4WLrtJ5YLW', '1JnpXm4cLJiIvy0llYg2gqk9iWpyCV0ZmTywQPq9YiUKlXVW7p', '0', '2016-09-03 22:24:49', '2016-09-03 22:24:49');
INSERT INTO `users` VALUES ('5f17c260-723e-11e6-8143-cbb626d78cf3', 'Elouise Zemlak', 'cole16@example.com', '$2y$10$pp5JA82yVJdzv/HVwTLjzuBo4WSf55V8oGbteW0H5p.euo5FZMCGy', 'user', 'oZvjIxDsztMadxVdjjqsoV2Q9Qu3B12iqKrRULBihPkQMD12Mu', '72Lo2lPzTs98yxp1Dtrse6DzDJ5GoKuNSGXHR7lQfY2TWqkERX', '1', '2016-09-03 22:24:49', '2016-09-03 22:24:49');
INSERT INTO `users` VALUES ('5f2428b0-723e-11e6-80ba-3f35b20aa3b6', 'Marcellus Aufderhar', 'heidenreich.dianna@example.com', '$2y$10$R.cFZ4DS0egraCGFQZC3OuocBRXOhf5e80Qkqh8NtfchDGRIfXqiy', 'user', 'dOL3DPgVwjmtIAcSJOSexL6zLmhnQEGqDmSzckuVx0m8jprodd', 'o2AH8qDcI3wtmOQTiBw83ps08NcPqA0hmEsFiW38RUIBFRtG4r', '0', '2016-09-03 22:24:49', '2016-09-03 22:24:49');
INSERT INTO `users` VALUES ('5f30a440-723e-11e6-a0d7-55b2a93f6295', 'Oleta Christiansen', 'jkunde@example.com', '$2y$10$71nhiWNuHLvGcKmsSESFXednh.PhWU02F2372sMfGR2yYgPV46umu', 'user', 'M7twlgUd0zN6GHT2sUTRYuXRnvS8kNI7VsffqRGtgvAauC81WH', 'DYIvuipaDqJoqqJT4uqJRwtClkQzIRqWVKPa0eNP2BIxjaW6LC', '2', '2016-09-03 22:24:49', '2016-09-03 22:24:49');
INSERT INTO `users` VALUES ('5f3d1640-723e-11e6-a962-df799e159107', 'Samantha Stroman', 'reese.fahey@example.org', '$2y$10$BVEDPSwxJUGj.5ZUmyol/Ocnk.u0qQN/7mTRAu0swMZtKQZ6XaS.a', 'user', 'xKpQMaMv5cEBPHsrqUv9Hg89tmFXONmNGjJjLX5hNBMcAInmCe', 'vQOgrvbCdrBZJ3t8dY3XtrLpWy0Hl31VRcgMmKNJoSpGlLPQiN', '1', '2016-09-03 22:24:49', '2016-09-03 22:24:49');
INSERT INTO `users` VALUES ('5f497d50-723e-11e6-b293-7d2443d131db', 'Mariana Medhurst', 'meghan93@example.org', '$2y$10$qnTQnqW1A4VGrXUkZ7WFren1eZtq8.3N9xNcIGxZmUCKrH2d7uALS', 'user', 'QjRgwJ6JeVMYMHyDcup38LztdhgaC3k2APU0GT8uRE7lFa4JUJ', 'Cog3SnZOJUvdFxCYBYUjD9fO8oIGM3IQrm7ThdM4ebZBvUS7bG', '2', '2016-09-03 22:24:49', '2016-09-03 22:24:49');
INSERT INTO `users` VALUES ('5f55e270-723e-11e6-bbd2-ad7a84124855', 'Edyth Breitenberg', 'sierra.hoppe@example.com', '$2y$10$z9G9s06f94xpRd70dm4rZOUaWaO5XzZ5hsVdyntwB1IDz3t0EA7Le', 'user', '0ylnNNiFJxSFSjknyAwRRHA8zxCaFZIqnnA8Mi2XMBOv7fpLwB', 'q3uyiIz5hn3kyCt5HF1mWi34jbqtRpRIy0HobBKs070eMPWGMR', '1', '2016-09-03 22:24:49', '2016-09-03 22:24:49');
INSERT INTO `users` VALUES ('5f623750-723e-11e6-bc0c-cf4c1a45dcc5', 'Deshaun West', 'mcrist@example.net', '$2y$10$.n15uP./ZGN0IYVh/cc84.46SeAJ2Rwq7DIAsxwL765imdhMviUM.', 'user', '7EqMoVd2sEU6uFBT1qGdDnT4iedVbZkgrY6mqVhRLu3QX01V3q', 'aKzRUeuwmkxpzTF95DHUWR1slBJcJ0Xp9QiVK9ulf5yH02ggK7', '1', '2016-09-03 22:24:49', '2016-09-03 22:24:49');
INSERT INTO `users` VALUES ('5f6e8810-723e-11e6-92d4-2170bf4e26c6', 'Prof. Durward Schmidt Sr.', 'hahn.damion@example.com', '$2y$10$UfI3G2rEC/Z/plQT3jIhseRqP5ZsBXwJlHz2kXKfL8Xu2XqYgBiUK', 'user', 'BCrIU6diy7Fya6wKr9X7bVwazNLXIIt4jsc42ig3lXPyH47jla', 'xElQQV0IliyTeHImLhRGKoqgNx7CdJRELXPUHsyB3Hk1Ox2ltC', '0', '2016-09-03 22:24:49', '2016-09-03 22:24:49');
INSERT INTO `users` VALUES ('5f7b4410-723e-11e6-9fd1-916255785ead', 'Dr. Sage Lueilwitz Jr.', 'ebarton@example.com', '$2y$10$0mRjytLdkF5ZDdLbXEBVuuLbecqxtOTSGTFCyru1vJP4kT/APuQ/K', 'user', 'MoRDTkqp3CZb1eqJq5CnQofzTbNEjVWnDLm5CxH8ahIXW7Nr7j', 'THX7IA7rZ082K8z5ViqHooEt7VnQw2kotXyFzU8l1U61q7p1dZ', '2', '2016-09-03 22:24:49', '2016-09-03 22:24:49');
INSERT INTO `users` VALUES ('5f87b3c0-723e-11e6-84cc-1bfc85a54e49', 'Dr. Sofia Ankunding IV', 'vlind@example.net', '$2y$10$F8Kdwm0F8uTjMeG0AQvytOIRbYgO64DOTew4jyjps7fUlEB9A3uTm', 'user', 'c1KOBYvc8UhVo19YStvwSAervNB4aJSe5anzfEsOw7v3HyAwXa', 'pbbk4oZu5yXekv52vGA0qFVkBsXJKlm0bzrSz8ran8wb0W2YWL', '2', '2016-09-03 22:24:49', '2016-09-03 22:24:49');
INSERT INTO `users` VALUES ('5f9427a0-723e-11e6-b158-0baf3f746a46', 'Charlotte Hodkiewicz', 'melyssa65@example.net', '$2y$10$FlDY1FButxZkIgzh5xySwuhWo.uFkob5ZRQnyx7F6MCjUfgp.LRq6', 'user', '4A9QoDdKOyRfsIFL2d6D12sB4eZX7HMq1ZQdbqphfCPuIuDsNH', 'Yp9AYJcj7fBqGXRAGs1sjijBsmTquHnOQ0ts9SAwAffpNm76Ge', '1', '2016-09-03 22:24:49', '2016-09-03 22:24:49');
INSERT INTO `users` VALUES ('5fa08a80-723e-11e6-a1d4-4b048716e650', 'Prof. Clemens McCullough', 'lterry@example.org', '$2y$10$MeWKkBYN9GpHiDQuUZQXhujBbF1AOvs0tYeXk6tN6tdjndMNeTfe.', 'user', 'S4vfIvec54BLixLWh6QgAPstz8NP4S6jNu9uCtfptGbPwHbX5H', 'SZnSbucpfE1KFjQqey2g26jkrqZanCidnPWhR7U15Cu8BIUZDp', '2', '2016-09-03 22:24:50', '2016-09-03 22:24:50');
INSERT INTO `users` VALUES ('5fad0280-723e-11e6-9d68-8f9df1d079c8', 'Mrs. Mazie Durgan', 'rpagac@example.net', '$2y$10$pPCXV4rHhJYNokE51CPVnevpzx2ILkgz4PHzUmU7m6HZYFOauHzsC', 'user', 'vnZGdXzzgCSST018WOiPRJCNcQyHlGJsmYOSZ9UirwTUHAZeAY', 'T42Biz96hCCrUs36etKvk3pUnPwMzi4U40LPfupa9SgqYScFTd', '1', '2016-09-03 22:24:50', '2016-09-03 22:24:50');
INSERT INTO `users` VALUES ('5fb947e0-723e-11e6-bd0a-3d3309a697a7', 'Dr. Lavonne Herman Sr.', 'wiegand.ola@example.org', '$2y$10$YiPU.xjeLN6HBsn94JzZGe6tRnNQQFb3TIk9xbevrIW8nIDNuGX0y', 'user', 'Y7QMkUoPOHJ2DcCMpYKkNpCV46w7RTnKYOSHqpkM3PbQF5Eexi', 'uJ21vmsHfTRHrpUSMs1o9mVZBURz5Z85g1jgVUYQ8dRRNciTSz', '1', '2016-09-03 22:24:50', '2016-09-03 22:24:50');
INSERT INTO `users` VALUES ('5fc5ca40-723e-11e6-b1cb-07d720318d82', 'Louvenia Fahey', 'ceasar33@example.org', '$2y$10$XntS6BLvAyFV3IzMOjvBLeRzmTHX7B8c4Pt8GaiPtla4CE8qbZonG', 'user', 'mgpCCzHjsS2LCFvRhySpIOQPAkf0wJVuQELk4Zs8W4U9UvDDfp', 'Al6UH0JfNrXRCefqjjpwWPhwIkSE9S9ifGCKCZEZhBWuAvOwJO', '1', '2016-09-03 22:24:50', '2016-09-03 22:24:50');
INSERT INTO `users` VALUES ('5fd23fc0-723e-11e6-9fe3-e5d593538e8b', 'Dr. Katarina Heidenreich PhD', 'schoen.novella@example.com', '$2y$10$Joq.xIxR.yC4FQb77TTlfeLTR9iXvAmYxOi3YOkwSt7uvR0DoWp3u', 'user', 'majM7Cwvl4daKi009ZCiSQEcznyOIirNpXcGNCBpQYLKxpApOe', 'LvfvjyubhZ14Zv38hDmcfXkiHx1SDITA7wHwKEhAPGBfaxdMsE', '0', '2016-09-03 22:24:50', '2016-09-03 22:24:50');
INSERT INTO `users` VALUES ('5fde66e0-723e-11e6-8817-e5beacde801a', 'Reta Nolan', 'senger.darrell@example.org', '$2y$10$iEbgxWTsZ7xzfsPP1zKNVu1B3f9m5PdGlB32L6tUOmZbYfTvU0bOm', 'user', 'fhe9AnayFiZh1L5TuJnv7ZPAIYe5TNRgT1kzOY46RS2o8ywTdE', 'FCqv6H08GGeGA4NYuj1Y73xijazeIw5V1Y38WeRMIJU0tNpSTt', '0', '2016-09-03 22:24:50', '2016-09-03 22:24:50');
INSERT INTO `users` VALUES ('5fea9080-723e-11e6-83cc-597db03ce711', 'Dr. Conner Donnelly PhD', 'zdouglas@example.net', '$2y$10$FC25U9oPcA3.bQ5QQaOfnOKF8XKJahkp6oM65M2umTbnj8Z5zIYpa', 'user', '8BcAuIGrjgZzbfQnNfoGNJ25IaUUpvfKrNfMywfMbmfhwhQGqd', 'qqAOkoudgr9k9ax4Q6IMdou8zHmj0wuICc9qY7tpVlgw6hWULL', '1', '2016-09-03 22:24:50', '2016-09-03 22:24:50');
INSERT INTO `users` VALUES ('5ff6b0f0-723e-11e6-8269-fb68d937147f', 'Dr. Neha Kuphal Jr.', 'rkris@example.net', '$2y$10$Fb.DUTTqHnkJprl.Z1DPyeYvhHgpxlP0mbanUZAcvOkMmIcdDNDTa', 'user', 'Sz7Eb3e3dSd39aNSgmFryJRVnK04LxI4qRgHwqE6Io9h8UnWkT', 'EMudvbl0KqN42fB9lHGFFYjEKBVMaiOmDHron9ad9KMj9iOpI6', '0', '2016-09-03 22:24:50', '2016-09-03 22:24:50');
INSERT INTO `users` VALUES ('60031580-723e-11e6-ba57-01a26a9d59d1', 'Era Aufderhar', 'upagac@example.net', '$2y$10$i.LNG0oUFUHvvZmNzn5lguMNxVaDf7Czn.KX2hec6kOHORjXS66Ne', 'user', 'LMzZbjTDAod8TU6bC0BkKQlmveyBR3Y3nM63RPmd8gNdRs9n34', 'VMz7mqG0JnqMQ7ADorl3CqhfEfrJu6YIC7nALMZ5NnwNakGN3x', '1', '2016-09-03 22:24:50', '2016-09-03 22:24:50');
INSERT INTO `users` VALUES ('600f7370-723e-11e6-9b24-1bab2bfb8401', 'Eveline Willms DVM', 'clay71@example.com', '$2y$10$bQna8lUTv4PqYJJJ5uIfxuSR3MUSsj10NGgAN31QhSLqYzpQokz1O', 'user', 'K2h7hrxZgcIWYhQrDOYvyGHjJabAPYB0MdUiRXRbANdnX491Ai', '4Npt4cwhbniruoLojo19xv9oFqjZ9EHTM2I7qcKihjYVIICZMQ', '2', '2016-09-03 22:24:50', '2016-09-03 22:24:50');
INSERT INTO `users` VALUES ('601bf5f0-723e-11e6-ad78-75b74d7bff15', 'Nestor Metz', 'bayer.eloise@example.org', '$2y$10$tsd8D4Rd8dMy0NR1ifrwoOONc4E.iGR5qahDmJvTJnVt6/NgQA8b2', 'user', 'KPPSq2kvY6S7egIuRk2in7fEtsNed2H9VQ79OGDW8eWsaX5m1G', 'XzkBZDwPbUI9FPEkGQlg1XkgGrmtIz5l37OfU4EDb3x5jiWKLK', '0', '2016-09-03 22:24:50', '2016-09-03 22:24:50');
INSERT INTO `users` VALUES ('602867c0-723e-11e6-b816-531e3cd9cfcf', 'Mazie Parisian', 'wbarton@example.com', '$2y$10$c7fIO5VWn.0IsucE9yLQ4.s7cHroLuL13jpqvGM33efuCkF4.1K5K', 'user', 'PZl1OMx5WHoP650fgjT5Pj3AOg2JzrJnsQbrYAIZWOXNvcP7B5', 'cXjbsfpQpEuyiUZIvSVR6SI2H8WfjL6vzKN7rEVx845FgcWD7p', '2', '2016-09-03 22:24:50', '2016-09-03 22:24:50');
INSERT INTO `users` VALUES ('60349940-723e-11e6-af4e-8f74569931e7', 'Nannie Renner IV', 'hirthe.evalyn@example.com', '$2y$10$fFVtFukTYqfy9PePIgB/BuXPmt89Gye9r8rehck/iahcWrliorkiu', 'user', 'mG2D4AyGQesRfol4bOWHWuUtOabRvK4Ntgp8QQKe0t4SdnZLnr', '76yBBaVOiWBoCGrtI4InXScrxk6HV6Z0bwvse6MEI2UzZebodw', '2', '2016-09-03 22:24:50', '2016-09-03 22:24:50');
INSERT INTO `users` VALUES ('6040b100-723e-11e6-a451-6be7a087daa8', 'Nestor Cremin MD', 'anibal94@example.com', '$2y$10$17sucLnzxaC1jww9t3bwQ.2Bz/KxNYuSPQqi6tiFXL.mjNZuxh6xO', 'user', 'Zl4hv17UORoIDY5WXTU7lrEhoUDaQqwIwteETfEQUHQc3SjoiX', '1Ov6IRJNDeItzaB3pgct6Sb8cp6OqBIvB0HXmrMeSOUWRtvrPT', '0', '2016-09-03 22:24:51', '2016-09-03 22:24:51');
INSERT INTO `users` VALUES ('604ce600-723e-11e6-8529-b510bbb8f399', 'Miss Shyanne Ankunding MD', 'kylie97@example.com', '$2y$10$Xty.YgpZGSp3WcpZULotyOvlJ/G6XpBIqs57tRlkyVasO6DcmD6uq', 'user', 'BBmlPuN8FBl3ciz0JCWtpAvI6bQeJvoNZulWCY90MJOptRAiM3', 'bc7Gd42sYDasOjgdCnhG3LUHrbynZI7ak4kA0zber9ji1uC8EB', '2', '2016-09-03 22:24:51', '2016-09-03 22:24:51');
INSERT INTO `users` VALUES ('60595d50-723e-11e6-a8d4-87baf1f427d6', 'Faustino Lakin', 'harold.pollich@example.com', '$2y$10$4.D2Y8IT5S3nHDnUkdq6weDmFqx8hu9bgDNGKbwuN04AwhIoNP2Vu', 'user', 'rrfgIfxRiCwdY0Rlmcr1z53hN1s8elK31wum77qiijNy47T0sS', '5vbJk58IESCi5QF2fBRnpZ4pWBinrEsk4vW4UrO46QV4d8xsie', '1', '2016-09-03 22:24:51', '2016-09-03 22:24:51');
INSERT INTO `users` VALUES ('6065fdd0-723e-11e6-b12f-618f40b57b0e', 'Fermin Kulas II', 'beatrice99@example.org', '$2y$10$ue4ZtRvBEoCeuhMErMlgfu7IpdhosVPM/rXYah2Yc.GHwQOU1q4lO', 'user', 'FsSRWOyrVaqoXN9CfUq400hb9iUtWXSMFusS05GrY2HkhId6z1', 'UlziJMW0v5tx9zBvB2lu67LENqoqoaS9re6d831OoLNyfAVzHd', '1', '2016-09-03 22:24:51', '2016-09-03 22:24:51');
INSERT INTO `users` VALUES ('60728000-723e-11e6-8ea3-2718b63fea1f', 'Dr. Liam Monahan', 'kschaefer@example.net', '$2y$10$HK6PnCSJGOfZWMAlV/WaEeMRfO2xHRMdd.eL2RAOYyzQrhx698M6u', 'user', 'reVojXGBQZVsTz48UIbk9rAx58OxjSwigAkYV0BVXucLWSIh1u', 'yI1PZ2I7T13RD368dMvPCdGaaOZjrH8Et9JxjLSOoC87COFysn', '1', '2016-09-03 22:24:51', '2016-09-03 22:24:51');
INSERT INTO `users` VALUES ('607eeec0-723e-11e6-8a40-f3e7e583eb3b', 'Vallie Rippin DVM', 'tstoltenberg@example.org', '$2y$10$ZU/pd/NcywnorglXrh6nau4vGl6o5r172FUdV4jFI8UAcke7O2Jdy', 'user', 'Xs7NJF0Fl78pn44PnRjI6V3fxK6W2ijiofsB9wWZ9GA4JDAOJv', 'URIrW6dee3PSEwDqpVeEOJlzPCsO2Qa2Ty1f35QnLPEPl6M12X', '2', '2016-09-03 22:24:51', '2016-09-03 22:24:51');
INSERT INTO `users` VALUES ('608b4940-723e-11e6-92c5-85af61ac74b1', 'Prof. Brionna Bernhard V', 'xoreilly@example.net', '$2y$10$VobqugIj/zMBdtUGSR0ijOi8fSmMEgllJortzx9Uus7tWm2vsRkt2', 'user', 'E6Y5ouR55yJzF37sptjg3XeOl0Ih5Jar4QMsueLxfRejuozGLG', 'zY98hqofpGWvEcQGXfdhW8mGiw0MvuMXnUOpzIfFXBIhApXGei', '0', '2016-09-03 22:24:51', '2016-09-03 22:24:51');
INSERT INTO `users` VALUES ('6097b1c0-723e-11e6-bc5f-e1b12685c9dd', 'Maryjane Adams', 'thodkiewicz@example.com', '$2y$10$UQcqP.pd8rVsHSRlKelF5eMQYOxDRmLw4pExv.1rJ3HHVaY0x2ePy', 'user', 'JIFfIz4QqekMYLf3s6ftb64vJVXjwAQMOAkc0eqwINafDFpvjh', 'TVAvxO6sqIQeXrVjLzekwbVoccj4PRGp6ueAZXMEyrPVcobwzr', '2', '2016-09-03 22:24:51', '2016-09-03 22:24:51');
INSERT INTO `users` VALUES ('60a3f160-723e-11e6-982c-6534758b1864', 'Brendon Reichel', 'clark90@example.net', '$2y$10$ACQ4rPQij3tm/Sz7XYxtJ.5a871UYT7O7K8paUOGLAE.om1QejVn2', 'user', 'lIA0INtb4lrlEttspZBGWBjKfsn7LwKXOunjJM8eMWLTmar40M', 'FnQwu1dEkufsZOhQAG38LaKECe114GpSZHl4lh1UDbIXcxCtZ6', '0', '2016-09-03 22:24:51', '2016-09-03 22:24:51');
INSERT INTO `users` VALUES ('60b07ca0-723e-11e6-b809-dd827922647d', 'Kaitlin Schoen', 'little.greta@example.com', '$2y$10$6CkyDNxGd01P.eCOdvh0JOWREXrTU.AubW8aM3FE.f6NCCJh/QP6K', 'user', 'yiZlM13YdLYx6qIxOnaMkLqAGQZ1rE3XkB05Eu6q23j8HEgVN8', 'LDAOJmwSk7mQQUSARe7K7fMC5c3iaCUlGu9k3hVJetSIy9oN4a', '0', '2016-09-03 22:24:51', '2016-09-03 22:24:51');
INSERT INTO `users` VALUES ('60bcfad0-723e-11e6-bd56-c71dff0c3868', 'Bobby Kling DDS', 'nader.werner@example.com', '$2y$10$ht.aelnfHHqqbB6WfJV.JOOfAKx1LgFqvxuazwts/DgxuFpTW4Xs.', 'user', 'Ca8rI5QIixaaDboY14YKUYl4Oc4bdgl9hy9kwYSPf9dG8O7bhc', 'WwuIBZiPlpnteHea9gLIy7BoiwnwI8IoOgEqvZPjjuWxl7qiBF', '1', '2016-09-03 22:24:51', '2016-09-03 22:24:51');
INSERT INTO `users` VALUES ('60c99cf0-723e-11e6-bcbe-b5378aad2fff', 'Kaia Howell I', 'skylar43@example.org', '$2y$10$1SBg51i9dOqT2rL2jSU1H.ShoYX8Ba408.if5j923V4kb3UChG1De', 'user', 'tsoRcx9TJsTwbFhzox5vBMQ9yCJWXIK0J7kufcc6cAqHgHVRUc', 'vHJ9QELNFwnTsNFccC30x2flDVMtATgeGa0JVLDIlAZh3ptmHw', '0', '2016-09-03 22:24:51', '2016-09-03 22:24:51');
INSERT INTO `users` VALUES ('60d612a0-723e-11e6-a807-f95bd977e749', 'Cullen Moore Jr.', 'lisette27@example.net', '$2y$10$KW2UHYoZpJjOhIRziQTHzO6s5309VFDdK/NzUTzz8283PNQ2e.vwy', 'user', 'JpPB01LHwht0WLsVP5TlkhveCk4jdy8qP6VNUvEV3prqx8Ht8T', 'd2LYi6HQO5bHmXsT0hFsGVCefN1xYmeQqT2g83NywawDeLOaW9', '1', '2016-09-03 22:24:52', '2016-09-03 22:24:52');
INSERT INTO `users` VALUES ('60e21690-723e-11e6-b032-9d52274e0517', 'Eloy Carroll MD', 'kellen32@example.net', '$2y$10$ePTWFESv1l1uhpLZ9f0psOQnt3LrtsjGlIZpnn0Of56SI9lW.Zyca', 'user', 'gAKZSuUdwyXLF0slQXeW9CQq6GUutbb0QRTW6Ixohel47fhaco', 'B050iXbfnwPlKKZHwuJmiSSOgrWz9iwI3wngA1pcVegeHyNkzs', '2', '2016-09-03 22:24:52', '2016-09-03 22:24:52');
INSERT INTO `users` VALUES ('60ee2640-723e-11e6-9b16-e1b18cceea64', 'Christopher Beatty', 'hayes.virginie@example.net', '$2y$10$RBBufxckK0XaWFXfebX6de8EacAe2cqBfrbTh8YLq99bpVyDJ5xom', 'user', 'HtmkNCRFu001hG0CZrkPVO1BCd3bhyZRpp3TyjjNmLa860i3rP', 'GyVZE2J3nT2axE0XFcs8NIZeIj1UIQK7d9yUGPU5EPhYCVJ3T7', '1', '2016-09-03 22:24:52', '2016-09-03 22:24:52');
INSERT INTO `users` VALUES ('60fa5000-723e-11e6-a400-9d574593be44', 'Scot D\'Amore', 'kamille72@example.com', '$2y$10$xW/BwNJGjT.4UYEp.peAmeKSvQzW/9gkrz.wrm6f//B0iP3YkXzNK', 'user', '8ZjZm0bK9WpAGs7MriscqPyCk9Gc08pOxnamh1vcATU8lgu5sa', 'mfxjvuhnFqzSXiAy5OxxVrkA7rwPoKgoqXAYNufO2wiVrjocqU', '0', '2016-09-03 22:24:52', '2016-09-03 22:24:52');
INSERT INTO `users` VALUES ('61067580-723e-11e6-95e0-cd21272b6c52', 'Dr. Arne O\'Keefe IV', 'phuels@example.com', '$2y$10$tdQrj29y5IstEMCunzqVxOGFrKWpbmRyu8yslGCwLTbEUX7ZnDN.e', 'user', 'TfDJic81DRHtSSjDMX2NYAkpfqigHOzZJJvZaJ7B78XNed9Vzl', 'fW0HihB09OpSG2pxPoufBdkMOwtcLeYqkalm54rrIwPaWlfbUa', '0', '2016-09-03 22:24:52', '2016-09-03 22:24:52');
INSERT INTO `users` VALUES ('6112b060-723e-11e6-b47d-c3443d59dc62', 'Mr. Jennings Fahey DDS', 'bahringer.franz@example.org', '$2y$10$iFhWd6G0PRqtbDNX2yogk.7p0/aUb/GWkziKb1I0sBEbGuQVwaU7W', 'user', 'i3yaRwMpTUtRJmJgYhH3OZWLWieMIgb4QLnAXbx6Zpt6pbkhgo', 'Oek88s7Z7jb0I7FlkfbxZDtNgrqxaKPKydoa1AIlu4bo1piWZF', '2', '2016-09-03 22:24:52', '2016-09-03 22:24:52');
INSERT INTO `users` VALUES ('611ec4e0-723e-11e6-be71-a9f6755fdb99', 'Sylvia Weissnat', 'ebert.dashawn@example.com', '$2y$10$M14bw5NuYnLBNiI0Ot.OQOzB4E1IdL3jIMg2xuOQMf18GqYTalody', 'user', '1eGKgDKojgE1kCobR22TLNFu0GGlGt2G2iPyc4aAecfHM3nTQq', 'ihlhkC34Ow4iCoEPtcHjqDzrsZm92HyF7MvM3EoC4kiR3i2Cwx', '1', '2016-09-03 22:24:52', '2016-09-03 22:24:52');
INSERT INTO `users` VALUES ('612ae2a0-723e-11e6-9c7b-d1f40cb6d0bd', 'Prof. Ben Auer DDS', 'marisa.mayer@example.com', '$2y$10$tbM3birlLeN8E.r0dYwiu.PeuU2wKoAT3XPHLJHB7valH2cO4irRS', 'user', 'WSF1Wh64hVmeAjuV1F7yk159ZcmqrJ8Kn44mUxoGHDgsMgiy8R', 'ciHNDmaenHlcvFFD0m12QZ1esdwBOtAxHsIexgKDSAVwpZPz7d', '1', '2016-09-03 22:24:52', '2016-09-03 22:24:52');
INSERT INTO `users` VALUES ('61370ab0-723e-11e6-affe-ff4654fd6432', 'Jerrod Ortiz', 'orie08@example.org', '$2y$10$ZsfI9Lm5FEyMQ5gQPr2IgeIjHiQD3vKIw/D6pdQyu.M5hQi9Eftn6', 'user', 'TNPyI0DIV3LouJa6GdDQRCkpPiFFSpLOg6dLOkLKIaRV9iEijD', 'EKB3EuxFfADEgeOviuQBwNHag1ZnAuqgKruGATY5QSkTjSZEXz', '0', '2016-09-03 22:24:52', '2016-09-03 22:24:52');
INSERT INTO `users` VALUES ('61432790-723e-11e6-885b-295b89db47b5', 'Mr. Blair Dickens PhD', 'johathan98@example.org', '$2y$10$XXA8Wi.I3hIZLqk1R22xT.asrEx4OlHYKr3AZgvk13dU423/qcrTS', 'user', 'msdIGMgOqakqPrwtMMsDy02NP3vk340MRga53NAcrqgQlhBRHB', 'FUb445PgoV6ESByQn09xtM4e1CF77LpXYdZMJ6XyEpnvHzUdDZ', '2', '2016-09-03 22:24:52', '2016-09-03 22:24:52');
INSERT INTO `users` VALUES ('614f9390-723e-11e6-9a71-a1e8fd6786bf', 'Katherine Stokes', 'bernhard.fatima@example.org', '$2y$10$ob6/IRsGw3JPnMIjrcLHEuK8Xm1jIFrDfGXq9lJvXhcy/WM9H1262', 'user', 'd3WynjQusYflIlOqJ7YBF0amelg0rlRG12AH4swZstdM8Vx1q1', 'nkxK3eGlljRvlVyHfQMxxKa5UTOpm5vCayzgHLy1iIpeyAtWpb', '2', '2016-09-03 22:24:52', '2016-09-03 22:24:52');
INSERT INTO `users` VALUES ('615bf000-723e-11e6-9a7b-ed470ce8d344', 'Rowan Bauch', 'adrian65@example.com', '$2y$10$3r/v7EogKVky3q53oSUmTui25Pc4IbsbF/9geutuG8i.A9VgGQP1m', 'user', '8GM4oA675pMVUsaWDuSbRDKQMjMydNzs9kCbhFjocYWhT9DPon', 'o32VKcS5RdF2gOqjt2KqRfsqiwPrceBehFkzu765GEgK9yN6Y0', '1', '2016-09-03 22:24:52', '2016-09-03 22:24:52');
INSERT INTO `users` VALUES ('61683f80-723e-11e6-a85b-c560ba0afbfe', 'Pearlie Bechtelar', 'thompson.verlie@example.net', '$2y$10$txdxu22vccppuIsz/UvGB.IVV6tvX6UdvRjavZwE.k7EZaOd4PoEC', 'user', '2BfLzSGUqgDBYaWOMLXR0iDU9uXnLek5rGTwnW09JQhl9mkLvd', 'sjpgWcE7En1epJcafSBA5Eh7pYeYKzyz7itpNq70Nw59QHLVmF', '2', '2016-09-03 22:24:52', '2016-09-03 22:24:52');
INSERT INTO `users` VALUES ('61749d20-723e-11e6-a1b9-615689591033', 'Carlie Parker V', 'colleen.walsh@example.net', '$2y$10$64UYGCbdndyO6yN0/oBGTuCWZHlJKXCQrW1qyfYexCNPPe19GOJQe', 'user', 'rkIhiVzYSML4pd7UdrhsXU7JhmTKmenVQidBnyOfSb6CME7Jfg', '410iVz5pRSAHAskslRgtAeKcHQZhvqlq2aQ1og0mEEcKPtCcd3', '1', '2016-09-03 22:24:53', '2016-09-03 22:24:53');
INSERT INTO `users` VALUES ('6180cd30-723e-11e6-8f24-8d841447f09c', 'Prof. Brandt Cruickshank', 'crystal43@example.com', '$2y$10$QZ0FUWsEGiVp5CrTnUZzZOblRMLnhE.IhQn7xr82irMFjCoE8Ij/e', 'user', 'YPfWCq2q2T5gyGYGg66u5dH189cqoSbgRBVr11l950pXNDIuB9', 'cvZ28NDjuGuwY2maQOjQ0y2prMipCLx55DnKsIQ1GFrZQ4RKqL', '0', '2016-09-03 22:24:53', '2016-09-03 22:24:53');
INSERT INTO `users` VALUES ('76f31220-723e-11e6-b06e-074876b08668', 'James Labrie', 'leame1988@dayrep.com', '$2y$10$0HQLdxaqulv7AavjFyj4iuYTXlUjA04yTFeJqAGhGVtu33b899IEC', 'user', 'JztPV4UErXyUwVMU2N2Kv3MQIfS2sMRBAYV4WzHpLYpgNWweLC', 'BX3Ws2Cus0WDDGhI9hRZBgpYf2WH4Mdh1KqRsZ0ebmL0dqPIyE', '1', '2016-09-03 22:25:29', '2016-09-03 22:25:29');
