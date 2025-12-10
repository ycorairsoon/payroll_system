-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2025 at 08:07 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payroll_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `certified_by`
--

CREATE TABLE `certified_by` (
  `cert_id` int(11) NOT NULL,
  `cert_a` varchar(100) NOT NULL,
  `cert_b` varchar(100) NOT NULL,
  `cert_c` varchar(100) NOT NULL,
  `cert_d` varchar(100) NOT NULL,
  `cert_e` varchar(100) NOT NULL,
  `cert_correct` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certified_by`
--

INSERT INTO `certified_by` (`cert_id`, `cert_a`, `cert_b`, `cert_c`, `cert_d`, `cert_e`, `cert_correct`) VALUES
(1, 'Jane Wilson', 'Mark Thompson', 'Sarah Johnson', 'Robert Davis', 'Michael Brown', 'Jennifer Lee');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_position` varchar(100) NOT NULL,
  `emp_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_name`, `emp_position`, `emp_no`) VALUES
(1, 'John Doe', 'Accountant', 'EMP001'),
(2, 'Jane Smith', 'Financial Analyst', 'EMP002'),
(3, 'John Lloyd', 'Accountant', 'EMP003'),
(4, 'Jane Layla', 'HR Officer', 'EMP004'),
(5, 'Carlos Reyes', 'Engineer', 'EMP005'),
(6, 'Emily Tan', 'Analyst', 'EMP006'),
(7, 'Mark Lim', 'Supervisor', 'EMP007'),
(8, 'Grace Lee', 'Developer', 'EMP008'),
(9, 'Aaron Cruz', 'Technician', 'EMP009'),
(10, 'Sample Employee1', 'Clerk', 'SE010'),
(11, 'Sample Employee2', 'Clerk', 'SE011'),
(12, 'Sample Employee3', 'Technician', 'SE012'),
(13, 'Sample Employee4', 'Analyst', 'SE013'),
(14, 'Sample Employee5', 'Assistant', 'SE014'),
(15, 'Sample Employee6', 'Supervisor', 'SE015'),
(16, 'Sample Employee7', 'Officer', 'SE016'),
(17, 'Sample Employee8', 'Engineer', 'SE017'),
(18, 'Sample Employee9', 'Assistant', 'SE018'),
(19, 'Sample Employee10', 'Coordinator', 'SE019'),
(20, 'Sample Employee11', 'Clerk', 'SE020'),
(21, 'Sample Employee12', 'Clerk', 'SE021'),
(22, 'Sample Employee13', 'Technician', 'SE022'),
(23, 'Sample Employee14', 'Analyst', 'SE023'),
(24, 'Sample Employee15', 'Assistant', 'SE024'),
(25, 'Sample Employee16', 'Supervisor', 'SE025'),
(26, 'Sample Employee17', 'Officer', 'SE026'),
(27, 'Sample Employee18', 'Engineer', 'SE027'),
(28, 'Sample Employee19', 'Assistant', 'SE028'),
(29, 'Sample Employee20', 'Coordinator', 'SE029'),
(30, 'Sample Employee21', 'Clerk', 'SE010'),
(31, 'Sample Employee22', 'Clerk', 'SE011'),
(32, 'Sample Employee23', 'Technician', 'SE012'),
(33, 'Sample Employee24', 'Analyst', 'SE013'),
(34, 'Sample Employee25', 'Assistant', 'SE014'),
(35, 'Sample Employee26', 'Supervisor', 'SE015'),
(36, 'Sample Employee27', 'Officer', 'SE016'),
(37, 'Sample Employee28', 'Engineer', 'SE017'),
(38, 'Sample Employee29', 'Assistant', 'SE018'),
(39, 'Sample Employee30', 'Coordinator', 'SE019'),
(40, 'Sample Employee31', 'Clerk', 'SE020'),
(41, 'Sample Employee32', 'Clerk', 'SE021'),
(42, 'Sample Employee33', 'Technician', 'SE022'),
(43, 'Sample Employee34', 'Analyst', 'SE023'),
(44, 'Sample Employee35', 'Assistant', 'SE024'),
(45, 'Sample Employee36', 'Supervisor', 'SE025'),
(46, 'Sample Employee37', 'Officer', 'SE026'),
(47, 'Sample Employee38', 'Engineer', 'SE027'),
(48, 'Sample Employee39', 'Assistant', 'SE028'),
(49, 'Sample Employee40', 'Coordinator', 'SE029');

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `office_id` int(11) NOT NULL,
  `office_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `office`
--

INSERT INTO `office` (`office_id`, `office_title`) VALUES
(1, 'Head Office');

-- --------------------------------------------------------

--
-- Stand-in structure for view `payroll_comprehensive_view`
-- (See below for the actual view)
--
CREATE TABLE `payroll_comprehensive_view` (
`date_start` date
,`date_end` date
,`PayrollMstID` varchar(50)
,`responsibility_title` varchar(100)
,`office_title` varchar(100)
,`payroll_id` int(11)
,`emp_name` varchar(100)
,`emp_position` varchar(100)
,`emp_no` varchar(50)
,`tax_code` varchar(50)
,`Salary` decimal(12,2)
,`PERA` decimal(12,2)
,`GrossIncome` decimal(12,2)
,`Tardiness` decimal(12,2)
,`IncomeTaxWithHeld` decimal(12,2)
,`PHIC_EmployeeShare` decimal(12,2)
,`PHIC_EmployerShare` decimal(12,2)
,`PAGIBIG_EmployeeShare` decimal(12,2)
,`PAGIBIG_EmployerShare` decimal(12,2)
,`PAGIBIG_II` decimal(12,2)
,`GSIS_EmployeeShare` decimal(12,2)
,`GSIS_EmployerShare` decimal(12,2)
,`GSIS_ECC` decimal(12,2)
,`PAGIBIG_MPL` decimal(12,2)
,`PAGIBIG_Housing` decimal(12,2)
,`PAGIBIG_LotPurchase` decimal(12,2)
,`GSCGEA_Dues` decimal(12,2)
,`GSCGEA_OtherDues` decimal(12,2)
,`GSCCoop` decimal(12,2)
,`GSIS_MPL` decimal(12,2)
,`ceap` decimal(12,2)
,`GSIS_ComputerLoan` decimal(12,2)
,`GSIS_MPLLite` decimal(12,2)
,`GSIS_PolicyLoanRegular` decimal(12,2)
,`GSIS_EmergencyLoan` decimal(12,2)
,`GSIS_GFAL` decimal(12,2)
,`BankLoan_LBP` decimal(12,2)
,`GrossDeductionGovernment` decimal(12,2)
,`GrossDeductionPersonal` decimal(12,2)
,`NetPay` decimal(12,2)
,`NetPay1stHalf` decimal(12,2)
,`NetPay2ndHalf` decimal(12,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_period`
--

