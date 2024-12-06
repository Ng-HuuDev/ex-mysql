/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `res` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `res` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `res` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Pizza', 'pizza.jpg', 10.5, 'Delicious pizza', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Salad', 'salad.jpg', 5, 'Fresh salad', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'bánh mì', 'banhmi.jpg', 5, 'Fresh salad', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'cơm', 'com.jpg', 5, 'Fresh salad', 1),
(5, 'cháo', 'chao.jpg', 5, 'Fresh salad', 1),
(6, 'rau', 'rau.jpg', 5, 'Fresh salad', 1);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'an nhe');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'an chinh');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'an toi');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'an trua'),
(5, 'an chieu'),
(6, 'an dem');

INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(1, 1, 2, '2024-12-06 13:00:00');
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(2, 2, 4, '2024-12-06 13:00:00');
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(3, 3, 1, '2024-12-06 13:00:00');
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(4, 4, 3, '2024-12-06 13:00:00'),
(5, 5, 5, '2024-12-06 13:00:00'),
(6, 6, 6, '2024-12-06 13:00:00'),
(7, 1, 2, '2024-12-06 13:00:00'),
(8, 1, 4, '2024-12-06 13:00:00'),
(9, 3, 1, '2024-12-06 13:00:00'),
(10, 2, 3, '2024-12-06 13:00:00'),
(11, 4, 5, '2024-12-06 13:00:00'),
(12, 1, 6, '2024-12-06 13:00:00');

INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 1, 2, '123', '1,1');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 2, 3, 4, '321', '1,3');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 4, 4, 1, '122', '1,5');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(4, 3, 5, 5, '333', '1,6'),
(5, 1, 2, 6, '442', '1,4'),
(6, 5, 1, 2, '123', '1,1'),
(7, 1, 1, 2, '123', '1,1'),
(8, 2, 1, 4, '321', '1,3'),
(9, 4, 3, 1, '122', '1,5'),
(10, 3, 2, 5, '333', '1,6'),
(11, 1, 2, 6, '442', '1,4'),
(12, 5, 5, 2, '123', '1,1');

INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 2, 4, '2024-12-06 12:00:00');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 1, 2, 4, '2024-12-06 12:00:00');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 2, 1, 1, '2024-12-06 12:00:00');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 3, 4, 2, '2024-12-06 12:00:00'),
(5, 4, 3, 3, '2024-12-06 12:00:00'),
(6, 5, 5, 5, '2024-12-06 12:00:00'),
(7, 6, 6, 1, '2024-12-06 12:00:00');

INSERT INTO `res` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Res1', 'image1.jpg', 'Good food');
INSERT INTO `res` (`res_id`, `res_name`, `image`, `description`) VALUES
(2, 'Res2', 'image2.jpg', 'Tasty meals');
INSERT INTO `res` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'Res3', 'image2.jpg', 'Tasty meals');
INSERT INTO `res` (`res_id`, `res_name`, `image`, `description`) VALUES
(4, 'Res4', 'image2.jpg', 'Tasty meals'),
(5, 'Res5', 'image2.jpg', 'Tasty meals'),
(6, 'Res6', 'image2.jpg', 'Tasty meals');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'muối', 1000, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'đường', 1500, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'bánh mì thêm', 2000, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'cơm thêm', 1700, 1),
(5, 'cháo thêm', 1600, 1),
(6, 'rau thêm', 1200, 1);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Nguyen Van A', 'a@example.com', '123');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Nguyen Van B', 'b@example.com', '1234');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Nguyen Van C', 'c@example.com', '321');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Nguyen Van D', 'd@example.com', '4321'),
(5, 'Nguyen Van E', 'e@example.com', '2133'),
(6, 'Nguyen Van F', 'f@example.com', '123123'),
(7, 'Nguyen Van A', 'a@example.com', '123'),
(8, 'Nguyen Van B', 'b@example.com', '1234'),
(9, 'Nguyen Van C', 'c@example.com', '321'),
(10, 'Nguyen Van D', 'd@example.com', '4321'),
(11, 'Nguyen Van E', 'e@example.com', '2133'),
(12, 'Nguyen Van F', 'f@example.com', '123123'),
(13, 'Nguyen Van G', 'g@example.com', '12323');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;