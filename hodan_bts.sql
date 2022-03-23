-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2022 at 07:22 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hodan_bts`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_buldingtypetable` (IN `p_buldingtype` VARCHAR(100), IN `p_buldingname` VARCHAR(50), IN `p_tax_price` INT, IN `p_user_id` INT, IN `p_date` DATE, IN `p_id` INT)  NO SQL
BEGIN
IF EXISTS(SELECT * FROM buldingtypetable b WHERE b.id=p_id) THEN
	UPDATE buldingtypetable b SET b.buldingtype=p_buldingtype,b.buldingname=p_buldingname,b.tax_price=p_tax_price
    ,b.user_id=p_user_id,b.date=p_date
     WHERE d.id=p_id;
    SELECT "success|buldingtypetable Updated Successfully" msg; 
ELSEIF EXISTS(SELECT * FROM buldingtypetable b WHERE b.buldingtype=p_buldingtype) THEN
	SELECT "warning|buldingtypetable already exists" msg;
ELSE
	INSERT INTO `buldingtypetable`(`buldingtype`, `buldingname`, `tax_price`,`user_id`, `date`) VALUES (p_buldingtype,p_buldingname,p_tax_price,p_user_id,p_date);
    SELECT "success|buldingtypetable registered succesfully" msg;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_busines` (IN `sp_district` INT, IN `sp_department` INT, IN `sp_branch` INT, IN `sp_address` VARCHAR(100), IN `sp_businesstype` INT, IN `sp_id` INT)  NO SQL
BEGIN
IF EXISTS(SELECT * FROM bussines b WHERE b.id=sp_id) THEN
	UPDATE bussines b SET b.district=sp_district,b.department=sp_department,b.branch=sp_branch
    ,b.businesstype=sp_businesstype,b.address=sp_address
     WHERE d.id=p_id;
    SELECT "success|bussines Updated Successfully" msg; 
ELSEIF EXISTS(SELECT * FROM bussines b WHERE b.businesstype=sp_businesstype) THEN
	SELECT "warning|bussines already exists" msg;
ELSE
	INSERT INTO `bussines`(`district`, `department`, `branch`, `businesstype`, `address`) VALUES (sp_district,sp_department,sp_branch,sp_businesstype,sp_address);
    SELECT "success|bussines registered succesfully" msg;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_department` (IN `p_districtt` INT, IN `p_departmentname` VARCHAR(50), IN `p_userid` INT, IN `pdate` DATE, IN `pid` INT)  NO SQL
BEGIN
IF EXISTS(SELECT * FROM department d WHERE d.id=pid) THEN
	UPDATE department d SET d.district=p_districtt,d.departmentname=p_departmentname,d.date=p_date
     WHERE d.id=pid;
    SELECT "success|Department Updated Successfully" msg; 
ELSEIF EXISTS(SELECT * FROM department d WHERE d.departmentname=p_departmentname) THEN
	SELECT "warning|Department already exists" msg;
ELSE
	INSERT INTO `department`(`id`, `district`, `departmentname`, `date`, `user_id`) VALUES (NULL,p_districtt,p_departmentname,pdate,p_userid);
    SELECT "success|Department registered succesfully" msg;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_district` (IN `p_districtnumber` VARCHAR(100), IN `p_distnict_name` VARCHAR(50), IN `p_District_Commissioner` VARCHAR(50), IN `p_userid` INT, IN `p_date` DATE, IN `pid` INT)  NO SQL
BEGIN
IF EXISTS(SELECT * FROM distincts d WHERE d.id=pid) THEN
	UPDATE distincts d SET d.district_number=p_districtnumber,d.District_Names=p_distnict_name,
    d.District_Commissioner=p_District_Commissioner,d.user_id=p_userid,d.date=p_date
     WHERE d.id=pid;
    SELECT "success|distincts Updated Successfully" msg; 
ELSEIF EXISTS(SELECT * FROM distincts d WHERE d.District_Names=p_distnict_name) THEN
	SELECT "warning|District already exists" msg;
ELSE
	INSERT INTO `distincts`(`district_number`, `District_Names`, `District_Commissioner`,`date`,`user_id`) VALUES (p_districtnumber,p_distnict_name,p_District_Commissioner ,p_date,p_userid);
    SELECT "success|District registered succesfully" msg;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_hometaxpayers` (IN `sp_ownername` INT, IN `sp_owner_telephone` INT, IN `sp_username` INT, IN `sp_password` INT, IN `sp_district` INT, IN `sp_department` INT, IN `sp_branch` INT, IN `sp_address` INT, IN `sp_homenumer` INT, IN `sp_buldingtype` INT, IN `sp_balac` INT, IN `sp_dherer` INT, IN `sp_joog` INT, IN `sp_user_id` INT, IN `sp_date` INT, IN `sp_id` INT)  NO SQL
