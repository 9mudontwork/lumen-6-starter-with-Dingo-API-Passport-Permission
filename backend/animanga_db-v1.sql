CREATE TABLE `user` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `provider` varchar(255),
  `facebook_id` varchar(255) UNIQUE,
  `google_id` varchar(255) UNIQUE,
  `email` varchar(255) UNIQUE,
  `username` varchar(255) UNIQUE,
  `password` varchar(255),
  `verify_status` boolean,
  `verify_code` varchar(255),
  `role` varchar(255),
  `access_token` varchar(255),
  `refresh_token` varchar(255),
  `created_at` datetime,
  `last_seen_at` datetime,
  `created_ip` datetime,
  `last_seen_ip` datetime
);

CREATE TABLE `user_profile` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int UNIQUE,
  `slug` varchar(255) UNIQUE,
  `display_name` varchar(255),
  `rank` varchar(255),
  `first_name` varchar(255),
  `last_name` varchar(255),
  `avatar` varchar(255),
  `baner` varchar(255)
);

CREATE TABLE `user_password_recovery` (
  `int` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int UNIQUE,
  `recovery_code` varchar(255)
);

CREATE TABLE `manga` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `slug` varchar(255) UNIQUE,
  `name` varchar(255),
  `other_name` varchar(255),
  `description` varchar(255),
  `genres` varchar(255),
  `year` year,
  `released_status` int,
  `cover` varchar(255),
  `publish_status` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `manga_view` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `manga_id` int,
  `view_date` datetime,
  `view_total` datetime
);

CREATE TABLE `manga_user_favorite` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `manga_id` int
);

CREATE TABLE `manga_chapter` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `manga_id` int,
  `slug` varchar(255) UNIQUE,
  `name` varchar(255),
  `sort_number` int UNIQUE,
  `image_url` text,
  `publish_status` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `manga_chapter_user_read` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `manga_id` int,
  `manga_chapter_id` int UNIQUE,
  `page_of_chapter` varchar(255),
  `read_at` datetime
);

CREATE TABLE `manga_chapter_view` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `chapter_id` int,
  `view_date` datetime,
  `view_total` datetime
);

CREATE TABLE `manga_chapter_comment` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `manga_chapter_id` int,
  `user_id` int,
  `comment_type` int,
  `sub_comment` int,
  `reply_comment_user_id` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `manga_chapter_comment_user_like` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `manga_chapter_comment_id` int,
  `user_id` int
);

CREATE TABLE `author` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `author_name` varchar(255) UNIQUE,
  `story` boolean,
  `art` boolean
);

CREATE TABLE `author_manga` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `author_id` int,
  `manga_id` int
);

CREATE TABLE `author_anime` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `author_id` int,
  `anime_id` int
);

CREATE TABLE `anime` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `slug` varchar(255) UNIQUE,
  `name` varchar(255),
  `other_name` varchar(255),
  `format` varchar(255),
  `description` varchar(255),
  `genres` varchar(255),
  `season` int,
  `year` year,
  `released_status` int,
  `cover` varchar(255),
  `publish_status` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `anime_chapter` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `anime_id` int,
  `slug` varchar(255) UNIQUE,
  `name` varchar(255),
  `sort_number` int UNIQUE,
  `video_url` text,
  `publish_status` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `anime_view` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `anime_id` int,
  `view_date` datetime,
  `view_total` datetime
);

CREATE TABLE `anime_chapter_view` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `chapter_id` int,
  `view_date` datetime,
  `view_total` datetime
);

CREATE TABLE `anime_chapter_user_view` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `anime_id` int,
  `anime_chapter_id` int UNIQUE,
  `read_at` datetime
);

CREATE TABLE `anime_user_favorite` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `anime_id` int
);

CREATE TABLE `studio` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `anime_id` int
);

CREATE TABLE `anime_studio` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `studio_id` int,
  `anime_id` int
);

CREATE TABLE `anime_chapter_comment` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `anime_chapter_id` int,
  `user_id` int,
  `comment_type` int,
  `sub_comment` int,
  `reply_comment_user_id` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `anime_chapter_comment_user_like` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `comment_anime_chapter_id` int,
  `user_id` int
);

CREATE TABLE `manga_thread` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `manga_id` int,
  `category` varchar(255) DEFAULT "manga",
  `user_id` int,
  `post` text,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `manga_thread_user_like` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `manga_thread_id` int,
  `user_id` int
);

CREATE TABLE `manga_thread_comment` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `manga_thread_id` int,
  `user_id` int,
  `comment` text,
  `comment_type` int,
  `sub_comment` int,
  `reply_comment_user_id` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `manga_thread_comment_user_like` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `manga_thread_comment` int,
  `user_id` int
);

CREATE TABLE `anime_thread` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `anime_id` int,
  `category` varchar(255) DEFAULT "anime",
  `user_id` int,
  `post` text,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `anime_thread_user_like` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `anime_thread_id` int,
  `user_id` int
);

CREATE TABLE `anime_thread_comment` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `anime_thread_id` int,
  `user_id` int,
  `comment` text,
  `comment_type` int,
  `sub_comment` int,
  `reply_comment_user_id` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `anime_thread_comment_user_like` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `anime_thread_comment` int,
  `user_id` int
);

ALTER TABLE `user_profile` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `user_password_recovery` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `manga_view` ADD FOREIGN KEY (`manga_id`) REFERENCES `manga` (`id`);

ALTER TABLE `manga_user_favorite` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `manga_user_favorite` ADD FOREIGN KEY (`manga_id`) REFERENCES `manga` (`id`);

