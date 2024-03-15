-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 15, 2024 at 05:48 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `company`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `Category_ID` varchar(5) NOT NULL,
  `Cat_Name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_ID`, `Cat_Name`) VALUES
('C0101', 'Chemical'),
('C0102', 'Storage and Distribution '),
('C0103', 'Filtration Systems'),
('C0104', 'Accessories and Maintenance'),
('C0105', 'Purification Systems'),
('C0106', 'Water Moters xyz'),
('C0107', 'Testing and Analysis Tools'),
('C0108', 'Wastewater Treatment'),
('C0109', 'Water Softening Equipment'),
('C0110', 'Reverse Osmosis (RO) Systems');

-- --------------------------------------------------------

--
-- Table structure for table `checkupdate`
--

DROP TABLE IF EXISTS `checkupdate`;
CREATE TABLE IF NOT EXISTS `checkupdate` (
  `Check_ID` varchar(5) NOT NULL,
  `Inventory_ID` varchar(5) NOT NULL,
  `Emp_ID` varchar(5) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Check_ID`),
  KEY `checkupdte_byEmpID` (`Emp_ID`),
  KEY `checkupdate_inventoryID` (`Inventory_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `Cus_ID` varchar(5) NOT NULL,
  `Login_ID` varchar(5) NOT NULL,
  `fname` varchar(15) NOT NULL,
  `lname` varchar(15) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Telephone` varchar(10) NOT NULL,
  `Email` varchar(35) NOT NULL,
  PRIMARY KEY (`Cus_ID`),
  KEY `login` (`Login_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Cus_ID`, `Login_ID`, `fname`, `lname`, `Address`, `Telephone`, `Email`) VALUES
('10001', 'L0003', 'Nimal', 'Siripala', 'Colombo', '0123456789', 'Nimal@gmail.com'),
('10002', 'L0004', 'Isuru', 'Pramuditha', 'Galle', '0112789456', 'pramuditha@gmail.com'),
('10003', 'L0005', 'Gihan', 'Silva', 'Kaluthara', '0112456789', 'Gihan@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `Emp_ID` varchar(5) NOT NULL,
  `Login_ID` varchar(5) NOT NULL,
  `fname` varchar(15) NOT NULL,
  `lname` varchar(15) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Telephone` varchar(10) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `Position` varchar(15) NOT NULL,
  PRIMARY KEY (`Emp_ID`),
  KEY `loginemp` (`Login_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Emp_ID`, `Login_ID`, `fname`, `lname`, `Address`, `Telephone`, `Email`, `Position`) VALUES
('EM001', 'L0001', 'Nisal', 'withana', 'Gampaha', '1234567890', 'ab@gmail.com', 'Manager'),
('EM101', 'L0002', 'Kasun', 'Rajitha', 'Ganegoda,Dompe', '1234567890', 'Rajitha@gmail.com', 'Supervisor'),
('EM201', 'L0006', 'Lahiru', 'Perera', 'Colombo 7', '1234567890', 'Perera@yahoo.com', 'Assistant '),
('EM301', 'L0007', 'Romesh', 'Pathirana', 'Mawathagama', '1234567890', 'romesh@gmail.com', 'Secondary Assis');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `Inventory_ID` varchar(5) NOT NULL,
  `Product_ID` varchar(5) NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`Inventory_ID`),
  KEY `productID_with_inventory` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`Inventory_ID`, `Product_ID`, `Quantity`) VALUES
