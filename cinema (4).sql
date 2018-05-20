-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-05-20 23:07:14
-- 服务器版本： 5.5.60-0ubuntu0.14.04.1
-- PHP Version: 5.6.36-1+ubuntu14.04.1+deb.sury.org+1

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
  `roleid` int(255) NOT NULL,
  `lastloginip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lastlogintime` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `loginip` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `realname` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `logintime` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cinema_admin`
--

INSERT INTO `cinema_admin` (`id`, `name`, `roleid`, `lastloginip`, `lastlogintime`, `password`, `loginip`, `realname`, `email`, `logintime`) VALUES
(1, 'admin', 1, '127.0.0.1', '1526385474', '$2y$10$tGUgvvMqColEuXmTqlfZgOx7VbNffFk.g9t2sqpSFEob8BaNAXPky', '127.0.0.1', 'ht', '', '1526827342');

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
(1, '第90届奥斯卡金像奖', '/uploads/20180319/aa41c79dc911ee751e1774f59e6e7e89.jpg', '获奖：最佳影片 / 最佳导演 / 最佳艺术指导 / 最佳原创音乐\n提名：最佳女主角 / 最佳男配角 / 最佳女配角 / 最佳原创剧本 / 最佳摄影 / 最佳服装设计 / 最佳音响效果 / 最佳剪辑 / 最佳音效剪辑', 1);

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
-- 表的结构 `cinema_comment`
--

CREATE TABLE `cinema_comment` (
  `id` int(255) NOT NULL,
  `movieid` int(255) NOT NULL,
  `userid` int(255) NOT NULL,
  `comment` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `score` tinyint(10) NOT NULL,
  `time` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cinema_comment`
--

INSERT INTO `cinema_comment` (`id`, `movieid`, `userid`, `comment`, `score`, `time`) VALUES
(2, 1, 1, '很好看', 5, '1524472302');

-- --------------------------------------------------------

--
-- 表的结构 `cinema_group`
--

