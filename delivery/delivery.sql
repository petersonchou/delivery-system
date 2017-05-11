-- phpMyAdmin SQL Dump
-- version 3.3.10.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 06 月 16 日 08:55
-- 服务器版本: 5.5.40
-- PHP 版本: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `delivery`
--

-- --------------------------------------------------------

--
-- 表的结构 `think_contribution`
--

CREATE TABLE IF NOT EXISTS `think_contribution` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL COMMENT '标题',
  `author` varchar(20) NOT NULL COMMENT '作者',
  `content` varchar(1400) NOT NULL COMMENT '内容',
  `postdate` datetime NOT NULL COMMENT '提交日期',
  `userid` int(10) unsigned NOT NULL COMMENT '提价者id',
  `statusid` int(10) unsigned NOT NULL COMMENT '状态id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `think_contribution`
--

INSERT INTO `think_contribution` (`id`, `title`, `author`, `content`, `postdate`, `userid`, `statusid`) VALUES
(1, '测试用的标题', '姚家勇', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;你好，world&nbsp;world测试用测试用测试用测试用测试用测试用测<br/>用测试用测试用测试用测试用测试用测试用测试用测试用测试用测试用测试测试用<br/>我们都是要测试的', '2016-05-03 11:48:43', 1, 2),
(2, '标题不重要标题不重要', '真子', '玩游戏玩游戏玩游戏', '2016-05-06 21:37:25', 1, 1),
(3, '归来了', '真子', '回来好耍了哈', '2016-05-06 21:38:01', 1, 3),
(4, '红色文化', '延君', '喜欢红色文化', '2016-05-09 21:38:45', 1, 3),
(5, '显示器不亮', '姚家勇', '东西坏了谁来修', '2016-05-10 21:39:07', 1, 2),
(7, '展风采', '延君', '努力赚钱展现风采', '2016-05-28 21:39:51', 1, 1),
(8, '哈哈哈', '延君', '你好哈哈哈', '2016-06-06 21:42:36', 1, 3),
(10, '表格文件', '姚家勇', '这是个很好的表格文件', '2016-06-06 21:44:10', 1, 2),
(11, '革命军人', '杨瀚成', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;中国人民抗日战争异常惨烈，从战略防御到战略相持，进而发展到战略反攻及大嫂，无论是正面战场还是敌后战场，中国人民同仇敌忾、共赴国难，铁骨铮铮、视死如归，奏响了气壮山河的英雄凯歌。杨靖宇、赵尚志、左权、彭雪枫、佟麟阁、赵登禹、张自忠、戴安澜等一批抗日将领，八路军“狼牙山五壮士”、新四军“刘老庄连”、东北抗联八位女战士、国民党军“八百壮士”等众多英雄群体，就是中国人民不畏强暴、以身殉国的杰出代表。<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;正所谓“诚既勇兮又以武，终刚强兮不可凌。身既死兮神以灵，魂魄毅兮为鬼雄。”&nbsp;中国人民抗日战争异常惨烈，从战略防御到战略相持，进而发展到战略反攻，无论是正面战场还是敌后战场，中国人民同仇敌忾、共赴国难，铁骨铮铮、视死如归，奏响了气壮山河的英雄凯歌。杨靖宇、赵尚志、左权、彭雪枫、佟麟阁、赵登禹、张自忠、戴安澜等一批抗日将领，八路军“狼牙山五壮士”、新四军“刘老庄连”、东北抗联八位女战士、国民党军“八百壮士”等众多英雄群体，就是中国人民不畏强暴、以身殉国的杰出代表。<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;正所谓“诚既勇兮又以武，终刚强兮不可凌。身既死兮神以灵，魂魄毅兮为鬼雄是打发第三方。”&nbsp;中国人民抗日战争异常惨烈，从战略防御到战略相持，进而发展到战略反攻，无论是正面战场还是敌后战场，中国人民同仇敌忾、共赴国难，铁骨铮铮、视死如归，奏响了气壮山河的英雄凯歌。杨靖宇、赵尚志、左权、彭雪', '2016-06-06 21:44:38', 1, 1),
(12, '测试添加功能', '测试作者', 'hello&nbsp;world.', '2016-06-11 18:06:51', 1, 3),
(19, '测试投稿', '阿旺', '你好你好你好你好测试正文', '2016-06-11 22:31:43', 1, 2),
(20, '训练队不错', '范华', '训练队一中队测试内容<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;测试内容测试内容', '2016-06-14 16:43:06', 3, 1),
(21, '天天打麻将', '延参', '减少对方酸豆角佛士大夫爱兜风<br/>水淀粉及哦啊啥地方叫阿斯顿<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;附件雕塑附近欧士大夫', '2016-06-14 16:44:40', 3, 1),
(22, '队部来啦', '院庆', '队部测试正文内容<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;测试测试', '2016-06-15 00:45:37', 4, 1),
(23, '测试已通过', '同心圆', '第三方家属的及覅偶阿萨德发生的风景哦天津市地方', '2016-06-15 17:04:43', 4, 3),
(24, '纠察来啦', '纠察', '纠察测试正文。', '2016-06-16 03:18:57', 20, 2);

-- --------------------------------------------------------

--
-- 表的结构 `think_group`
--

CREATE TABLE IF NOT EXISTS `think_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupname` varchar(20) NOT NULL COMMENT '组名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `think_group`
--

INSERT INTO `think_group` (`id`, `groupname`) VALUES
(1, '普通用户'),
(2, '管理员'),
(3, '超级管理员');

-- --------------------------------------------------------

--
-- 表的结构 `think_status`
--

CREATE TABLE IF NOT EXISTS `think_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statusname` varchar(20) NOT NULL COMMENT '状态名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `think_status`
--

INSERT INTO `think_status` (`id`, `statusname`) VALUES
(1, '待审核'),
(2, '未通过'),
(3, '已通过');

-- --------------------------------------------------------

--
-- 表的结构 `think_user`
--

CREATE TABLE IF NOT EXISTS `think_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL COMMENT '用户密码',
  `usercode` varchar(6) NOT NULL COMMENT '用户编码',
  `loginip` varchar(11) NOT NULL COMMENT '登录地ip',
  `lastvisited` datetime NOT NULL COMMENT '上次登录时间',
  `groupid` int(10) unsigned NOT NULL COMMENT '所属组id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `think_user`
--

INSERT INTO `think_user` (`id`, `username`, `password`, `usercode`, `loginip`, `lastvisited`, `groupid`) VALUES
(1, '六连', '123456', '2-4', '127.0.0.1', '2016-06-03 11:43:55', 1),
(2, '宣传股', '123456', '0-1', '127.0.0.1', '2016-06-03 11:46:09', 2),
(3, '一中队', '123456', '5-1', '127.0.0.1', '2016-06-14 16:41:01', 1),
(4, '训练队队部', '123456', '5-0', '127.0.0.1', '2016-06-15 00:43:49', 1),
(5, '一营营部', '123456', '1-0', '127.0.0.1', '2016-06-16 01:36:11', 1),
(6, '二营营部', '123456', '2-0', '127.0.0.1', '2016-06-16 01:36:29', 1),
(7, '三营营部', '123456', '3-0', '127.0.0.1', '2016-06-16 01:36:48', 1),
(8, '四营营部', '123456', '4-0', '127.0.0.1', '2016-06-16 01:37:07', 1),
(9, '一连', '123456', '1-1', '127.0.0.1', '2016-06-16 01:37:37', 1),
(10, '二连', '123456', '1-2', '127.0.0.1', '2016-06-16 01:37:49', 1),
(11, '三连', '123456', '2-1', '127.0.0.1', '2016-06-16 01:38:11', 1),
(12, '四连', '123456', '2-2', '127.0.0.1', '2016-06-16 01:38:20', 1),
(13, '五连', '123456', '2-3', '127.0.0.1', '2016-06-16 01:38:41', 1),
(14, '七连', '123456', '3-1', '127.0.0.1', '2016-06-16 01:38:55', 1),
(15, '八连', '123456', '3-2', '127.0.0.1', '2016-06-16 01:39:10', 1),
(16, '九连', '123456', '3-3', '127.0.0.1', '2016-06-16 01:39:22', 1),
(17, '十连', '123456', '4-1', '127.0.0.1', '2016-06-16 01:39:45', 1),
(18, '十一连', '123456', '4-2', '127.0.0.1', '2016-06-16 01:39:55', 1),
(19, '十二连', '123456', '4-3', '127.0.0.1', '2016-06-16 01:40:13', 1),
(20, '警通连', '123456', '6-1', '127.0.0.1', '2016-06-16 01:40:26', 1),
(21, '修理连', '123456', '6-2', '127.0.0.1', '2016-06-16 01:40:42', 1),
(22, '二中队', '123456', '5-2', '127.0.0.1', '2016-06-16 00:00:00', 1),
(23, '三中队', '123456', '5-3', '127.0.0.1', '2016-06-16 01:41:46', 1);