('Q0001', 'P1001', 13),
('Q0002', 'P1002', 25),
('Q0003', 'P1003', 10),
('Q0004', 'P1004', 17),
('Q0005', 'P1005', 0),
('Q0006', 'P1006', 30),
('Q0007', 'P1007', 6),
('Q0008', 'P1008', 25),
('Q0009', 'P1009', 23),
('Q0010', 'P1010', 2),
('Q0011', 'P1011', 8),
('Q0012', 'P1012', 4),
('Q0013', 'P1013', 3),
('Q0014', 'P1023', 0),
('Q0015', 'P1024', 0);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `Log_ID` varchar(5) NOT NULL,
  `Login_Type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(15) NOT NULL,
  `Password` varchar(15) NOT NULL,
  PRIMARY KEY (`Log_ID`),
  UNIQUE KEY `username` (`username`)
) ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`Log_ID`, `Login_Type`, `username`, `Password`) VALUES
('L0001', 'Manager', 'Admin@01', '1234567'),
('L0002', 'Employee', 'Emp@01', '12345678'),
('L0003', 'Customer', 'Test@01', '1234567'),
('L0004', 'Customer', 'Customer@01', '1234567'),
('L0005', 'Customer', 'Customer@02', '1234567'),
('L0006', 'Employee', 'Employee@02', '1234567'),
('L0007', 'Employee', 'Employee@03', '1234567');

-- --------------------------------------------------------

--
-- Table structure for table `manage`
--

DROP TABLE IF EXISTS `manage`;
CREATE TABLE IF NOT EXISTS `manage` (
  `Manage_ID` varchar(5) NOT NULL,
  `Emp_ID` varchar(5) NOT NULL,
  `Product_ID` varchar(5) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Manage_ID`),
  KEY `manageby_empID` (`Emp_ID`),
  KEY `manage_productID` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `Order_ID` varchar(5) NOT NULL,
  `Cus_ID` varchar(5) NOT NULL,
  `Order_Date` date NOT NULL,
  `Order_Status` varchar(10) NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `order_with_cus` (`Cus_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`Order_ID`, `Cus_ID`, `Order_Date`, `Order_Status`) VALUES
('O0001', '10001', '2023-09-01', 'Complete'),
('O0002', '10002', '2023-09-03', 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE IF NOT EXISTS `orderitem` (
  `OrderItem_ID` varchar(5) NOT NULL,
  `Order_ID` varchar(5) NOT NULL,
  `Product_ID` varchar(5) NOT NULL,
  `Quantity` int NOT NULL,
  `Total_Price` float NOT NULL,
  PRIMARY KEY (`OrderItem_ID`),
  KEY `order_with_order` (`Order_ID`),
  KEY `order_with_product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`OrderItem_ID`, `Order_ID`, `Product_ID`, `Quantity`, `Total_Price`) VALUES
('I0001', 'O0001', 'P1001', 2, 24000),
('I0002', 'O0001', 'P1002', 1, 4500),
('I0003', 'O0002', 'P1003', 2, 9046),
('I0004', 'O0002', 'P1004', 2, 14400);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `Payment_ID` varchar(5) NOT NULL,
  `Order_ID` varchar(5) NOT NULL,
  `Payment Date` date NOT NULL,
  `Payment status` varchar(10) NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `payment_with_oderID` (`Order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_ID`, `Order_ID`, `Payment Date`, `Payment status`) VALUES
