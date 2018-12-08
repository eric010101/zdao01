-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2018 年 12 月 08 日 09:31
-- 伺服器版本: 10.1.26-MariaDB
-- PHP 版本： 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `esbc_zdao01`
--

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_cash_balance`
--

CREATE TABLE `zdao_cash_balance` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `depositor` mediumint(8) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `money` decimal(12,2) NOT NULL,
  `currency` char(30) NOT NULL,
  `createdBy` char(30) NOT NULL DEFAULT '',
  `createdDate` datetime NOT NULL,
  `editedBy` char(30) NOT NULL DEFAULT '',
  `editedDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_cash_depositor`
--

CREATE TABLE `zdao_cash_depositor` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `abbr` char(60) NOT NULL,
  `provider` char(100) NOT NULL,
  `title` char(100) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `account` char(90) NOT NULL,
  `bankcode` varchar(30) NOT NULL,
  `public` enum('0','1') NOT NULL,
  `type` enum('cash','bank','online') NOT NULL,
  `currency` char(30) NOT NULL,
  `status` enum('normal','disable') NOT NULL DEFAULT 'normal',
  `createdBy` char(30) NOT NULL DEFAULT '',
  `createdDate` datetime NOT NULL,
  `editedBy` char(30) NOT NULL DEFAULT '',
  `editedDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_cash_trade`
--

CREATE TABLE `zdao_cash_trade` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `depositor` mediumint(8) UNSIGNED NOT NULL,
  `parent` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `product` mediumint(8) UNSIGNED NOT NULL,
  `trader` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `order` mediumint(8) UNSIGNED NOT NULL,
  `contract` mediumint(8) UNSIGNED NOT NULL,
  `project` mediumint(8) UNSIGNED NOT NULL,
  `investID` mediumint(8) UNSIGNED NOT NULL,
  `loanID` mediumint(8) UNSIGNED NOT NULL,
  `dept` mediumint(8) UNSIGNED NOT NULL,
  `type` enum('in','out','transferin','transferout','invest','redeem','loan','repay') NOT NULL,
  `money` decimal(12,2) NOT NULL,
  `exchangeRate` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `currency` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `deadline` date NOT NULL,
  `handlers` varchar(255) NOT NULL,
  `category` char(30) NOT NULL DEFAULT '0',
  `desc` text NOT NULL,
  `createdBy` char(30) NOT NULL DEFAULT '',
  `createdDate` datetime NOT NULL,
  `editedBy` char(30) NOT NULL DEFAULT '',
  `editedDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_crm_address`
--

CREATE TABLE `zdao_crm_address` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `objectType` char(30) NOT NULL,
  `objectID` mediumint(8) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `area` mediumint(8) UNSIGNED NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_crm_contact`
--

