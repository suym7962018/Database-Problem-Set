-- ----------------------------
-- Dataset for HW3 P1
-- Time: 2018-11-02 22:51
-- By: Qi Yao
-- ----------------------------
-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `custid` INT NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `ccn` VARCHAR(45) NOT NULL,
  `cphoneno` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `zip` INT NOT NULL,
  PRIMARY KEY (`custid`));

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (100001, 'Antonio','Rod','US', '48596784756','210 Lexinton St','New York',11211);
INSERT INTO `customer` VALUES (100002, 'Jerry', 'Tong','CN', '8476372654','75 Gateway St','New York', 11201);
INSERT INTO `customer` VALUES (100003, 'Brown', 'Snow','US', '34857694038','230 Golden St','New York', 11222);
INSERT INTO `customer` VALUES (100004, 'Guru','Singh','US', '3847596878','75 Pearl St','New York', 11223);
INSERT INTO `customer` VALUES (100005, 'Ivy','Yu','CN', '2039485768','120 5th Av','New York', 11222);
INSERT INTO `customer` VALUES (100006, 'Jack','Smith','UK', '9178594837','220 Stan St','New York', 11222);
INSERT INTO `customer` VALUES (100007, 'Jane','Jing','AUS', '39485068594','297 Smith St','New York', 11201);
INSERT INTO `customer` VALUES (100008, 'Tom','White','US', '45783940587','310 Courant St','New York', 11222);

-- ----------------------------
-- Table structure for `cake`
-- ----------------------------
DROP TABLE IF EXISTS `cake`;
CREATE TABLE `cake` (
  `cakeid` INT NOT NULL,
  `cakename` VARCHAR(45) NOT NULL,
  `slices` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  PRIMARY KEY (`cakeid`));

-- ----------------------------
-- Records of cake
-- ----------------------------
INSERT INTO `cake` VALUES (1, 'Cheese Cake', 8, 'available', 10);
INSERT INTO `cake` VALUES (2, 'Brownie', 2, 'available', 12);
INSERT INTO `cake` VALUES (3, 'Chocolate Cake', 10, 'available', 15);
INSERT INTO `cake` VALUES (4, 'Birthday Cake', 2, 'available', 50);
INSERT INTO `cake` VALUES (5, 'Opera Cake', 1, 'available', 21);

-- ----------------------------
-- Table structure for ingredient
-- ----------------------------
DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE `ingredient` (
  `ingredid` INT NOT NULL,
  `iname` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `available` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ingredid`));
  

-- ----------------------------
-- Records of ingredient
-- ----------------------------
INSERT INTO `ingredient` VALUES (1, 'cream', 10, 'yes');
INSERT INTO `ingredient` VALUES (2, 'flour', 5, 'yes');
INSERT INTO `ingredient` VALUES (3, 'sugar', 8, 'yes');
INSERT INTO `ingredient` VALUES (4, 'egg', 20, 'yes');
INSERT INTO `ingredient` VALUES (5, 'chocolate', 40, 'yes');
INSERT INTO `ingredient` VALUES (6, 'cheese', 80, 'yes');

-- ----------------------------
-- Table structure for `contain`
-- ----------------------------
DROP TABLE IF EXISTS `contain`;
CREATE TABLE `contain` (
  `cakeid` INT NOT NULL,
  `ingredid` INT NOT NULL,
  `qty` INT NOT NULL,
  PRIMARY KEY (`cakeid`,`ingredid`),
  CONSTRAINT `cake_fk` FOREIGN KEY (`cakeid`) REFERENCES `cake` (`cakeid`),
  CONSTRAINT `ingredient_fk` FOREIGN KEY (`ingredid`) REFERENCES `ingredient` (`ingredid`));
  
-- ----------------------------
-- Records of contain
-- ----------------------------
INSERT INTO `contain` VALUES (1, 6, 1);
INSERT INTO `contain` VALUES (1, 3, 2);
INSERT INTO `contain` VALUES (1, 4, 3);
INSERT INTO `contain` VALUES (2, 2, 2);
INSERT INTO `contain` VALUES (2, 3, 1);
INSERT INTO `contain` VALUES (2, 4, 2);
INSERT INTO `contain` VALUES (3, 2, 2);
INSERT INTO `contain` VALUES (3, 3, 1);
INSERT INTO `contain` VALUES (4, 2, 2);
INSERT INTO `contain` VALUES (4, 3, 1);
INSERT INTO `contain` VALUES (5, 2, 2);
INSERT INTO `contain` VALUES (5, 3, 1);
  
-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `custid` INT NOT NULL,
  `cakeid` INT NOT NULL,
  `ordertime` DATETIME NOT NULL,
  `pickuptime` DATETIME NOT NULL,
  `pricepaid` INT NOT NULL,
  PRIMARY KEY (`custid`,`cakeid`,`ordertime`),
  CONSTRAINT `cake_fk1` FOREIGN KEY (`cakeid`) REFERENCES `cake` (`cakeid`),
  CONSTRAINT `customer_fk` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`));
  
-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (100001, 1, '2018-10-05 12:00:00','2018-10-05 13:00:00',10);
INSERT INTO `orders` VALUES (100002, 2, '2018-10-05 13:00:00','2018-10-05 14:00:00',12);
INSERT INTO `orders` VALUES (100003, 3, '2018-10-06 12:00:00','2018-10-06 13:00:00',15);
INSERT INTO `orders` VALUES (100004, 4, '2018-10-07 12:00:00','2018-10-07 17:00:00',50);
INSERT INTO `orders` VALUES (100005, 5, '2018-10-08 12:00:00','2018-10-08 13:00:00',21);
INSERT INTO `orders` VALUES (100006, 1, '2018-10-05 11:00:00','2018-10-05 12:00:00',10);