('P0001', 'O0001', '2023-09-01', 'Success'),
('P0002', 'O0002', '2023-09-03', 'Success');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `Product_ID` varchar(5) NOT NULL,
  `Category_ID` varchar(5) NOT NULL,
  `Supplier_ID` varchar(5) NOT NULL,
  `Name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Price` float NOT NULL,
  `Product_type` varchar(15) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Specification` varchar(300) NOT NULL,
  PRIMARY KEY (`Product_ID`),
  KEY `supplierID` (`Supplier_ID`),
  KEY `productID_with_category` (`Category_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Category_ID`, `Supplier_ID`, `Name`, `Price`, `Product_type`, `Description`, `Specification`) VALUES
('P1001', 'C0103', 'SU101', 'AquaPure Whole-House Sediment Filter', 7, 'filter', 'The AquaPure Whole-House Sediment Filter is designed to remove sediment, sand, and rust from your home\'s incoming water supply. It ensures cleaner water for all household uses.', 'Micron Rating: 5 microns\r\nFlow Rate: Up to 20 gallons per minute (GPM)\r\nInlet/Outlet Size: 1 inch\r\nFilter Dimensions: 10\" x 4.5\"'),
('P1002', 'C0103', 'SU101', 'CarbonMax Activated Carbon Cartridge', 4500, 'filter ', 'The CarbonMax filter cartridge is a high-quality replacement for your standard whole-house water filtration system. It effectively removes chlorine, odors, and organic contaminants.', 'Filter Media: Granular activated carbon (GAC)\r\nSize: 10\" x 2.5\"\r\nCapacity: 5,000 gallons'),
('P1003', 'C0103', 'SU101', 'ROGuard Pre-Filter Set', 4523, 'filter ', 'The ROGuard Pre-Filter Set includes essential pre-filters for your RO system. These filters prolong the life of the RO membrane and improve overall system performance.', 'Includes: Sediment filter, carbon block filter, inline GAC filter\r\nStandard size: Fits most RO systems'),
('P1004', 'C0103', 'SU101', 'Universal Replacement Cartridges', 7200, 'filter ', 'Our Universal Replacement Filter Cartridges come in various micron ratings and sizes to fit a wide range of water filtration systems. Ensure clean water with these high-quality cartridges.', 'Available in 1, 5, and 10-micron ratings\r\nSizes: 10\", 20\", and 30\"'),
('P1005', 'C0109', 'SU104', ' AquaSoft ProResidential Softener', 8900, ' softener', 'The AquaSoft Pro 40,000-Grain Water Softener provides your home with soft, scale-free water. It\'s equipped with a digital control valve for efficient operation.', 'Capacity: 40,000 grains\r\nControl Valve: Digital metered\r\nBrine Tank: Included'),
('P1006', 'C0109', 'SU104', 'EcoClear Salt-Free Water Conditioner', 3699, '  conditioner', 'The EcoClear Water Conditioner uses template-assisted crystallization (TAC) technology to prevent scale buildup without the use of salt. It\'s an eco-friendly solution for your home.', 'Technology: Template-assisted crystallization (TAC)'),
('P1007', 'C0109', 'SU104', 'High-Efficiency Replacement Resin', 7850, ' resin', 'Upgrade your water softener with our High-Efficiency Replacement Resin. It\'s a premium cation exchange resin that ensures optimal performance.', 'Size: 1 cubic foot\r\nCrosslink: 8%'),
('P1008', 'C0110', 'SU102', 'CrystalClear Residential 5-Stage RO', 14000, 'RO system', 'The CrystalClear 5-Stage RO System delivers pure, great-tasting drinking water by removing contaminants. It includes a storage tank and a dedicated faucet.', 'Filtration Stages: 5\r\nMembrane Capacity: 75 gallons per day (GPD)\r\nComponents: Storage tank, fauce'),
('P1009', 'C0105', 'SU104', 'AquaPure UV Water Purifier - 12 GPM', 4560, 'purification ', 'The AquaPure UV Water Purifier uses UV-C light to effectively destroy harmful microorganisms, ensuring safe and clean water for your home or business.', 'The AquaPure UV Water Purifier uses UV-C light to effectively destroy harmful microorganisms, ensuring safe and clean water for your home or business.'),
('P1010', 'C0110', 'SU102', 'OzoneMaster Ozone Generator - 10g/h', 25000, 'generator', 'The OzoneMaster Ozone Generator produces 10 grams of ozone per hour, making it ideal for water disinfection and purification in various applications.', 'Ozone Output: 10 grams per hour\r\nTimer Control: Adjustable\r\nAir Dryer: Included'),
('P1011', 'C0101', 'SU103', 'UltraChlor Liquid Chlorine', 5000, 'Liquid ', 'UltraChlor Liquid Chlorine is a powerful disinfectant for water treatment. It effectively kills bacteria, viruses, and algae in pools and water systems.\r\n', 'Chlorine Concentration: 12.5%\r\nContainer Size: 5 gallons'),
('P1012', 'C0101', 'SU103', 'ChloriClean Chlorine Dioxide Tablets', 200, 'Tablets', 'ChloriClean Chlorine Dioxide Tablets are a convenient and efficient way to generate chlorine dioxide for water disinfection and deodorization.', 'Tablet Size: 3 grams\r\nUsage: Dissolve in water'),
('P1013', 'C0107', 'SU105', ' pHMeter Pro Digital pH Meter', 3000, 'pH meter', 'The pHMeter Pro is a digital pH meter for accurate and easy measurement of pH levels in water. It\'s ideal for both professional and home use.', 'Measurement Range: 0-14 pH\r\nAccuracy: ±0.01 pH\r\nCalibration: Automatic'),
('P1014', 'C0107', 'SU105', 'AquaTDS Digital TDS Meter', 3200, 'TDS Meter', 'The AquaTDS Digital TDS Meter measures total dissolved solids in water, helping you monitor water quality and the effectiveness of your filtration systems.', 'Measurement Range: 0-9999 ppm\r\nAccuracy: ±2%'),
('P1015', 'C0107', 'SU105', 'TurbiClear Turbidity Meter', 4200, 'T meter', 'The TurbiClear Turbidity Meter quantifies water clarity by measuring turbidity. It\'s crucial for compliance with water quality regulations.', 'Measurement Range: 0-400 NTU\r\nResolution: 0.01 N'),
('P1016', 'C0102', 'SU105', 'AquaTank Polyethylene Water StorageTank', 25000, 'tank', 'The AquaTank Polyethylene Water Storage Tank is designed for safe and reliable water storage. It\'s suitable for residential, commercial, and industrial applications.', 'Capacity: 1000 gallons\r\nMaterial: UV-resistant polyethylene\r\nDimensions: 72\" x 48\" x 60\"'),
('P1017', 'C0104', 'SU105', 'Replacement Filter Cartridge', 6500, 'cartridge', 'This Replacement Filter Cartridge is specifically designed for use with Model XYZ water filtration systems. It ensures consistent water quality.', 'Micron Rating: 5 microns\r\nSize: 10\" x 2.5\"\r\nCompatibility: Model XYZ system'),
('P1018', 'C0104', 'SU105', 'Filter Housing O-Ring Kit', 3200, 'O-ring kit', 'The Filter Housing O-Ring Kit includes a variety of O-rings for different filter housing sizes. It helps maintain a watertight seal.', 'Sizes: 2.5\", 5\", 10\", and 20\" housings\r\nMaterial: EPDM rubber'),
('P1019', 'C0104', 'SU105', 'Valve and Connector Assortment', 450, 'Valves', 'This assortment includes a range of valves, adapters, and connectors to accommodate various water treatment system setups', 'Types: Ball valves, check valves, hose adapters, quick-connect fittings'),
('P1020', 'C0106', 'SU104', 'Water Motor', 15000, 'Motor', 'Modern water pumps are used throughout the world to supply water for municipal, industrial, agricultural, and residential uses', 'Power: 1500W\r\nVoltage:240V'),
('P1021', 'C0108', 'SU105', 'AquaClean Domestic Sewage Treatment Plan', 35000, 'Treatment Plant', 'The AquaClean Domestic Sewage Treatment Plant is an efficient system for treating household wastewater, ensuring compliance with environmental regulations.', 'Treatment Capacity: 5,000 gallons per day (GPD)\r\nProcess: Aeration and biological treatment'),
('P1022', 'C0108', 'SU105', 'SludgeMaster Dewatering Press', 35000, 'dewatering ', 'The SludgeMaster Dewatering Press is designed to efficiently dewater sludge from wastewater treatment processes, reducing disposal costs.', 'Processing Capacity: Up to 20 dry tons per day\r\nOperation: Fully automated'),
('P1023', 'C0101', 'SU101', '', 132.69, '', '', ''),
('P1024', 'C0101', 'SU101', 'ere', 1262.68, '2', '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `servicerequest`
--

DROP TABLE IF EXISTS `servicerequest`;
CREATE TABLE IF NOT EXISTS `servicerequest` (
  `RequestID` varchar(5) NOT NULL,
  `Cus_ID` varchar(5) NOT NULL,
  `Emp_ID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Request_Date` date NOT NULL,
  `Request_status` varchar(10) NOT NULL,
  `Request_Type` varchar(30) NOT NULL,
  PRIMARY KEY (`RequestID`),
  KEY `relatedcusID` (`Cus_ID`),
  KEY `relatedempID` (`Emp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `servicerequest`
