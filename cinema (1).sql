-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-03-22 11:17:51
-- 服务器版本： 5.5.59-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinema`
--

-- --------------------------------------------------------

--
-- 表的结构 `cinema_admin`
--

CREATE TABLE `cinema_admin` (
  `id` int(255) NOT NULL,
  `name` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `roldid` int(255) NOT NULL,
  `lastloginip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lastlogintime` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `loginip` int(11) NOT NULL,
  `realname` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `cinema_award`
--

CREATE TABLE `cinema_award` (
  `id` int(255) NOT NULL,
  `awardName` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `awardCover` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `award` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `movieid` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cinema_award`
--

INSERT INTO `cinema_award` (`id`, `awardName`, `awardCover`, `award`, `movieid`) VALUES
(1, '第90届奥斯卡金像奖', '/uploads/20180319/aa41c79dc911ee751e1774f59e6e7e89.jpg', '获奖：最佳影片 / 最佳导演 / 最佳艺术指导 / 最\r\n佳原创音乐\r\n提名：最佳女主角 / 最佳男配角 / 最佳女配角 / \r\n最佳原创剧本 / 最佳摄影 / 最佳服装设计 / 最佳\r\n音响效果 / 最佳剪辑 / 最佳音效剪辑', 1);

-- --------------------------------------------------------

--
-- 表的结构 `cinema_cinema`
--

CREATE TABLE `cinema_cinema` (
  `id` int(255) NOT NULL,
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `seat` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `cinema_movie`
--

CREATE TABLE `cinema_movie` (
  `id` int(255) NOT NULL,
  `name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `cover` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1200) COLLATE utf8_unicode_ci NOT NULL,
  `pictures` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `area` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `duration` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `time` date NOT NULL,
  `version` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `addtime` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cinema_movie`
--

INSERT INTO `cinema_movie` (`id`, `name`, `cover`, `description`, `pictures`, `area`, `duration`, `type`, `time`, `version`, `addtime`) VALUES
(1, '水形物语', '[\"\\/uploads\\/20180319\\/c8615e75118864326acac1e0c9671c32.jpg\"]', '哑女艾丽莎（莎莉·霍金斯 饰）在一间政府高度机密的实验室当清洁工。她和同事泽尔达（奥克塔维亚·斯宾瑟 饰）发现一个神秘的两栖人形生物被送进了实验室，她情不自禁向孤独的他靠近，感情在密会中逐渐滋长。然而，死亡威胁步步逼近，她必须想办法让他的生命在水中延续……', '[\"\\/uploads\\/20180319\\/90e4eec29856f83a619c3739e2a8bb07.jpg\",\"\\/uploads\\/20180319\\/660a48a24e5a233f69bd7340c6262056.jpg\",\"\\/uploads\\/20180319\\/3b5a2fb3e38263caacff26781b3255a0.jpg\"]', '美国', '123', '[\"2\"]', '2018-03-19', '3D', '');

-- --------------------------------------------------------

--
-- 表的结构 `cinema_moviehall`
--

CREATE TABLE `cinema_moviehall` (
  `id` int(255) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `seat` varchar(350) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cinema_moviehall`
--

INSERT INTO `cinema_moviehall` (`id`, `name`, `seat`) VALUES
(1, '一号电影厅', '[\"cccccccc_cc\",\"cccccccc_cc\",\"cccccccc_cc\",\"cccccccc_cc\",\"cccccccc_cc\"]');

-- --------------------------------------------------------

--
-- 表的结构 `cinema_movietype`
--

CREATE TABLE `cinema_movietype` (
  `id` int(255) NOT NULL,
  `name` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cinema_movietype`
--

INSERT INTO `cinema_movietype` (`id`, `name`) VALUES
(1, '战争             '),
(2, '爱情');

-- --------------------------------------------------------

--
-- 表的结构 `cinema_staff`
--

CREATE TABLE `cinema_staff` (
  `id` int(255) NOT NULL,
  `staffName` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `office` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `staffCover` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `mcharacter` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `movieid` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cinema_staff`
--

INSERT INTO `cinema_staff` (`id`, `staffName`, `office`, `staffCover`, `mcharacter`, `movieid`) VALUES
(1, '吉尔摩·德尔·托罗', '导演', '/uploads/20180319/e362198c9b14a1b7083bd851fdc43e7e.jpg', '', 1),
(2, '莎莉·霍金斯', '演员', '/uploads/20180319/2066639b89d99da0875cd5d52cdf8b25.jpg', '艾丽莎 Elisa', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cinema_admin`
--
ALTER TABLE `cinema_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinema_award`
--
ALTER TABLE `cinema_award`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinema_cinema`
--
ALTER TABLE `cinema_cinema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinema_movie`
--
ALTER TABLE `cinema_movie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinema_moviehall`
--
ALTER TABLE `cinema_moviehall`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinema_movietype`
--
ALTER TABLE `cinema_movietype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinema_staff`
--
ALTER TABLE `cinema_staff`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cinema_admin`
--
ALTER TABLE `cinema_admin`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cinema_award`
--
ALTER TABLE `cinema_award`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `cinema_cinema`
--
ALTER TABLE `cinema_cinema`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cinema_movie`
--
ALTER TABLE `cinema_movie`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `cinema_moviehall`
--
ALTER TABLE `cinema_moviehall`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `cinema_movietype`
--
ALTER TABLE `cinema_movietype`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `cinema_staff`
--
ALTER TABLE `cinema_staff`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