ALTER TABLE `manga_chapter` ADD FOREIGN KEY (`manga_id`) REFERENCES `manga` (`id`);

ALTER TABLE `manga_chapter_user_read` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `manga_chapter_user_read` ADD FOREIGN KEY (`manga_id`) REFERENCES `manga` (`id`);

ALTER TABLE `manga_chapter_user_read` ADD FOREIGN KEY (`manga_chapter_id`) REFERENCES `manga_chapter` (`id`);

ALTER TABLE `manga_chapter_view` ADD FOREIGN KEY (`chapter_id`) REFERENCES `manga_chapter` (`id`);

ALTER TABLE `manga_chapter_comment` ADD FOREIGN KEY (`manga_chapter_id`) REFERENCES `manga_chapter` (`id`);

ALTER TABLE `manga_chapter_comment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `manga_chapter_comment` ADD FOREIGN KEY (`sub_comment`) REFERENCES `manga_chapter_comment` (`id`);

ALTER TABLE `manga_chapter_comment` ADD FOREIGN KEY (`reply_comment_user_id`) REFERENCES `manga_chapter_comment` (`user_id`);

ALTER TABLE `manga_chapter_comment_user_like` ADD FOREIGN KEY (`manga_chapter_comment_id`) REFERENCES `manga_chapter_comment` (`id`);

ALTER TABLE `manga_chapter_comment_user_like` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `author_manga` ADD FOREIGN KEY (`author_id`) REFERENCES `author` (`id`);

ALTER TABLE `author_manga` ADD FOREIGN KEY (`manga_id`) REFERENCES `manga` (`id`);

ALTER TABLE `author_anime` ADD FOREIGN KEY (`author_id`) REFERENCES `author` (`id`);

ALTER TABLE `author_anime` ADD FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`);

ALTER TABLE `anime_chapter` ADD FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`);

ALTER TABLE `anime_view` ADD FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`);

ALTER TABLE `anime_chapter_view` ADD FOREIGN KEY (`chapter_id`) REFERENCES `anime_chapter` (`id`);

ALTER TABLE `anime_chapter_user_view` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `anime_chapter_user_view` ADD FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`);

ALTER TABLE `anime_chapter_user_view` ADD FOREIGN KEY (`anime_chapter_id`) REFERENCES `anime_chapter` (`id`);

ALTER TABLE `anime_user_favorite` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `anime_user_favorite` ADD FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`);

ALTER TABLE `studio` ADD FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`);

ALTER TABLE `anime_studio` ADD FOREIGN KEY (`studio_id`) REFERENCES `studio` (`id`);

ALTER TABLE `anime_studio` ADD FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`);

ALTER TABLE `anime_chapter_comment` ADD FOREIGN KEY (`anime_chapter_id`) REFERENCES `anime_chapter` (`id`);

ALTER TABLE `anime_chapter_comment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `anime_chapter_comment` ADD FOREIGN KEY (`sub_comment`) REFERENCES `anime_chapter_comment` (`id`);

ALTER TABLE `anime_chapter_comment` ADD FOREIGN KEY (`reply_comment_user_id`) REFERENCES `anime_chapter_comment` (`user_id`);

ALTER TABLE `anime_chapter_comment_user_like` ADD FOREIGN KEY (`comment_anime_chapter_id`) REFERENCES `anime_chapter_comment` (`id`);

ALTER TABLE `anime_chapter_comment_user_like` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `manga_thread` ADD FOREIGN KEY (`manga_id`) REFERENCES `manga` (`id`);

ALTER TABLE `manga_thread` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `manga_thread_user_like` ADD FOREIGN KEY (`manga_thread_id`) REFERENCES `manga_thread` (`id`);

ALTER TABLE `manga_thread_user_like` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `manga_thread_comment` ADD FOREIGN KEY (`manga_thread_id`) REFERENCES `manga_thread` (`id`);

ALTER TABLE `manga_thread_comment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `manga_thread_comment` ADD FOREIGN KEY (`sub_comment`) REFERENCES `manga_thread_comment` (`id`);

ALTER TABLE `manga_thread_comment` ADD FOREIGN KEY (`reply_comment_user_id`) REFERENCES `manga_thread_comment` (`user_id`);

ALTER TABLE `manga_thread_comment_user_like` ADD FOREIGN KEY (`manga_thread_comment`) REFERENCES `manga_thread_comment` (`id`);

ALTER TABLE `manga_thread_comment_user_like` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `anime_thread` ADD FOREIGN KEY (`anime_id`) REFERENCES `anime` (`id`);

ALTER TABLE `anime_thread` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `anime_thread_user_like` ADD FOREIGN KEY (`anime_thread_id`) REFERENCES `anime_thread` (`id`);

ALTER TABLE `anime_thread_user_like` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `anime_thread_comment` ADD FOREIGN KEY (`anime_thread_id`) REFERENCES `anime_thread` (`id`);

ALTER TABLE `anime_thread_comment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `anime_thread_comment` ADD FOREIGN KEY (`sub_comment`) REFERENCES `anime_thread_comment` (`id`);

ALTER TABLE `anime_thread_comment` ADD FOREIGN KEY (`reply_comment_user_id`) REFERENCES `anime_thread_comment` (`user_id`);

ALTER TABLE `anime_thread_comment_user_like` ADD FOREIGN KEY (`anime_thread_comment`) REFERENCES `anime_thread_comment` (`id`);

ALTER TABLE `anime_thread_comment_user_like` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
