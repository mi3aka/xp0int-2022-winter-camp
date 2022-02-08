CREATE database `union_injection` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
use `union_injection`;
CREATE TABLE `users` (
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `username` varchar(255),
    `password` varchar(255)
);
INSERT INTO `users` (`username`,`password`) VALUES ("admin","can you capture the flag?");
CREATE TABLE `flag` (
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `flag` varchar(255)
);
INSERT INTO `flag` (`flag`) VALUES ("flag{union_injection welcome to xp0int winter camp}");


CREATE database `boolean_injection` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
use `boolean_injection`;
CREATE TABLE `users` (
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `username` varchar(255),
    `password` varchar(255)
);
INSERT INTO `users` (`username`,`password`) VALUES ("admin","can you capture the flag?");
CREATE TABLE `flag` (
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `flag` varchar(255)
);
INSERT INTO `flag` (`flag`) VALUES ("flag{boolean_injection welcome to xp0int winter camp}");


CREATE database `time_based_injection` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
use `time_based_injection`;
CREATE TABLE `users` (
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `username` varchar(255),
    `password` varchar(255)
);
INSERT INTO `users` (`username`,`password`) VALUES ("admin","can you capture the flag?");
CREATE TABLE `flag` (
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `flag` varchar(255)
);
INSERT INTO `flag` (`flag`) VALUES ("flag{time_based_injection welcome to xp0int winter camp}");


CREATE database `error_injection` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
use `error_injection`;
CREATE TABLE `users` (
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `username` varchar(255),
    `password` varchar(255)
);
INSERT INTO `users` (`username`,`password`) VALUES ("admin","can you capture the flag?");
CREATE TABLE `flag` (
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `flag` varchar(255)
);
INSERT INTO `flag` (`flag`) VALUES ("flag{error_injection welcome to xp0int winter camp}");


CREATE database `orderby_injection` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
use `orderby_injection`;
CREATE TABLE `users` (
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `username` varchar(255),
    `rank` int
);
INSERT INTO `users` (`username`,`rank`) VALUES ("Mike",100);
INSERT INTO `users` (`username`,`rank`) VALUES ("Jame",60);
INSERT INTO `users` (`username`,`rank`) VALUES ("Tim",90);
CREATE TABLE `flag` (
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `flag` varchar(255)
);
INSERT INTO `flag` (`flag`) VALUES ("flag{orderby_injection welcome to xp0int winter camp}");


CREATE database `constraint_based_attack` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
use `constraint_based_attack`;
CREATE TABLE `users` (
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `username` varchar(10),
    `password` varchar(10)
);
INSERT INTO `users` (`username`,`password`) VALUES ("admin","15c8bb41");


CREATE database `unkown_column_name_injection` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
use `unkown_column_name_injection`;
CREATE TABLE `users` (
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `username` varchar(255),
    `rank` int,
    `fl3g` varchar(255)
);
INSERT INTO `users` (`username`,`rank`) VALUES ("Mike",100);
INSERT INTO `users` (`username`,`rank`) VALUES ("Jame",60);
INSERT INTO `users` (`username`,`rank`) VALUES ("Tim",90);
INSERT INTO `users` (`username`,`rank`,`fl3g`) VALUES ("flag",75,"flag{unkown_column_name_injection welcome to xp0int winter camp}");


CREATE USER 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON `union_injection`.* TO 'user'@'%';
GRANT ALL PRIVILEGES ON `boolean_injection`.* TO 'user'@'%';
GRANT ALL PRIVILEGES ON `time_based_injection`.* TO 'user'@'%';
GRANT ALL PRIVILEGES ON `error_injection`.* TO 'user'@'%';
GRANT ALL PRIVILEGES ON `orderby_injection`.* TO 'user'@'%';
GRANT ALL PRIVILEGES ON `constraint_based_attack`.* TO 'user'@'%';
GRANT ALL PRIVILEGES ON `unkown_column_name_injection`.* TO 'user'@'%';
FLUSH PRIVILEGES;