BEGIN
IF EXISTS(SELECT * FROM hometaxpayers b WHERE b.id=sp_id) THEN
	UPDATE hometaxpayers b SET b.ownername=sp_ownername,b.owner_telephone=sp_owner_telephone,b.username=sp_username
    ,b.password=sp_password,b.district=sp_district,b.department=sp_department,b.branch=sp_branch,b.address=sp_address,b.homenumer=sp_homenumer,b.buldingtype=sp_buldingtype,b.balac=sp_balac,b.dherer=sp_dherer,b.joog=sp_joog,b.user_id=sp_user_id,b.date=sp_date
     WHERE d.id=sp_id;
    SELECT "success|hometaxpayers Updated Successfully" msg; 
ELSEIF EXISTS(SELECT * FROM hometaxpayers b WHERE b.ownername=sp_ownername) THEN
	SELECT "warning|hometaxpayers already exists" msg;
ELSE
	INSERT INTO `hometaxpayers`(`ownername`, `owner_telephone`, `username`, `password`, `district`,department,branch,address,homenumer,buldingtype,balac,dherer,joog,user_id,date) VALUES (sp_ownername,sp_owner_telephone,sp_username,sp_password,sp_district,sp_department,sp_branch,sp_address,sp_homenumer,sp_buldingtype,sp_balac,sp_dherer,sp_joog,sp_user_id,sp_date);
    SELECT "success|bussines registered succesfully" msg;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_users` (IN `p_fullname` INT, IN `p_Phone` INT, IN `p_address` INT, IN `p_username` INT, IN `p_userType` INT, IN `p_password` INT, IN `p_user_id` INT, IN `p_date` INT, IN `p_id` INT)  NO SQL
BEGIN
IF EXISTS(SELECT * FROM users b WHERE b.id=p_id) THEN
	UPDATE users b SET b.fullname=p_fullname,b.Phone=p_Phone,b.address=p_address
    ,b.username=p_username,b.userType=p_userType,b.password=p_password,b.user_id=p_user_id,b.date=p_date
     WHERE d.id=p_id;
    SELECT "success|users Updated Successfully" msg; 
ELSEIF EXISTS(SELECT * FROM users b WHERE b.username=p_username) THEN
	SELECT "warning|users already exists" msg;
ELSE
	INSERT INTO `users`(`fullname`, `Phone`, `address`, `username`, `userType`,password,user_id,date) VALUES (p_fullname,p_Phone,p_address,p_username,p_userType,p_password,p_user_id,p_date);
    SELECT "success|users registered succesfully" msg;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_usertypetable` (IN `p_usertypename` INT, IN `p_user_id` INT, IN `p_date` INT, IN `p_id` INT)  NO SQL
BEGIN
IF EXISTS(SELECT * FROM usertypetable b WHERE b.id=p_id) THEN
	UPDATE usertypetable b SET b.usertypename=p_usertypename,b.user_id=p_user_id,b.date=p_date
     WHERE d.id=p_id;
    SELECT "success|usertypetable Updated Successfully" msg; 
ELSEIF EXISTS(SELECT * FROM usertypetable b WHERE b.usertypename=p_usertypename) THEN
	SELECT "warning|usertypetable already exists" msg;
ELSE
	INSERT INTO `usertypetable`(`usertypename`, `user_id`, `date`) VALUES (p_usertypename,p_user_id,p_date);
    SELECT "success|usertypetable registered succesfully" msg;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_bussinestype` (IN `p_business_Type` INT, IN `p_bussines_name` INT, IN `p_Tax_price` INT, IN `p_image` INT, IN `p_id` INT)  NO SQL
BEGIN
IF EXISTS(SELECT * FROM bussinestype b WHERE b.id=p_id) THEN
	UPDATE bussinestype b SET b.business_Type=p_business_Type,b.bussines_name=p_bussines_name,b.Tax_price=p_Tax_price,b.image=p_image
     WHERE d.id=p_id;
    SELECT "success|bussinestype Updated Successfully" msg; 
ELSEIF EXISTS(SELECT * FROM bussinestype b WHERE b.bussines_name=p_bussines_name) THEN
	SELECT "warning|bussinestype already exists" msg;
ELSE
	INSERT INTO `bussinestype`(`business_Type`, `bussines_name`, `Tax_price`,image) VALUES (p_business_Type,p_bussines_name,p_Tax_price,p_image);
    SELECT "success|bussinestype registered succesfully" msg;
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_branchs` (IN `p_district` INT, IN `p_department` INT, IN `p_branchname` VARCHAR(50), IN `p_date` DATE, IN `p_id` INT, IN `p_userid` INT)  NO SQL
BEGIN
IF EXISTS(SELECT * FROM branch b WHERE b.id=p_id) THEN
	UPDATE branch b SET b.district=p_district,b.department=p_department,b.branchname=p_branchname,b.date=p_date,b.user_id=p_userid
     WHERE b.id=p_id;
    SELECT "success|branch Updated Successfully" msg; 
ELSEIF EXISTS(SELECT * FROM branch b WHERE b.branchname=p_branchname) THEN
	SELECT "warning|branch already exists" msg;
