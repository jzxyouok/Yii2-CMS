/*
MySQL Backup
Source Server Version: 5.5.46
Source Database: yii2-cms
Date: 2016/5/20 12:16:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `sys_article`
-- ----------------------------
DROP TABLE IF EXISTS `sys_article`;
CREATE TABLE `sys_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `sub_title` varchar(100) DEFAULT NULL,
  `author` varchar(32) NOT NULL,
  `source` varchar(128) DEFAULT NULL,
  `category_id` mediumint(8) unsigned NOT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  `image` varchar(128) NOT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `hits` mediumint(8) unsigned DEFAULT '100',
  `sort` mediumint(8) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文章管理';

-- ----------------------------
--  Table structure for `sys_auth_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_assignment`;
CREATE TABLE `sys_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `sys_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `sys_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_item`;
CREATE TABLE `sys_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `sys_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `sys_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_auth_item_child`
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_item_child`;
CREATE TABLE `sys_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `sys_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `sys_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `sys_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_rule`;
CREATE TABLE `sys_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_carousel`
-- ----------------------------
DROP TABLE IF EXISTS `sys_carousel`;
CREATE TABLE `sys_carousel` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort` tinyint(1) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='首页轮播图表';

-- ----------------------------
--  Table structure for `sys_category`
-- ----------------------------
DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `sort` smallint(5) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  `updated_at` int(10) unsigned NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='资讯分类表';

-- ----------------------------
--  Table structure for `sys_links`
-- ----------------------------
DROP TABLE IF EXISTS `sys_links`;
CREATE TABLE `sys_links` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort` tinyint(1) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='友情链接表';

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `sys_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
--  Table structure for `sys_migration`
-- ----------------------------
DROP TABLE IF EXISTS `sys_migration`;
CREATE TABLE `sys_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `sys_operated_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_operated_log`;
CREATE TABLE `sys_operated_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `route` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `created_at` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_setting`
-- ----------------------------
DROP TABLE IF EXISTS `sys_setting`;
CREATE TABLE `sys_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `store_range` varchar(255) DEFAULT NULL,
  `store_dir` varchar(255) DEFAULT NULL,
  `value` text,
  `sort_order` int(11) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `code` (`code`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=3116 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) NOT NULL COMMENT '自动登录key',
  `password_hash` varchar(255) NOT NULL COMMENT '加密密码',
  `password_reset_token` varchar(255) DEFAULT NULL COMMENT '重置密码token',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `role` smallint(6) NOT NULL DEFAULT '10' COMMENT '角色等级',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '状态',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `sys_article` VALUES ('1','test','test','king','百度','5','1453098814','Uploads/images/2016118/secondarytile.png','testtesttesttesttest','<p>testtesttesttest</p>','100','1000','1'), ('2','yii2-cms','yii2','King','原创','8','1463047328','/upload/images/2016/05/12/a3ef7cb6138c3a0943448fd7778f1cb66c42bf60.jpg','yii2-cms','<p><img src=\"/upload/images/2016/05/13/8c8566b78a-qq20160513140359.png\" alt=\"8c8566b78a-qq20160513140359\"></p><p>yii2-cms</p><p>yii2-cms<span class=\"redactor-invisible-space\"><br></span></p><p><span class=\"redactor-invisible-space\">yii2-cms<span class=\"redactor-invisible-space\"><br><br><br></span></span></p>','100','999','1');
INSERT INTO `sys_auth_assignment` VALUES ('Super Admin','1','1462775378'), ('Web Editor','2','1463535115'), ('网站编辑','2','1463535077'), ('超级管理员','1','1462775371');
INSERT INTO `sys_auth_item` VALUES ('/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/article/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/article/create','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/article/delete','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/article/index','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/article/s-upload','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/article/update','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/article/view','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/carousel/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/carousel/create','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/carousel/delete','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/carousel/index','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/carousel/s-upload','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/carousel/update','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/carousel/view','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/category/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/category/create','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/category/delete','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/category/index','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/category/update','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/category/view','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/debug/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/debug/default/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/debug/default/db-explain','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/debug/default/download-mail','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/debug/default/index','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/debug/default/toolbar','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/debug/default/view','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/gii/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/gii/default/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/gii/default/action','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/gii/default/diff','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/gii/default/index','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/gii/default/preview','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/gii/default/view','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/links/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/links/create','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/links/delete','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/links/index','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/links/s-upload','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/links/update','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/links/view','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/assignment/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/assignment/assign','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/assignment/index','2',NULL,NULL,NULL,'1463387979','1463387979'), ('/rbac/assignment/revoke','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/assignment/view','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/default/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/default/index','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/menu/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/menu/create','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/menu/delete','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/menu/index','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/menu/update','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/menu/view','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/permission/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/permission/assign','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/permission/create','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/permission/delete','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/permission/index','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/permission/remove','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/permission/update','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/permission/view','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/role/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/role/assign','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/role/create','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/role/delete','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/role/index','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/role/remove','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/role/update','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/role/view','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/route/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/route/assign','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/route/create','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/route/index','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/route/refresh','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/route/remove','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/rule/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/rule/create','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/rule/delete','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/rule/index','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/rule/update','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/rule/view','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/user/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/user/activate','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/user/change-password','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/user/delete','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/user/index','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/user/login','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/user/logout','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/user/request-password-reset','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/user/reset-password','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/user/signup','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/rbac/user/view','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/redactor/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/setting/*','2',NULL,NULL,NULL,'1463649441','1463649441'), ('/setting/default/*','2',NULL,NULL,NULL,'1463649441','1463649441'), ('/setting/default/index','2',NULL,NULL,NULL,'1463649441','1463649441'), ('/site/*','2',NULL,NULL,NULL,'1463387980','1463387980');
INSERT INTO `sys_auth_item` VALUES ('/site/error','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/site/index','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/site/login','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/site/logout','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/user/*','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/user/create','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/user/delete','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/user/index','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/user/update','2',NULL,NULL,NULL,'1463387980','1463387980'), ('/user/view','2',NULL,NULL,NULL,'1463387980','1463387980'), ('Super Admin','2','超级管理员',NULL,NULL,'1462775228','1462776398'), ('Web Editor','2','网站编辑',NULL,NULL,'1462776295','1462776426'), ('网站编辑','1','网站编辑',NULL,NULL,'1462776553','1462776553'), ('超级管理员','1','超级管理员',NULL,NULL,'1462775335','1462776448');
INSERT INTO `sys_auth_item_child` VALUES ('Super Admin','/*'), ('Super Admin','/article/*'), ('Web Editor','/article/*'), ('Super Admin','/article/create'), ('Web Editor','/article/create'), ('Super Admin','/article/delete'), ('Web Editor','/article/delete'), ('Super Admin','/article/index'), ('Web Editor','/article/index'), ('Super Admin','/article/s-upload'), ('Web Editor','/article/s-upload'), ('Super Admin','/article/update'), ('Web Editor','/article/update'), ('Super Admin','/article/view'), ('Web Editor','/article/view'), ('Super Admin','/carousel/*'), ('Super Admin','/carousel/create'), ('Super Admin','/carousel/delete'), ('Super Admin','/carousel/index'), ('Super Admin','/carousel/s-upload'), ('Super Admin','/carousel/update'), ('Super Admin','/carousel/view'), ('Super Admin','/category/*'), ('Web Editor','/category/*'), ('Super Admin','/category/create'), ('Web Editor','/category/create'), ('Super Admin','/category/delete'), ('Web Editor','/category/delete'), ('Super Admin','/category/index'), ('Web Editor','/category/index'), ('Super Admin','/category/update'), ('Web Editor','/category/update'), ('Super Admin','/category/view'), ('Web Editor','/category/view'), ('Super Admin','/debug/*'), ('Super Admin','/debug/default/*'), ('Super Admin','/debug/default/db-explain'), ('Super Admin','/debug/default/download-mail'), ('Super Admin','/debug/default/index'), ('Super Admin','/debug/default/toolbar'), ('Super Admin','/debug/default/view'), ('Super Admin','/gii/*'), ('Super Admin','/gii/default/*'), ('Super Admin','/gii/default/action'), ('Super Admin','/gii/default/diff'), ('Super Admin','/gii/default/index'), ('Super Admin','/gii/default/preview'), ('Super Admin','/gii/default/view'), ('Super Admin','/links/*'), ('Super Admin','/links/create'), ('Super Admin','/links/delete'), ('Super Admin','/links/index'), ('Super Admin','/links/s-upload'), ('Super Admin','/links/update'), ('Super Admin','/links/view'), ('Super Admin','/rbac/*'), ('Super Admin','/rbac/assignment/*'), ('Super Admin','/rbac/assignment/assign'), ('Super Admin','/rbac/assignment/index'), ('Super Admin','/rbac/assignment/revoke'), ('Super Admin','/rbac/assignment/view'), ('Super Admin','/rbac/default/*'), ('Super Admin','/rbac/default/index'), ('Super Admin','/rbac/menu/*'), ('Super Admin','/rbac/menu/create'), ('Super Admin','/rbac/menu/delete'), ('Super Admin','/rbac/menu/index'), ('Super Admin','/rbac/menu/update'), ('Super Admin','/rbac/menu/view'), ('Super Admin','/rbac/permission/*'), ('Super Admin','/rbac/permission/assign'), ('Super Admin','/rbac/permission/create'), ('Super Admin','/rbac/permission/delete'), ('Super Admin','/rbac/permission/index'), ('Super Admin','/rbac/permission/remove'), ('Super Admin','/rbac/permission/update'), ('Super Admin','/rbac/permission/view'), ('Super Admin','/rbac/role/*'), ('Super Admin','/rbac/role/assign'), ('Super Admin','/rbac/role/create'), ('Super Admin','/rbac/role/delete'), ('Super Admin','/rbac/role/index'), ('Super Admin','/rbac/role/remove'), ('Super Admin','/rbac/role/update'), ('Super Admin','/rbac/role/view'), ('Super Admin','/rbac/route/*'), ('Super Admin','/rbac/route/assign'), ('Super Admin','/rbac/route/create'), ('Super Admin','/rbac/route/index'), ('Super Admin','/rbac/route/refresh'), ('Super Admin','/rbac/route/remove'), ('Super Admin','/rbac/rule/*'), ('Super Admin','/rbac/rule/create'), ('Super Admin','/rbac/rule/delete'), ('Super Admin','/rbac/rule/index'), ('Super Admin','/rbac/rule/update'), ('Super Admin','/rbac/rule/view'), ('Super Admin','/rbac/user/*'), ('Super Admin','/rbac/user/activate'), ('Super Admin','/rbac/user/change-password');
INSERT INTO `sys_auth_item_child` VALUES ('Super Admin','/rbac/user/delete'), ('Super Admin','/rbac/user/index'), ('Super Admin','/rbac/user/login'), ('Super Admin','/rbac/user/logout'), ('Super Admin','/rbac/user/request-password-reset'), ('Super Admin','/rbac/user/reset-password'), ('Super Admin','/rbac/user/signup'), ('Super Admin','/rbac/user/view'), ('Super Admin','/redactor/*'), ('Web Editor','/redactor/*'), ('Super Admin','/site/*'), ('Web Editor','/site/*'), ('Super Admin','/site/error'), ('Web Editor','/site/error'), ('Super Admin','/site/index'), ('Web Editor','/site/index'), ('Super Admin','/site/login'), ('Web Editor','/site/login'), ('Super Admin','/site/logout'), ('Web Editor','/site/logout'), ('Super Admin','/user/*'), ('Super Admin','/user/create'), ('Super Admin','/user/delete'), ('Super Admin','/user/index'), ('Super Admin','/user/update'), ('Super Admin','/user/view'), ('超级管理员','Super Admin'), ('Super Admin','Web Editor'), ('网站编辑','Web Editor');
INSERT INTO `sys_carousel` VALUES ('1','百度','/upload/images/2016/05/13/05f7eafe0e709951fc008b6c0119a20585bbfe55.png','https://www.baidu.com/','100','1','1463129926'), ('2','test','/upload/images/2016/05/16/772bbd6e4fa883e851a85bdd6452f60c5639f796.jpg','http://baidu.com','100','0','1463378375');
INSERT INTO `sys_category` VALUES ('1','装修主材','0','100','1','1458719431','1458719431',NULL), ('2','aa','1','100','1','1458719432','1458719432',NULL), ('3','bb','1','100','1','1458719432','1458719432',NULL), ('4','家具软装','0','100','1','1458719432','1458719432',NULL), ('5','cc','4','100','1','1458719432','1458719432',NULL), ('7','ee','2','100','0','1458719432','1458719432',''), ('8','PHP','0','100','0','1463020523','1463020523','');
INSERT INTO `sys_links` VALUES ('1','百度','/upload/images/2016/05/13/05f7eafe0e709951fc008b6c0119a20585bbfe55.png','https://www.baidu.com/','100','1','1463129926');
INSERT INTO `sys_menu` VALUES ('1','权限管理',NULL,NULL,'2','{\"icon\": \"fa fa-key\"}'), ('2','权限控制','1',NULL,'1','{\"icon\": \"fa fa-lock\"}'), ('3','菜单','2','/rbac/menu/index',NULL,NULL), ('4','路由','2','/rbac/route/index',NULL,NULL), ('5','权限','2','/rbac/permission/index',NULL,NULL), ('6','角色','2','/rbac/role/index',NULL,NULL), ('7','分配','2','/rbac/assignment/index',NULL,NULL), ('8','后台用户管理','1','/user/index','2','{\"icon\": \"fa fa-user\"}'), ('9','Gii','10','/gii/default/index',NULL,NULL), ('10','系统管理',NULL,NULL,'1','{\"icon\": \"fa fa-cog\"}'), ('11','Debug','10','/debug/default/index',NULL,NULL), ('12','资讯管理',NULL,NULL,'3','{\"icon\":\"fa fa-file-text\"}'), ('13','分类管理','12','/category/index','1',NULL), ('14','文章管理','12','/article/index','2',NULL), ('15','广告管理',NULL,NULL,'999','{\"icon\":\"fa fa-coffee\"}'), ('16','友情链接管理','15','/links/index','1',NULL), ('17','轮播图管理','15','/carousel/index','1',NULL), ('18','系统设置','10','/setting/default/index','1',NULL);
INSERT INTO `sys_migration` VALUES ('m000000_000000_base','1463649196'), ('m141208_201488_setting_init','1463649204');
INSERT INTO `sys_setting` VALUES ('11','0','info','group','','','','50'), ('21','0','basic','group','','','','50'), ('31','0','smtp','group','','','','50'), ('1111','11','siteName','text','','','Yii2-cms','50'), ('1112','11','siteTitle','text','','','Your Site Title','50'), ('1113','11','siteKeyword','text','','','Your Site Keyword','50'), ('2111','21','timezone','select','-12,-11,-10,-9,-8,-7,-6,-5,-4,-3.5,-3,-2,-1,0,1,2,3,3.5,4,4.5,5,5.5,5.75,6,6.5,7,8,9,9.5,10,11,12','','8','50'), ('2112','21','commentCheck','select','0,1','','1','50'), ('3111','31','smtpHost','text','','','localhost','50'), ('3112','31','smtpPort','text','','','','50'), ('3113','31','smtpUser','text','','','admin','50'), ('3114','31','smtpPassword','password','','','123456','50'), ('3115','31','smtpMail','text','','','','50');
INSERT INTO `sys_user` VALUES ('1','admin','kKwZNhb2z5m2tOrvY_sXuIcXYBRA3sF-','$2y$13$SbYdoRzGv0n4ZQlVzTeinOAidoJCSrImMfi1c0IHlJPskMvTak9Im',NULL,'986083741@qq.com','10','10','1462528580','1462528580'), ('2','King','akXsABuanlBMwZO_o4Mr34I5AGKWWZ6u','$2y$13$Wu5Vj2IMj1ldN1iF.P7y9OxiZvwLzU4n816p9o0S1W10SA7YMliVe',NULL,'123456@qq.com','10','10','1462764253','1462764253'), ('3','test','7J62L8vlkets7V-aJBkxyKNgSnkzKvWf','$2y$13$gnGvBgYiA/EUsxpZhCeDdupQhpdfYqJuROT1OfLtnd16B50NBi0cC',NULL,'test@qq.com','10','0','1463389863','1463475741'), ('4','demo','_pHrDKLbrShpiT6xjn3-jAY975au3lj9','$2y$13$524UIJyhcDF6Q.vknxlLL.5vFQTYBJmrRKDuEd2STodowWL1p7.8m',NULL,'demo@qq.com','10','10','1463478607','1463478607');
