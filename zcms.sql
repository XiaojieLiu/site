-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 06 月 01 日 13:09
-- 服务器版本: 5.5.20
-- PHP 版本: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `zcms`
--

-- --------------------------------------------------------

--
-- 表的结构 `zs_action`
--

CREATE TABLE IF NOT EXISTS `zs_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `zs_action`
--

INSERT INTO `zs_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 0, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765);

-- --------------------------------------------------------

--
-- 表的结构 `zs_action_log`
--

CREATE TABLE IF NOT EXISTS `zs_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=54 ;

--
-- 转存表中的数据 `zs_action_log`
--

INSERT INTO `zs_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(1, 1, 1, 2130706433, 'member', 1, 'admin在2015-05-28 20:18登录了后台', 1, 1432815507),
(2, 1, 3, 2130706433, 'member', 3, 'yqlxj在2015-05-28 20:21登录了后台', 1, 1432815680),
(3, 1, 1, 2130706433, 'member', 1, 'admin在2015-05-28 23:08登录了后台', 1, 1432825698),
(4, 1, 1, 2130706433, 'member', 1, 'admin在2015-05-28 23:09登录了后台', 1, 1432825783),
(5, 1, 1, 2130706433, 'member', 1, 'admin在2015-05-28 23:09登录了后台', 1, 1432825794),
(6, 1, 1, 2130706433, 'member', 1, 'admin在2015-05-28 23:10登录了后台', 1, 1432825857),
(7, 1, 1, 2130706433, 'member', 1, 'admin在2015-05-29 23:32登录了后台', 1, 1432913544),
(8, 1, 1, 2130706433, 'member', 1, 'admin在2015-05-29 23:32登录了后台', 1, 1432913555),
(9, 10, 1, 2130706433, 'Menu', 70, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1432917318),
(10, 10, 1, 2130706433, 'Menu', 70, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1432917373),
(11, 10, 1, 2130706433, 'Menu', 0, '操作url：/thinkphp-zcms/Admin/menu/del/id/70', 1, 1432917388),
(12, 10, 1, 2130706433, 'Menu', 2, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1432917446),
(13, 10, 1, 2130706433, 'Menu', 123, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1432917478),
(14, 10, 1, 2130706433, 'Menu', 125, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1432917503),
(15, 10, 1, 2130706433, 'Menu', 0, '操作url：/thinkphp-zcms/Admin/menu/del/id/125', 1, 1432917520),
(16, 10, 1, 2130706433, 'Menu', 90, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1432917560),
(17, 10, 1, 2130706433, 'Menu', 0, '操作url：/thinkphp-zcms/Admin/menu/del/id/90', 1, 1432917573),
(18, 10, 1, 2130706433, 'Menu', 0, '操作url：/thinkphp-zcms/Admin/menu/del/id/86', 1, 1432917577),
(19, 10, 1, 2130706433, 'Menu', 0, '操作url：/thinkphp-zcms/Admin/menu/del/id/57', 1, 1432917583),
(20, 10, 1, 2130706433, 'Menu', 0, '操作url：/thinkphp-zcms/Admin/menu/del/id/44', 1, 1432917592),
(21, 10, 1, 2130706433, 'Menu', 43, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1432917603),
(22, 1, 1, 2130706433, 'member', 1, 'admin在2015-05-30 10:08登录了后台', 1, 1432951734),
(23, 10, 1, 2130706433, 'Menu', 123, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1432951869),
(24, 10, 1, 2130706433, 'Menu', 68, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1432951943),
(25, 10, 1, 2130706433, 'Menu', 16, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1432951954),
(26, 10, 1, 2130706433, 'Menu', 123, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1432951967),
(27, 10, 1, 2130706433, 'Menu', 68, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1432951977),
(28, 10, 1, 2130706433, 'Menu', 16, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1432951988),
(29, 1, 3, 2130706433, 'member', 3, 'yqlxj在2015-05-30 22:58登录了后台', 1, 1432997925),
(30, 1, 4, 2130706433, 'member', 4, 'woaideren在2015-05-30 23:00登录了后台', 1, 1432998008),
(31, 1, 4, 2130706433, 'member', 4, 'woaideren在2015-05-30 23:02登录了后台', 1, 1432998121),
(32, 1, 4, 2130706433, 'member', 4, 'woaideren在2015-05-30 23:03登录了后台', 1, 1432998212),
(33, 1, 4, 2130706433, 'member', 4, 'woaideren在2015-05-30 23:04登录了后台', 1, 1432998241),
(34, 1, 4, 2130706433, 'member', 4, 'woaideren在2015-05-30 23:04登录了后台', 1, 1432998270),
(35, 1, 4, 2130706433, 'member', 4, 'woaideren在2015-05-30 23:05登录了后台', 1, 1432998330),
(36, 1, 4, 2130706433, 'member', 4, 'woaideren在2015-05-30 23:08登录了后台', 1, 1432998488),
(37, 1, 4, 2130706433, 'member', 4, 'woaideren在2015-05-30 23:09登录了后台', 1, 1432998594),
(38, 10, 1, 2130706433, 'Menu', 19, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1432999491),
(39, 10, 1, 2130706433, 'Menu', 0, '操作url：/thinkphp-zcms/Admin/menu/del/id/19', 1, 1432999548),
(40, 1, 1, 2130706433, 'member', 1, 'admin在2015-05-31 15:01登录了后台', 1, 1433055661),
(41, 10, 1, 2130706433, 'Menu', 133, '操作url：/thinkphp-zcms/Admin/Menu/add', 1, 1433076438),
(42, 10, 1, 2130706433, 'Menu', 82, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1433076506),
(43, 10, 1, 2130706433, 'Menu', 81, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1433076573),
(44, 10, 1, 2130706433, 'Menu', 134, '操作url：/thinkphp-zcms/Admin/Menu/add', 1, 1433076644),
(45, 10, 1, 2130706433, 'Menu', 135, '操作url：/thinkphp-zcms/Admin/Menu/add', 1, 1433076675),
(46, 10, 1, 2130706433, 'Menu', 136, '操作url：/thinkphp-zcms/Admin/Menu/add', 1, 1433076691),
(47, 10, 1, 2130706433, 'Menu', 135, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1433076727),
(48, 10, 1, 2130706433, 'Menu', 136, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1433076739),
(49, 10, 1, 2130706433, 'Menu', 0, '操作url：/thinkphp-zcms/Admin/menu/del/id/133', 1, 1433076849),
(50, 10, 1, 2130706433, 'Menu', 2, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1433076864),
(51, 10, 1, 2130706433, 'Menu', 82, '操作url：/thinkphp-zcms/Admin/Menu/edit', 1, 1433076896),
(52, 11, 1, 2130706433, 'category', 1, '操作url：/thinkphp-zcms/Admin/Category/add', 1, 1433076947),
(53, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-01 20:57登录了后台', 1, 1433163426);

-- --------------------------------------------------------

--
-- 表的结构 `zs_addons`
--

CREATE TABLE IF NOT EXISTS `zs_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `zs_addons`
--

INSERT INTO `zs_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(1, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1383126253, 0),
(2, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0),
(3, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0),
(4, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1379842319, 1),
(5, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"2","comment_uid_youyan":"jroy","comment_short_name_duoshuo":"","comment_data_list_duoshuo":""}', 'thinkphp', '0.1', 1380273962, 0);

-- --------------------------------------------------------

--
-- 表的结构 `zs_address`
--

CREATE TABLE IF NOT EXISTS `zs_address` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(60) NOT NULL DEFAULT '',
  `country` varchar(10) NOT NULL DEFAULT '',
  `province` varchar(10) NOT NULL DEFAULT '',
  `city` varchar(10) NOT NULL DEFAULT '',
  `district` varchar(225) NOT NULL DEFAULT '',
  `address` varchar(120) NOT NULL DEFAULT '',
  `zipcode` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `mobile` varchar(60) NOT NULL DEFAULT '',
  `create_time` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zs_attachment`
--

CREATE TABLE IF NOT EXISTS `zs_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zs_attribute`
--

CREATE TABLE IF NOT EXISTS `zs_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=74 ;

--
-- 转存表中的数据 `zs_attribute`
--

INSERT INTO `zs_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', 1, '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'thumb', '缩略图', 'int(10) unsigned NOT NULL ', 'picture', '0', '栏目封面', 1, '', 1, 0, 1, 1406600180, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, ''),
(22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, ''),
(23, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 2, 0, 1, 1384511049, 1383891243, '', 0, '', '', '', 0, ''),
(24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, ''),
(25, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', 1, '', 2, 0, 1, 1383896190, 1383891243, '', 0, '', '', '', 0, ''),
(26, 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 2, 0, 1, 1383896103, 1383891243, '', 0, '', '', '', 0, ''),
(27, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 3, 0, 1, 1387260461, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(28, 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', 1, '', 3, 0, 1, 1383896438, 1383891252, '', 0, '', '', '', 0, ''),
(29, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', 1, '', 3, 0, 1, 1383896429, 1383891252, '', 0, '', '', '', 0, ''),
(30, 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '', 1, '', 3, 0, 1, 1406599765, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(31, 'count', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 3, 0, 1, 1406599339, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(32, 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', 1, '', 3, 0, 1, 1383896371, 1383891252, '', 0, '', '', '', 0, ''),
(47, 'cid', '分类id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 6, 1, 1, 1402367172, 1402367172, '', 3, '', 'regex', '', 3, 'function'),
(72, 'price', '价格', 'int(10) UNSIGNED NOT NULL', 'num', '', '本站价格', 1, '', 4, 0, 1, 1406165369, 1406165369, '', 3, '', 'regex', '', 3, 'function'),
(70, 'content', '内容', 'text NOT NULL', 'editor', '', '', 1, '', 4, 0, 1, 1406165184, 1406165184, '', 3, '', 'regex', '', 3, 'function'),
(71, 'mrsp', '市场价', 'int(10) UNSIGNED NOT NULL', 'num', '', '市场价', 1, '', 4, 0, 1, 1406165298, 1406165298, '', 3, '', 'regex', '', 3, 'function'),
(68, 'content', '内容', 'text NOT NULL', 'editor', '', '', 1, '', 5, 0, 1, 1406079578, 1406079578, '', 3, '', 'regex', '', 3, 'function'),
(67, 'gallery', '图集', 'varchar(100) NOT NULL', 'gallery', '', '', 1, '', 1, 0, 1, 1406079122, 1406079122, '', 3, '', 'regex', '', 3, 'function'),
(73, 'relative', '相关文章', 'varchar(255) NOT NULL', 'array', '', '', 1, '', 1, 0, 1, 1408083033, 1408082647, '', 3, '', 'regex', '', 3, 'function');

-- --------------------------------------------------------

--
-- 表的结构 `zs_auth_extend`
--

CREATE TABLE IF NOT EXISTS `zs_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `zs_auth_extend`
--

INSERT INTO `zs_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(1, 4, 1),
(1, 37, 1);

-- --------------------------------------------------------

--
-- 表的结构 `zs_auth_group`
--

CREATE TABLE IF NOT EXISTS `zs_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `zs_auth_group`
--

INSERT INTO `zs_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', 1, '默认用户组', '', 1, '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106'),
(2, 'admin', 1, '编辑', '网站编辑组', 1, '1,2,3,4,5,6,7,8,9,10,12,13,14,15,16,17,18,19,20,21,62,63,64,66,67,72,73,77,78,79,80,81,82,83,88,89,90,91,98,99,102,103,106,107,108,109,110,111,112,113,114,115,116,117');

-- --------------------------------------------------------

--
-- 表的结构 `zs_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `zs_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zs_auth_group_access`
--

INSERT INTO `zs_auth_group_access` (`uid`, `group_id`) VALUES
(2, 2),
(3, 2);

-- --------------------------------------------------------

--
-- 表的结构 `zs_auth_rule`
--

CREATE TABLE IF NOT EXISTS `zs_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=119 ;

--
-- 转存表中的数据 `zs_auth_rule`
--

INSERT INTO `zs_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'Admin', 1, 'Admin/article/add', '新增', 1, ''),
(2, 'Admin', 1, 'Admin/article/edit', '编辑', 1, ''),
(3, 'Admin', 1, 'Admin/article/setStatus', '改变状态', 1, ''),
(4, 'Admin', 1, 'Admin/article/update', '保存', 1, ''),
(5, 'Admin', 1, 'Admin/article/autoSave', '保存草稿', 1, ''),
(6, 'Admin', 1, 'Admin/article/move', '移动', 1, ''),
(7, 'Admin', 1, 'Admin/article/copy', '复制', 1, ''),
(8, 'Admin', 1, 'Admin/article/paste', '粘贴', 1, ''),
(9, 'Admin', 1, 'Admin/article/batchOperate', '导入', 1, ''),
(10, 'Admin', 1, 'Admin/article/permit', '还原', 1, ''),
(11, 'Admin', 1, 'Admin/article/clear', '清空', 1, ''),
(12, 'Admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(13, 'Admin', 1, 'Admin/User/add', '新增用户', 1, ''),
(14, 'Admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(15, 'Admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(16, 'Admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(17, 'Admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(18, 'Admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(19, 'Admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(20, 'Admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(21, 'Admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(22, 'Admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(23, 'Admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(24, 'Admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(25, 'Admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(26, 'Admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(27, 'Admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(28, 'Admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(29, 'Admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(30, 'Admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(31, 'Admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(32, 'Admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(33, 'Admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(34, 'Admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(35, 'Admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(36, 'Admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(37, 'Admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(38, 'Admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(39, 'Admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(40, 'Admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(41, 'Admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(42, 'Admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(43, 'Admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(44, 'Admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(45, 'Admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(46, 'Admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(47, 'Admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(48, 'Admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(49, 'Admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(50, 'Admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(51, 'Admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(52, 'Admin', 1, 'Admin/Model/index', '模型管理', 1, ''),
(53, 'Admin', 1, 'Admin/model/add', '新增', 1, ''),
(54, 'Admin', 1, 'Admin/model/edit', '编辑', 1, ''),
(55, 'Admin', 1, 'Admin/model/setStatus', '改变状态', 1, ''),
(56, 'Admin', 1, 'Admin/model/update', '保存数据', 1, ''),
(57, 'Admin', 1, 'Admin/Attribute/index', '属性管理', 1, ''),
(58, 'Admin', 1, 'Admin/Attribute/add', '新增', 1, ''),
(59, 'Admin', 1, 'Admin/Attribute/edit', '编辑', 1, ''),
(60, 'Admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, ''),
(61, 'Admin', 1, 'Admin/Attribute/update', '保存数据', 1, ''),
(62, 'Admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(63, 'Admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(64, 'Admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(65, 'Admin', 1, 'Admin/Config/del', '删除', 1, ''),
(66, 'Admin', 1, 'Admin/Config/add', '新增', 1, ''),
(67, 'Admin', 1, 'Admin/Config/save', '保存', 1, ''),
(68, 'Admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(69, 'Admin', 1, 'Admin/Channel/add', '新增', 1, ''),
(70, 'Admin', 1, 'Admin/Channel/edit', '编辑', 1, ''),
(71, 'Admin', 1, 'Admin/Channel/del', '删除', 1, ''),
(72, 'Admin', 1, 'Admin/Category/edit', '编辑', 1, ''),
(73, 'Admin', 1, 'Admin/Category/add', '新增', 1, ''),
(74, 'Admin', 1, 'Admin/Category/remove', '删除', 1, ''),
(75, 'Admin', 1, 'Admin/Category/operate/type/move', '移动', 1, ''),
(76, 'Admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, ''),
(77, 'Admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(78, 'Admin', 1, 'Admin/Database/export', '备份', 1, ''),
(79, 'Admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(80, 'Admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(81, 'Admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'Admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(83, 'Admin', 1, 'Admin/Database/del', '删除', 1, ''),
(84, 'Admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(85, 'Admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(86, 'Admin', 1, 'Admin/Think/lists?model=download', '下载管理', 1, ''),
(87, 'Admin', 1, 'Admin/Think/lists?model=config', '配置管理', 1, ''),
(88, 'Admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(89, 'Admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(90, 'Admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(91, 'Admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(92, 'Admin', 1, 'Admin/think/add', '新增数据', 1, ''),
(93, 'Admin', 1, 'Admin/think/edit', '编辑数据', 1, ''),
(94, 'Admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(95, 'Admin', 1, 'Admin/Model/generate', '生成', 1, ''),
(96, 'Admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(97, 'Admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(98, 'Admin', 1, 'Admin/Article/sort', '文档排序', 1, ''),
(99, 'Admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(100, 'Admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(101, 'Admin', 1, 'Admin/Channel/sort', '排序', 1, ''),
(102, 'Shop', 1, 'Shop/ShopOrders/index', '订单管理', 1, ''),
(103, 'Shop', 1, 'Shop/ShopShipping/index', '配货方式设置', 1, ''),
(104, 'Shop', 1, 'Shop/ShopProduct/index', '商品管理', -1, ''),
(105, 'Shop', 1, 'Shop/ShopCatalog/index', '分类管理', -1, ''),
(106, 'Admin', 1, 'Admin/Flink/index', '链接管理', 1, ''),
(107, 'Admin', 1, 'Admin/Flink/type', '分类管理', 1, ''),
(108, 'Admin', 1, 'Admin/Flink/add', '添加友情链接', 1, ''),
(109, 'Admin', 1, 'Admin/Message/index', '留言管理', 1, ''),
(110, 'Admin', 2, 'Admin/Config/group', '设置', 1, ''),
(111, 'Admin', 1, 'Admin/Category/index', '栏目管理', 1, ''),
(112, 'Admin', 1, 'Admin/article/mydocument', '文档列表', 1, ''),
(113, 'Admin', 2, 'Admin/User/index', '用户管理', 1, ''),
(114, 'Admin', 2, 'Admin/Article/mydocument', '内容管理', 1, ''),
(115, 'Admin', 1, 'Admin/article/recycle', '回收站', 1, ''),
(116, 'Shop', 2, 'Shop/index', '商店管理', 1, ''),
(117, 'Admin', 2, 'Admin/Addons/index', '扩展工具', 1, ''),
(118, 'Admin', 2, 'Admin/Index/dev', '开发者选项', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `zs_category`
--

CREATE TABLE IF NOT EXISTS `zs_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` varchar(100) NOT NULL,
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zs_category`
--

INSERT INTO `zs_category` (`id`, `name`, `title`, `pid`, `sort`, `url`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`) VALUES
(1, '1', 'test', 0, 0, '', 10, '', '', '', 'category', 'list', 'show', '', '4', '1', 0, 1, 1, 1, 0, '', '', 1433076947, 1433076947, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `zs_category_content`
--

CREATE TABLE IF NOT EXISTS `zs_category_content` (
  `id` int(10) NOT NULL,
  `content` text NOT NULL,
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zs_category_content`
--

INSERT INTO `zs_category_content` (`id`, `content`) VALUES
(1, '');

-- --------------------------------------------------------

--
-- 表的结构 `zs_config`
--

CREATE TABLE IF NOT EXISTS `zs_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `zs_config`
--

INSERT INTO `zs_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, 'XXXXXXXXXXX', 0),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, 'XXXXXXXXXX', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, 'XXXXXXXXXXXXXXX', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1403938397, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举\r\n5:图片', 0),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '', 9),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', 3),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 4),
(13, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1403938427, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:图片\r\n6:支付', 0),
(14, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(15, 'AUTH_CONFIG', 3, 'Auth配置', 4, 'AUTH_ON:1\r\nAUTH_TYPE:2', '自定义Auth.class.php类配置', 1379409310, 1404435039, 1, '1', 8),
(17, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 2),
(18, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1402646852, 1, '12', 10),
(19, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 3),
(20, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 3),
(21, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 5),
(22, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 7),
(23, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(24, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 10),
(25, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 11),
(26, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture\r\n11:index/clean\r\n12:index/index\r\n13:public/logout', 0),
(27, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(28, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 0),
(29, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(30, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '1', 1),
(31, 'IMG_WATER_ON', 4, '开启水印', 5, '1:不开启\r\n2:开启', '开启水印之后，所有上传的图片都会添加水印', 1403687525, 1403687751, 1, '1', 0),
(32, 'IMG_WATER', 5, '水印图片', 5, '', '水印图片', 1403687788, 1403687788, 1, '', 0),
(33, 'IMG_WATER_POSTION', 4, '水印位置', 5, '1:1\r\n2:2\r\n3:3\r\n4:4\r\n5:5\r\n6:6\r\n7:7\r\n8:8\r\n9:9', '九宫格打水印，相应数值代表水印位置', 1403687857, 1403687857, 1, '9', 0),
(34, 'PAY_PARTNER', 0, '支付pid', 6, '', '', 1403938158, 1403938448, 1, '', 0),
(35, 'PAY_KEY', 1, 'KEY', 6, '', '', 1403938172, 1403938457, 1, '', 0),
(36, 'PAY_SELLER_EMAIL', 1, '卖家支付宝账号', 6, '', '这里是卖家的支付宝账号，也就是你申请接口时注册的支付宝账号', 1403938200, 1403938466, 1, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `zs_document`
--

CREATE TABLE IF NOT EXISTS `zs_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `thumb` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '缩略图',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `gallery` varchar(100) NOT NULL COMMENT '图集',
  `relative` varchar(255) NOT NULL COMMENT '相关文章',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zs_document_article`
--

CREATE TABLE IF NOT EXISTS `zs_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- --------------------------------------------------------

--
-- 表的结构 `zs_document_download`
--

CREATE TABLE IF NOT EXISTS `zs_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- --------------------------------------------------------

--
-- 表的结构 `zs_document_product`
--

CREATE TABLE IF NOT EXISTS `zs_document_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zs_document_shop`
--

CREATE TABLE IF NOT EXISTS `zs_document_shop` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text NOT NULL COMMENT '内容',
  `mrsp` int(10) unsigned NOT NULL COMMENT '市场价',
  `price` int(10) unsigned NOT NULL COMMENT '价格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zs_file`
--

CREATE TABLE IF NOT EXISTS `zs_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zs_file`
--

INSERT INTO `zs_file` (`id`, `name`, `savename`, `savepath`, `ext`, `mime`, `size`, `md5`, `sha1`, `location`, `create_time`) VALUES
(1, 'aa.pdf', '53d6fe7eb74ca.pdf', '2014-07-29/', 'pdf', 'application/octet-stream', 9758, '2216c04b92386ecb79846ce0b9161af7', '019ec5aa3dccd94a9190335414ecc205d745aa6c', 0, 1406598782);

-- --------------------------------------------------------

--
-- 表的结构 `zs_flink`
--

CREATE TABLE IF NOT EXISTS `zs_flink` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `gid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` varchar(40) NOT NULL DEFAULT 'text',
  `title` varchar(60) NOT NULL DEFAULT '',
  `url` varchar(120) NOT NULL DEFAULT '',
  `logo` int(10) NOT NULL DEFAULT '0',
  `sort` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zs_flink_group`
--

CREATE TABLE IF NOT EXISTS `zs_flink_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT '',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zs_hooks`
--

CREATE TABLE IF NOT EXISTS `zs_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `zs_hooks`
--

INSERT INTO `zs_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, ''),
(2, 'pageFoonethinker', '页面foonethinker钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop'),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment'),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'Attachment,SocialComment'),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, ''),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment'),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor'),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin'),
(9, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo,DevTeam'),
(10, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor'),
(11, 'app_begin', '应用开始', 2, 1384481614, '');

-- --------------------------------------------------------

--
-- 表的结构 `zs_member`
--

CREATE TABLE IF NOT EXISTS `zs_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `name` char(16) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `address` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '默认收货地址',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '联系方式',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `zs_member`
--

INSERT INTO `zs_member` (`uid`, `nickname`, `name`, `address`, `sex`, `birthday`, `mobile`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`) VALUES
(1, 'admin', '', 0, 0, '0000-00-00', '', 40, 11, 0, 1432814216, 2130706433, 1433163426, 1),
(2, 'editor', '', 0, 0, '0000-00-00', '', 0, 1, 0, 1432814216, 0, 1432814216, 1),
(3, 'yqlxj', '', 0, 0, '0000-00-00', '', 20, 2, 2130706433, 1432815680, 2130706433, 1432997925, 1),
(4, 'woaideren', '', 0, 0, '0000-00-00', '18651902992', 0, 1, 2130706433, 1432998594, 2130706433, 1432998594, 0);

-- --------------------------------------------------------

--
-- 表的结构 `zs_menu`
--

CREATE TABLE IF NOT EXISTS `zs_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `module` varchar(20) NOT NULL DEFAULT 'Admin',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `ico` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=137 ;

--
-- 转存表中的数据 `zs_menu`
--

INSERT INTO `zs_menu` (`id`, `title`, `pid`, `module`, `sort`, `url`, `hide`, `tip`, `ico`) VALUES
(2, '内容管理', 0, 'Admin', 3, 'Article/mydocument', 0, '', 'fa-tasks'),
(3, '文档列表', 2, 'Admin', 2, 'article/mydocument', 0, '', ''),
(4, '新增', 3, 'Admin', 0, 'article/add', 1, '', ''),
(5, '编辑', 3, 'Admin', 0, 'article/edit', 1, '', ''),
(6, '改变状态', 3, 'Admin', 0, 'article/setStatus', 1, '', ''),
(7, '保存', 3, 'Admin', 0, 'article/update', 1, '', ''),
(8, '保存草稿', 3, 'Admin', 0, 'article/autoSave', 1, '', ''),
(9, '移动', 3, 'Admin', 0, 'article/move', 1, '', ''),
(10, '复制', 3, 'Admin', 0, 'article/copy', 1, '', ''),
(11, '粘贴', 3, 'Admin', 0, 'article/paste', 1, '', ''),
(12, '导入', 3, 'Admin', 0, 'article/batchOperate', 1, '', ''),
(13, '回收站', 2, 'Admin', 3, 'article/recycle', 0, '', ''),
(14, '还原', 13, 'Admin', 0, 'article/permit', 1, '', ''),
(15, '清空', 13, 'Admin', 0, 'article/clear', 1, '', ''),
(16, '用户管理', 0, 'Admin', 2, 'User/index', 0, '', 'fa-group'),
(17, '用户信息', 16, 'Admin', 0, 'User/index', 0, '', ''),
(18, '新增用户', 17, 'Admin', 0, 'User/add', 1, '添加新用户', ''),
(20, '新增用户行为', 19, 'Admin', 0, 'User/addaction', 1, '', ''),
(21, '编辑用户行为', 19, 'Admin', 0, 'User/editaction', 1, '', ''),
(22, '保存用户行为', 19, 'Admin', 0, 'User/saveAction', 1, '"用户->用户行为"保存编辑和新增的用户行为', ''),
(23, '变更行为状态', 19, 'Admin', 0, 'User/setStatus', 1, '"用户->用户行为"中的启用,禁用和删除权限', ''),
(24, '禁用会员', 19, 'Admin', 0, 'User/changeStatus?method=forbidUser', 1, '"用户->用户信息"中的禁用', ''),
(25, '启用会员', 19, 'Admin', 0, 'User/changeStatus?method=resumeUser', 1, '"用户->用户信息"中的启用', ''),
(26, '删除会员', 19, 'Admin', 0, 'User/changeStatus?method=deleteUser', 1, '"用户->用户信息"中的删除', ''),
(27, '权限管理', 16, 'Admin', 0, 'AuthManager/index', 0, '', ''),
(28, '删除', 27, 'Admin', 0, 'AuthManager/changeStatus?method=deleteGroup', 1, '删除用户组', ''),
(29, '禁用', 27, 'Admin', 0, 'AuthManager/changeStatus?method=forbidGroup', 1, '禁用用户组', ''),
(30, '恢复', 27, 'Admin', 0, 'AuthManager/changeStatus?method=resumeGroup', 1, '恢复已禁用的用户组', ''),
(31, '新增', 27, 'Admin', 0, 'AuthManager/createGroup', 1, '创建新的用户组', ''),
(32, '编辑', 27, 'Admin', 0, 'AuthManager/editGroup', 1, '编辑用户组名称和描述', ''),
(33, '保存用户组', 27, 'Admin', 0, 'AuthManager/writeGroup', 1, '新增和编辑用户组的"保存"按钮', ''),
(34, '授权', 27, 'Admin', 0, 'AuthManager/group', 1, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', ''),
(35, '访问授权', 27, 'Admin', 0, 'AuthManager/access', 1, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', ''),
(36, '成员授权', 27, 'Admin', 0, 'AuthManager/user', 1, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', ''),
(37, '解除授权', 27, 'Admin', 0, 'AuthManager/removeFromGroup', 1, '"成员授权"列表页内的解除授权操作按钮', ''),
(38, '保存成员授权', 27, 'Admin', 0, 'AuthManager/addToGroup', 1, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', ''),
(39, '分类授权', 27, 'Admin', 0, 'AuthManager/category', 1, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', ''),
(40, '保存分类授权', 27, 'Admin', 0, 'AuthManager/addToCategory', 1, '"分类授权"页面的"保存"按钮', ''),
(41, '模型授权', 27, 'Admin', 0, 'AuthManager/modelauth', 1, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', ''),
(42, '保存模型授权', 27, 'Admin', 0, 'AuthManager/addToModel', 1, '"分类授权"页面的"保存"按钮', ''),
(43, '扩展工具', 0, 'Admin', 5, 'Addons/index', 1, '', 'fa-cloud'),
(45, '创建', 44, 'Admin', 0, 'Addons/create', 1, '服务器上创建插件结构向导', ''),
(46, '检测创建', 44, 'Admin', 0, 'Addons/checkForm', 1, '检测插件是否可以创建', ''),
(47, '预览', 44, 'Admin', 0, 'Addons/preview', 1, '预览插件定义类文件', ''),
(48, '快速生成插件', 44, 'Admin', 0, 'Addons/build', 1, '开始生成插件结构', ''),
(49, '设置', 44, 'Admin', 0, 'Addons/config', 1, '设置插件配置', ''),
(50, '禁用', 44, 'Admin', 0, 'Addons/disable', 1, '禁用插件', ''),
(51, '启用', 44, 'Admin', 0, 'Addons/enable', 1, '启用插件', ''),
(52, '安装', 44, 'Admin', 0, 'Addons/install', 1, '安装插件', ''),
(53, '卸载', 44, 'Admin', 0, 'Addons/uninstall', 1, '卸载插件', ''),
(54, '更新配置', 44, 'Admin', 0, 'Addons/saveconfig', 1, '更新插件配置处理', ''),
(55, '插件后台列表', 44, 'Admin', 0, 'Addons/adminList', 1, '', ''),
(56, 'URL方式访问插件', 44, 'Admin', 0, 'Addons/execute', 1, '控制是否有权限通过url访问插件控制器方法', ''),
(134, '新增', 133, 'Admin', 0, 'Category/add', 0, '', ''),
(58, '模型管理', 122, 'Admin', 0, 'Model/index', 0, '', ''),
(59, '新增', 58, 'Admin', 0, 'model/add', 1, '', ''),
(60, '编辑', 58, 'Admin', 0, 'model/edit', 1, '', ''),
(61, '改变状态', 58, 'Admin', 0, 'model/setStatus', 1, '', ''),
(62, '保存数据', 58, 'Admin', 0, 'model/update', 1, '', ''),
(63, '属性管理', 122, 'Admin', 0, 'Attribute/index', 0, '网站属性配置。', ''),
(64, '新增', 63, 'Admin', 0, 'Attribute/add', 1, '', ''),
(65, '编辑', 63, 'Admin', 0, 'Attribute/edit', 1, '', ''),
(66, '改变状态', 63, 'Admin', 0, 'Attribute/setStatus', 1, '', ''),
(67, '保存数据', 63, 'Admin', 0, 'Attribute/update', 1, '', ''),
(68, '设置', 0, 'Admin', 3, 'Config/group', 0, '', 'fa-cog'),
(69, '网站设置', 68, 'Admin', 0, 'Config/group', 0, '', ''),
(71, '编辑', 70, 'Admin', 0, 'Config/edit', 1, '新增编辑和保存配置', ''),
(72, '删除', 70, 'Admin', 0, 'Config/del', 1, '删除配置', ''),
(73, '新增', 70, 'Admin', 0, 'Config/add', 1, '新增配置', ''),
(74, '保存', 70, 'Admin', 0, 'Config/save', 1, '保存配置', ''),
(75, '菜单管理', 122, 'Admin', 0, 'Menu/index', 0, '', ''),
(77, '新增', 76, 'Admin', 0, 'Channel/add', 0, '', ''),
(78, '编辑', 76, 'Admin', 0, 'Channel/edit', 0, '', ''),
(79, '删除', 76, 'Admin', 0, 'Channel/del', 0, '', ''),
(80, '栏目管理', 2, 'Admin', 1, 'Category/index', 0, '', ''),
(81, '编辑', 81, 'Admin', 0, 'Category/edit', 1, '编辑和保存栏目分类', ''),
(82, '新增', 80, 'Admin', 0, 'Category/add', 1, '新增栏目分类', ''),
(83, '删除', 80, 'Admin', 0, 'Category/remove', 1, '删除栏目分类', ''),
(84, '移动', 80, 'Admin', 0, 'Category/operate/type/move', 1, '移动栏目分类', ''),
(85, '合并', 80, 'Admin', 0, 'Category/operate/type/merge', 1, '合并栏目分类', ''),
(135, '编辑', 133, 'Admin', 1, 'Category/edit', 0, '', ''),
(87, '备份', 86, 'Admin', 0, 'Database/export', 1, '备份数据库', ''),
(88, '优化表', 86, 'Admin', 0, 'Database/optimize', 1, '优化数据表', ''),
(89, '修复表', 86, 'Admin', 0, 'Database/repair', 1, '修复数据表', ''),
(91, '恢复', 90, 'Admin', 0, 'Database/import', 1, '数据库恢复', ''),
(92, '删除', 90, 'Admin', 0, 'Database/del', 1, '删除备份文件', ''),
(96, '新增', 75, 'Admin', 0, 'Menu/add', 1, '', ''),
(98, '编辑', 75, 'Admin', 0, 'Menu/edit', 1, '', ''),
(104, '下载管理', 102, 'Admin', 0, 'Think/lists?model=download', 0, '', ''),
(105, '配置管理', 102, 'Admin', 0, 'Think/lists?model=config', 0, '', ''),
(106, '行为日志', 16, 'Admin', 0, 'Action/actionlog', 0, '', ''),
(108, '修改密码', 68, 'Admin', 0, 'User/updatePassword', 0, '', ''),
(109, '修改昵称', 68, 'Admin', 0, 'User/updateNickname', 0, '', ''),
(110, '查看行为日志', 106, 'Admin', 0, 'action/edit', 1, '', ''),
(112, '新增数据', 58, 'Admin', 0, 'think/add', 1, '', ''),
(113, '编辑数据', 58, 'Admin', 0, 'think/edit', 1, '', ''),
(114, '导入', 75, 'Admin', 0, 'Menu/import', 1, '', ''),
(115, '生成', 58, 'Admin', 0, 'Model/generate', 1, '', ''),
(116, '新增钩子', 57, 'Admin', 0, 'Addons/addHook', 1, '', ''),
(117, '编辑钩子', 57, 'Admin', 0, 'Addons/edithook', 1, '', ''),
(118, '文档排序', 3, 'Admin', 0, 'Article/sort', 1, '', ''),
(119, '排序', 70, 'Admin', 0, 'Config/sort', 1, '', ''),
(120, '排序', 75, 'Admin', 0, 'Menu/sort', 1, '', ''),
(121, '排序', 76, 'Admin', 0, 'Channel/sort', 0, '', ''),
(122, '开发者选项', 0, 'Admin', 6, 'Index/dev', 0, '', 'fa-apple'),
(123, '订单管理', 0, 'Shop', 1, 'index', 0, '', 'fa-shopping-cart'),
(124, '订单管理', 123, 'Shop', 0, 'ShopOrders/index', 0, '', ''),
(136, '删除', 133, 'Admin', 2, 'Category/remove', 0, '', ''),
(128, '友情链接', 43, 'Admin', 0, 'Flink/index', 0, '', ''),
(129, '链接管理', 128, 'Admin', 0, 'Flink/index', 0, '', ''),
(130, '分类管理', 128, 'Admin', 0, 'Flink/type', 0, '', ''),
(131, '添加友情链接', 128, 'Admin', 0, 'Flink/add', 1, '', ''),
(132, '留言管理', 43, 'Admin', 0, 'Message/index', 0, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `zs_message`
--

CREATE TABLE IF NOT EXISTS `zs_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `name` tinytext NOT NULL,
  `listorder` int(6) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `ip` varchar(100) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(100) NOT NULL DEFAULT '0',
  `reply` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `reply` (`reply`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zs_message_reply`
--

CREATE TABLE IF NOT EXISTS `zs_message_reply` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` bigint(20) unsigned NOT NULL,
  `rname` tinytext NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `msg_id` (`msg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zs_model`
--

CREATE TABLE IF NOT EXISTS `zs_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  `issystem` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `zs_model`
--

INSERT INTO `zs_model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`, `issystem`) VALUES
(1, 'document', '基础文档', 0, '', 1, '{"1":["2","3","5","9","10","11","12","13","14","16","17","19","20"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', 0, '', '', 1383891233, 1402277461, 1, 'MyISAM', 1),
(2, 'article', '文章', 1, '', 1, '{"1":["3","5","24","67","13"],"2":["9","19","10","12","16","17","26","20","14","11","25"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', 0, '', '', 1383891243, 1406079236, 1, 'MyISAM', 1),
(3, 'download', '下载', 1, '', 1, '{"1":["3","28","30","32","2","5","31"],"2":["13","10","27","9","12","16","17","19","11","20","14","29"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', 0, '', '', 1383891252, 1387260449, 1, 'MyISAM', 1),
(4, 'shop', '商品', 1, '', 1, '{"1":["3","71","72","12","5","70","13","67"],"2":["10","11","16","19","17","14","20"]}', '1:基础;2:扩展', '', '', '', '', '1:id\r\n2:title', 10, '', '', 1406164737, 1406165411, 1, 'MyISAM', 0),
(5, 'product', '产品', 1, '', 1, '{"1":["3","12","5","68","11","13","67"],"2":["10","14","16","17","20"]}', '1:基础;2:扩展', '', '', '', '', '1:id\r\n2:title', 10, '', '', 1406599932, 1406600298, 1, 'MyISAM', 0);

-- --------------------------------------------------------

--
-- 表的结构 `zs_picture`
--

CREATE TABLE IF NOT EXISTS `zs_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `zs_picture`
--

INSERT INTO `zs_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, '/Uploads/Picture/2014-07-23/53cf8680dac93.jpg', '', 'f059fb849b9e5b52a835bc4ddd4eefd7', 'dc0c0f033540ec727a05cca1f74aa18b968ce3fe', 1, 1406109312),
(2, '/Uploads/Picture/2014-07-23/53cf86811779e.jpg', '', 'cf4f86f004d08703ffb9f36229bf030d', '091026daa1f1585367b84351ca012dc1ab9b8f34', 1, 1406109313),
(3, '/Uploads/Picture/2014-07-23/53cf86813f45f.jpg', '', '04e8254e51ac7ac909e84c98aff5ea11', 'e9bc5e0b346c25e5bc5fddb26b9d89153dc62b26', 1, 1406109313),
(4, '/Uploads/Picture/2014-07-29/53d70498b185e.gif', '', 'c348d76511e5a0b20591a90b444cc051', 'da143aa6e438e2fcf1cc82938109d3c11738292f', 1, 1406600344),
(5, '/Uploads/Picture/2014-07-29/53d704a4e3410.gif', '', '37239c2b1ba2831f3b13f36628e80557', '75dc0150edef877869a164e63bd8805daf7051d2', 1, 1406600356),
(6, '/Uploads/Picture/2014-07-29/53d704a505d1d.gif', '', 'f1fd4bf431931c17583bddad2643d719', '484c6f9d45d5c42e3136c1775deec76c5f04c06a', 1, 1406600356),
(7, '/Uploads/Picture/2014-07-29/53d704a51c09b.gif', '', '619382435048a8e7fd7711382b6d4226', '2050ea55da96242ebb82615d01cc2dddea88e877', 1, 1406600357),
(8, '/Uploads/Picture/2015-05-31/556b06ccbff0b.png', '', '894e8e22a139e3f9175b6acace62d9c9', 'bac41a6eb08f017b3712996535cda9bd957019ba', 1, 1433077452);

-- --------------------------------------------------------

--
-- 表的结构 `zs_shop_orders`
--

CREATE TABLE IF NOT EXISTS `zs_shop_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` varchar(80) NOT NULL,
  `uid` int(10) NOT NULL,
  `product` varchar(225) DEFAULT NULL,
  `shipping` varchar(60) NOT NULL DEFAULT '0',
  `address` varchar(225) DEFAULT NULL,
  `mrsp` float(13,2) NOT NULL DEFAULT '0.00',
  `price` float(13,2) NOT NULL DEFAULT '0.00',
  `tonethinkal` float(13,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '',
  `content` varchar(225) DEFAULT NULL,
  `create_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`),
  KEY `uid` (`uid`),
  KEY `id` (`oid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zs_shop_orders`
--

INSERT INTO `zs_shop_orders` (`id`, `oid`, `uid`, `product`, `shipping`, `address`, `mrsp`, `price`, `tonethinkal`, `status`, `ip`, `content`, `create_time`) VALUES
(1, 'E1C91107003', 3, '', '0', NULL, 0.00, 0.00, 0.00, 1, '127.0.0.1', '', 1432816487);

-- --------------------------------------------------------

--
-- 表的结构 `zs_shop_product`
--

CREATE TABLE IF NOT EXISTS `zs_shop_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(15) unsigned NOT NULL,
  `pname` char(20) NOT NULL,
  `price` float NOT NULL,
  `mrsp` float NOT NULL,
  `pinfo` char(15) NOT NULL COMMENT 'room infomation(number,floor)',
  `status` int(2) NOT NULL,
  `update_time` int(10) NOT NULL,
  `reserve_time` int(10) NOT NULL COMMENT '订购到期时间',
  `type` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zs_shop_product`
--

INSERT INTO `zs_shop_product` (`id`, `pid`, `pname`, `price`, `mrsp`, `pinfo`, `status`, `update_time`, `reserve_time`, `type`) VALUES
(1, 0, '', 0, 0, '', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `zs_shop_shipping`
--

CREATE TABLE IF NOT EXISTS `zs_shop_shipping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL,
  `price` float(13,2) NOT NULL DEFAULT '0.00',
  `des` char(255) DEFAULT NULL,
  `orders` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `orders` (`orders`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zs_ucenter_admin`
--

CREATE TABLE IF NOT EXISTS `zs_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zs_ucenter_app`
--

CREATE TABLE IF NOT EXISTS `zs_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zs_ucenter_member`
--

CREATE TABLE IF NOT EXISTS `zs_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `zs_ucenter_member`
--

INSERT INTO `zs_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'admin', '32cf29689cc8481c5456fb2cd1ca97d6', 'yqlxj@vip.qq.com', '', 1432814216, 2130706433, 1433163426, 2130706433, 1432814216, 1),
(2, 'editor', 'ab15c5d83fb1bb8934b3a5fdace9f6e8', 'editor@qq.com', '', 1432814216, 2130706433, 0, 0, 1432814216, 1),
(3, 'yqlxj', '32cf29689cc8481c5456fb2cd1ca97d6', 'yqlxj1@vip.qq.com', '', 1432815091, 2130706433, 1432997925, 2130706433, 1432815091, 1),
(4, 'woaideren', '1fafa7aa4316804850a4f3ecef631052', 'yqlxj12@qq.com', '18651902992', 1432997093, 2130706433, 1432999023, 2130706433, 1432997093, 1);

-- --------------------------------------------------------

--
-- 表的结构 `zs_ucenter_setting`
--

CREATE TABLE IF NOT EXISTS `zs_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `zs_url`
--

CREATE TABLE IF NOT EXISTS `zs_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `cid` int(11) unsigned NOT NULL COMMENT '栏目id',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='链接表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `zs_url`
--

INSERT INTO `zs_url` (`id`, `cid`, `url`, `short`, `status`, `create_time`) VALUES
(1, 1, '/thinkphp-zcms/Home/Article/lists/cid/1', '1', 1, 1433076947);

-- --------------------------------------------------------

--
-- 表的结构 `zs_userdata`
--

CREATE TABLE IF NOT EXISTS `zs_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