CREATE TABLE `cinema_group` (
  `id` int(255) NOT NULL,
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `points` float NOT NULL,
  `preferential` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cinema_group`
--

INSERT INTO `cinema_group` (`id`, `name`, `points`, `preferential`) VALUES
(1, '一星用户', 0, '100'),
(2, '二星会员', 200, '90'),
(3, '五星用户', 10000, '70'),
(4, '三星用户', 500, '85');

-- --------------------------------------------------------

--
-- 表的结构 `cinema_lunbo`
--

CREATE TABLE `cinema_lunbo` (
  `id` int(255) NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cinema_lunbo`
--

INSERT INTO `cinema_lunbo` (`id`, `url`, `role`) VALUES
(1, '/uploads/20180427/8d0563f248ed8bc0959660fb6a8de30e.jpg', 50),
(2, '/uploads/20180427/edc9a1cefe1dcf0180266593e5b72eac.jpg', 49),
(3, '/uploads/20180427/9a13a3abb201df85bdfc49e6ce1d398e.jpg', 48);

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
  `time` date NOT NULL COMMENT '上映时间',
  `version` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `addtime` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `isshow` int(11) NOT NULL DEFAULT '0' COMMENT '是否上映'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cinema_movie`
--

INSERT INTO `cinema_movie` (`id`, `name`, `cover`, `description`, `pictures`, `area`, `duration`, `type`, `time`, `version`, `addtime`, `isshow`) VALUES
(1, '水形物语', '[\"\\/uploads\\/20180319\\/c8615e75118864326acac1e0c9671c32.jpg\"]', '哑女艾丽莎（莎莉·霍金斯 饰）在一间政府高度机密的实验室当清洁工。她和同事泽尔达（奥克塔维亚·斯宾瑟 饰）发现一个神秘的两栖人形生物被送进了实验室，她情不自禁向孤独的他靠近，感情在密会中逐渐滋长。然而，死亡威胁步步逼近，她必须想办法让他的生命在水中延续……', '[\"\\/uploads\\/20180319\\/90e4eec29856f83a619c3739e2a8bb07.jpg\",\"\\/uploads\\/20180319\\/660a48a24e5a233f69bd7340c6262056.jpg\",\"\\/uploads\\/20180319\\/3b5a2fb3e38263caacff26781b3255a0.jpg\"]', '美国', '123', '[\"2\"]', '2018-03-31', '3D', '1522052009', 1),
(2, '头号玩家', '[\"\\/uploads\\/20180326\\/d7853de0e53fc4eafdf4323b0cb23f6a.jpg\"]', '在2045年，现实世界衰退破败，人们沉迷于VR(虚拟现实)游戏“绿洲(OASIS)”的虚幻世界里寻求慰藉。“绿洲”的创始人临终前宣布，将亿万身家全部留给寻获他隐藏的彩蛋的游戏玩家，史上最大规模的寻宝冒险就此展开。韦德·沃兹（泰伊·谢里丹 饰）和数十亿竞争者踏上奇妙而又危机重重的旅途。', '[\"\\/uploads\\/20180326\\/50f257b3d1b59aa721dd260cbaae2e77.jpg\",\"\\/uploads\\/20180326\\/b8ddc3e61431dbc4a657a337e61604f8.jpg\",\"\\/uploads\\/20180326\\/a6a7357dd74980534d50e3dbb4c79061.jpg\"]', '美国', '140', '[\"1\",\"2\"]', '2018-03-30', '3D', '1522052009', 1);

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
(1, '一号电影厅', '[\"cccccccc_cc\",\"cccccccc_cc\",\"cccccccc_cc\",\"cccccccc_cc\",\"cccccccc_cc\"]'),
(2, '二号电影厅', '[\"cccccccc_cc\",\"cccccccc_cc\",\"cccccccc_cc\",\"cccccccc_cc\",\"cccccccc_cc\"]');

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
-- 表的结构 `cinema_order`
--

CREATE TABLE `cinema_order` (
  `id` int(255) NOT NULL,
  `userid` int(255) NOT NULL,
  `seat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `money` float NOT NULL,
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '订单状态：０未付款；１已付款',
  `time` varchar(125) COLLATE utf8_unicode_ci NOT NULL COMMENT '下单时间',
  `pid` int(255) NOT NULL,
  `num` int(255) NOT NULL COMMENT '数量',
  `ordernum` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '订单号',
  `alinum` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '支付宝交易号',
  `takenum` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '取票码',
  `paytime` datetime NOT NULL COMMENT '支付时间',
  `isdel` int(10) NOT NULL DEFAULT '0' COMMENT '是否删除,0：不删除，1：删除',
  `isUpay` tinyint(4) DEFAULT '0' COMMENT '是否余额支付：0否1是',
  `realmoney` float NOT NULL COMMENT '折扣前金额',
  `isshow` tinyint(20) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cinema_order`
--

INSERT INTO `cinema_order` (`id`, `userid`, `seat`, `money`, `status`, `time`, `pid`, `num`, `ordernum`, `alinum`, `takenum`, `paytime`, `isdel`, `isUpay`, `realmoney`, `isshow`) VALUES
(2, 1, '[\"3_5\",\"3_6\"]', 98, 1, '1523608747', 4, 2, '2018041339241', '2018041321001004720201259633', '99597', '2018-04-13 16:41:08', 0, 0, 0, 1),
(3, 1, '[\"4_5\",\"4_6\"]', 98, 0, '1523841658', 4, 2, '2018041671483', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(4, 1, '[\"2_5\",\"2_6\"]', 98, 0, '1523863449', 4, 2, '2018041603326', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(5, 1, '[\"2_5\",\"2_6\"]', 98, 0, '1523864063', 4, 2, '2018041681072', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(6, 1, '[\"3_5\",\"3_6\"]', 98, 0, '1523930162', 5, 2, '2018041749100', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(7, 1, '[\"3_5\",\"3_6\"]', 98, 0, '1523930773', 5, 2, '2018041783517', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(8, 1, '[\"3_5\",\"3_6\"]', 98, 0, '1523931245', 5, 2, '2018041732284', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(9, 1, '[\"3_5\",\"3_6\"]', 98, 0, '1523931747', 5, 2, '2018041751996', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(10, 1, '[\"3_5\",\"3_6\"]', 98, 0, '1523932213', 5, 2, '2018041762727', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(12, 1, '[\"3_5\",\"3_6\"]', 0, 0, '1524487471', 6, 2, '2018042313271', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(13, 1, '[\"3_5\",\"3_6\"]', 100, 0, '1525332429', 7, 2, '2018050312368', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(14, 1, '[\"3_5\",\"3_6\"]', 100, 0, '1525334088', 7, 2, '2018050341432', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(15, 1, '[\"3_5\",\"3_6\"]', 100, 0, '1525335015', 7, 2, '2018050329797', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(16, 1, '[\"3_5\",\"3_6\"]', 100, 0, '1525337516', 7, 2, '2018050331238', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(17, 1, '[\"3_5\",\"3_6\"]', 100, 0, '1525338695', 7, 2, '2018050356940', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(18, 1, '[\"3_5\"]', 50, 0, '1525339158', 7, 1, '2018050349281', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(19, 1, '[\"3_6\"]', 50, 1, '1525339616', 7, 1, '2018050344813', '0', '71056', '0000-00-00 00:00:00', 0, 1, 0, 1),
(20, 1, '[\"2_5\"]', 50, 0, '1525339870', 7, 1, '2018050362867', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(21, 1, '[\"3_7\"]', 50, 0, '1525340476', 7, 1, '2018050319341', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(22, 1, '[\"3_4\",\"3_5\"]', 100, 0, '1526260831', 8, 2, '2018051433573', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(23, 2, '[\"3_4\",\"3_5\"]', 100, 0, '1526262984', 8, 2, '2018051481205', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(24, 2, '[\"3_5\",\"3_6\"]', 100, 0, '1526263447', 8, 2, '2018051487458', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(25, 2, '[\"3_5\",\"3_6\"]', 100, 0, '1526263931', 8, 2, '2018051418217', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(26, 1, '[\"4_5\",\"4_6\"]', 100, 0, '1526264100', 8, 2, '2018051440133', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(27, 1, '[\"4_5\",\"4_6\"]', 100, 0, '1526264557', 8, 2, '2018051418905', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(28, 1, '[\"3_5\",\"3_6\"]', 100, 0, '1526347459', 8, 2, '2018051557984', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(29, 1, '[\"4_5\",\"4_6\"]', 100, 0, '1526347637', 8, 2, '2018051545081', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(30, 1, '[\"3_5\",\"3_6\"]', 100, 0, '1526348049', 8, 2, '2018051542073', '0', '0', '0000-00-00 00:00:00', 1, 0, 0, 1),
(31, 1, '[\"3_3\",\"3_4\"]', 100, 1, '1526352768', 8, 2, '2018051506389', '2018051521001004720201275861', '29948', '2018-05-15 10:56:44', 0, 0, 0, 1),
(32, 1, '[\"2_5\",\"2_6\"]', 100, 1, '1526353848', 8, 2, '2018051598959', '2018051521001004720201275551', '70726', '2018-05-15 11:11:29', 0, 0, 0, 1),
(33, 1, '[\"4_5\",\"4_7\"]', 100, 1, '1526355724', 8, 2, '2018051569380', '0', '47574', '0000-00-00 00:00:00', 0, 1, 0, 1),
(34, 1, '[\"3_5\",\"3_6\"]', 100, 1, '1526356051', 8, 2, '2018051535191', '0', '20941', '0000-00-00 00:00:00', 0, 1, 0, 1),
(35, 1, '[\"2_3\",\"2_4\"]', 85, 1, '1526388278', 8, 2, '2018051527210', '0', '52694', '0000-00-00 00:00:00', 0, 1, 100, 0),
(36, 1, '[\"3_7\",\"3_8\"]', 85, 1, '1526388471', 8, 2, '2018051533181', '2018051521001004720201277204', '52994', '2018-05-15 20:50:31', 0, 0, 100, 0),
(37, 1, '[\"3_5\",\"3_6\"]', 85, 0, '1526827424', 12, 2, '2018052079870', '0', '0', '0000-00-00 00:00:00', 1, 0, 100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cinema_platter`
--

CREATE TABLE `cinema_platter` (
  `id` int(255) NOT NULL,
  `hallid` int(255) NOT NULL,
  `movieid` int(255) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cinema_platter`
--

INSERT INTO `cinema_platter` (`id`, `hallid`, `movieid`, `start`, `end`, `price`) VALUES
(2, 1, 1, '2018-04-11 00:00:00', '2018-04-11 02:03:00', 49),
(3, 1, 1, '2018-04-13 00:00:00', '2018-04-13 02:03:00', 49),
(4, 1, 1, '2018-04-17 00:00:00', '2018-04-17 02:03:00', 49),
(5, 1, 1, '2018-04-20 00:00:00', '2018-04-20 02:03:00', 49),
(6, 1, 1, '2018-04-27 00:00:00', '2018-04-27 02:03:00', 50),
(7, 1, 1, '2018-05-05 00:00:00', '2018-05-05 02:03:00', 50),
(8, 1, 1, '2018-05-18 00:00:00', '2018-05-18 02:03:00', 50),
(10, 2, 1, '2018-05-18 00:00:00', '2018-05-18 02:03:00', 50),
(12, 1, 1, '2018-05-26 00:00:00', '2018-05-26 02:03:00', 50);

-- --------------------------------------------------------

--
-- 表的结构 `cinema_recharge`
--

CREATE TABLE `cinema_recharge` (
  `id` int(255) NOT NULL,
  `num` bigint(255) NOT NULL COMMENT '订单号',
  `userid` int(255) NOT NULL,
  `time` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '支付成功时间',
  `money` float NOT NULL COMMENT '金额',
  `alinum` varchar(125) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cinema_recharge`
--

INSERT INTO `cinema_recharge` (`id`, `num`, `userid`, `time`, `money`, `alinum`) VALUES
(1, 201805033002771, 1, '2018-05-03 15:05:48', 15.5, '2018050321001004900200220777'),
(28, 201805032492596, 1, '2018-05-03 17:02:58', 10, '2018050321001004900200221094'),
(29, 201805080175658, 1, '2018-05-08 14:41:10', 100, '2018050821001004720201268318'),
(30, 201805080125212, 1, '2018-05-08 15:10:56', 10, '2018050821001004720201268513'),
(31, 201805080178572, 1, '2018-05-08 15:13:22', 0.01, '2018050821001004720201268514'),
(32, 201805084722950, 1, '2018-05-08 15:16:14', 0.01, '2018050821001004720201268705'),
(35, 201805153719015, 1, '2018-05-15 11:35:15', 300, '2018051521001004720201275560');

-- --------------------------------------------------------

--
-- 表的结构 `cinema_rold`
--

CREATE TABLE `cinema_rold` (
  `id` int(255) NOT NULL,
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `rold` varchar(2000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(2, '莎莉·霍金斯', '演员', '/uploads/20180319/2066639b89d99da0875cd5d52cdf8b25.jpg', '艾丽莎 Elisa', 1),
(3, '史蒂文·斯皮尔伯格', '导演', '/uploads/20180326/156f6fcd525555c58640adf7c88a0faf.jpg', '', 2),
(4, '泰尔·谢里丹', '演员', '/uploads/20180326/ecced2fa3095050aea920674e70d9630.jpg', '韦德·沃兹', 2);

-- --------------------------------------------------------

--
-- 表的结构 `cinema_user`
--

CREATE TABLE `cinema_user` (
  `id` int(255) NOT NULL,
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `avater` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'http://p0.meituan.net/movie/7dd82a16316ab32c8359debdb04396ef2897.png',
  `registertime` datetime NOT NULL,
  `logintime` datetime NOT NULL,
  `gender` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '未知',
  `money` float NOT NULL DEFAULT '0' COMMENT '个人总余额',
  `groupid` int(255) DEFAULT '1' COMMENT '会员组id',
  `points` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '积分'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cinema_user`
--

INSERT INTO `cinema_user` (`id`, `name`, `password`, `phone`, `avater`, `registertime`, `logintime`, `gender`, `money`, `groupid`, `points`) VALUES
(1, 'keke', '$2y$10$ESiQa5jG2gcICMvUdrr3quL/PnxHLN4B/L28LIxN8zSNBeO0Al.8i', '15818348574', '/uploads/20180515/8ee5f99903c645185eb95a73dbb16560.jpg', '2018-04-08 17:12:35', '2018-05-20 22:41:06', '男', 14950.5, 4, '885'),
(2, '', '$2y$10$FT8T35L4IJMFHBT5vdBvhOU80btUmt3DCVCayEmm.KtzNCaYAhINq', '15625875833', 'http://p0.meituan.net/movie/7dd82a16316ab32c8359debdb04396ef2897.png', '2018-05-14 09:42:18', '2018-05-14 09:42:47', '未知', 0, 1, '0');

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
-- Indexes for table `cinema_comment`
--
ALTER TABLE `cinema_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinema_group`
--
ALTER TABLE `cinema_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinema_lunbo`
--
ALTER TABLE `cinema_lunbo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinema_movie`
--
ALTER TABLE `cinema_movie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

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
-- Indexes for table `cinema_order`
--
ALTER TABLE `cinema_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinema_platter`
--
ALTER TABLE `cinema_platter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinema_recharge`
--
ALTER TABLE `cinema_recharge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinema_rold`
--
ALTER TABLE `cinema_rold`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinema_staff`
--
ALTER TABLE `cinema_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinema_user`
--
ALTER TABLE `cinema_user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cinema_admin`
--
ALTER TABLE `cinema_admin`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
-- 使用表AUTO_INCREMENT `cinema_comment`
--
ALTER TABLE `cinema_comment`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `cinema_group`
--
ALTER TABLE `cinema_group`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `cinema_lunbo`
--
ALTER TABLE `cinema_lunbo`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `cinema_movie`
--
ALTER TABLE `cinema_movie`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `cinema_moviehall`
--
ALTER TABLE `cinema_moviehall`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `cinema_movietype`
--
ALTER TABLE `cinema_movietype`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `cinema_order`
--
ALTER TABLE `cinema_order`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- 使用表AUTO_INCREMENT `cinema_platter`
--
ALTER TABLE `cinema_platter`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `cinema_recharge`
--
ALTER TABLE `cinema_recharge`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- 使用表AUTO_INCREMENT `cinema_rold`
--
ALTER TABLE `cinema_rold`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `cinema_staff`
--
ALTER TABLE `cinema_staff`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `cinema_user`
--
ALTER TABLE `cinema_user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
DELIMITER $$
--
-- 事件
--
CREATE DEFINER=`root`@`localhost` EVENT `order_event` ON SCHEDULE EVERY 1 SECOND STARTS '2018-04-16 14:53:39' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE cinema_order set isdel=1 where (unix_timestamp(now())-time)>=450 and status=0$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
