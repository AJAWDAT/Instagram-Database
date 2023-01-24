CREATE DATABASE Instagram_DB
;

CREATE TABLE `app_user` (
  `ID` int,
  `first_name` char(20),
  `last_name` char(20),
  `profile_name` char(35),
  `signup_date` datetime,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `post` (
  `ID` int,
  `created_by_user_ID` int,
  `created_datetime` datetime,
  `caption` char(30),
  `post_type` char(20),
  PRIMARY KEY (`ID`)
);

CREATE TABLE `post_media` (
  `ID` int,
  `post_ID` int,
  `media_file` char(50),
  `filter_ID` int,
  `position` int,
  `longitude` float,
  `latitude` float,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `follower` (
  `following_user_ID` int,
  `followed_user_ID` int
);

CREATE TABLE `filter` (
  `ID` int,
  `filter_name` char(20),
  `filter_details` char(50),
  PRIMARY KEY (`ID`)
);

CREATE TABLE `effects` (
  `ID` int,
  `effect_name` int,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `post_effects` (
  `post_media_ID` int,
  `effect_ID` int,
  `scale` int
);

CREATE TABLE `post_media_user_tag` (
  `post_media__ID` int,
  `user_ID` int,
  `x_coordinate` int,
  `y_coordinate` int
);

CREATE TABLE `comment` (
  `ID` int,
  `created_by_user_ID` int,
  `created_datetime` datetime,
  `post_ID` int,
  `comment` varchar(255),
  `comment_replied_to_ID` int
);

CREATE TABLE `reaction` (
  `user_ID` int,
  `post_ID` int
);

CREATE TABLE `post_type` (
  `ID` int,
  `post_type_name` char(20)
);

ALTER TABLE `post` ADD FOREIGN KEY (`created_by_user_ID`) REFERENCES `app_user` (`ID`);

ALTER TABLE `post_media` ADD FOREIGN KEY (`post_ID`) REFERENCES `post` (`ID`);

ALTER TABLE `follower` ADD FOREIGN KEY (`following_user_ID`) REFERENCES `app_user` (`ID`);

ALTER TABLE `follower` ADD FOREIGN KEY (`followed_user_ID`) REFERENCES `app_user` (`ID`);

ALTER TABLE `post_media` ADD FOREIGN KEY (`filter_ID`) REFERENCES `filter` (`ID`);

ALTER TABLE `post_effects` ADD FOREIGN KEY (`post_media_ID`) REFERENCES `post_media` (`ID`);

ALTER TABLE `post_effects` ADD FOREIGN KEY (`effect_ID`) REFERENCES `effects` (`ID`);

ALTER TABLE `post_media_user_tag` ADD FOREIGN KEY (`user_ID`) REFERENCES `app_user` (`ID`);

ALTER TABLE `post_media_user_tag` ADD FOREIGN KEY (`post_media__ID`) REFERENCES `post_media` (`ID`);

ALTER TABLE `comment` ADD FOREIGN KEY (`created_by_user_ID`) REFERENCES `app_user` (`ID`);

ALTER TABLE `comment` ADD FOREIGN KEY (`post_ID`) REFERENCES `post` (`ID`);

ALTER TABLE `comment` ADD FOREIGN KEY (`comment_replied_to_ID`) REFERENCES `comment` (`ID`);

ALTER TABLE `reaction` ADD FOREIGN KEY (`user_ID`) REFERENCES `app_user` (`ID`);

ALTER TABLE `reaction` ADD FOREIGN KEY (`post_ID`) REFERENCES `post` (`ID`);

ALTER TABLE `post` ADD FOREIGN KEY (`post_type`) REFERENCES `post_type` (`ID`);