ELSE
	INSERT INTO `branch`(`district`,`department`, `branchname`,`date`,`user_id`) 
    VALUES (p_district,p_department,p_branchname,p_date,p_userid);
    SELECT "success|branch registered succesfully" msg;
   END IF ;
   END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `district` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `branchname` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `district`, `department`, `branchname`, `user_id`, `date`) VALUES
(1, 1, 12, 'nb', 2, '0000-00-00 00:00:00'),
(2, 3, 4, 'gy', 2, '2022-03-22 21:00:00'),
(3, 3, 5, 'gt', 2, '2022-03-22 21:00:00'),
(4, 1, 11, 'yu', 2, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `buldingtypetable`
--

CREATE TABLE `buldingtypetable` (
  `id` int(11) NOT NULL,
  `buldingtype` varchar(50) DEFAULT NULL,
  `buldingname` varchar(50) DEFAULT NULL,
  `tax_price` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buldingtypetable`
--

INSERT INTO `buldingtypetable` (`id`, `buldingtype`, `buldingname`, `tax_price`, `user_id`, `date`) VALUES
(1, 'jj', 'v', 5, NULL, '2022-03-22 21:00:00'),
(2, 'w', 'v', 3, NULL, '2022-03-22 21:00:00'),
(3, 't', 'y', 6, 1, '2022-03-21 21:00:00'),
(4, '', '', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `bussines`
--

CREATE TABLE `bussines` (
  `id` int(11) NOT NULL,
  `district` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `branch` int(11) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `businesstype` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bussines`
--

INSERT INTO `bussines` (`id`, `district`, `department`, `branch`, `address`, `businesstype`) VALUES
(1, 1, 1, 1, 'hodan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bussinestype`
--

CREATE TABLE `bussinestype` (
  `id` int(11) NOT NULL,
  `business_Type` varchar(30) DEFAULT NULL,
  `bussines_name` varchar(30) DEFAULT NULL,
  `Tax_price` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bussinestype`
--

INSERT INTO `bussinestype` (`id`, `business_Type`, `bussines_name`, `Tax_price`, `image`) VALUES
(1, '1', '1', 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `district` int(11) DEFAULT NULL,
  `departmentname` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `district`, `departmentname`, `user_id`, `date`) VALUES
(1, 1, 'mad', 2, '2022-03-22 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `distincts`
--

CREATE TABLE `distincts` (
  `id` int(11) NOT NULL,
  `District_Number` varchar(50) DEFAULT NULL,
  `District_Names` varchar(50) DEFAULT NULL,
  `District_Commissioner` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distincts`
--

INSERT INTO `distincts` (`id`, `District_Number`, `District_Names`, `District_Commissioner`, `user_id`, `Date`) VALUES
(1, 'one', 'ma', 'gu', 2, '2022-03-22 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `hometaxpayers`
--

CREATE TABLE `hometaxpayers` (
  `id` int(11) NOT NULL,
  `ownername` varchar(50) DEFAULT NULL,
  `owner_telephone` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `branch` int(11) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `homenumer` varchar(50) DEFAULT NULL,
  `buldingtype` int(11) DEFAULT NULL,
  `balac` int(11) DEFAULT NULL,
  `dherer` int(11) DEFAULT NULL,
  `joog` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hometaxpayers`
--

INSERT INTO `hometaxpayers` (`id`, `ownername`, `owner_telephone`, `username`, `password`, `district`, `department`, `branch`, `address`, `homenumer`, `buldingtype`, `balac`, `dherer`, `joog`, `user_id`, `date`) VALUES
(1, '11', '1', '1', '3', 4, 6, 8, '8', '8', 456, 7, 7, 8, 8, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `userType` int(11) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `Phone`, `address`, `username`, `userType`, `password`, `user_id`, `date`) VALUES
(1, '11', '5', '5', '87', 9, '123', 1, '2000-01-22 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `usertypetable`
--

CREATE TABLE `usertypetable` (
  `id` int(11) NOT NULL,
  `usertypename` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertypetable`
--

INSERT INTO `usertypetable` (`id`, `usertypename`, `user_id`, `date`) VALUES
(1, '1', 1, '2000-01-22 21:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buldingtypetable`
--
ALTER TABLE `buldingtypetable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bussines`
--
ALTER TABLE `bussines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bussinestype`
--
ALTER TABLE `bussinestype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `distincts`
--
ALTER TABLE `distincts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hometaxpayers`
--
ALTER TABLE `hometaxpayers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usertypetable`
--
ALTER TABLE `usertypetable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `buldingtypetable`
--
ALTER TABLE `buldingtypetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bussines`
--
ALTER TABLE `bussines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bussinestype`
--
ALTER TABLE `bussinestype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `distincts`
--
ALTER TABLE `distincts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hometaxpayers`
--
ALTER TABLE `hometaxpayers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usertypetable`
--
ALTER TABLE `usertypetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