CREATE TABLE `payroll_period` (
  `period_id` int(11) NOT NULL,
  `PayrollMstID` varchar(50) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `responsibility_id` int(11) NOT NULL,
  `office_id` int(11) NOT NULL,
  `status` varchar(20) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_period`
--

INSERT INTO `payroll_period` (`period_id`, `PayrollMstID`, `date_start`, `date_end`, `responsibility_id`, `office_id`, `status`) VALUES
(1, '10001', '2025-04-01', '2025-04-15', 1, 1, 'Active'),
(2, '10002', '2025-05-01', '2025-05-31', 1, 1, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_report_table`
--

CREATE TABLE `payroll_report_table` (
  `payroll_id` int(11) NOT NULL,
  `period_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `tax_code` varchar(50) DEFAULT NULL,
  `Salary` decimal(12,2) DEFAULT 0.00,
  `PERA` decimal(12,2) DEFAULT 0.00,
  `GrossIncome` decimal(12,2) DEFAULT 0.00,
  `Tardiness` decimal(12,2) DEFAULT 0.00,
  `IncomeTaxWithHeld` decimal(12,2) DEFAULT 0.00,
  `PHIC_EmployeeShare` decimal(12,2) DEFAULT 0.00,
  `PHIC_EmployerShare` decimal(12,2) DEFAULT 0.00,
  `PAGIBIG_EmployeeShare` decimal(12,2) DEFAULT 0.00,
  `PAGIBIG_EmployerShare` decimal(12,2) DEFAULT 0.00,
  `PAGIBIG_II` decimal(12,2) DEFAULT 0.00,
  `GSIS_EmployeeShare` decimal(12,2) DEFAULT 0.00,
  `GSIS_EmployerShare` decimal(12,2) DEFAULT 0.00,
  `GSIS_ECC` decimal(12,2) DEFAULT 0.00,
  `PAGIBIG_MPL` decimal(12,2) DEFAULT 0.00,
  `PAGIBIG_Housing` decimal(12,2) DEFAULT 0.00,
  `PAGIBIG_LotPurchase` decimal(12,2) DEFAULT 0.00,
  `GSCGEA_Dues` decimal(12,2) DEFAULT 0.00,
  `GSCGEA_OtherDues` decimal(12,2) DEFAULT 0.00,
  `GSCCoop` decimal(12,2) DEFAULT 0.00,
  `GSIS_MPL` decimal(12,2) DEFAULT 0.00,
  `ceap` decimal(12,2) DEFAULT 0.00,
  `GSIS_ComputerLoan` decimal(12,2) DEFAULT 0.00,
  `GSIS_MPLLite` decimal(12,2) DEFAULT 0.00,
  `GSIS_PolicyLoanRegular` decimal(12,2) DEFAULT 0.00,
  `GSIS_EmergencyLoan` decimal(12,2) DEFAULT 0.00,
  `GSIS_GFAL` decimal(12,2) DEFAULT 0.00,
  `BankLoan_LBP` decimal(12,2) DEFAULT 0.00,
  `GrossDeductionGovernment` decimal(12,2) DEFAULT 0.00,
  `GrossDeductionPersonal` decimal(12,2) DEFAULT 0.00,
  `NetPay` decimal(12,2) DEFAULT 0.00,
  `NetPay1stHalf` decimal(12,2) DEFAULT 0.00,
  `NetPay2ndHalf` decimal(12,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_report_table`
--

INSERT INTO `payroll_report_table` (`payroll_id`, `period_id`, `emp_id`, `tax_code`, `Salary`, `PERA`, `GrossIncome`, `Tardiness`, `IncomeTaxWithHeld`, `PHIC_EmployeeShare`, `PHIC_EmployerShare`, `PAGIBIG_EmployeeShare`, `PAGIBIG_EmployerShare`, `PAGIBIG_II`, `GSIS_EmployeeShare`, `GSIS_EmployerShare`, `GSIS_ECC`, `PAGIBIG_MPL`, `PAGIBIG_Housing`, `PAGIBIG_LotPurchase`, `GSCGEA_Dues`, `GSCGEA_OtherDues`, `GSCCoop`, `GSIS_MPL`, `ceap`, `GSIS_ComputerLoan`, `GSIS_MPLLite`, `GSIS_PolicyLoanRegular`, `GSIS_EmergencyLoan`, `GSIS_GFAL`, `BankLoan_LBP`, `GrossDeductionGovernment`, `GrossDeductionPersonal`, `NetPay`, `NetPay1stHalf`, `NetPay2ndHalf`) VALUES
(1, 1, 1, 'ME', 35000.00, 2000.00, 37000.00, 0.00, 3500.00, 550.00, 550.00, 100.00, 100.00, 0.00, 2450.00, 4900.00, 100.00, 0.00, 0.00, 0.00, 150.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 8250.00, 650.00, 28100.00, 14050.00, 14050.00),
(2, 1, 2, 'YOU', 40000.00, 2000.00, 42000.00, 0.00, 4200.00, 600.00, 600.00, 100.00, 100.00, 0.00, 2800.00, 5600.00, 100.00, 1000.00, 0.00, 0.00, 150.00, 0.00, 800.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 9650.00, 1950.00, 30400.00, 15200.00, 15200.00),
(3, 1, 5, NULL, 37500.00, 2000.00, 39500.00, 5.00, 3700.00, 570.00, 570.00, 100.00, 100.00, 5.00, 2600.00, 5200.00, 100.00, 5.00, 5.00, 5.00, 150.00, 5.00, 680.00, 5.00, 5.00, 5.00, 5.00, 5.00, 5.00, 0.00, 0.00, 8700.00, 1000.00, 30800.00, 15400.00, 15400.00),
(5, 1, 3, NULL, 37500.00, 2000.00, 39500.00, 0.00, 3700.00, 570.00, 570.00, 100.00, 100.00, 0.00, 2600.00, 5200.00, 100.00, 0.00, 0.00, 0.00, 150.00, 0.00, 680.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 8700.00, 1000.00, 30800.00, 15400.00, 15400.00),
(6, 1, 9, NULL, 38500.00, 2000.00, 40500.00, 0.00, 3900.00, 580.00, 580.00, 100.00, 100.00, 0.00, 2670.00, 5340.00, 100.00, 0.00, 0.00, 0.00, 150.00, 0.00, 720.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 8820.00, 1100.00, 31680.00, 15840.00, 15840.00),
(18, 1, 4, NULL, 36000.00, 2000.00, 38000.00, 0.00, 3400.00, 560.00, 560.00, 100.00, 100.00, 0.00, 2500.00, 5000.00, 100.00, 0.00, 500.00, 0.00, 150.00, 0.00, 600.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 8470.00, 1000.00, 28530.00, 14265.00, 14265.00),
(20, 1, 6, NULL, 37000.00, 2000.00, 39000.00, 0.00, 3600.00, 550.00, 550.00, 100.00, 100.00, 0.00, 2550.00, 5100.00, 100.00, 0.00, 0.00, 0.00, 150.00, 0.00, 650.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 8600.00, 1200.00, 30400.00, 15200.00, 15200.00),
(22, 1, 8, NULL, 39500.00, 2000.00, 41500.00, 0.00, 4100.00, 590.00, 590.00, 100.00, 100.00, 0.00, 2750.00, 5500.00, 100.00, 200.00, 0.00, 0.00, 150.00, 0.00, 820.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 9110.00, 800.00, 32390.00, 16195.00, 16195.00),
(23, 1, 9, NULL, 40500.00, 2000.00, 42500.00, 0.00, 4250.00, 610.00, 610.00, 100.00, 100.00, 0.00, 2900.00, 5800.00, 100.00, 1000.00, 0.00, 0.00, 150.00, 0.00, 950.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 10120.00, 1250.00, 32380.00, 16190.00, 16190.00),
(28, 1, 9, NULL, 38500.00, 2000.00, 40500.00, 0.00, 3900.00, 580.00, 580.00, 100.00, 100.00, 0.00, 2670.00, 5340.00, 100.00, 0.00, 0.00, 0.00, 150.00, 0.00, 720.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 8820.00, 1100.00, 31680.00, 15840.00, 15840.00),
(29, 1, 5, NULL, 37500.00, 2000.00, 39500.00, 0.00, 3700.00, 570.00, 570.00, 100.00, 100.00, 0.00, 2600.00, 5200.00, 100.00, 0.00, 0.00, 0.00, 150.00, 0.00, 680.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 8700.00, 1000.00, 30800.00, 15400.00, 15400.00),
(31, 1, 9, NULL, 37500.00, 2000.00, 39500.00, 0.00, 3700.00, 570.00, 570.00, 100.00, 100.00, 0.00, 2600.00, 5200.00, 100.00, 0.00, 0.00, 0.00, 150.00, 0.00, 680.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 8700.00, 1000.00, 30800.00, 15400.00, 15400.00),
(52, 1, 1, 'TC1', 30000.00, 2000.00, 32000.00, 200.00, 1500.00, 150.00, 150.00, 100.00, 100.00, 0.00, 400.00, 400.00, 100.00, 0.00, 0.00, 0.00, 50.00, 0.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3000.00, 500.00, 25500.00, 12750.00, 12750.00),
(53, 1, 2, 'TC1', 28000.00, 2000.00, 30000.00, 100.00, 1300.00, 150.00, 150.00, 100.00, 100.00, 0.00, 380.00, 380.00, 100.00, 0.00, 0.00, 0.00, 40.00, 0.00, 0.00, 180.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2800.00, 400.00, 24800.00, 12400.00, 12400.00),
(54, 1, 3, 'TC2', 32000.00, 2000.00, 34000.00, 300.00, 1600.00, 150.00, 150.00, 100.00, 100.00, 0.00, 420.00, 420.00, 100.00, 0.00, 0.00, 0.00, 60.00, 0.00, 0.00, 220.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3200.00, 600.00, 26200.00, 13100.00, 13100.00),
(55, 1, 4, 'TC2', 27000.00, 2000.00, 29000.00, 100.00, 1200.00, 150.00, 150.00, 100.00, 100.00, 0.00, 360.00, 360.00, 100.00, 0.00, 0.00, 0.00, 30.00, 0.00, 0.00, 170.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2700.00, 300.00, 24000.00, 12000.00, 12000.00),
(56, 1, 5, 'TC3', 35000.00, 2000.00, 37000.00, 200.00, 1800.00, 150.00, 150.00, 100.00, 100.00, 0.00, 450.00, 450.00, 100.00, 0.00, 0.00, 0.00, 70.00, 0.00, 0.00, 250.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3500.00, 700.00, 27500.00, 13750.00, 13750.00),
(57, 1, 6, 'TC1', 26000.00, 2000.00, 28000.00, 50.00, 1100.00, 150.00, 150.00, 100.00, 100.00, 0.00, 350.00, 350.00, 100.00, 0.00, 0.00, 0.00, 20.00, 0.00, 0.00, 160.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2600.00, 300.00, 23100.00, 11550.00, 11550.00),
(58, 1, 7, 'TC1', 40000.00, 2000.00, 42000.00, 250.00, 2100.00, 150.00, 150.00, 100.00, 100.00, 0.00, 500.00, 500.00, 100.00, 0.00, 0.00, 0.00, 80.00, 0.00, 0.00, 300.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 4000.00, 800.00, 32200.00, 16100.00, 16100.00),
(59, 1, 8, 'TC2', 38000.00, 2000.00, 40000.00, 200.00, 2000.00, 150.00, 150.00, 100.00, 100.00, 0.00, 480.00, 480.00, 100.00, 0.00, 0.00, 0.00, 70.00, 0.00, 0.00, 280.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3800.00, 700.00, 29500.00, 14750.00, 14750.00),
(60, 1, 9, 'TC1', 25000.00, 2000.00, 27000.00, 50.00, 1000.00, 150.00, 150.00, 100.00, 100.00, 0.00, 340.00, 340.00, 100.00, 0.00, 0.00, 0.00, 20.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2500.00, 250.00, 23250.00, 11625.00, 11625.00),
(61, 1, 10, 'TC2', 23000.00, 2000.00, 25000.00, 50.00, 900.00, 150.00, 150.00, 100.00, 100.00, 0.00, 330.00, 330.00, 100.00, 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, 140.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2300.00, 200.00, 21800.00, 10900.00, 10900.00),
(62, 1, 11, 'TC1', 24000.00, 2000.00, 26000.00, 100.00, 950.00, 150.00, 150.00, 100.00, 100.00, 0.00, 335.00, 335.00, 100.00, 0.00, 0.00, 0.00, 15.00, 0.00, 0.00, 145.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2400.00, 230.00, 22070.00, 11035.00, 11035.00),
(63, 1, 12, 'TC3', 29000.00, 2000.00, 31000.00, 150.00, 1200.00, 150.00, 150.00, 100.00, 100.00, 0.00, 370.00, 370.00, 100.00, 0.00, 0.00, 0.00, 30.00, 0.00, 0.00, 170.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2900.00, 300.00, 25100.00, 12550.00, 12550.00),
(64, 1, 13, 'TC1', 31000.00, 2000.00, 33000.00, 150.00, 1400.00, 150.00, 150.00, 100.00, 100.00, 0.00, 390.00, 390.00, 100.00, 0.00, 0.00, 0.00, 40.00, 0.00, 0.00, 190.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3100.00, 350.00, 25250.00, 12625.00, 12625.00),
(65, 1, 14, 'TC2', 22000.00, 2000.00, 24000.00, 50.00, 800.00, 150.00, 150.00, 100.00, 100.00, 0.00, 320.00, 320.00, 100.00, 0.00, 0.00, 0.00, 10.00, 0.00, 0.00, 130.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2200.00, 150.00, 20750.00, 10375.00, 10375.00),
(66, 1, 15, 'TC1', 35000.00, 2000.00, 37000.00, 200.00, 1800.00, 150.00, 150.00, 100.00, 100.00, 0.00, 450.00, 450.00, 100.00, 0.00, 0.00, 0.00, 60.00, 0.00, 0.00, 250.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3500.00, 700.00, 27500.00, 13750.00, 13750.00),
(67, 1, 16, 'TC3', 28000.00, 2000.00, 30000.00, 150.00, 1100.00, 150.00, 150.00, 100.00, 100.00, 0.00, 360.00, 360.00, 100.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 165.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2800.00, 300.00, 24100.00, 12050.00, 12050.00),
(68, 1, 17, 'TC2', 36000.00, 2000.00, 38000.00, 200.00, 1700.00, 150.00, 150.00, 100.00, 100.00, 0.00, 460.00, 460.00, 100.00, 0.00, 0.00, 0.00, 70.00, 0.00, 0.00, 260.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 3600.00, 650.00, 28150.00, 14075.00, 14075.00),
(69, 1, 18, 'TC1', 25000.00, 2000.00, 27000.00, 50.00, 1000.00, 150.00, 150.00, 100.00, 100.00, 0.00, 340.00, 340.00, 100.00, 0.00, 0.00, 0.00, 20.00, 0.00, 0.00, 150.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2500.00, 250.00, 23250.00, 11625.00, 11625.00),
(70, 1, 19, 'TC2', 26000.00, 2000.00, 28000.00, 100.00, 1100.00, 150.00, 150.00, 100.00, 100.00, 0.00, 350.00, 350.00, 100.00, 0.00, 0.00, 0.00, 25.00, 0.00, 0.00, 160.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2600.00, 280.00, 22820.00, 11410.00, 11410.00),
(71, 1, 20, 'TC3', 27000.00, 2000.00, 29000.00, 100.00, 1150.00, 150.00, 150.00, 100.00, 100.00, 0.00, 360.00, 360.00, 100.00, 0.00, 0.00, 0.00, 30.00, 0.00, 0.00, 165.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2700.00, 300.00, 23150.00, 11575.00, 11575.00);

-- --------------------------------------------------------

--
-- Table structure for table `responsibility`
--

CREATE TABLE `responsibility` (
  `responsibility_id` int(11) NOT NULL,
  `responsibility_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `responsibility`
--

INSERT INTO `responsibility` (`responsibility_id`, `responsibility_title`) VALUES
(1, 'Accounting Department'),
(2, 'ICTD');

-- --------------------------------------------------------

--
-- Structure for view `payroll_comprehensive_view`
--
DROP TABLE IF EXISTS `payroll_comprehensive_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `payroll_comprehensive_view`  AS SELECT `pp`.`date_start` AS `date_start`, `pp`.`date_end` AS `date_end`, `pp`.`PayrollMstID` AS `PayrollMstID`, `r`.`responsibility_title` AS `responsibility_title`, `o`.`office_title` AS `office_title`, `prt`.`payroll_id` AS `payroll_id`, `e`.`emp_name` AS `emp_name`, `e`.`emp_position` AS `emp_position`, `e`.`emp_no` AS `emp_no`, `prt`.`tax_code` AS `tax_code`, `prt`.`Salary` AS `Salary`, `prt`.`PERA` AS `PERA`, `prt`.`GrossIncome` AS `GrossIncome`, `prt`.`Tardiness` AS `Tardiness`, `prt`.`IncomeTaxWithHeld` AS `IncomeTaxWithHeld`, `prt`.`PHIC_EmployeeShare` AS `PHIC_EmployeeShare`, `prt`.`PHIC_EmployerShare` AS `PHIC_EmployerShare`, `prt`.`PAGIBIG_EmployeeShare` AS `PAGIBIG_EmployeeShare`, `prt`.`PAGIBIG_EmployerShare` AS `PAGIBIG_EmployerShare`, `prt`.`PAGIBIG_II` AS `PAGIBIG_II`, `prt`.`GSIS_EmployeeShare` AS `GSIS_EmployeeShare`, `prt`.`GSIS_EmployerShare` AS `GSIS_EmployerShare`, `prt`.`GSIS_ECC` AS `GSIS_ECC`, `prt`.`PAGIBIG_MPL` AS `PAGIBIG_MPL`, `prt`.`PAGIBIG_Housing` AS `PAGIBIG_Housing`, `prt`.`PAGIBIG_LotPurchase` AS `PAGIBIG_LotPurchase`, `prt`.`GSCGEA_Dues` AS `GSCGEA_Dues`, `prt`.`GSCGEA_OtherDues` AS `GSCGEA_OtherDues`, `prt`.`GSCCoop` AS `GSCCoop`, `prt`.`GSIS_MPL` AS `GSIS_MPL`, `prt`.`ceap` AS `ceap`, `prt`.`GSIS_ComputerLoan` AS `GSIS_ComputerLoan`, `prt`.`GSIS_MPLLite` AS `GSIS_MPLLite`, `prt`.`GSIS_PolicyLoanRegular` AS `GSIS_PolicyLoanRegular`, `prt`.`GSIS_EmergencyLoan` AS `GSIS_EmergencyLoan`, `prt`.`GSIS_GFAL` AS `GSIS_GFAL`, `prt`.`BankLoan_LBP` AS `BankLoan_LBP`, `prt`.`GrossDeductionGovernment` AS `GrossDeductionGovernment`, `prt`.`GrossDeductionPersonal` AS `GrossDeductionPersonal`, `prt`.`NetPay` AS `NetPay`, `prt`.`NetPay1stHalf` AS `NetPay1stHalf`, `prt`.`NetPay2ndHalf` AS `NetPay2ndHalf` FROM ((((`payroll_period` `pp` join `responsibility` `r` on(`pp`.`responsibility_id` = `r`.`responsibility_id`)) join `office` `o` on(`pp`.`office_id` = `o`.`office_id`)) join `payroll_report_table` `prt` on(`pp`.`period_id` = `prt`.`period_id`)) join `employee` `e` on(`prt`.`emp_id` = `e`.`emp_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `certified_by`
--
ALTER TABLE `certified_by`
  ADD PRIMARY KEY (`cert_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`office_id`);

--
-- Indexes for table `payroll_period`
--
ALTER TABLE `payroll_period`
  ADD PRIMARY KEY (`period_id`),
  ADD KEY `responsibility_id` (`responsibility_id`),
  ADD KEY `office_id` (`office_id`);

--
-- Indexes for table `payroll_report_table`
--
ALTER TABLE `payroll_report_table`
  ADD PRIMARY KEY (`payroll_id`),
  ADD KEY `period_id` (`period_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `responsibility`
--
ALTER TABLE `responsibility`
  ADD PRIMARY KEY (`responsibility_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `certified_by`
--
ALTER TABLE `certified_by`
  MODIFY `cert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `office`
--
ALTER TABLE `office`
  MODIFY `office_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payroll_period`
--
ALTER TABLE `payroll_period`
  MODIFY `period_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payroll_report_table`
--
ALTER TABLE `payroll_report_table`
  MODIFY `payroll_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `responsibility`
--
ALTER TABLE `responsibility`
  MODIFY `responsibility_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payroll_period`
--
ALTER TABLE `payroll_period`
  ADD CONSTRAINT `payroll_period_ibfk_1` FOREIGN KEY (`responsibility_id`) REFERENCES `responsibility` (`responsibility_id`),
  ADD CONSTRAINT `payroll_period_ibfk_2` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`);

--
-- Constraints for table `payroll_report_table`
--
ALTER TABLE `payroll_report_table`
  ADD CONSTRAINT `payroll_report_table_ibfk_1` FOREIGN KEY (`period_id`) REFERENCES `payroll_period` (`period_id`),
  ADD CONSTRAINT `payroll_report_table_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
