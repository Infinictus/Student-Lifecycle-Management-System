SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE TABLE `attendence` (
  `aid` int(11) NOT NULL,
  `rollno` varchar(20) NOT NULL,
  `attendance` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `department` (
  `cid` int(11) NOT NULL,
  `branch` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `department` (`cid`, `branch`) VALUES
(1, 'CSE'),
(2, 'AI'),
(3, 'Cyber Security'),
(4, 'IT'),
(5, 'ECE');

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `rollno` varchar(20) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `sem` int(20) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(12) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DELIMITER $$
CREATE TRIGGER `DELETE` BEFORE DELETE ON `student` FOR EACH ROW INSERT INTO trig VALUES(null,OLD.rollno,'STUDENT DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Insert` AFTER INSERT ON `student` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.rollno,'STUDENT INSERTED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UPDATE` AFTER UPDATE ON `student` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.rollno,'STUDENT UPDATED',NOW())
$$
DELIMITER ;

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(52) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `test` (`id`, `name`, `email`) VALUES
(1, 'arnav', 'arnav@gmail.com');

CREATE TABLE `trig` (
  `tid` int(11) NOT NULL,
  `rollno` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `attendence`
  ADD PRIMARY KEY (`aid`);

ALTER TABLE `department`
  ADD PRIMARY KEY (`cid`);

ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `trig`
  ADD PRIMARY KEY (`tid`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `attendence`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `department`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `trig`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
