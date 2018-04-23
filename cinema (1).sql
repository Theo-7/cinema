-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-04-23 19:32:21
-- 服务器版本： 5.5.59-0ubuntu0.14.04.1
-- PHP Version: 5.6.35-1+ubuntu14.04.1+deb.sury.org+1

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
(1, 'admin', 1, '127.0.0.1', '1524475808', '$2y$10$tGUgvvMqColEuXmTqlfZgOx7VbNffFk.g9t2sqpSFEob8BaNAXPky', '127.0.0.1', 'ht', '', '1524480707');

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
  `isdel` int(10) NOT NULL DEFAULT '0' COMMENT '是否删除,0：不删除，1：删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cinema_order`
--

INSERT INTO `cinema_order` (`id`, `userid`, `seat`, `money`, `status`, `time`, `pid`, `num`, `ordernum`, `alinum`, `takenum`, `paytime`, `isdel`) VALUES
(1, 1, '[\"3_4\",\"3_5\"]', 98, 1, '1523518385', 3, 2, '2018041234542', '2018041221001004720201259254', '82406', '0000-00-00 00:00:00', 0),
(2, 1, '[\"3_5\",\"3_6\"]', 98, 1, '1523608747', 4, 2, '2018041339241', '2018041321001004720201259633', '99597', '2018-04-13 16:41:08', 0),
(3, 1, '[\"4_5\",\"4_6\"]', 98, 0, '1523841658', 4, 2, '2018041671483', '0', '0', '0000-00-00 00:00:00', 1),
(4, 1, '[\"2_5\",\"2_6\"]', 98, 0, '1523863449', 4, 2, '2018041603326', '0', '0', '0000-00-00 00:00:00', 1),
(5, 1, '[\"2_5\",\"2_6\"]', 98, 0, '1523864063', 4, 2, '2018041681072', '0', '0', '0000-00-00 00:00:00', 1),
(6, 1, '[\"3_5\",\"3_6\"]', 98, 0, '1523930162', 5, 2, '2018041749100', '0', '0', '0000-00-00 00:00:00', 1),
(7, 1, '[\"3_5\",\"3_6\"]', 98, 0, '1523930773', 5, 2, '2018041783517', '0', '0', '0000-00-00 00:00:00', 1),
(8, 1, '[\"3_5\",\"3_6\"]', 98, 0, '1523931245', 5, 2, '2018041732284', '0', '0', '0000-00-00 00:00:00', 1),
(9, 1, '[\"3_5\",\"3_6\"]', 98, 0, '1523931747', 5, 2, '2018041751996', '0', '0', '0000-00-00 00:00:00', 1),
(10, 1, '[\"3_5\",\"3_6\"]', 98, 0, '1523932213', 5, 2, '2018041762727', '0', '0', '0000-00-00 00:00:00', 1);

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
(1, 1, 1, '2018-04-09 00:00:00', '2018-04-09 02:03:00', 49),
(2, 1, 1, '2018-04-11 00:00:00', '2018-04-11 02:03:00', 49),
(3, 1, 1, '2018-04-13 00:00:00', '2018-04-13 02:03:00', 49),
(4, 1, 1, '2018-04-17 00:00:00', '2018-04-17 02:03:00', 49),
(5, 1, 1, '2018-04-20 00:00:00', '2018-04-20 02:03:00', 49);

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
  `logintime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `cinema_user`
--

INSERT INTO `cinema_user` (`id`, `name`, `password`, `phone`, `avater`, `registertime`, `logintime`) VALUES
(1, '', '$2y$10$ESiQa5jG2gcICMvUdrr3quL/PnxHLN4B/L28LIxN8zSNBeO0Al.8i', '15818348574', 'http://p0.meituan.net/movie/7dd82a16316ab32c8359debdb04396ef2897.png', '2018-04-08 17:12:35', '2018-04-23 16:11:03');

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
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `cinema_platter`
--
ALTER TABLE `cinema_platter`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
DELIMITER $$
--
-- 事件
--
CREATE DEFINER=`root`@`localhost` EVENT `order_event` ON SCHEDULE EVERY 1 SECOND STARTS '2018-04-16 14:53:39' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE cinema_order set isdel=1 where unix_timestamp(now())-time>=450 and status=0$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
