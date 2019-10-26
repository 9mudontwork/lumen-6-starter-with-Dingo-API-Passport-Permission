-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2019 at 02:43 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `animanga_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `anime`
--

CREATE TABLE `anime` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `other_name` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `genres` varchar(255) DEFAULT NULL,
  `season` int(11) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `released_status` int(11) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `publish_status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `anime_chapter`
--

CREATE TABLE `anime_chapter` (
  `id` int(11) NOT NULL,
  `anime_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `video_url` text DEFAULT NULL,
  `publish_status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `anime_chapter_comment`
--

CREATE TABLE `anime_chapter_comment` (
  `id` int(11) NOT NULL,
  `anime_chapter_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_type` int(11) DEFAULT NULL,
  `sub_comment` int(11) DEFAULT NULL,
  `reply_comment_user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `anime_chapter_comment_user_like`
--

CREATE TABLE `anime_chapter_comment_user_like` (
  `id` int(11) NOT NULL,
  `comment_anime_chapter_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `anime_chapter_user_view`
--

CREATE TABLE `anime_chapter_user_view` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `anime_id` int(11) DEFAULT NULL,
  `anime_chapter_id` int(11) DEFAULT NULL,
  `read_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `anime_chapter_view`
--

CREATE TABLE `anime_chapter_view` (
  `id` int(11) NOT NULL,
  `chapter_id` int(11) DEFAULT NULL,
  `view_date` datetime DEFAULT NULL,
  `view_total` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `anime_studio`
--

CREATE TABLE `anime_studio` (
  `id` int(11) NOT NULL,
  `studio_id` int(11) DEFAULT NULL,
  `anime_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `anime_thread`
--

CREATE TABLE `anime_thread` (
  `id` int(11) NOT NULL,
  `anime_id` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT 'anime',
  `user_id` int(11) DEFAULT NULL,
  `post` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `anime_thread_comment`
--

CREATE TABLE `anime_thread_comment` (
  `id` int(11) NOT NULL,
  `anime_thread_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `comment_type` int(11) DEFAULT NULL,
  `sub_comment` int(11) DEFAULT NULL,
  `reply_comment_user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `anime_thread_comment_user_like`
--

CREATE TABLE `anime_thread_comment_user_like` (
  `id` int(11) NOT NULL,
  `anime_thread_comment` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `anime_thread_user_like`
--

CREATE TABLE `anime_thread_user_like` (
  `id` int(11) NOT NULL,
  `anime_thread_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `anime_user_favorite`
--

CREATE TABLE `anime_user_favorite` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `anime_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `anime_view`
--

CREATE TABLE `anime_view` (
  `id` int(11) NOT NULL,
  `anime_id` int(11) DEFAULT NULL,
  `view_date` datetime DEFAULT NULL,
  `view_total` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `story` tinyint(1) DEFAULT NULL,
  `art` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `author_anime`
--

CREATE TABLE `author_anime` (
  `id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `anime_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `author_manga`
--

CREATE TABLE `author_manga` (
  `id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `manga_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manga`
--

CREATE TABLE `manga` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `other_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `genres` varchar(255) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `released_status` int(11) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `publish_status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manga_chapter`
--

CREATE TABLE `manga_chapter` (
  `id` int(11) NOT NULL,
  `manga_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `publish_status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manga_chapter_comment`
--

CREATE TABLE `manga_chapter_comment` (
  `id` int(11) NOT NULL,
  `manga_chapter_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_type` int(11) DEFAULT NULL,
  `sub_comment` int(11) DEFAULT NULL,
  `reply_comment_user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manga_chapter_comment_user_like`
--

CREATE TABLE `manga_chapter_comment_user_like` (
  `id` int(11) NOT NULL,
  `manga_chapter_comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manga_chapter_user_read`
--

CREATE TABLE `manga_chapter_user_read` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `manga_id` int(11) DEFAULT NULL,
  `manga_chapter_id` int(11) DEFAULT NULL,
  `page_of_chapter` varchar(255) DEFAULT NULL,
  `read_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manga_chapter_view`
--

CREATE TABLE `manga_chapter_view` (
  `id` int(11) NOT NULL,
  `chapter_id` int(11) DEFAULT NULL,
  `view_date` datetime DEFAULT NULL,
  `view_total` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manga_thread`
--

CREATE TABLE `manga_thread` (
  `id` int(11) NOT NULL,
  `manga_id` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT 'manga',
  `user_id` int(11) DEFAULT NULL,
  `post` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manga_thread_comment`
--

CREATE TABLE `manga_thread_comment` (
  `id` int(11) NOT NULL,
  `manga_thread_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `comment_type` int(11) DEFAULT NULL,
  `sub_comment` int(11) DEFAULT NULL,
  `reply_comment_user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manga_thread_comment_user_like`
--

CREATE TABLE `manga_thread_comment_user_like` (
  `id` int(11) NOT NULL,
  `manga_thread_comment` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manga_thread_user_like`
--

CREATE TABLE `manga_thread_user_like` (
  `id` int(11) NOT NULL,
  `manga_thread_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manga_user_favorite`
--

CREATE TABLE `manga_user_favorite` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `manga_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `manga_view`
--

CREATE TABLE `manga_view` (
  `id` int(11) NOT NULL,
  `manga_id` int(11) DEFAULT NULL,
  `view_date` datetime DEFAULT NULL,
  `view_total` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `studio`
--

CREATE TABLE `studio` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `anime_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `verify_status` tinyint(1) DEFAULT NULL,
  `verify_code` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_seen_at` datetime DEFAULT NULL,
  `created_ip` datetime DEFAULT NULL,
  `last_seen_ip` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_password_recovery`
--

CREATE TABLE `user_password_recovery` (
  `int` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `recovery_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `rank` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `baner` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anime`
--
ALTER TABLE `anime`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `anime_chapter`
--
ALTER TABLE `anime_chapter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `sort_number` (`sort_number`),
  ADD KEY `anime_id` (`anime_id`);

--
-- Indexes for table `anime_chapter_comment`
--
ALTER TABLE `anime_chapter_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anime_chapter_id` (`anime_chapter_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sub_comment` (`sub_comment`),
  ADD KEY `reply_comment_user_id` (`reply_comment_user_id`);

--
-- Indexes for table `anime_chapter_comment_user_like`
--
ALTER TABLE `anime_chapter_comment_user_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_anime_chapter_id` (`comment_anime_chapter_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `anime_chapter_user_view`
--
ALTER TABLE `anime_chapter_user_view`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `anime_chapter_id` (`anime_chapter_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `anime_id` (`anime_id`);

--
-- Indexes for table `anime_chapter_view`
--
ALTER TABLE `anime_chapter_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapter_id` (`chapter_id`);

--
-- Indexes for table `anime_studio`
--
ALTER TABLE `anime_studio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studio_id` (`studio_id`),
  ADD KEY `anime_id` (`anime_id`);

--
-- Indexes for table `anime_thread`
--
ALTER TABLE `anime_thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anime_id` (`anime_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `anime_thread_comment`
--
ALTER TABLE `anime_thread_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anime_thread_id` (`anime_thread_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sub_comment` (`sub_comment`),
  ADD KEY `reply_comment_user_id` (`reply_comment_user_id`);

--
-- Indexes for table `anime_thread_comment_user_like`
--
ALTER TABLE `anime_thread_comment_user_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anime_thread_comment` (`anime_thread_comment`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `anime_thread_user_like`
--
ALTER TABLE `anime_thread_user_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anime_thread_id` (`anime_thread_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `anime_user_favorite`
--
ALTER TABLE `anime_user_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `anime_id` (`anime_id`);

--
-- Indexes for table `anime_view`
--
ALTER TABLE `anime_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anime_id` (`anime_id`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `author_name` (`author_name`);

--
-- Indexes for table `author_anime`
--
ALTER TABLE `author_anime`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `anime_id` (`anime_id`);

--
-- Indexes for table `author_manga`
--
ALTER TABLE `author_manga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `manga_id` (`manga_id`);

--
-- Indexes for table `manga`
--
ALTER TABLE `manga`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `manga_chapter`
--
ALTER TABLE `manga_chapter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `sort_number` (`sort_number`),
  ADD KEY `manga_id` (`manga_id`);

--
-- Indexes for table `manga_chapter_comment`
--
ALTER TABLE `manga_chapter_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manga_chapter_id` (`manga_chapter_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sub_comment` (`sub_comment`),
  ADD KEY `reply_comment_user_id` (`reply_comment_user_id`);

--
-- Indexes for table `manga_chapter_comment_user_like`
--
ALTER TABLE `manga_chapter_comment_user_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manga_chapter_comment_id` (`manga_chapter_comment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `manga_chapter_user_read`
--
ALTER TABLE `manga_chapter_user_read`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `manga_chapter_id` (`manga_chapter_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `manga_id` (`manga_id`);

--
-- Indexes for table `manga_chapter_view`
--
ALTER TABLE `manga_chapter_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapter_id` (`chapter_id`);

--
-- Indexes for table `manga_thread`
--
ALTER TABLE `manga_thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manga_id` (`manga_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `manga_thread_comment`
--
ALTER TABLE `manga_thread_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manga_thread_id` (`manga_thread_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sub_comment` (`sub_comment`),
  ADD KEY `reply_comment_user_id` (`reply_comment_user_id`);

--
-- Indexes for table `manga_thread_comment_user_like`
--
ALTER TABLE `manga_thread_comment_user_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manga_thread_comment` (`manga_thread_comment`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `manga_thread_user_like`
--
ALTER TABLE `manga_thread_user_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manga_thread_id` (`manga_thread_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `manga_user_favorite`
--
ALTER TABLE `manga_user_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `manga_id` (`manga_id`);

--
-- Indexes for table `manga_view`
--
ALTER TABLE `manga_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manga_id` (`manga_id`);

--
-- Indexes for table `studio`
--
ALTER TABLE `studio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anime_id` (`anime_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `facebook_id` (`facebook_id`),
  ADD UNIQUE KEY `google_id` (`google_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_password_recovery`
--
ALTER TABLE `user_password_recovery`
  ADD PRIMARY KEY (`int`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anime`
--
ALTER TABLE `anime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anime_chapter`
--
ALTER TABLE `anime_chapter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anime_chapter_comment`
--
ALTER TABLE `anime_chapter_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anime_chapter_comment_user_like`
--
ALTER TABLE `anime_chapter_comment_user_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anime_chapter_user_view`
--
ALTER TABLE `anime_chapter_user_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anime_chapter_view`
--
ALTER TABLE `anime_chapter_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anime_studio`
--
ALTER TABLE `anime_studio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anime_thread`
--
ALTER TABLE `anime_thread`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anime_thread_comment`
--
ALTER TABLE `anime_thread_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anime_thread_comment_user_like`
--
ALTER TABLE `anime_thread_comment_user_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anime_thread_user_like`
--
ALTER TABLE `anime_thread_user_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anime_user_favorite`
--
ALTER TABLE `anime_user_favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anime_view`
--
ALTER TABLE `anime_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `author_anime`
--
ALTER TABLE `author_anime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `author_manga`
--
ALTER TABLE `author_manga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manga`
--
ALTER TABLE `manga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manga_chapter`
--
ALTER TABLE `manga_chapter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manga_chapter_comment`
--
ALTER TABLE `manga_chapter_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manga_chapter_comment_user_like`
--
ALTER TABLE `manga_chapter_comment_user_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manga_chapter_user_read`
--
ALTER TABLE `manga_chapter_user_read`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manga_chapter_view`
--
ALTER TABLE `manga_chapter_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manga_thread`
--
ALTER TABLE `manga_thread`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manga_thread_comment`
--
ALTER TABLE `manga_thread_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manga_thread_comment_user_like`
--
ALTER TABLE `manga_thread_comment_user_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manga_thread_user_like`
--
ALTER TABLE `manga_thread_user_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manga_user_favorite`
--
ALTER TABLE `manga_user_favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manga_view`
--
ALTER TABLE `manga_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `studio`
--
ALTER TABLE `studio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_password_recovery`
--
ALTER TABLE `user_password_recovery`
  MODIFY `int` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anime_chapter`
--
ALTER TABLE `anime_chapter`
  ADD CONSTRAINT `anime_chapter_ibfk_1` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`);

--
-- Constraints for table `anime_chapter_comment`
--
ALTER TABLE `anime_chapter_comment`
  ADD CONSTRAINT `anime_chapter_comment_ibfk_1` FOREIGN KEY (`anime_chapter_id`) REFERENCES `anime_chapter` (`id`),
  ADD CONSTRAINT `anime_chapter_comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `anime_chapter_comment_ibfk_3` FOREIGN KEY (`sub_comment`) REFERENCES `anime_chapter_comment` (`id`),
  ADD CONSTRAINT `anime_chapter_comment_ibfk_4` FOREIGN KEY (`reply_comment_user_id`) REFERENCES `anime_chapter_comment` (`user_id`);

--
-- Constraints for table `anime_chapter_comment_user_like`
--
ALTER TABLE `anime_chapter_comment_user_like`
  ADD CONSTRAINT `anime_chapter_comment_user_like_ibfk_1` FOREIGN KEY (`comment_anime_chapter_id`) REFERENCES `anime_chapter_comment` (`id`),
  ADD CONSTRAINT `anime_chapter_comment_user_like_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `anime_chapter_user_view`
--
ALTER TABLE `anime_chapter_user_view`
  ADD CONSTRAINT `anime_chapter_user_view_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `anime_chapter_user_view_ibfk_2` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`),
  ADD CONSTRAINT `anime_chapter_user_view_ibfk_3` FOREIGN KEY (`anime_chapter_id`) REFERENCES `anime_chapter` (`id`);

--
-- Constraints for table `anime_chapter_view`
--
ALTER TABLE `anime_chapter_view`
  ADD CONSTRAINT `anime_chapter_view_ibfk_1` FOREIGN KEY (`chapter_id`) REFERENCES `anime_chapter` (`id`);

--
-- Constraints for table `anime_studio`
--
ALTER TABLE `anime_studio`
  ADD CONSTRAINT `anime_studio_ibfk_1` FOREIGN KEY (`studio_id`) REFERENCES `studio` (`id`),
  ADD CONSTRAINT `anime_studio_ibfk_2` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`);

--
-- Constraints for table `anime_thread`
--
ALTER TABLE `anime_thread`
  ADD CONSTRAINT `anime_thread_ibfk_1` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`),
  ADD CONSTRAINT `anime_thread_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `anime_thread_comment`
--
ALTER TABLE `anime_thread_comment`
  ADD CONSTRAINT `anime_thread_comment_ibfk_1` FOREIGN KEY (`anime_thread_id`) REFERENCES `anime_thread` (`id`),
  ADD CONSTRAINT `anime_thread_comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `anime_thread_comment_ibfk_3` FOREIGN KEY (`sub_comment`) REFERENCES `anime_thread_comment` (`id`),
  ADD CONSTRAINT `anime_thread_comment_ibfk_4` FOREIGN KEY (`reply_comment_user_id`) REFERENCES `anime_thread_comment` (`user_id`);

--
-- Constraints for table `anime_thread_comment_user_like`
--
ALTER TABLE `anime_thread_comment_user_like`
  ADD CONSTRAINT `anime_thread_comment_user_like_ibfk_1` FOREIGN KEY (`anime_thread_comment`) REFERENCES `anime_thread_comment` (`id`),
  ADD CONSTRAINT `anime_thread_comment_user_like_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `anime_thread_user_like`
--
ALTER TABLE `anime_thread_user_like`
  ADD CONSTRAINT `anime_thread_user_like_ibfk_1` FOREIGN KEY (`anime_thread_id`) REFERENCES `anime_thread` (`id`),
  ADD CONSTRAINT `anime_thread_user_like_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `anime_user_favorite`
--
ALTER TABLE `anime_user_favorite`
  ADD CONSTRAINT `anime_user_favorite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `anime_user_favorite_ibfk_2` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`);

--
-- Constraints for table `anime_view`
--
ALTER TABLE `anime_view`
  ADD CONSTRAINT `anime_view_ibfk_1` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`);

--
-- Constraints for table `author_anime`
--
ALTER TABLE `author_anime`
  ADD CONSTRAINT `author_anime_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  ADD CONSTRAINT `author_anime_ibfk_2` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`);

--
-- Constraints for table `author_manga`
--
ALTER TABLE `author_manga`
  ADD CONSTRAINT `author_manga_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  ADD CONSTRAINT `author_manga_ibfk_2` FOREIGN KEY (`manga_id`) REFERENCES `manga` (`id`);

--
-- Constraints for table `manga_chapter`
--
ALTER TABLE `manga_chapter`
  ADD CONSTRAINT `manga_chapter_ibfk_1` FOREIGN KEY (`manga_id`) REFERENCES `manga` (`id`);

--
-- Constraints for table `manga_chapter_comment`
--
ALTER TABLE `manga_chapter_comment`
  ADD CONSTRAINT `manga_chapter_comment_ibfk_1` FOREIGN KEY (`manga_chapter_id`) REFERENCES `manga_chapter` (`id`),
  ADD CONSTRAINT `manga_chapter_comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `manga_chapter_comment_ibfk_3` FOREIGN KEY (`sub_comment`) REFERENCES `manga_chapter_comment` (`id`),
  ADD CONSTRAINT `manga_chapter_comment_ibfk_4` FOREIGN KEY (`reply_comment_user_id`) REFERENCES `manga_chapter_comment` (`user_id`);

--
-- Constraints for table `manga_chapter_comment_user_like`
--
ALTER TABLE `manga_chapter_comment_user_like`
  ADD CONSTRAINT `manga_chapter_comment_user_like_ibfk_1` FOREIGN KEY (`manga_chapter_comment_id`) REFERENCES `manga_chapter_comment` (`id`),
  ADD CONSTRAINT `manga_chapter_comment_user_like_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `manga_chapter_user_read`
--
ALTER TABLE `manga_chapter_user_read`
  ADD CONSTRAINT `manga_chapter_user_read_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `manga_chapter_user_read_ibfk_2` FOREIGN KEY (`manga_id`) REFERENCES `manga` (`id`),
  ADD CONSTRAINT `manga_chapter_user_read_ibfk_3` FOREIGN KEY (`manga_chapter_id`) REFERENCES `manga_chapter` (`id`);

--
-- Constraints for table `manga_chapter_view`
--
ALTER TABLE `manga_chapter_view`
  ADD CONSTRAINT `manga_chapter_view_ibfk_1` FOREIGN KEY (`chapter_id`) REFERENCES `manga_chapter` (`id`);

--
-- Constraints for table `manga_thread`
--
ALTER TABLE `manga_thread`
  ADD CONSTRAINT `manga_thread_ibfk_1` FOREIGN KEY (`manga_id`) REFERENCES `manga` (`id`),
  ADD CONSTRAINT `manga_thread_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `manga_thread_comment`
--
ALTER TABLE `manga_thread_comment`
  ADD CONSTRAINT `manga_thread_comment_ibfk_1` FOREIGN KEY (`manga_thread_id`) REFERENCES `manga_thread` (`id`),
  ADD CONSTRAINT `manga_thread_comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `manga_thread_comment_ibfk_3` FOREIGN KEY (`sub_comment`) REFERENCES `manga_thread_comment` (`id`),
  ADD CONSTRAINT `manga_thread_comment_ibfk_4` FOREIGN KEY (`reply_comment_user_id`) REFERENCES `manga_thread_comment` (`user_id`);

--
-- Constraints for table `manga_thread_comment_user_like`
--
ALTER TABLE `manga_thread_comment_user_like`
  ADD CONSTRAINT `manga_thread_comment_user_like_ibfk_1` FOREIGN KEY (`manga_thread_comment`) REFERENCES `manga_thread_comment` (`id`),
  ADD CONSTRAINT `manga_thread_comment_user_like_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `manga_thread_user_like`
--
ALTER TABLE `manga_thread_user_like`
  ADD CONSTRAINT `manga_thread_user_like_ibfk_1` FOREIGN KEY (`manga_thread_id`) REFERENCES `manga_thread` (`id`),
  ADD CONSTRAINT `manga_thread_user_like_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `manga_user_favorite`
--
ALTER TABLE `manga_user_favorite`
  ADD CONSTRAINT `manga_user_favorite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `manga_user_favorite_ibfk_2` FOREIGN KEY (`manga_id`) REFERENCES `manga` (`id`);

--
-- Constraints for table `manga_view`
--
ALTER TABLE `manga_view`
  ADD CONSTRAINT `manga_view_ibfk_1` FOREIGN KEY (`manga_id`) REFERENCES `manga` (`id`);

--
-- Constraints for table `studio`
--
ALTER TABLE `studio`
  ADD CONSTRAINT `studio_ibfk_1` FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`);

--
-- Constraints for table `user_password_recovery`
--
ALTER TABLE `user_password_recovery`
  ADD CONSTRAINT `user_password_recovery_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