--

INSERT INTO `servicerequest` (`RequestID`, `Cus_ID`, `Emp_ID`, `Request_Date`, `Request_status`, `Request_Type`) VALUES
('R0001', '10001', 'EM001', '2023-09-30', 'Closed', 'Maintenance Request'),
('R0002', '10002', 'EM001', '2023-09-01', 'Closed', 'Product Inquiry'),
('R0003', '10002', 'EM301', '2023-10-03', 'Closed', 'Maintenance Request');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `SupplierID` varchar(5) NOT NULL,
  `Supplier_name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Contract_info` varchar(500) NOT NULL,
  `Emp_ID` varchar(5) NOT NULL,
  PRIMARY KEY (`SupplierID`),
  KEY `contracEmp` (`Emp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `Supplier_name`, `Contract_info`, `Emp_ID`) VALUES
('SU101', 'AquaSoft Inc.', 'Whole-house sediment filters contract, Activated carbon filters contract.', 'EM001'),
('SU102', 'RO Systems Ltd.', 'Replacement filter cartridges contract for specific models', 'EM001'),
('SU103', 'AquaChemic', 'Chemical Supplier Contract. Supplier on time chemical stocks. Bank cheque accepted.  ', 'EM001'),
('SU104', 'WaterTest Pro', 'All types of Moters, Salt-free conditioner tanks contract, UV purification lamps contract, Testing and analysis tools contract, Ater softening equipment contract ', 'EM001'),
('SU105', 'GreenTechCorp', 'Testing and analysis tools contract, Storage and distribution components contract, Accessories and maintenance contract, Wastewater treatment contract. ', 'EM001');

-- --------------------------------------------------------

--
-- Table structure for table `view`
--

DROP TABLE IF EXISTS `view`;
CREATE TABLE IF NOT EXISTS `view` (
  `View_ID` varchar(5) NOT NULL,
  `Cus_ID` varchar(5) NOT NULL,
  `Product_ID` varchar(5) NOT NULL,
  PRIMARY KEY (`View_ID`),
  KEY `view_cusID` (`Cus_ID`),
  KEY `view_productID` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `view`
--

INSERT INTO `view` (`View_ID`, `Cus_ID`, `Product_ID`) VALUES
('V0001', '10002', 'P1001'),
('V0002', '10003', 'P1012'),
('V0004', '10003', 'P1011'),
('V0005', '10002', 'P1011'),
('V0006', '10001', 'P1011');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkupdate`
--
ALTER TABLE `checkupdate`
  ADD CONSTRAINT `checkupdate_inventoryID` FOREIGN KEY (`Inventory_ID`) REFERENCES `inventory` (`Inventory_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `checkupdte_byEmpID` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `login` FOREIGN KEY (`Login_ID`) REFERENCES `login` (`Log_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `loginemp` FOREIGN KEY (`Login_ID`) REFERENCES `login` (`Log_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `productID_with_inventory` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `manage`
--
ALTER TABLE `manage`
  ADD CONSTRAINT `manage_productID` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `manageby_empID` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_with_cus` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `order_with_order` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_with_product` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_with_oderID` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `productID_with_category` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `supplierID` FOREIGN KEY (`Supplier_ID`) REFERENCES `supplier` (`SupplierID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `servicerequest`
--
ALTER TABLE `servicerequest`
  ADD CONSTRAINT `relatedcusID` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `relatedempID` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `contracEmp` FOREIGN KEY (`Emp_ID`) REFERENCES `employee` (`Emp_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `view`
--
ALTER TABLE `view`
  ADD CONSTRAINT `view_cusID` FOREIGN KEY (`Cus_ID`) REFERENCES `customer` (`Cus_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `view_productID` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