CREATE TABLE `zdao_crm_contact` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `realname` char(30) NOT NULL DEFAULT '',
  `nickname` char(30) NOT NULL,
  `resume` mediumint(8) UNSIGNED NOT NULL,
  `origin` varchar(150) NOT NULL,
  `originAccount` varchar(255) NOT NULL,
  `status` enum('normal','wait','ignore') NOT NULL DEFAULT 'normal',
  `avatar` varchar(255) NOT NULL,
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `gender` enum('f','m','u') NOT NULL DEFAULT 'u',
  `email` char(50) NOT NULL DEFAULT '',
  `skype` char(50) NOT NULL,
  `qq` char(20) NOT NULL DEFAULT '',
  `yahoo` char(50) NOT NULL DEFAULT '',
  `gtalk` char(50) NOT NULL DEFAULT '',
  `wangwang` char(50) NOT NULL DEFAULT '',
  `site` varchar(100) NOT NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  `phone` char(20) NOT NULL DEFAULT '',
  `company` varchar(255) NOT NULL,
  `fax` char(20) NOT NULL DEFAULT '',
  `weibo` char(50) NOT NULL,
  `weixin` char(50) NOT NULL,
  `desc` text NOT NULL,
  `createdBy` char(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `editedBy` char(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `contactedBy` char(30) NOT NULL,
  `contactedDate` datetime NOT NULL,
  `nextDate` date NOT NULL,
  `assignedTo` char(30) NOT NULL,
  `ignoredBy` char(30) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_crm_contract`
--

CREATE TABLE `zdao_crm_contract` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `customer` mediumint(8) UNSIGNED NOT NULL,
  `name` char(100) NOT NULL,
  `code` char(30) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `items` text NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `delivery` char(30) NOT NULL,
  `return` char(30) NOT NULL,
  `currency` varchar(20) NOT NULL,
  `status` enum('normal','closed','canceled') NOT NULL DEFAULT 'normal',
  `contact` mediumint(8) UNSIGNED NOT NULL,
  `address` mediumint(8) UNSIGNED NOT NULL,
  `handlers` varchar(255) NOT NULL,
  `signedBy` char(30) NOT NULL,
  `signedDate` date NOT NULL,
  `deliveredBy` char(30) NOT NULL,
  `deliveredDate` date NOT NULL,
  `returnedBy` char(30) NOT NULL,
  `returnedDate` date NOT NULL,
  `finishedBy` char(30) NOT NULL,
  `finishedDate` date NOT NULL,
  `canceledBy` char(30) NOT NULL,
  `canceledDate` date NOT NULL,
  `createdBy` char(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `editedBy` char(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `contactedBy` char(30) NOT NULL,
  `contactedDate` datetime NOT NULL,
  `nextDate` date NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_crm_contractorder`
--

CREATE TABLE `zdao_crm_contractorder` (
  `contract` mediumint(8) UNSIGNED NOT NULL,
  `order` mediumint(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_crm_customer`
--

CREATE TABLE `zdao_crm_customer` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` char(100) NOT NULL,
  `type` char(30) NOT NULL,
  `relation` enum('client','provider','partner') NOT NULL DEFAULT 'client',
  `source` varchar(20) NOT NULL,
  `sourceNote` varchar(255) NOT NULL,
  `size` tinyint(3) UNSIGNED NOT NULL,
  `industry` mediumint(8) UNSIGNED NOT NULL,
  `area` mediumint(8) UNSIGNED NOT NULL,
  `status` char(30) NOT NULL,
  `level` char(10) NOT NULL,
  `intension` text NOT NULL,
  `site` varchar(100) NOT NULL,
  `weibo` char(50) NOT NULL,
  `weixin` char(50) NOT NULL,
  `category` mediumint(8) NOT NULL,
  `depositor` varchar(100) NOT NULL,
  `desc` text NOT NULL,
  `public` enum('0','1') NOT NULL DEFAULT '0',
  `createdBy` char(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `assignedTo` char(30) NOT NULL,
  `assignedBy` char(30) NOT NULL,
  `assignedDate` datetime NOT NULL,
  `editedBy` char(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `contactedBy` char(30) NOT NULL,
  `contactedDate` datetime NOT NULL,
  `nextDate` date NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_crm_dating`
--

CREATE TABLE `zdao_crm_dating` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `objectType` varchar(30) NOT NULL,
  `objectID` mediumint(8) UNSIGNED NOT NULL,
  `action` mediumint(8) UNSIGNED NOT NULL,
  `contact` mediumint(8) UNSIGNED NOT NULL,
  `account` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `desc` text NOT NULL,
  `status` enum('wait','done') NOT NULL DEFAULT 'wait',
  `createdBy` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `editedBy` varchar(30) NOT NULL,
  `editedDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_crm_delivery`
--

CREATE TABLE `zdao_crm_delivery` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `contract` mediumint(8) UNSIGNED NOT NULL,
  `deliveredBy` char(30) NOT NULL,
  `deliveredDate` date NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_crm_order`
--

CREATE TABLE `zdao_crm_order` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `product` char(255) NOT NULL,
  `customer` mediumint(8) UNSIGNED NOT NULL,
  `plan` decimal(12,2) NOT NULL,
  `real` decimal(12,2) NOT NULL,
  `currency` varchar(20) NOT NULL,
  `status` enum('normal','signed','closed') NOT NULL DEFAULT 'normal',
  `createdBy` char(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `editedBy` char(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `assignedTo` char(30) NOT NULL,
  `assignedBy` char(30) NOT NULL,
  `assignedDate` datetime NOT NULL,
  `signedBy` char(30) NOT NULL,
  `signedDate` date NOT NULL,
  `closedBy` char(30) NOT NULL,
  `closedDate` datetime NOT NULL,
  `closedReason` enum('','payed','failed','postponed') NOT NULL DEFAULT '',
  `activatedBy` char(30) NOT NULL,
  `activatedDate` datetime NOT NULL,
  `contactedBy` char(30) NOT NULL,
  `contactedDate` datetime NOT NULL,
  `nextDate` date NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_crm_plan`
--

CREATE TABLE `zdao_crm_plan` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `contract` mediumint(8) UNSIGNED NOT NULL,
  `returnedBy` char(30) NOT NULL,
  `returnedDate` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_crm_resume`
--

CREATE TABLE `zdao_crm_resume` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `contact` mediumint(8) UNSIGNED NOT NULL,
  `customer` mediumint(8) UNSIGNED NOT NULL,
  `maker` enum('0','1') NOT NULL DEFAULT '0',
  `dept` char(100) NOT NULL,
  `title` char(100) NOT NULL,
  `address` mediumint(8) UNSIGNED NOT NULL,
  `join` char(10) NOT NULL,
  `left` char(10) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_crm_salesgroup`
--

CREATE TABLE `zdao_crm_salesgroup` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `users` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_crm_salespriv`
--

CREATE TABLE `zdao_crm_salespriv` (
  `account` char(30) NOT NULL,
  `salesgroup` mediumint(8) UNSIGNED NOT NULL,
  `priv` enum('view','edit') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_im_chat`
--

CREATE TABLE `zdao_im_chat` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `gid` char(40) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT 'group',
  `admins` varchar(255) NOT NULL DEFAULT '',
  `committers` varchar(255) NOT NULL DEFAULT '',
  `subject` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `public` enum('0','1') NOT NULL DEFAULT '0',
  `createdBy` varchar(30) NOT NULL DEFAULT '',
  `createdDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editedBy` varchar(30) NOT NULL DEFAULT '',
  `editedDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastActiveTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dismissDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_im_chatuser`
--

CREATE TABLE `zdao_im_chatuser` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `cgid` char(40) NOT NULL DEFAULT '',
  `user` mediumint(8) NOT NULL DEFAULT '0',
  `order` smallint(5) NOT NULL DEFAULT '0',
  `star` enum('0','1') NOT NULL DEFAULT '0',
  `hide` enum('0','1') NOT NULL DEFAULT '0',
  `mute` enum('0','1') NOT NULL DEFAULT '0',
  `join` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `quit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `category` varchar(40) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_im_message`
--

CREATE TABLE `zdao_im_message` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `gid` char(40) NOT NULL DEFAULT '',
  `cgid` char(40) NOT NULL DEFAULT '',
  `user` varchar(30) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `order` bigint(8) UNSIGNED NOT NULL,
  `type` enum('normal','broadcast','notify') NOT NULL DEFAULT 'normal',
  `content` text NOT NULL,
  `contentType` enum('text','plain','emotion','image','file','object') NOT NULL DEFAULT 'text',
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_im_messagestatus`
--

CREATE TABLE `zdao_im_messagestatus` (
  `user` mediumint(8) NOT NULL DEFAULT '0',
  `gid` char(40) NOT NULL DEFAULT '',
  `status` enum('waiting','sent','readed','deleted') NOT NULL DEFAULT 'waiting'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_oa_attend`
--

CREATE TABLE `zdao_oa_attend` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `account` char(30) NOT NULL,
  `date` date NOT NULL,
  `signIn` time NOT NULL,
  `signOut` time NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL,
  `device` varchar(30) NOT NULL,
  `client` varchar(20) NOT NULL,
  `manualIn` time NOT NULL,
  `manualOut` time NOT NULL,
  `reason` varchar(30) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `reviewStatus` varchar(30) NOT NULL DEFAULT '',
  `reviewedBy` char(30) NOT NULL,
  `reviewedDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `zdao_oa_attend`
--

INSERT INTO `zdao_oa_attend` (`id`, `account`, `date`, `signIn`, `signOut`, `status`, `ip`, `device`, `client`, `manualIn`, `manualOut`, `reason`, `desc`, `reviewStatus`, `reviewedBy`, `reviewedDate`) VALUES
(1, 'ESBCadmin', '2018-12-07', '17:47:28', '00:00:00', 'both', '185.232.86.237', 'desktop', 'desktop', '00:00:00', '00:00:00', '', '', '', '', '0000-00-00 00:00:00'),
(2, 'ESBCadmin', '2018-12-08', '11:51:15', '00:00:00', 'rest', '::1', 'desktop', 'desktop', '00:00:00', '00:00:00', '', '', '', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_oa_attendstat`
--

CREATE TABLE `zdao_oa_attendstat` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `account` char(30) NOT NULL,
  `month` char(10) NOT NULL DEFAULT '',
  `normal` decimal(12,2) NOT NULL DEFAULT '0.00',
  `late` decimal(12,2) NOT NULL DEFAULT '0.00',
  `early` decimal(12,2) NOT NULL DEFAULT '0.00',
  `absent` decimal(12,2) NOT NULL DEFAULT '0.00',
  `trip` decimal(12,2) NOT NULL DEFAULT '0.00',
  `egress` decimal(12,2) NOT NULL DEFAULT '0.00',
  `lieu` decimal(12,2) NOT NULL DEFAULT '0.00',
  `paidLeave` decimal(12,2) NOT NULL DEFAULT '0.00',
  `unpaidLeave` decimal(12,2) NOT NULL DEFAULT '0.00',
  `timeOvertime` decimal(12,2) NOT NULL DEFAULT '0.00',
  `restOvertime` decimal(12,2) NOT NULL DEFAULT '0.00',
  `holidayOvertime` decimal(12,2) NOT NULL DEFAULT '0.00',
  `deserve` decimal(12,2) NOT NULL DEFAULT '0.00',
  `actual` decimal(12,2) NOT NULL DEFAULT '0.00',
  `status` char(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_oa_doc`
--

CREATE TABLE `zdao_oa_doc` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `product` mediumint(8) UNSIGNED NOT NULL,
  `project` mediumint(8) UNSIGNED NOT NULL,
  `lib` mediumint(8) UNSIGNED NOT NULL,
  `module` mediumint(8) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `type` varchar(30) NOT NULL,
  `views` mediumint(8) UNSIGNED NOT NULL,
  `createdBy` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `editedBy` varchar(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `version` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `private` enum('0','1') NOT NULL DEFAULT '0',
  `users` text NOT NULL,
  `groups` varchar(255) NOT NULL DEFAULT '',
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_oa_doccontent`
--

CREATE TABLE `zdao_oa_doccontent` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `doc` mediumint(8) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `digest` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `files` text NOT NULL,
  `type` varchar(10) NOT NULL,
  `version` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_oa_doclib`
--

CREATE TABLE `zdao_oa_doclib` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `project` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `private` enum('0','1') NOT NULL DEFAULT '0',
  `users` text NOT NULL,
  `groups` varchar(255) NOT NULL DEFAULT '',
  `main` enum('0','1') NOT NULL DEFAULT '0',
  `order` tinyint(5) UNSIGNED NOT NULL,
  `createdBy` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `editedBy` varchar(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_oa_holiday`
--

CREATE TABLE `zdao_oa_holiday` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `type` enum('holiday','working') NOT NULL DEFAULT 'holiday',
  `desc` text NOT NULL,
  `year` char(4) NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_oa_leave`
--

CREATE TABLE `zdao_oa_leave` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `year` char(4) NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `start` time NOT NULL,
  `finish` time NOT NULL,
  `hours` float(4,1) UNSIGNED NOT NULL DEFAULT '0.0',
  `backDate` datetime NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT '',
  `createdBy` char(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `reviewedBy` char(30) NOT NULL,
  `reviewedDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_oa_lieu`
--

CREATE TABLE `zdao_oa_lieu` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `year` char(4) NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `start` time NOT NULL,
  `finish` time NOT NULL,
  `hours` float(4,1) UNSIGNED NOT NULL DEFAULT '0.0',
  `overtime` char(255) NOT NULL,
  `desc` text NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT '',
  `createdBy` char(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `reviewedBy` char(30) NOT NULL,
  `reviewedDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_oa_overtime`
--

CREATE TABLE `zdao_oa_overtime` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `year` char(4) NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `start` time NOT NULL,
  `finish` time NOT NULL,
  `hours` float(4,1) UNSIGNED NOT NULL DEFAULT '0.0',
  `leave` varchar(255) NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT '',
  `rejectReason` varchar(100) NOT NULL,
  `createdBy` char(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `reviewedBy` char(30) NOT NULL,
  `reviewedDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_oa_project`
--

CREATE TABLE `zdao_oa_project` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(90) NOT NULL,
  `desc` text NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `createdBy` char(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `editedBy` char(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `status` enum('doing','finished','suspend') NOT NULL DEFAULT 'doing',
  `whitelist` varchar(255) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_oa_refund`
--

CREATE TABLE `zdao_oa_refund` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `customer` mediumint(8) UNSIGNED NOT NULL,
  `order` mediumint(8) UNSIGNED NOT NULL,
  `contract` mediumint(8) UNSIGNED NOT NULL,
  `project` mediumint(8) UNSIGNED NOT NULL,
  `name` char(150) NOT NULL,
  `parent` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `dept` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `category` char(30) NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `money` decimal(12,2) NOT NULL,
  `currency` varchar(30) NOT NULL,
  `desc` text NOT NULL,
  `related` char(200) NOT NULL DEFAULT '',
  `status` char(30) NOT NULL DEFAULT 'wait',
  `createdBy` char(30) NOT NULL DEFAULT '',
  `createdDate` datetime NOT NULL,
  `editedBy` char(30) NOT NULL DEFAULT '',
  `editedDate` datetime NOT NULL,
  `firstReviewer` char(30) NOT NULL DEFAULT '',
  `firstReviewDate` datetime NOT NULL,
  `secondReviewer` char(30) NOT NULL DEFAULT '',
  `secondReviewDate` datetime NOT NULL,
  `refundBy` char(30) NOT NULL DEFAULT '',
  `refundDate` datetime NOT NULL,
  `reason` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_oa_todo`
--

CREATE TABLE `zdao_oa_todo` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `account` char(30) NOT NULL,
  `date` date NOT NULL,
  `begin` smallint(4) UNSIGNED ZEROFILL NOT NULL,
  `end` smallint(4) UNSIGNED ZEROFILL NOT NULL,
  `type` char(20) NOT NULL,
  `idvalue` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `pri` tinyint(3) UNSIGNED NOT NULL,
  `name` char(150) NOT NULL,
  `desc` text NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL,
  `assignedTo` varchar(30) NOT NULL DEFAULT '',
  `assignedBy` varchar(30) NOT NULL DEFAULT '',
  `assignedDate` datetime NOT NULL,
  `finishedBy` varchar(30) NOT NULL DEFAULT '',
  `finishedDate` datetime NOT NULL,
  `closedBy` varchar(30) NOT NULL DEFAULT '',
  `closedDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_oa_trip`
--

CREATE TABLE `zdao_oa_trip` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `type` enum('trip','egress') NOT NULL DEFAULT 'trip',
  `customers` varchar(20) NOT NULL,
  `name` char(30) NOT NULL,
  `desc` text NOT NULL,
  `year` char(4) NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `start` time NOT NULL,
  `finish` time NOT NULL,
  `from` char(50) NOT NULL,
  `to` char(50) NOT NULL,
  `createdBy` char(30) NOT NULL,
  `createdDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_action`
--

CREATE TABLE `zdao_sys_action` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `customer` mediumint(8) UNSIGNED DEFAULT NULL,
  `contact` mediumint(8) UNSIGNED DEFAULT NULL,
  `objectType` varchar(30) NOT NULL DEFAULT '',
  `objectID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `actor` varchar(30) NOT NULL DEFAULT '',
  `action` varchar(30) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `comment` text NOT NULL,
  `extra` varchar(255) NOT NULL,
  `read` enum('0','1') NOT NULL DEFAULT '0',
  `reader` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `zdao_sys_action`
--

INSERT INTO `zdao_sys_action` (`id`, `customer`, `contact`, `objectType`, `objectID`, `actor`, `action`, `date`, `comment`, `extra`, `read`, `reader`) VALUES
(1, 0, 0, 'user', 1, 'ESBCadmin', 'login', '2018-12-07 17:47:28', '', '', '0', ''),
(2, 0, 0, 'user', 1, 'ESBCadmin', 'login', '2018-12-08 11:51:15', '', '', '0', '');

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_article`
--

CREATE TABLE `zdao_sys_article` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `keywords` varchar(150) NOT NULL,
  `summary` text NOT NULL,
  `content` text NOT NULL,
  `original` enum('1','0') NOT NULL,
  `copySite` varchar(60) NOT NULL,
  `copyURL` varchar(255) NOT NULL,
  `author` varchar(60) NOT NULL,
  `editor` varchar(60) NOT NULL,
  `createdDate` datetime NOT NULL,
  `editedDate` datetime NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'normal',
  `type` varchar(30) NOT NULL,
  `views` mediumint(5) UNSIGNED NOT NULL DEFAULT '0',
  `sticky` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `order` smallint(5) UNSIGNED NOT NULL,
  `private` enum('0','1') NOT NULL DEFAULT '0',
  `users` text NOT NULL,
  `groups` varchar(255) NOT NULL DEFAULT '',
  `readers` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_block`
--

CREATE TABLE `zdao_sys_block` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `account` char(30) NOT NULL,
  `app` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `source` varchar(20) NOT NULL,
  `block` varchar(20) NOT NULL,
  `params` text NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `grid` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `height` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `hidden` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `zdao_sys_block`
--

INSERT INTO `zdao_sys_block` (`id`, `account`, `app`, `title`, `source`, `block`, `params`, `order`, `grid`, `height`, `hidden`) VALUES
(1, 'ESBCadmin', 'sys', '日曆', 'oa', 'attend', '', 1, 6, 0, 0),
(2, 'ESBCadmin', 'sys', '最新動態', '', 'dynamic', '', 2, 6, 0, 0),
(3, 'ESBCadmin', 'sys', '系統公告', 'oa', 'announce', '{\"num\":15}', 3, 4, 0, 0),
(4, 'ESBCadmin', 'sys', '我的合同', 'crm', 'contract', '{\"num\":15,\"orderBy\":\"id_desc\",\"type\":\"returnedBy\",\"status\":[]}', 4, 4, 0, 0),
(5, 'ESBCadmin', 'sys', '我的訂單', 'crm', 'order', '{\"num\":15,\"orderBy\":\"id_desc\",\"type\":\"createdBy\",\"status\":[]}', 5, 4, 0, 0),
(6, 'ESBCadmin', 'sys', '付款賬戶', 'cash', 'depositor', '[]', 6, 4, 0, 0),
(7, 'ESBCadmin', 'sys', '最新博客', 'team', 'blog', '{\"num\":15}', 7, 4, 0, 0),
(8, 'ESBCadmin', 'sys', '最新帖子', 'team', 'thread', '{\"num\":15,\"type\":\"new\"}', 8, 4, 0, 0),
(9, 'ESBCadmin', 'oa', '日曆', 'oa', 'attend', '', 1, 6, 0, 0),
(10, 'ESBCadmin', 'oa', '系統公告', 'oa', 'announce', '{\"num\":15}', 2, 4, 0, 0),
(11, 'ESBCadmin', 'crm', '我的訂單', 'crm', 'order', '{\"num\":15,\"orderBy\":\"id_desc\",\"type\":\"createdBy\",\"status\":[]}', 1, 4, 0, 0),
(12, 'ESBCadmin', 'crm', '我的合同', 'crm', 'contract', '{\"num\":15,\"orderBy\":\"id_desc\",\"type\":\"returnedBy\",\"status\":[]}', 2, 4, 0, 0),
(13, 'ESBCadmin', 'crm', '本週聯繫', 'crm', 'customer', '{\"num\":15,\"orderBy\":\"id_desc\",\"type\":\"thisweek\"}', 3, 4, 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_category`
--

CREATE TABLE `zdao_sys_category` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` char(30) NOT NULL DEFAULT '',
  `alias` varchar(100) NOT NULL,
  `desc` text NOT NULL,
  `keywords` varchar(150) NOT NULL,
  `root` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `parent` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `path` char(255) NOT NULL DEFAULT '',
  `grade` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `order` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `type` char(30) NOT NULL,
  `readonly` enum('0','1') NOT NULL DEFAULT '0',
  `moderators` varchar(255) NOT NULL,
  `threads` smallint(5) NOT NULL,
  `posts` smallint(5) NOT NULL,
  `postedBy` varchar(30) NOT NULL,
  `postedDate` datetime NOT NULL,
  `postID` mediumint(8) UNSIGNED NOT NULL,
  `replyID` mediumint(8) UNSIGNED NOT NULL,
  `users` text NOT NULL,
  `rights` varchar(255) NOT NULL,
  `refund` enum('0','1') NOT NULL DEFAULT '0',
  `major` enum('0','1','2','3','4','5','6','7','8') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `zdao_sys_category`
--

INSERT INTO `zdao_sys_category` (`id`, `name`, `alias`, `desc`, `keywords`, `root`, `parent`, `path`, `grade`, `order`, `type`, `readonly`, `moderators`, `threads`, `posts`, `postedBy`, `postedDate`, `postID`, `replyID`, `users`, `rights`, `refund`, `major`) VALUES
(1, 'Primary Income', '', '', '', 0, 0, ',1,', 1, 1, 'in', '0', '', 0, 0, '', '0000-00-00 00:00:00', 0, 0, '', '', '0', '1'),
(2, 'Non-Primary Income', '', '', '', 0, 0, ',2,', 1, 2, 'in', '0', '', 0, 0, '', '0000-00-00 00:00:00', 0, 0, '', '', '0', '2'),
(3, 'Primary Expense', '', '', '', 0, 0, ',3,', 1, 3, 'out', '0', '', 0, 0, '', '0000-00-00 00:00:00', 0, 0, '', '', '0', '3'),
(4, 'Non-Primary Expense', '', '', '', 0, 0, ',4,', 1, 4, 'out', '0', '', 0, 0, '', '0000-00-00 00:00:00', 0, 0, '', '', '0', '4'),
(5, 'Profit', '', '', '', 0, 2, ',2,5,', 2, 5, 'in', '0', '', 0, 0, '', '0000-00-00 00:00:00', 0, 0, '', '', '0', '5'),
(6, 'Loss', '', '', '', 0, 4, ',4,6,', 2, 6, 'out', '0', '', 0, 0, '', '0000-00-00 00:00:00', 0, 0, '', '', '0', '6'),
(7, 'Fees', '', '', '', 0, 4, ',4,7,', 2, 7, 'out', '0', '', 0, 0, '', '0000-00-00 00:00:00', 0, 0, '', '', '0', '7'),
(8, 'Interest', '', '', '', 0, 4, ',4,8,', 2, 8, 'out', '0', '', 0, 0, '', '0000-00-00 00:00:00', 0, 0, '', '', '0', '8');

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_config`
--

CREATE TABLE `zdao_sys_config` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `owner` char(30) NOT NULL DEFAULT '',
  `app` varchar(30) NOT NULL DEFAULT 'sys',
  `module` varchar(30) NOT NULL,
  `section` char(30) NOT NULL DEFAULT '',
  `key` char(30) DEFAULT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `zdao_sys_config`
--

INSERT INTO `zdao_sys_config` (`id`, `owner`, `app`, `module`, `section`, `key`, `value`) VALUES
(1, 'system', 'sys', 'xuanxuan', 'global', 'version', '2.1.0'),
(2, 'system', 'sys', 'xuanxuan', '', 'key', 'c06ad29a92b3463631bccfde0db16cae'),
(3, 'system', 'sys', 'common', 'global', 'version', '4.9'),
(4, 'ESBCadmin', 'sys', 'common', '', 'blockInited', '1'),
(5, 'system', 'sys', 'cron', 'run', 'status', 'running'),
(6, 'ESBCadmin', 'oa', 'common', '', 'blockInited', '1'),
(7, 'ESBCadmin', 'crm', 'common', '', 'blockInited', '1');

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_cron`
--

CREATE TABLE `zdao_sys_cron` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `m` varchar(20) NOT NULL,
  `h` varchar(20) NOT NULL,
  `dom` varchar(20) NOT NULL,
  `mon` varchar(20) NOT NULL,
  `dow` varchar(20) NOT NULL,
  `command` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `buildin` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(20) NOT NULL,
  `lastTime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `zdao_sys_cron`
--

INSERT INTO `zdao_sys_cron` (`id`, `m`, `h`, `dom`, `mon`, `dow`, `command`, `remark`, `type`, `buildin`, `status`, `lastTime`) VALUES
(1, '*', '*', '*', '*', '*', '', 'Monitor cron', 'ranzhi', 1, 'normal', '2018-12-08 16:31:00'),
(2, '1', '1', '*', '*', '*', 'appName=sys&moduleName=backup&methodName=backup&reload=0', 'Back up data & files', 'ranzhi', 1, 'normal', '2018-12-08 11:51:15'),
(3, '1', '1', '*', '*', '*', 'appName=sys&moduleName=backup&methodName=batchdelete&saveDays=30', 'Auto delete the data 30 days prior to today', 'ranzhi', 1, 'normal', '2018-12-08 11:51:15'),
(4, '1', '7', '*', '*', '*', 'appName=sys&moduleName=report&methodName=remind', 'Daily Reminder', 'ranzhi', 1, 'normal', '2018-12-08 11:51:15'),
(5, '*/1', '*', '*', '*', '*', 'appName=sys&moduleName=queue&methodName=getqueue', '出队列', 'ranzhi', 0, 'normal', '2018-12-08 16:31:00'),
(6, '*/10', '*', '*', '*', '*', 'appName=sys&moduleName=queue&methodName=additional', '检查是否添加待办', 'ranzhi', 0, 'normal', '2018-12-08 16:30:00');

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_entry`
--

CREATE TABLE `zdao_sys_entry` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `abbr` char(6) NOT NULL,
  `code` varchar(20) NOT NULL,
  `buildin` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `version` varchar(20) NOT NULL,
  `platform` varchar(255) NOT NULL DEFAULT 'ranzhi',
  `package` int(11) NOT NULL DEFAULT '0',
  `integration` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `open` varchar(20) NOT NULL,
  `key` char(32) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `login` varchar(255) NOT NULL,
  `logout` varchar(255) NOT NULL,
  `block` varchar(255) NOT NULL,
  `control` varchar(10) NOT NULL DEFAULT 'simple',
  `size` varchar(50) NOT NULL DEFAULT 'max',
  `position` varchar(10) NOT NULL DEFAULT 'default',
  `visible` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `order` tinyint(5) UNSIGNED NOT NULL DEFAULT '0',
  `zentao` enum('0','1') NOT NULL DEFAULT '0',
  `category` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `status` enum('online','offline') NOT NULL DEFAULT 'online',
  `sso` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `zdao_sys_entry`
--

INSERT INTO `zdao_sys_entry` (`id`, `name`, `abbr`, `code`, `buildin`, `version`, `platform`, `package`, `integration`, `open`, `key`, `ip`, `logo`, `login`, `logout`, `block`, `control`, `size`, `position`, `visible`, `order`, `zentao`, `category`, `status`, `sso`) VALUES
(1, 'CRM', '', 'crm', 1, '', 'ranzhi', 0, 1, 'iframe', 'epet8b8ae1g89rxzquf4ubv37ul5tite', '*', 'theme/default/images/ips/app-crm.png', '../crm', '', '', 'simple', 'max', 'default', 1, 10, '0', 0, 'online', '0'),
(2, 'OA', 'OA', 'oa', 1, '', 'ranzhi', 0, 1, 'iframe', '1a673c4c3c85fadcf0333e0a4596d220', '*', 'theme/default/images/ips/app-oa.png', '../oa', '', '', 'simple', 'max', 'default', 1, 20, '0', 0, 'online', '0'),
(3, 'PROJ', '', 'proj', 1, '', 'ranzhi', 0, 1, 'iframe', 'a910d9d1dd03c9dd99cecb3ca31ea600', '*', 'theme/default/images/ips/app-proj.png', '../proj', '', '', 'simple', 'max', 'default', 1, 30, '0', 0, 'online', '0'),
(4, 'DOC', '', 'doc', 1, '', 'ranzhi', 0, 1, 'iframe', '76ff605479df34f1d239730efa68d562', '*', 'theme/default/images/ips/app-doc.png', '../doc', '', '', 'simple', 'max', 'default', 1, 40, '0', 0, 'online', '0'),
(5, 'CASH', '', 'cash', 1, '', 'ranzhi', 0, 1, 'iframe', '438d85f2c2b04372662c63ebfb1c4c2f', '*', 'theme/default/images/ips/app-cash.png', '../cash', '', '', 'simple', 'max', 'default', 1, 50, '0', 0, 'online', '0'),
(6, 'TEAM', '', 'team', 1, '', 'ranzhi', 0, 1, 'iframe', '6c46d9fe76a1afa1cd61f946f1072d1e', '*', 'theme/default/images/ips/app-team.png', '../team', '', '', 'simple', 'max', 'default', 1, 60, '0', 0, 'online', '0'),
(7, 'sso', 'sso', 'sso', 1, '1.0.0', 'xuanxuan', 1, 1, 'iframe', '7a171c33d02d172fc0f1cf4cb93edfd6', '*', '', 'http://xuan.im', '', '', 'none', 'max', 'default', 0, 0, '0', 0, 'online', '1');

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_file`
--

CREATE TABLE `zdao_sys_file` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `pathname` char(100) NOT NULL,
  `title` char(90) NOT NULL,
  `extension` char(30) NOT NULL,
  `size` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `objectType` char(30) NOT NULL,
  `objectID` mediumint(8) UNSIGNED NOT NULL,
  `createdBy` char(30) NOT NULL DEFAULT '',
  `createdDate` datetime NOT NULL,
  `editor` enum('1','0') NOT NULL DEFAULT '0',
  `primary` enum('1','0') DEFAULT '0',
  `public` enum('1','0') NOT NULL DEFAULT '1',
  `downloads` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `extra` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `zdao_sys_file`
--

INSERT INTO `zdao_sys_file` (`id`, `pathname`, `title`, `extension`, `size`, `objectType`, `objectID`, `createdBy`, `createdDate`, `editor`, `primary`, `public`, `downloads`, `extra`) VALUES
(1, '201810/f_8db2fa542a1e087d63d45d8bc1185361.zip', 'sso', 'zip', 89674, 'entry', 7, '', '2018-12-07 03:46:54', '0', '0', '1', 0, '');

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_group`
--

CREATE TABLE `zdao_sys_group` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` char(30) NOT NULL,
  `desc` char(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `zdao_sys_group`
--

INSERT INTO `zdao_sys_group` (`id`, `name`, `desc`) VALUES
(1, 'Administrator', 'Administrator has all privileges.'),
(2, 'Finance Specialist', 'has all privileges of CASH.'),
(3, 'Sales Manager', 'Sales Manager has all privileges of CRM.'),
(4, 'Sales', 'Default privileges for sales.'),
(5, 'Common', 'Default privileges for all users.');

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_grouppriv`
--

CREATE TABLE `zdao_sys_grouppriv` (
  `group` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `module` char(30) NOT NULL DEFAULT '',
  `method` char(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `zdao_sys_grouppriv`
--

INSERT INTO `zdao_sys_grouppriv` (`group`, `module`, `method`) VALUES
(1, 'address', 'browse'),
(1, 'address', 'create'),
(1, 'address', 'delete'),
(1, 'address', 'edit'),
(1, 'announce', 'browse'),
(1, 'announce', 'create'),
(1, 'announce', 'delete'),
(1, 'announce', 'edit'),
(1, 'announce', 'view'),
(1, 'apppriv', 'cash'),
(1, 'apppriv', 'crm'),
(1, 'apppriv', 'doc'),
(1, 'apppriv', 'oa'),
(1, 'apppriv', 'proj'),
(1, 'apppriv', 'superadmin'),
(1, 'apppriv', 'team'),
(1, 'attend', 'browseReview'),
(1, 'attend', 'company'),
(1, 'attend', 'department'),
(1, 'attend', 'detail'),
(1, 'attend', 'export'),
(1, 'attend', 'exportDetail'),
(1, 'attend', 'exportStat'),
(1, 'attend', 'personalSettings'),
(1, 'attend', 'review'),
(1, 'attend', 'saveStat'),
(1, 'attend', 'setManager'),
(1, 'attend', 'settings'),
(1, 'attend', 'stat'),
(1, 'balance', 'browse'),
(1, 'balance', 'create'),
(1, 'balance', 'delete'),
(1, 'balance', 'edit'),
(1, 'blog', 'create'),
(1, 'blog', 'delete'),
(1, 'blog', 'edit'),
(1, 'blog', 'index'),
(1, 'blog', 'view'),
(1, 'company', 'index'),
(1, 'contact', 'browse'),
(1, 'contact', 'create'),
(1, 'contact', 'delete'),
(1, 'contact', 'edit'),
(1, 'contact', 'export'),
(1, 'contact', 'exportTemplate'),
(1, 'contact', 'import'),
(1, 'contact', 'showImport'),
(1, 'contact', 'vcard'),
(1, 'contact', 'view'),
(1, 'contract', 'browse'),
(1, 'contract', 'cancel'),
(1, 'contract', 'create'),
(1, 'contract', 'delete'),
(1, 'contract', 'deleteDelivery'),
(1, 'contract', 'deleteReturn'),
(1, 'contract', 'delivery'),
(1, 'contract', 'edit'),
(1, 'contract', 'editDelivery'),
(1, 'contract', 'editReturn'),
(1, 'contract', 'export'),
(1, 'contract', 'finish'),
(1, 'contract', 'receive'),
(1, 'contract', 'view'),
(1, 'crm', 'manageAll'),
(1, 'customer', 'assign'),
(1, 'customer', 'batchAssign'),
(1, 'customer', 'browse'),
(1, 'customer', 'contact'),
(1, 'customer', 'contract'),
(1, 'customer', 'create'),
(1, 'customer', 'delete'),
(1, 'customer', 'edit'),
(1, 'customer', 'export'),
(1, 'customer', 'linkContact'),
(1, 'customer', 'merge'),
(1, 'customer', 'order'),
(1, 'customer', 'view'),
(1, 'depositor', 'activate'),
(1, 'depositor', 'browse'),
(1, 'depositor', 'check'),
(1, 'depositor', 'create'),
(1, 'depositor', 'delete'),
(1, 'depositor', 'edit'),
(1, 'depositor', 'export'),
(1, 'depositor', 'forbid'),
(1, 'depositor', 'savebalance'),
(1, 'doc', 'allLibs'),
(1, 'doc', 'browse'),
(1, 'doc', 'create'),
(1, 'doc', 'createLib'),
(1, 'doc', 'delete'),
(1, 'doc', 'deleteLib'),
(1, 'doc', 'edit'),
(1, 'doc', 'editLib'),
(1, 'doc', 'index'),
(1, 'doc', 'projectLibs'),
(1, 'doc', 'showFiles'),
(1, 'doc', 'sort'),
(1, 'doc', 'view'),
(1, 'egress', 'company'),
(1, 'egress', 'department'),
(1, 'file', 'delete'),
(1, 'file', 'download'),
(1, 'file', 'edit'),
(1, 'file', 'upload'),
(1, 'forum', 'admin'),
(1, 'forum', 'board'),
(1, 'forum', 'index'),
(1, 'forum', 'update'),
(1, 'holiday', 'create'),
(1, 'holiday', 'delete'),
(1, 'holiday', 'edit'),
(1, 'leads', 'apply'),
(1, 'leads', 'assign'),
(1, 'leads', 'browse'),
(1, 'leads', 'create'),
(1, 'leads', 'delete'),
(1, 'leads', 'edit'),
(1, 'leads', 'ignore'),
(1, 'leads', 'setting'),
(1, 'leads', 'transform'),
(1, 'leads', 'view'),
(1, 'leave', 'batchReview'),
(1, 'leave', 'browseReview'),
(1, 'leave', 'company'),
(1, 'leave', 'export'),
(1, 'leave', 'review'),
(1, 'leave', 'setReviewer'),
(1, 'lieu', 'batchReview'),
(1, 'lieu', 'browseReview'),
(1, 'lieu', 'company'),
(1, 'lieu', 'review'),
(1, 'lieu', 'setReviewer'),
(1, 'makeup', 'batchReview'),
(1, 'makeup', 'browseReview'),
(1, 'makeup', 'company'),
(1, 'makeup', 'export'),
(1, 'makeup', 'review'),
(1, 'makeup', 'setReviewer'),
(1, 'my', 'company'),
(1, 'order', 'activate'),
(1, 'order', 'assign'),
(1, 'order', 'browse'),
(1, 'order', 'close'),
(1, 'order', 'contact'),
(1, 'order', 'create'),
(1, 'order', 'delete'),
(1, 'order', 'edit'),
(1, 'order', 'export'),
(1, 'order', 'view'),
(1, 'overtime', 'batchReview'),
(1, 'overtime', 'browseReview'),
(1, 'overtime', 'company'),
(1, 'overtime', 'export'),
(1, 'overtime', 'review'),
(1, 'overtime', 'setReviewer'),
(1, 'product', 'browse'),
(1, 'product', 'create'),
(1, 'product', 'delete'),
(1, 'product', 'edit'),
(1, 'product', 'view'),
(1, 'provider', 'browse'),
(1, 'provider', 'contact'),
(1, 'provider', 'create'),
(1, 'provider', 'delete'),
(1, 'provider', 'edit'),
(1, 'provider', 'linkContact'),
(1, 'provider', 'view'),
(1, 'refund', 'browseReview'),
(1, 'refund', 'company'),
(1, 'refund', 'export'),
(1, 'refund', 'reimburse'),
(1, 'refund', 'review'),
(1, 'refund', 'setCategory'),
(1, 'refund', 'setDepositor'),
(1, 'refund', 'setRefundBy'),
(1, 'refund', 'setReviewer'),
(1, 'refund', 'todo'),
(1, 'report', 'browse'),
(1, 'resume', 'browse'),
(1, 'resume', 'create'),
(1, 'resume', 'delete'),
(1, 'resume', 'edit'),
(1, 'resume', 'leave'),
(1, 'sales', 'admin'),
(1, 'sales', 'browse'),
(1, 'sales', 'create'),
(1, 'sales', 'delete'),
(1, 'sales', 'edit'),
(1, 'schema', 'browse'),
(1, 'schema', 'create'),
(1, 'schema', 'delete'),
(1, 'schema', 'edit'),
(1, 'schema', 'view'),
(1, 'setting', 'customerPool'),
(1, 'setting', 'lang'),
(1, 'setting', 'modules'),
(1, 'setting', 'reset'),
(1, 'task', 'deleteAll'),
(1, 'task', 'editAll'),
(1, 'task', 'viewAll'),
(1, 'thread', 'delete'),
(1, 'thread', 'deleteFile'),
(1, 'thread', 'edit'),
(1, 'thread', 'post'),
(1, 'thread', 'stick'),
(1, 'thread', 'switchStatus'),
(1, 'thread', 'transfer'),
(1, 'thread', 'view'),
(1, 'trade', 'batchCreate'),
(1, 'trade', 'batchEdit'),
(1, 'trade', 'browse'),
(1, 'trade', 'compare'),
(1, 'trade', 'create'),
(1, 'trade', 'delete'),
(1, 'trade', 'detail'),
(1, 'trade', 'edit'),
(1, 'trade', 'export'),
(1, 'trade', 'export2Excel'),
(1, 'trade', 'import'),
(1, 'trade', 'invest'),
(1, 'trade', 'loan'),
(1, 'trade', 'report'),
(1, 'trade', 'setReportUnit'),
(1, 'trade', 'showImport'),
(1, 'trade', 'tradeSetting'),
(1, 'trade', 'transfer'),
(1, 'trade', 'view'),
(1, 'tree', 'browse'),
(1, 'tree', 'children'),
(1, 'tree', 'delete'),
(1, 'tree', 'edit'),
(1, 'tree', 'merge'),
(1, 'trip', 'company'),
(1, 'trip', 'department'),
(1, 'user', 'active'),
(1, 'user', 'admin'),
(1, 'user', 'colleague'),
(1, 'user', 'create'),
(1, 'user', 'delete'),
(1, 'user', 'edit'),
(1, 'user', 'forbid'),
(2, 'address', 'browse'),
(2, 'announce', 'browse'),
(2, 'announce', 'create'),
(2, 'announce', 'edit'),
(2, 'announce', 'view'),
(2, 'apppriv', 'cash'),
(2, 'apppriv', 'crm'),
(2, 'apppriv', 'doc'),
(2, 'apppriv', 'oa'),
(2, 'apppriv', 'proj'),
(2, 'apppriv', 'team'),
(2, 'attend', 'company'),
(2, 'attend', 'export'),
(2, 'attend', 'exportStat'),
(2, 'attend', 'saveStat'),
(2, 'attend', 'stat'),
(2, 'balance', 'browse'),
(2, 'balance', 'create'),
(2, 'balance', 'delete'),
(2, 'balance', 'edit'),
(2, 'blog', 'create'),
(2, 'blog', 'edit'),
(2, 'blog', 'index'),
(2, 'blog', 'view'),
(2, 'company', 'index'),
(2, 'contact', 'browse'),
(2, 'contact', 'vcard'),
(2, 'contact', 'view'),
(2, 'contract', 'browse'),
(2, 'contract', 'view'),
(2, 'crm', 'manageAll'),
(2, 'customer', 'browse'),
(2, 'customer', 'contact'),
(2, 'customer', 'contract'),
(2, 'customer', 'order'),
(2, 'customer', 'view'),
(2, 'depositor', 'activate'),
(2, 'depositor', 'browse'),
(2, 'depositor', 'check'),
(2, 'depositor', 'create'),
(2, 'depositor', 'delete'),
(2, 'depositor', 'edit'),
(2, 'depositor', 'export'),
(2, 'depositor', 'forbid'),
(2, 'depositor', 'savebalance'),
(2, 'doc', 'allLibs'),
(2, 'doc', 'browse'),
(2, 'doc', 'create'),
(2, 'doc', 'createLib'),
(2, 'doc', 'edit'),
(2, 'doc', 'editLib'),
(2, 'doc', 'index'),
(2, 'doc', 'projectLibs'),
(2, 'doc', 'showFiles'),
(2, 'doc', 'sort'),
(2, 'doc', 'view'),
(2, 'file', 'delete'),
(2, 'file', 'download'),
(2, 'file', 'edit'),
(2, 'file', 'upload'),
(2, 'forum', 'admin'),
(2, 'forum', 'board'),
(2, 'forum', 'index'),
(2, 'holiday', 'create'),
(2, 'holiday', 'delete'),
(2, 'holiday', 'edit'),
(2, 'leads', 'browse'),
(2, 'leads', 'view'),
(2, 'leave', 'company'),
(2, 'order', 'browse'),
(2, 'order', 'contact'),
(2, 'order', 'view'),
(2, 'product', 'browse'),
(2, 'product', 'view'),
(2, 'provider', 'browse'),
(2, 'provider', 'contact'),
(2, 'provider', 'create'),
(2, 'provider', 'delete'),
(2, 'provider', 'edit'),
(2, 'provider', 'linkContact'),
(2, 'provider', 'view'),
(2, 'refund', 'browseReview'),
(2, 'refund', 'company'),
(2, 'refund', 'reimburse'),
(2, 'refund', 'review'),
(2, 'refund', 'setCategory'),
(2, 'refund', 'setDepositor'),
(2, 'refund', 'todo'),
(2, 'resume', 'browse'),
(2, 'sales', 'browse'),
(2, 'schema', 'browse'),
(2, 'schema', 'create'),
(2, 'schema', 'delete'),
(2, 'schema', 'edit'),
(2, 'schema', 'view'),
(2, 'setting', 'lang'),
(2, 'setting', 'reset'),
(2, 'thread', 'edit'),
(2, 'thread', 'post'),
(2, 'thread', 'stick'),
(2, 'thread', 'switchStatus'),
(2, 'thread', 'transfer'),
(2, 'thread', 'view'),
(2, 'trade', 'batchCreate'),
(2, 'trade', 'batchEdit'),
(2, 'trade', 'browse'),
(2, 'trade', 'compare'),
(2, 'trade', 'create'),
(2, 'trade', 'delete'),
(2, 'trade', 'detail'),
(2, 'trade', 'edit'),
(2, 'trade', 'export'),
(2, 'trade', 'export2Excel'),
(2, 'trade', 'import'),
(2, 'trade', 'invest'),
(2, 'trade', 'loan'),
(2, 'trade', 'report'),
(2, 'trade', 'setReportUnit'),
(2, 'trade', 'showImport'),
(2, 'trade', 'tradeSetting'),
(2, 'trade', 'transfer'),
(2, 'trade', 'view'),
(2, 'tree', 'browse'),
(2, 'tree', 'children'),
(2, 'tree', 'edit'),
(2, 'tree', 'merge'),
(2, 'trip', 'company'),
(2, 'user', 'colleague'),
(3, 'address', 'browse'),
(3, 'address', 'create'),
(3, 'address', 'delete'),
(3, 'address', 'edit'),
(3, 'announce', 'browse'),
(3, 'announce', 'create'),
(3, 'announce', 'edit'),
(3, 'announce', 'view'),
(3, 'apppriv', 'cash'),
(3, 'apppriv', 'crm'),
(3, 'apppriv', 'doc'),
(3, 'apppriv', 'oa'),
(3, 'apppriv', 'proj'),
(3, 'apppriv', 'team'),
(3, 'blog', 'create'),
(3, 'blog', 'edit'),
(3, 'blog', 'index'),
(3, 'blog', 'view'),
(3, 'company', 'index'),
(3, 'contact', 'browse'),
(3, 'contact', 'create'),
(3, 'contact', 'delete'),
(3, 'contact', 'edit'),
(3, 'contact', 'export'),
(3, 'contact', 'exportTemplate'),
(3, 'contact', 'import'),
(3, 'contact', 'showImport'),
(3, 'contact', 'vcard'),
(3, 'contact', 'view'),
(3, 'contract', 'browse'),
(3, 'contract', 'cancel'),
(3, 'contract', 'create'),
(3, 'contract', 'delete'),
(3, 'contract', 'deleteDelivery'),
(3, 'contract', 'deleteReturn'),
(3, 'contract', 'delivery'),
(3, 'contract', 'edit'),
(3, 'contract', 'editDelivery'),
(3, 'contract', 'editReturn'),
(3, 'contract', 'export'),
(3, 'contract', 'finish'),
(3, 'contract', 'receive'),
(3, 'contract', 'view'),
(3, 'crm', 'manageAll'),
(3, 'customer', 'assign'),
(3, 'customer', 'browse'),
(3, 'customer', 'contact'),
(3, 'customer', 'contract'),
(3, 'customer', 'create'),
(3, 'customer', 'delete'),
(3, 'customer', 'edit'),
(3, 'customer', 'export'),
(3, 'customer', 'linkContact'),
(3, 'customer', 'merge'),
(3, 'customer', 'order'),
(3, 'customer', 'view'),
(3, 'depositor', 'browse'),
(3, 'doc', 'allLibs'),
(3, 'doc', 'browse'),
(3, 'doc', 'create'),
(3, 'doc', 'createLib'),
(3, 'doc', 'edit'),
(3, 'doc', 'editLib'),
(3, 'doc', 'index'),
(3, 'doc', 'projectLibs'),
(3, 'doc', 'showFiles'),
(3, 'doc', 'sort'),
(3, 'doc', 'view'),
(3, 'egress', 'department'),
(3, 'file', 'delete'),
(3, 'file', 'download'),
(3, 'file', 'edit'),
(3, 'file', 'upload'),
(3, 'forum', 'admin'),
(3, 'forum', 'board'),
(3, 'forum', 'index'),
(3, 'leads', 'apply'),
(3, 'leads', 'assign'),
(3, 'leads', 'browse'),
(3, 'leads', 'create'),
(3, 'leads', 'delete'),
(3, 'leads', 'edit'),
(3, 'leads', 'ignore'),
(3, 'leads', 'setting'),
(3, 'leads', 'transform'),
(3, 'leads', 'view'),
(3, 'leave', 'batchReview'),
(3, 'leave', 'browseReview'),
(3, 'leave', 'review'),
(3, 'lieu', 'batchReview'),
(3, 'lieu', 'browseReview'),
(3, 'lieu', 'review'),
(3, 'makeup', 'batchReview'),
(3, 'makeup', 'browseReview'),
(3, 'makeup', 'review'),
(3, 'order', 'activate'),
(3, 'order', 'assign'),
(3, 'order', 'browse'),
(3, 'order', 'close'),
(3, 'order', 'contact'),
(3, 'order', 'create'),
(3, 'order', 'delete'),
(3, 'order', 'edit'),
(3, 'order', 'export'),
(3, 'order', 'view'),
(3, 'overtime', 'batchReview'),
(3, 'overtime', 'browseReview'),
(3, 'overtime', 'review'),
(3, 'product', 'browse'),
(3, 'product', 'create'),
(3, 'product', 'delete'),
(3, 'product', 'edit'),
(3, 'product', 'view'),
(3, 'refund', 'browseReview'),
(3, 'refund', 'review'),
(3, 'resume', 'browse'),
(3, 'resume', 'create'),
(3, 'resume', 'delete'),
(3, 'resume', 'edit'),
(3, 'resume', 'leave'),
(3, 'sales', 'browse'),
(3, 'sales', 'create'),
(3, 'sales', 'delete'),
(3, 'sales', 'edit'),
(3, 'setting', 'customerPool'),
(3, 'setting', 'lang'),
(3, 'setting', 'reset'),
(3, 'thread', 'edit'),
(3, 'thread', 'post'),
(3, 'thread', 'stick'),
(3, 'thread', 'switchStatus'),
(3, 'thread', 'transfer'),
(3, 'thread', 'view'),
(3, 'tree', 'browse'),
(3, 'tree', 'children'),
(3, 'tree', 'edit'),
(3, 'trip', 'department'),
(3, 'user', 'colleague'),
(4, 'address', 'browse'),
(4, 'address', 'create'),
(4, 'address', 'edit'),
(4, 'announce', 'browse'),
(4, 'announce', 'create'),
(4, 'announce', 'edit'),
(4, 'announce', 'view'),
(4, 'apppriv', 'cash'),
(4, 'apppriv', 'crm'),
(4, 'apppriv', 'doc'),
(4, 'apppriv', 'oa'),
(4, 'apppriv', 'proj'),
(4, 'apppriv', 'team'),
(4, 'attend', 'browseReview'),
(4, 'attend', 'department'),
(4, 'attend', 'export'),
(4, 'attend', 'review'),
(4, 'blog', 'create'),
(4, 'blog', 'edit'),
(4, 'blog', 'index'),
(4, 'blog', 'view'),
(4, 'company', 'index'),
(4, 'contact', 'browse'),
(4, 'contact', 'create'),
(4, 'contact', 'edit'),
(4, 'contact', 'export'),
(4, 'contact', 'exportTemplate'),
(4, 'contact', 'import'),
(4, 'contact', 'showImport'),
(4, 'contact', 'vcard'),
(4, 'contact', 'view'),
(4, 'contract', 'browse'),
(4, 'contract', 'cancel'),
(4, 'contract', 'create'),
(4, 'contract', 'delivery'),
(4, 'contract', 'edit'),
(4, 'contract', 'editDelivery'),
(4, 'contract', 'editReturn'),
(4, 'contract', 'export'),
(4, 'contract', 'finish'),
(4, 'contract', 'receive'),
(4, 'contract', 'view'),
(4, 'customer', 'assign'),
(4, 'customer', 'batchAssign'),
(4, 'customer', 'browse'),
(4, 'customer', 'contact'),
(4, 'customer', 'contract'),
(4, 'customer', 'create'),
(4, 'customer', 'edit'),
(4, 'customer', 'export'),
(4, 'customer', 'linkContact'),
(4, 'customer', 'merge'),
(4, 'customer', 'order'),
(4, 'customer', 'view'),
(4, 'depositor', 'browse'),
(4, 'doc', 'allLibs'),
(4, 'doc', 'browse'),
(4, 'doc', 'create'),
(4, 'doc', 'createLib'),
(4, 'doc', 'edit'),
(4, 'doc', 'editLib'),
(4, 'doc', 'index'),
(4, 'doc', 'projectLibs'),
(4, 'doc', 'showFiles'),
(4, 'doc', 'sort'),
(4, 'doc', 'view'),
(4, 'file', 'delete'),
(4, 'file', 'download'),
(4, 'file', 'edit'),
(4, 'file', 'upload'),
(4, 'forum', 'admin'),
(4, 'forum', 'board'),
(4, 'forum', 'index'),
(4, 'leads', 'apply'),
(4, 'leads', 'assign'),
(4, 'leads', 'browse'),
(4, 'leads', 'create'),
(4, 'leads', 'edit'),
(4, 'leads', 'ignore'),
(4, 'leads', 'transform'),
(4, 'leads', 'view'),
(4, 'order', 'activate'),
(4, 'order', 'assign'),
(4, 'order', 'browse'),
(4, 'order', 'close'),
(4, 'order', 'contact'),
(4, 'order', 'create'),
(4, 'order', 'edit'),
(4, 'order', 'export'),
(4, 'order', 'view'),
(4, 'product', 'browse'),
(4, 'product', 'create'),
(4, 'product', 'edit'),
(4, 'product', 'view'),
(4, 'resume', 'browse'),
(4, 'resume', 'create'),
(4, 'resume', 'edit'),
(4, 'sales', 'browse'),
(4, 'setting', 'lang'),
(4, 'setting', 'reset'),
(4, 'thread', 'edit'),
(4, 'thread', 'post'),
(4, 'thread', 'stick'),
(4, 'thread', 'switchStatus'),
(4, 'thread', 'transfer'),
(4, 'thread', 'view'),
(4, 'tree', 'browse'),
(4, 'tree', 'children'),
(4, 'tree', 'edit'),
(4, 'user', 'colleague'),
(5, 'announce', 'browse'),
(5, 'announce', 'create'),
(5, 'announce', 'edit'),
(5, 'announce', 'view'),
(5, 'apppriv', 'doc'),
(5, 'apppriv', 'oa'),
(5, 'apppriv', 'proj'),
(5, 'apppriv', 'team'),
(5, 'blog', 'create'),
(5, 'blog', 'edit'),
(5, 'blog', 'index'),
(5, 'blog', 'view'),
(5, 'company', 'index'),
(5, 'doc', 'allLibs'),
(5, 'doc', 'browse'),
(5, 'doc', 'create'),
(5, 'doc', 'createLib'),
(5, 'doc', 'edit'),
(5, 'doc', 'editLib'),
(5, 'doc', 'index'),
(5, 'doc', 'projectLibs'),
(5, 'doc', 'showFiles'),
(5, 'doc', 'sort'),
(5, 'doc', 'view'),
(5, 'file', 'delete'),
(5, 'file', 'download'),
(5, 'file', 'edit'),
(5, 'file', 'upload'),
(5, 'forum', 'admin'),
(5, 'forum', 'board'),
(5, 'forum', 'index'),
(5, 'thread', 'edit'),
(5, 'thread', 'post'),
(5, 'thread', 'stick'),
(5, 'thread', 'switchStatus'),
(5, 'thread', 'transfer'),
(5, 'thread', 'view'),
(5, 'user', 'colleague');

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_history`
--

CREATE TABLE `zdao_sys_history` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `action` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `field` varchar(30) NOT NULL DEFAULT '',
  `old` text NOT NULL,
  `new` text NOT NULL,
  `diff` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_lang`
--

CREATE TABLE `zdao_sys_lang` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `lang` varchar(30) NOT NULL,
  `app` varchar(30) NOT NULL DEFAULT 'sys',
  `module` varchar(30) NOT NULL,
  `section` varchar(30) NOT NULL,
  `key` varchar(60) NOT NULL,
  `value` text NOT NULL,
  `system` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_message`
--

CREATE TABLE `zdao_sys_message` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `type` char(20) NOT NULL,
  `objectType` varchar(30) NOT NULL DEFAULT '',
  `objectID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `account` char(30) DEFAULT NULL,
  `from` char(30) NOT NULL,
  `to` char(30) NOT NULL,
  `date` datetime NOT NULL,
  `content` text NOT NULL,
  `status` char(20) NOT NULL,
  `readed` enum('0','1') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_package`
--

CREATE TABLE `zdao_sys_package` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `code` varchar(30) NOT NULL,
  `version` varchar(50) NOT NULL,
  `author` varchar(100) NOT NULL,
  `desc` text NOT NULL,
  `license` text NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'extension',
  `site` varchar(150) NOT NULL,
  `ranzhiCompatible` varchar(100) NOT NULL,
  `installedTime` datetime NOT NULL,
  `depends` varchar(100) NOT NULL,
  `dirs` text NOT NULL,
  `files` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_product`
--

CREATE TABLE `zdao_sys_product` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `category` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` varchar(10) NOT NULL,
  `order` smallint(5) NOT NULL,
  `status` varchar(10) NOT NULL,
  `desc` text NOT NULL,
  `createdBy` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `editedBy` varchar(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_queue`
--

CREATE TABLE `zdao_sys_queue` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `objectID` mediumint(8) UNSIGNED NOT NULL,
  `action` mediumint(9) NOT NULL,
  `toList` varchar(255) NOT NULL,
  `ccList` text NOT NULL,
  `subject` varchar(255) DEFAULT '',
  `data` text,
  `createdBy` char(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `sendTime` datetime NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'wait',
  `failReason` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_relation`
--

CREATE TABLE `zdao_sys_relation` (
  `type` char(20) NOT NULL,
  `id` mediumint(8) NOT NULL,
  `category` mediumint(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_schema`
--

CREATE TABLE `zdao_sys_schema` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` char(10) NOT NULL,
  `trader` char(10) NOT NULL,
  `type` char(10) NOT NULL,
  `money` char(10) NOT NULL,
  `desc` char(10) NOT NULL,
  `date` char(10) NOT NULL,
  `fee` char(10) NOT NULL,
  `dept` char(10) NOT NULL,
  `product` char(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `zdao_sys_schema`
--

INSERT INTO `zdao_sys_schema` (`id`, `name`, `category`, `trader`, `type`, `money`, `desc`, `date`, `fee`, `dept`, `product`) VALUES
(1, 'Alipay', '', 'H', 'K', 'J', 'I,O', 'D', 'M', '', ''),
(2, 'CITIC Bank', '', 'C', '', 'E,D', 'G,H', 'A', '', '', '');

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_sso`
--

CREATE TABLE `zdao_sys_sso` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `sid` char(32) NOT NULL,
  `entry` mediumint(8) UNSIGNED NOT NULL,
  `token` char(32) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_tag`
--

CREATE TABLE `zdao_sys_tag` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `tag` varchar(50) NOT NULL,
  `rank` smallint(5) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_task`
--

CREATE TABLE `zdao_sys_task` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `project` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `customer` mediumint(8) UNSIGNED NOT NULL,
  `order` mediumint(8) UNSIGNED NOT NULL,
  `category` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `pri` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `estimate` decimal(12,1) UNSIGNED NOT NULL,
  `consumed` decimal(12,1) UNSIGNED NOT NULL,
  `left` decimal(12,1) UNSIGNED NOT NULL,
  `deadline` date NOT NULL,
  `status` enum('wait','doing','done','cancel','closed') NOT NULL DEFAULT 'wait',
  `statusCustom` tinyint(3) UNSIGNED NOT NULL,
  `mailto` varchar(255) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `parent` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `createdBy` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `assignedTo` varchar(30) NOT NULL,
  `assignedDate` datetime NOT NULL,
  `estStarted` date NOT NULL,
  `realStarted` date NOT NULL,
  `finishedBy` varchar(30) NOT NULL,
  `finishedDate` datetime NOT NULL,
  `canceledBy` varchar(30) NOT NULL,
  `canceledDate` datetime NOT NULL,
  `closedBy` varchar(30) NOT NULL,
  `closedDate` datetime NOT NULL,
  `closedReason` varchar(30) NOT NULL,
  `editedBy` varchar(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  `key` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_team`
--

CREATE TABLE `zdao_sys_team` (
  `type` char(30) NOT NULL,
  `id` mediumint(8) NOT NULL DEFAULT '0',
  `account` char(30) NOT NULL DEFAULT '',
  `role` char(30) NOT NULL DEFAULT '',
  `join` date NOT NULL DEFAULT '0000-00-00',
  `days` smallint(5) UNSIGNED NOT NULL,
  `hours` float(2,1) UNSIGNED NOT NULL DEFAULT '0.0',
  `estimate` decimal(12,1) UNSIGNED NOT NULL,
  `consumed` decimal(12,1) UNSIGNED NOT NULL,
  `left` decimal(12,1) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_user`
--

CREATE TABLE `zdao_sys_user` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `dept` mediumint(8) UNSIGNED NOT NULL,
  `account` char(30) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `realname` char(30) NOT NULL DEFAULT '',
  `role` char(30) NOT NULL,
  `nickname` char(60) NOT NULL DEFAULT '',
  `admin` enum('no','common','super') NOT NULL DEFAULT 'no',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `birthday` date NOT NULL,
  `gender` enum('f','m','u') NOT NULL DEFAULT 'u',
  `email` char(90) NOT NULL DEFAULT '',
  `skype` char(90) NOT NULL,
  `qq` char(20) NOT NULL DEFAULT '',
  `yahoo` char(90) NOT NULL DEFAULT '',
  `gtalk` char(90) NOT NULL DEFAULT '',
  `wangwang` char(90) NOT NULL DEFAULT '',
  `site` varchar(100) NOT NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  `phone` char(20) NOT NULL DEFAULT '',
  `address` char(120) NOT NULL DEFAULT '',
  `zipcode` char(10) NOT NULL DEFAULT '',
  `visits` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `ip` char(50) NOT NULL DEFAULT '',
  `last` datetime NOT NULL,
  `ping` datetime NOT NULL,
  `fails` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `join` datetime NOT NULL,
  `locked` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL,
  `status` enum('online','away','busy','offline') NOT NULL DEFAULT 'offline'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `zdao_sys_user`
--

INSERT INTO `zdao_sys_user` (`id`, `dept`, `account`, `password`, `realname`, `role`, `nickname`, `admin`, `avatar`, `birthday`, `gender`, `email`, `skype`, `qq`, `yahoo`, `gtalk`, `wangwang`, `site`, `mobile`, `phone`, `address`, `zipcode`, `visits`, `ip`, `last`, `ping`, `fails`, `join`, `locked`, `deleted`, `status`) VALUES
(1, 0, 'ESBCadmin', '7ff3b3b76b2174643e7deb4bd908d10c', 'ESBCadmin', '', '', 'super', '', '0000-00-00', 'u', '', '', '', '', '', '', '', '', '', '', '', 2, '::1', '2018-12-08 11:51:15', '2018-12-08 16:30:59', 0, '2018-12-07 03:46:54', '0000-00-00 00:00:00', '0', 'offline');

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_usercontact`
--

CREATE TABLE `zdao_sys_usercontact` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `account` char(30) NOT NULL,
  `name` varchar(60) NOT NULL,
  `member` text NOT NULL,
  `public` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_usergroup`
--

CREATE TABLE `zdao_sys_usergroup` (
  `account` char(30) NOT NULL DEFAULT '',
  `group` mediumint(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_sys_userquery`
--

CREATE TABLE `zdao_sys_userquery` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `account` char(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `title` varchar(90) NOT NULL,
  `form` text NOT NULL,
  `sql` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_team_reply`
--

CREATE TABLE `zdao_team_reply` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `thread` mediumint(8) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `author` char(30) NOT NULL,
  `editor` char(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `editedDate` datetime NOT NULL,
  `hidden` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `zdao_team_thread`
--

CREATE TABLE `zdao_team_thread` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `board` mediumint(8) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(60) NOT NULL,
  `editor` varchar(60) NOT NULL,
  `createdDate` datetime NOT NULL,
  `editedDate` datetime NOT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  `views` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `stick` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `replies` mediumint(8) UNSIGNED NOT NULL,
  `repliedBy` varchar(30) NOT NULL,
  `repliedDate` datetime NOT NULL,
  `replyID` mediumint(8) UNSIGNED NOT NULL,
  `hidden` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `zdao_cash_balance`
--
ALTER TABLE `zdao_cash_balance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `depositor` (`depositor`,`date`);

--
-- 資料表索引 `zdao_cash_depositor`
--
ALTER TABLE `zdao_cash_depositor`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `zdao_cash_trade`
--
ALTER TABLE `zdao_cash_trade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `depositor` (`depositor`),
  ADD KEY `parent` (`parent`),
  ADD KEY `product` (`product`),
  ADD KEY `trader` (`trader`),
  ADD KEY `order` (`order`),
  ADD KEY `contract` (`contract`),
  ADD KEY `investID` (`investID`),
  ADD KEY `loanID` (`loanID`),
  ADD KEY `dept` (`dept`);

--
-- 資料表索引 `zdao_crm_address`
--
ALTER TABLE `zdao_crm_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `objectType` (`objectType`,`objectID`);

--
-- 資料表索引 `zdao_crm_contact`
--
ALTER TABLE `zdao_crm_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `realname` (`realname`),
  ADD KEY `nickname` (`nickname`),
  ADD KEY `origin` (`origin`),
  ADD KEY `birthday` (`birthday`),
  ADD KEY `email` (`email`),
  ADD KEY `qq` (`qq`),
  ADD KEY `mobile` (`mobile`),
  ADD KEY `phone` (`phone`),
  ADD KEY `createdBy` (`createdBy`),
  ADD KEY `contactedBy` (`contactedBy`),
  ADD KEY `contactedDate` (`contactedDate`),
  ADD KEY `nextDate` (`nextDate`);

--
-- 資料表索引 `zdao_crm_contract`
--
ALTER TABLE `zdao_crm_contract`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `customer` (`customer`),
  ADD KEY `amount` (`amount`),
  ADD KEY `delivery` (`delivery`),
  ADD KEY `return` (`return`),
  ADD KEY `begin` (`begin`),
  ADD KEY `end` (`end`),
  ADD KEY `status` (`status`),
  ADD KEY `handlers` (`handlers`),
  ADD KEY `contactedDate` (`contactedDate`),
  ADD KEY `nextDate` (`nextDate`);

--
-- 資料表索引 `zdao_crm_contractorder`
--
ALTER TABLE `zdao_crm_contractorder`
  ADD UNIQUE KEY `contract` (`contract`,`order`);

--
-- 資料表索引 `zdao_crm_customer`
--
ALTER TABLE `zdao_crm_customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `industry` (`industry`),
  ADD KEY `size` (`size`),
  ADD KEY `name` (`name`),
  ADD KEY `type` (`type`),
  ADD KEY `relation` (`relation`),
  ADD KEY `area` (`area`),
  ADD KEY `status` (`status`),
  ADD KEY `level` (`level`),
  ADD KEY `category` (`category`),
  ADD KEY `public` (`public`),
  ADD KEY `assignedTo` (`assignedTo`),
  ADD KEY `contactedDate` (`contactedDate`),
  ADD KEY `nextDate` (`nextDate`);

--
-- 資料表索引 `zdao_crm_dating`
--
ALTER TABLE `zdao_crm_dating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nextDate` (`status`,`objectType`,`objectID`,`date`,`account`,`contact`);

--
-- 資料表索引 `zdao_crm_delivery`
--
ALTER TABLE `zdao_crm_delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract` (`contract`);

--
-- 資料表索引 `zdao_crm_order`
--
ALTER TABLE `zdao_crm_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product` (`product`),
  ADD KEY `customer` (`customer`),
  ADD KEY `plan` (`plan`),
  ADD KEY `real` (`real`),
  ADD KEY `status` (`status`),
  ADD KEY `createdBy` (`createdBy`),
  ADD KEY `assignedTo` (`assignedTo`),
  ADD KEY `closedBy` (`closedBy`),
  ADD KEY `closedReason` (`closedReason`),
  ADD KEY `contactedDate` (`contactedDate`),
  ADD KEY `nextDate` (`nextDate`);

--
-- 資料表索引 `zdao_crm_plan`
--
ALTER TABLE `zdao_crm_plan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract` (`contract`);

--
-- 資料表索引 `zdao_crm_resume`
--
ALTER TABLE `zdao_crm_resume`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact` (`contact`),
  ADD KEY `customer` (`customer`),
  ADD KEY `left` (`left`),
  ADD KEY `maker` (`maker`);

--
-- 資料表索引 `zdao_crm_salesgroup`
--
ALTER TABLE `zdao_crm_salesgroup`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `zdao_crm_salespriv`
--
ALTER TABLE `zdao_crm_salespriv`
  ADD KEY `account` (`account`);

--
-- 資料表索引 `zdao_im_chat`
--
ALTER TABLE `zdao_im_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gid` (`gid`),
  ADD KEY `name` (`name`),
  ADD KEY `type` (`type`),
  ADD KEY `public` (`public`),
  ADD KEY `createdBy` (`createdBy`),
  ADD KEY `editedBy` (`editedBy`);

--
-- 資料表索引 `zdao_im_chatuser`
--
ALTER TABLE `zdao_im_chatuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chatuser` (`cgid`,`user`),
  ADD KEY `cgid` (`cgid`),
  ADD KEY `user` (`user`),
  ADD KEY `order` (`order`),
  ADD KEY `star` (`star`),
  ADD KEY `hide` (`hide`);

--
-- 資料表索引 `zdao_im_message`
--
ALTER TABLE `zdao_im_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mgid` (`gid`),
  ADD KEY `mcgid` (`cgid`),
  ADD KEY `muser` (`user`),
  ADD KEY `mtype` (`type`);

--
-- 資料表索引 `zdao_im_messagestatus`
--
ALTER TABLE `zdao_im_messagestatus`
  ADD UNIQUE KEY `user` (`user`,`gid`);

--
-- 資料表索引 `zdao_oa_attend`
--
ALTER TABLE `zdao_oa_attend`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attend` (`date`,`account`),
  ADD KEY `account` (`account`),
  ADD KEY `date` (`date`),
  ADD KEY `status` (`status`),
  ADD KEY `reason` (`reason`),
  ADD KEY `reviewStatus` (`reviewStatus`),
  ADD KEY `reviewedBy` (`reviewedBy`);

--
-- 資料表索引 `zdao_oa_attendstat`
--
ALTER TABLE `zdao_oa_attendstat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attend` (`month`,`account`),
  ADD KEY `account` (`account`),
  ADD KEY `month` (`month`),
  ADD KEY `status` (`status`);

--
-- 資料表索引 `zdao_oa_doc`
--
ALTER TABLE `zdao_oa_doc`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `zdao_oa_doccontent`
--
ALTER TABLE `zdao_oa_doccontent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `docVersion` (`doc`,`version`);

--
-- 資料表索引 `zdao_oa_doclib`
--
ALTER TABLE `zdao_oa_doclib`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `zdao_oa_holiday`
--
ALTER TABLE `zdao_oa_holiday`
  ADD PRIMARY KEY (`id`),
  ADD KEY `year` (`year`),
  ADD KEY `name` (`name`);

--
-- 資料表索引 `zdao_oa_leave`
--
ALTER TABLE `zdao_oa_leave`
  ADD PRIMARY KEY (`id`),
  ADD KEY `year` (`year`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`),
  ADD KEY `createdBy` (`createdBy`);

--
-- 資料表索引 `zdao_oa_lieu`
--
ALTER TABLE `zdao_oa_lieu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `year` (`year`),
  ADD KEY `status` (`status`),
  ADD KEY `createdBy` (`createdBy`);

--
-- 資料表索引 `zdao_oa_overtime`
--
ALTER TABLE `zdao_oa_overtime`
  ADD PRIMARY KEY (`id`),
  ADD KEY `year` (`year`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`),
  ADD KEY `createdBy` (`createdBy`);

--
-- 資料表索引 `zdao_oa_project`
--
ALTER TABLE `zdao_oa_project`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `zdao_oa_refund`
--
ALTER TABLE `zdao_oa_refund`
  ADD PRIMARY KEY (`id`),
  ADD KEY `createdBy` (`createdBy`),
  ADD KEY `firstReviewer` (`firstReviewer`),
  ADD KEY `secondReviewer` (`secondReviewer`),
  ADD KEY `refundBy` (`refundBy`),
  ADD KEY `category` (`category`),
  ADD KEY `date` (`date`);

--
-- 資料表索引 `zdao_oa_todo`
--
ALTER TABLE `zdao_oa_todo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`account`);

--
-- 資料表索引 `zdao_oa_trip`
--
ALTER TABLE `zdao_oa_trip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `year` (`year`),
  ADD KEY `createdBy` (`createdBy`);

--
-- 資料表索引 `zdao_sys_action`
--
ALTER TABLE `zdao_sys_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer` (`customer`),
  ADD KEY `contact` (`contact`),
  ADD KEY `objectType` (`objectType`),
  ADD KEY `objectID` (`objectID`),
  ADD KEY `date` (`date`);

--
-- 資料表索引 `zdao_sys_article`
--
ALTER TABLE `zdao_sys_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order` (`order`),
  ADD KEY `views` (`views`),
  ADD KEY `sticky` (`sticky`);

--
-- 資料表索引 `zdao_sys_block`
--
ALTER TABLE `zdao_sys_block`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accountAppOrder` (`account`,`app`,`order`),
  ADD KEY `account` (`account`,`app`);

--
-- 資料表索引 `zdao_sys_category`
--
ALTER TABLE `zdao_sys_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `order` (`order`),
  ADD KEY `parent` (`parent`),
  ADD KEY `path` (`path`);

--
-- 資料表索引 `zdao_sys_config`
--
ALTER TABLE `zdao_sys_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`owner`,`app`,`module`,`section`,`key`);

--
-- 資料表索引 `zdao_sys_cron`
--
ALTER TABLE `zdao_sys_cron`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `zdao_sys_entry`
--
ALTER TABLE `zdao_sys_entry`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- 資料表索引 `zdao_sys_file`
--
ALTER TABLE `zdao_sys_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object` (`objectType`,`objectID`);

--
-- 資料表索引 `zdao_sys_group`
--
ALTER TABLE `zdao_sys_group`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `zdao_sys_grouppriv`
--
ALTER TABLE `zdao_sys_grouppriv`
  ADD UNIQUE KEY `group` (`group`,`module`,`method`);

--
-- 資料表索引 `zdao_sys_history`
--
ALTER TABLE `zdao_sys_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action` (`action`);

--
-- 資料表索引 `zdao_sys_lang`
--
ALTER TABLE `zdao_sys_lang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lang` (`app`,`lang`,`module`,`section`,`key`);

--
-- 資料表索引 `zdao_sys_message`
--
ALTER TABLE `zdao_sys_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `object` (`objectType`,`objectID`);

--
-- 資料表索引 `zdao_sys_package`
--
ALTER TABLE `zdao_sys_package`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `name` (`name`),
  ADD KEY `addedTime` (`installedTime`);

--
-- 資料表索引 `zdao_sys_product`
--
ALTER TABLE `zdao_sys_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`);

--
-- 資料表索引 `zdao_sys_queue`
--
ALTER TABLE `zdao_sys_queue`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `zdao_sys_relation`
--
ALTER TABLE `zdao_sys_relation`
  ADD UNIQUE KEY `relation` (`type`,`id`,`category`);

--
-- 資料表索引 `zdao_sys_schema`
--
ALTER TABLE `zdao_sys_schema`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `zdao_sys_sso`
--
ALTER TABLE `zdao_sys_sso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sid` (`sid`);

--
-- 資料表索引 `zdao_sys_tag`
--
ALTER TABLE `zdao_sys_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag` (`tag`),
  ADD KEY `rank` (`rank`);

--
-- 資料表索引 `zdao_sys_task`
--
ALTER TABLE `zdao_sys_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `statusOrder` (`statusCustom`),
  ADD KEY `assignedTo` (`assignedTo`),
  ADD KEY `createdBy` (`createdBy`),
  ADD KEY `finishedBy` (`finishedBy`),
  ADD KEY `closedBy` (`closedBy`),
  ADD KEY `closedReason` (`closedReason`),
  ADD KEY `type` (`type`);

--
-- 資料表索引 `zdao_sys_team`
--
ALTER TABLE `zdao_sys_team`
  ADD PRIMARY KEY (`type`,`id`,`account`);

--
-- 資料表索引 `zdao_sys_user`
--
ALTER TABLE `zdao_sys_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account` (`account`),
  ADD KEY `admin` (`admin`),
  ADD KEY `accountPassword` (`account`,`password`),
  ADD KEY `dept` (`dept`);

--
-- 資料表索引 `zdao_sys_usercontact`
--
ALTER TABLE `zdao_sys_usercontact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account` (`account`);

--
-- 資料表索引 `zdao_sys_usergroup`
--
ALTER TABLE `zdao_sys_usergroup`
  ADD UNIQUE KEY `account` (`account`,`group`);

--
-- 資料表索引 `zdao_sys_userquery`
--
ALTER TABLE `zdao_sys_userquery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account` (`account`),
  ADD KEY `module` (`module`);

--
-- 資料表索引 `zdao_team_reply`
--
ALTER TABLE `zdao_team_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `thread` (`thread`),
  ADD KEY `author` (`author`);

--
-- 資料表索引 `zdao_team_thread`
--
ALTER TABLE `zdao_team_thread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`board`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `zdao_cash_balance`
--
ALTER TABLE `zdao_cash_balance`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_cash_depositor`
--
ALTER TABLE `zdao_cash_depositor`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_cash_trade`
--
ALTER TABLE `zdao_cash_trade`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_crm_address`
--
ALTER TABLE `zdao_crm_address`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_crm_contact`
--
ALTER TABLE `zdao_crm_contact`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_crm_contract`
--
ALTER TABLE `zdao_crm_contract`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_crm_customer`
--
ALTER TABLE `zdao_crm_customer`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_crm_dating`
--
ALTER TABLE `zdao_crm_dating`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_crm_delivery`
--
ALTER TABLE `zdao_crm_delivery`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_crm_order`
--
ALTER TABLE `zdao_crm_order`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_crm_plan`
--
ALTER TABLE `zdao_crm_plan`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_crm_resume`
--
ALTER TABLE `zdao_crm_resume`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_crm_salesgroup`
--
ALTER TABLE `zdao_crm_salesgroup`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_im_chat`
--
ALTER TABLE `zdao_im_chat`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_im_chatuser`
--
ALTER TABLE `zdao_im_chatuser`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_im_message`
--
ALTER TABLE `zdao_im_message`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_oa_attend`
--
ALTER TABLE `zdao_oa_attend`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表 AUTO_INCREMENT `zdao_oa_attendstat`
--
ALTER TABLE `zdao_oa_attendstat`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_oa_doc`
--
ALTER TABLE `zdao_oa_doc`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_oa_doccontent`
--
ALTER TABLE `zdao_oa_doccontent`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_oa_doclib`
--
ALTER TABLE `zdao_oa_doclib`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_oa_holiday`
--
ALTER TABLE `zdao_oa_holiday`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_oa_leave`
--
ALTER TABLE `zdao_oa_leave`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_oa_lieu`
--
ALTER TABLE `zdao_oa_lieu`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_oa_overtime`
--
ALTER TABLE `zdao_oa_overtime`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_oa_project`
--
ALTER TABLE `zdao_oa_project`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_oa_refund`
--
ALTER TABLE `zdao_oa_refund`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_oa_todo`
--
ALTER TABLE `zdao_oa_todo`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_oa_trip`
--
ALTER TABLE `zdao_oa_trip`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_action`
--
ALTER TABLE `zdao_sys_action`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_article`
--
ALTER TABLE `zdao_sys_article`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_block`
--
ALTER TABLE `zdao_sys_block`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_category`
--
ALTER TABLE `zdao_sys_category`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_config`
--
ALTER TABLE `zdao_sys_config`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_cron`
--
ALTER TABLE `zdao_sys_cron`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_entry`
--
ALTER TABLE `zdao_sys_entry`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_file`
--
ALTER TABLE `zdao_sys_file`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_group`
--
ALTER TABLE `zdao_sys_group`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_history`
--
ALTER TABLE `zdao_sys_history`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_lang`
--
ALTER TABLE `zdao_sys_lang`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_message`
--
ALTER TABLE `zdao_sys_message`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_package`
--
ALTER TABLE `zdao_sys_package`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_product`
--
ALTER TABLE `zdao_sys_product`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_queue`
--
ALTER TABLE `zdao_sys_queue`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_schema`
--
ALTER TABLE `zdao_sys_schema`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_sso`
--
ALTER TABLE `zdao_sys_sso`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_tag`
--
ALTER TABLE `zdao_sys_tag`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_task`
--
ALTER TABLE `zdao_sys_task`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_user`
--
ALTER TABLE `zdao_sys_user`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_usercontact`
--
ALTER TABLE `zdao_sys_usercontact`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_sys_userquery`
--
ALTER TABLE `zdao_sys_userquery`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_team_reply`
--
ALTER TABLE `zdao_team_reply`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用資料表 AUTO_INCREMENT `zdao_team_thread`
--
ALTER TABLE `zdao_team_thread`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
