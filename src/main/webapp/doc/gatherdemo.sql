/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : 127.0.0.1:3306
Source Database       : gatherdemo

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-05-29 10:56:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app_files
-- ----------------------------
DROP TABLE IF EXISTS `app_files`;
CREATE TABLE `app_files` (
  `id` varchar(40) COLLATE utf8_bin NOT NULL,
  `name` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `length` double DEFAULT NULL,
  `content_type` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `ext_name` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `path` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of app_files
-- ----------------------------
INSERT INTO `app_files` VALUES ('69819145-0d4f-11e6-8e3a-f0761c357cc1', '3e27a1bc0e5656091382eb380a9c0394.jpg', '350304', 'image/jpeg', '3e27a1bc0e5656091382eb380a9c0394.jpg', 'uploadfile//20160428', '0');
INSERT INTO `app_files` VALUES ('91557287-0e7a-11e6-8e3a-f0761c357cc1', 'logo.jpg', '42676', 'image/jpeg', 'logo.jpg', 'uploadfile//20160430', '0');

-- ----------------------------
-- Table structure for s_log
-- ----------------------------
DROP TABLE IF EXISTS `s_log`;
CREATE TABLE `s_log` (
  `id` varchar(40) COLLATE utf8_bin NOT NULL,
  `username` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `handle` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `method` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `parameter` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `ip` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of s_log
-- ----------------------------
INSERT INTO `s_log` VALUES ('059e8a77b11749a28668732e5dd7c5df', 'admin', '2016-05-27 01:25:54', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@397a259a)][参数2，类型:String，值:(getBytes:[B@23abef1)][参数3，类型:String，值:(getBytes:[B@5ecdc15b)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('0c5bd79de40d47a0a8da69a77dc4e53d', 'admin', '2016-05-27 09:47:15', '删除操作', 'Result com.modules.sys.svc.LogSVC.deltLog(String)', 'deltLog', 'deltLog[参数1，类型:String，值:(getBytes:[B@2226566f)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('0cf898b6b1d94a72ad46dd83984295cf', 'admin', '2016-05-27 11:00:15', '退出系统', null, null, null, '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('0d8f85fa59dc4313985f5c42fd533aed', 'admin', '2016-05-27 10:20:03', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getIcon:null)(getPhoneNum:null)(getNickName:超级管理员)(getIfSpeak:0)(getEmail:admin@abc.com)(getSex:0)(getLoginorg:null)(getSession:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('10282883fdbf4c94882610c50e9f3143', 'admin', '2016-05-27 01:25:56', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@25cb80b4)][参数2，类型:String，值:(getBytes:[B@536ebcce)][参数3，类型:String，值:(getBytes:[B@b2da32d)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('11a806a47af0425c932c59e4ddf4245a', 'admin', '2016-05-28 23:24:21', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getSex:0)(getEmail:admin@abc.com)(getLoginorg:null)(getPhoneNum:null)(getIfSpeak:0)(getNickName:超级管理员)(getIcon:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('1243dcea3c1f469fb278dcfba9028a3d', 'admin', '2016-05-28 22:56:59', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getSession:null)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)(getIfSpeak:0)(getPhoneNum:null)(getNickName:超级管理员)(getIcon:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('139b9381ac8743b2b9f48d5e5f37b47f', 'admin', '2016-05-27 01:25:58', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@24eacb66)][参数2，类型:String，值:(getBytes:[B@32cfa879)][参数3，类型:String，值:(getBytes:[B@5f3db9fe)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('13de5af1f43f4fb19f11666370752e4f', 'admin', '2016-05-27 01:25:51', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@403d9a08)][参数2，类型:String，值:(getBytes:[B@c4ba42b)][参数3，类型:String，值:(getBytes:[B@3a07095b)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('1464483cd07642c28e6a02829e003205', 'admin', '2016-05-26 16:02:57', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getIcon:null)(getLoginorg:null)(getSex:0)(getEmail:admin@abc.com)(getNickName:超级管理员)(getPhoneNum:null)(getIfSpeak:0)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('1693e638356b44aa8ab30303041705b0', 'admin', '2016-05-28 22:52:36', '新增操作', 'Result com.modules.sys.svc.RoleSVC.saveRole(Role)', 'saveRole', 'saveRole[参数1，类型:Role，值:(getId:05d0d787-24e4-11e6-837d-f0761c357cc1)(getRolename:233)(getSerialversionuid:1)(getRoleno:233)(getRoleremark:2333)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('17e0c23f6eab4d1d81a6da009bc3d15c', 'admin', '2016-05-26 01:11:00', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@6d133151)][参数2，类型:String，值:(getBytes:[B@604cbbbb)][参数3，类型:String，值:(getBytes:[B@4db92361)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('17fe4719d69d467b8de90b6691c6982f', 'admin', '2016-05-27 01:24:45', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@488c437)][参数2，类型:String，值:(getBytes:[B@23f466df)][参数3，类型:String，值:(getBytes:[B@2b8817f5)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('1918862d7e1047da89a357a4f6f4529d', 'admin', '2016-05-27 09:43:23', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getSex:0)(getEmail:admin@abc.com)(getLoginorg:null)(getIfSpeak:0)(getNickName:超级管理员)(getPhoneNum:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getIcon:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('1ab6b85607954c289d8a8728e7422feb', 'admin', '2016-05-27 22:21:40', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getNickName:超级管理员)(getIfSpeak:0)(getPhoneNum:null)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)(getSession:null)(getIcon:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('217d21c7f7b84763b76025d112d6d05d', 'admin', '2016-05-25 01:10:57', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@4cfdcbe)][参数2，类型:String，值:(getBytes:[B@727e432)][参数3，类型:String，值:(getBytes:[B@4bf69249)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('21cd1b0be883404fb648df57f01c5254', 'admin', '2016-05-28 21:23:17', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getIfSpeak:0)(getNickName:超级管理员)(getPhoneNum:null)(getSession:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getLoginorg:null)(getSex:0)(getEmail:admin@abc.com)(getIcon:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('22be01a4870f48bc872012b7e91e20eb', 'admin', '2016-05-27 22:16:29', '删除操作', 'Result com.modules.sys.svc.LogSVC.deltLog(String)', 'deltLog', 'deltLog[参数1，类型:String，值:(getBytes:[B@58f2eef9)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('2605bb45f5b84fafac1201d15fa0843d', 'admin', '2016-05-27 01:10:39', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@7b3a85a7)][参数2，类型:String，值:(getBytes:[B@3f1cd625)][参数3，类型:String，值:(getBytes:[B@4de536df)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('2cc0f038700d4c3d840850ac10dfda9e', 'admin', '2016-05-28 23:01:22', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getPhoneNum:null)(getIfSpeak:0)(getNickName:超级管理员)(getIcon:null)(getSex:0)(getEmail:admin@abc.com)(getLoginorg:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('2fccbe1c69db46849fcc2be85ac18d21', '小四', '2016-05-27 00:53:13', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@332a3b24)][参数2，类型:String，值:(getBytes:[B@1990d2ba)][参数3，类型:String，值:(getBytes:[B@72fabe72)]', '192.168.0.101');
INSERT INTO `s_log` VALUES ('3d25e4e510a9467bbe5635ebe483fc7d', 'admin', '2016-05-26 10:42:43', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getIcon:null)(getSession:null)(getPhoneNum:null)(getNickName:超级管理员)(getIfSpeak:0)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('3e560880a570490f9facb77691f5100f', 'admin', '2016-05-27 01:24:42', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@18f06a07)][参数2，类型:String，值:(getBytes:[B@77b3145)][参数3，类型:String，值:(getBytes:[B@28dfacd9)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('3f1cf0c0629046a4863cbc3d5923419e', 'admin', '2016-05-27 15:42:11', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getNickName:超级管理员)(getPhoneNum:null)(getIfSpeak:0)(getIcon:null)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('4018beee344240d5ab02a35e67d03252', 'admin', '2016-05-27 01:24:26', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getIcon:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)(getIfSpeak:0)(getNickName:超级管理员)(getPhoneNum:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('4051316054cf4ab68f302442cc042e10', 'admin', '2016-05-28 22:48:48', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getSession:null)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)(getIfSpeak:0)(getPhoneNum:null)(getNickName:超级管理员)(getIcon:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('40ac19754ea041d1b610b629ab104b01', 'admin', '2016-05-28 22:15:08', '新增操作', 'Result com.modules.sys.svc.RoleSVC.saveRole(Role)', 'saveRole', 'saveRole[参数1，类型:Role，值:(getId:ca3e2959-24de-11e6-837d-f0761c357cc1)(getRolename:444555)(getSerialversionuid:1)(getRoleno:2333)(getRoleremark:66767676)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('4567685a8db54dddb9b00918040e3336', 'admin', '2016-05-27 11:57:19', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getIcon:null)(getSession:null)(getPhoneNum:null)(getNickName:超级管理员)(getIfSpeak:0)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('49de37e2c8264396aac461405c86c9c9', 'admin', '2016-05-28 21:11:35', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getEmail:admin@abc.com)(getLoginorg:null)(getSex:0)(getIfSpeak:0)(getNickName:超级管理员)(getPhoneNum:null)(getSession:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getIcon:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('4a2e2c6bc3e648a3834a86465f2702b9', 'admin', '2016-05-27 10:52:29', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getIcon:null)(getSession:null)(getPhoneNum:null)(getNickName:超级管理员)(getIfSpeak:0)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('4bcdf682c92d4e219c7803856daf7900', 'admin', '2016-05-27 12:28:54', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getIcon:null)(getSession:null)(getPhoneNum:null)(getNickName:超级管理员)(getIfSpeak:0)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('4c0a163d61924fbe918d10ab2cfdda72', 'admin', '2016-05-28 23:45:24', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getIcon:null)(getSex:0)(getEmail:admin@abc.com)(getLoginorg:null)(getIfSpeak:0)(getNickName:超级管理员)(getPhoneNum:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('4d5b0a401e214828b48adc0748991d2b', 'admin', '2016-05-27 00:53:54', '新增操作', 'Result com.modules.sys.svc.SubscriberSVC.saveUser(Subscriber)', 'saveUser', 'saveUser[参数1，类型:Subscriber，值:(getId:null)(getCookie:null)(getUsername:323)(getSex:0)(getPhonenum:我we)(getRoleName:null)(getLoginorg:null)(getEmail:3232@qq.com)(getIfspeak:0)(getNickname:问问)(getIfactivate:0)(getActivity:null)(getRoleid:9a68bdd6-df4a-11e5-a938-f0761c357cc1)(getPassword:8aecdb1b8c85112c0b3015716711be02)(getLastlogintime:null)(getLogindevice:null)(getSubject:null)(getIcon:null)(getSalt:7ae235494113073dc3fc448c93bc35fc)(getCredentialsSalt:3237ae235494113073dc3fc448c93bc35fc)(getAge:0)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('4d777c4ed2234a3cafda4bed36f7f2f8', 'jack', '2016-05-27 15:44:10', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:jack)(getId:be27aef3c5454c10aae90026dc36a5a5)(getSession:null)(getNickName:杰克)(getPhoneNum:10086)(getIfSpeak:0)(getIcon:null)(getLoginorg:null)(getEmail:jack@abc.com)(getSex:0)(getLastLoginTime:Tue May 24 00:37:28 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('4e3fbf567bea4f2ca591c21990d75257', 'admin', '2016-05-28 23:29:13', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)(getNickName:超级管理员)(getPhoneNum:null)(getIfSpeak:0)(getIcon:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('501027e5f9ce413f9d5d522d60d6220f', 'admin', '2016-05-27 09:47:53', '删除操作', 'Result com.modules.sys.svc.LogSVC.deltLog(String)', 'deltLog', 'deltLog[参数1，类型:String，值:(getBytes:[B@15b9da1)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('50f6dc2268a04efba60cdaa666859d2c', 'admin', '2016-05-28 22:52:42', '删除操作', 'Result com.modules.sys.svc.RoleSVC.deltRole(String)', 'deltRole', 'deltRole[参数1，类型:String，值:(getBytes:[B@6c521562)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('516eb47c12de4ed8bb20a065c6e65a79', 'admin', '2016-05-27 15:15:50', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getIcon:null)(getIfSpeak:0)(getPhoneNum:null)(getNickName:超级管理员)(getEmail:admin@abc.com)(getLoginorg:null)(getSex:0)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('59c8a470dea246d98c2ecd32762962e4', 'admin', '2016-05-27 12:30:20', '删除操作', 'Result com.modules.sys.svc.LogSVC.deltLog(String)', 'deltLog', 'deltLog[参数1，类型:String，值:(getBytes:[B@7e416dcc)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('5eeb4836d4be45bdb0e1faccaf4f92ca', 'admin', '2016-05-27 12:20:38', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getIcon:null)(getSession:null)(getPhoneNum:null)(getNickName:超级管理员)(getIfSpeak:0)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('639e20b999c1455e8324691f2080ca28', 'admin', '2016-05-28 23:55:50', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getIcon:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getEmail:admin@abc.com)(getSex:0)(getLoginorg:null)(getIfSpeak:0)(getNickName:超级管理员)(getPhoneNum:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('65f328ca0bd24d578287fea717f171be', '小四', '2016-05-27 00:53:15', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@46220aac)][参数2，类型:String，值:(getBytes:[B@64eac62c)][参数3，类型:String，值:(getBytes:[B@7178a676)]', '192.168.0.101');
INSERT INTO `s_log` VALUES ('6730e8df442544c7bbbaeecbde8fe828', 'admin', '2016-05-27 01:28:49', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getIcon:null)(getSession:null)(getSex:0)(getEmail:admin@abc.com)(getLoginorg:null)(getIfSpeak:0)(getPhoneNum:null)(getNickName:超级管理员)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('6cfbb95ea0aa4f08bda6d29f7db09530', 'admin', '2016-05-27 22:12:53', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getIcon:null)(getSession:null)(getEmail:admin@abc.com)(getSex:0)(getLoginorg:null)(getPhoneNum:null)(getIfSpeak:0)(getNickName:超级管理员)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('6d9135147c6849488a2c0a791bb40ed6', '小四', '2016-05-27 00:53:36', '删除操作', 'Result com.modules.sys.svc.SubscriberSVC.deltUsers(String,User)', 'deltUsers', 'deltUsers[参数1，类型:String，值:(getBytes:[B@2d2092a1)][参数2，类型:User，值:(getName:小四)(getId:111111)(getSex:0)(getLoginorg:null)(getEmail:xiaosi@abc.com)(getLastLoginTime:null)(getSession:null)(getIcon:null)(getNickName:小四)(getIfSpeak:0)(getPhoneNum:12212)]', '192.168.0.101');
INSERT INTO `s_log` VALUES ('70b6ac7bdd004c06bd9568f91a88ceda', 'admin', '2016-05-28 22:12:08', '新增操作', 'Result com.modules.sys.svc.RoleSVC.saveRole(Role)', 'saveRole', 'saveRole[参数1，类型:Role，值:(getId:5ee4ec5d-24de-11e6-837d-f0761c357cc1)(getRolename:22)(getSerialversionuid:1)(getRoleno:11)(getRoleremark:221)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('72f015adac2b4297b37230ba47df842f', 'admin', '2016-05-28 21:29:13', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getIfSpeak:0)(getNickName:超级管理员)(getPhoneNum:null)(getSession:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getLoginorg:null)(getSex:0)(getEmail:admin@abc.com)(getIcon:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('74b0f3f650b74a409cc10dd8875cf192', 'admin', '2016-05-27 21:17:33', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getSex:0)(getEmail:admin@abc.com)(getLoginorg:null)(getNickName:超级管理员)(getPhoneNum:null)(getIfSpeak:0)(getIcon:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('761cb83d61164429b14f831cb5a1f962', '小四', '2016-05-27 00:53:04', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@4b8103a5)][参数2，类型:String，值:(getBytes:[B@35244f40)][参数3，类型:String，值:(getBytes:[B@62cf0e01)]', '192.168.0.101');
INSERT INTO `s_log` VALUES ('773796baa7d9496eaf37f064e5944517', 'admin', '2016-05-28 21:19:02', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getLoginorg:null)(getSex:0)(getEmail:admin@abc.com)(getPhoneNum:null)(getIfSpeak:0)(getNickName:超级管理员)(getIcon:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('7a05818d3c8f4512a6ad1c98987060c7', 'admin', '2016-05-28 10:27:59', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getSession:null)(getIcon:null)(getSex:0)(getLoginorg:null)(getEmail:admin@abc.com)(getNickName:超级管理员)(getIfSpeak:0)(getPhoneNum:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('8698a75c5ac7489fac4d9b2cd010737f', 'admin', '2016-05-27 15:57:05', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getNickName:超级管理员)(getPhoneNum:null)(getIfSpeak:0)(getIcon:null)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('8ccb26ca70a840da9781ea5e20effa24', 'admin', '2016-05-28 22:49:25', '删除操作', 'Result com.modules.sys.svc.RoleSVC.deltRole(String)', 'deltRole', 'deltRole[参数1，类型:String，值:(getBytes:[B@1b060768)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('8d16c14b21534bd1b95755ef0b5eee08', 'admin', '2016-05-28 23:05:50', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getIcon:null)(getSession:null)(getNickName:超级管理员)(getPhoneNum:null)(getIfSpeak:0)(getEmail:admin@abc.com)(getSex:0)(getLoginorg:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('8f40086652f84fc999120cc39209008b', 'admin', '2016-05-27 01:10:26', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@759d4dcd)][参数2，类型:String，值:(getBytes:[B@2a5f0a0e)][参数3，类型:String，值:(getBytes:[B@458d32dd)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('8f9350550b424397986a116f462b39ab', 'admin', '2016-05-27 15:27:16', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)(getSession:null)(getIcon:null)(getPhoneNum:null)(getIfSpeak:0)(getNickName:超级管理员)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('93b320c1135d4cdbaeacca57ae98196a', 'admin', '2016-05-27 01:10:59', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@76229694)][参数2，类型:String，值:(getBytes:[B@58cc0b23)][参数3，类型:String，值:(getBytes:[B@358e68a6)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('96e8a1943cdc4caeb4fe3996921bc914', 'admin', '2016-05-28 23:42:10', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getIcon:null)(getPhoneNum:null)(getIfSpeak:0)(getNickName:超级管理员)(getLoginorg:null)(getSex:0)(getEmail:admin@abc.com)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('9730b851437d4f2a855d7f4ce6aacf74', 'jack', '2016-05-27 00:54:50', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@1fc7764e)][参数2，类型:String，值:(getBytes:[B@60280b2e)][参数3，类型:String，值:(getBytes:[B@64f62a53)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('97832719bf544063862ef00fca236a34', 'admin', '2016-05-27 09:36:42', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getNickName:超级管理员)(getPhoneNum:null)(getIfSpeak:0)(getSex:0)(getLoginorg:null)(getIcon:null)(getEmail:admin@abc.com)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('9b1f45102c9540fd84f31a5c085e3e0a', 'admin', '2016-05-27 16:08:28', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getSex:0)(getLoginorg:null)(getEmail:admin@abc.com)(getNickName:超级管理员)(getPhoneNum:null)(getIfSpeak:0)(getIcon:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('9c43b42022ac474eb1eab6dc7d55954c', 'admin', '2016-05-28 22:52:17', '删除操作', 'Result com.modules.sys.svc.SubscriberSVC.deltUsers(String,User)', 'deltUsers', 'deltUsers[参数1，类型:String，值:(getBytes:[B@db2e9f6)][参数2，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getSession:null)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)(getIfSpeak:0)(getPhoneNum:null)(getNickName:超级管理员)(getIcon:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('a16b232757434e04a6533ca5fd09022d', 'admin', '2016-05-28 23:37:18', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getSession:null)(getIcon:null)(getEmail:admin@abc.com)(getLoginorg:null)(getSex:0)(getNickName:超级管理员)(getPhoneNum:null)(getIfSpeak:0)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('a6a5080af7a04321b66ae76a458999e9', 'admin', '2016-05-28 23:39:50', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getIcon:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getIfSpeak:0)(getNickName:超级管理员)(getPhoneNum:null)(getEmail:admin@abc.com)(getLoginorg:null)(getSex:0)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('ab7d64f7e5ff43e886f24d5caf4938c9', 'admin', '2016-05-28 23:18:03', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getIcon:null)(getSession:null)(getLoginorg:null)(getSex:0)(getEmail:admin@abc.com)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getNickName:超级管理员)(getPhoneNum:null)(getIfSpeak:0)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('aded4b8274764dd2b17f454d1730c13c', 'admin', '2016-05-27 01:24:37', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@387a16a1)][参数2，类型:String，值:(getBytes:[B@5763c0fe)][参数3，类型:String，值:(getBytes:[B@56139084)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('afc4bee9dd3f4e628e194e80c5599cc3', 'admin', '2016-05-27 15:36:38', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getNickName:超级管理员)(getPhoneNum:null)(getIfSpeak:0)(getIcon:null)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('b06a6cc17df6492b9a5ee4a129dae3d6', 'admin', '2016-05-27 01:25:52', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@718984c8)][参数2，类型:String，值:(getBytes:[B@18aa8713)][参数3，类型:String，值:(getBytes:[B@6389fd0b)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('b07d175b85a24bc2b57ac78df123aa4b', 'admin', '2016-05-27 01:25:57', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@326ad613)][参数2，类型:String，值:(getBytes:[B@40c9341)][参数3，类型:String，值:(getBytes:[B@5597927a)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('b658c35f1ef149749864286aae29e8d9', '小四', '2016-05-27 00:53:11', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@1d9380c2)][参数2，类型:String，值:(getBytes:[B@3eea4fb9)][参数3，类型:String，值:(getBytes:[B@9181af4)]', '192.168.0.101');
INSERT INTO `s_log` VALUES ('b6e742aff3fb48a0aed1aaa9387f202f', 'admin', '2016-05-28 23:58:32', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getNickName:超级管理员)(getPhoneNum:null)(getIfSpeak:0)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getIcon:null)(getSex:0)(getEmail:admin@abc.com)(getLoginorg:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('b91056c804ed44f3a64cb786a8e842cf', 'admin', '2016-05-27 01:11:01', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@1c657642)][参数2，类型:String，值:(getBytes:[B@3fd2fb4d)][参数3，类型:String，值:(getBytes:[B@34709cf7)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('b961ee8073d6412883efd8ec20adc922', 'admin', '2016-05-27 09:40:29', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getSex:0)(getEmail:admin@abc.com)(getLoginorg:null)(getIfSpeak:0)(getNickName:超级管理员)(getPhoneNum:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getIcon:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('bc2fc158b7c34254810c035fef941b50', 'admin', '2016-05-27 01:24:43', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@69673772)][参数2，类型:String，值:(getBytes:[B@23e4565a)][参数3，类型:String，值:(getBytes:[B@63e1411e)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('bd0210236f2644388f955b8947657086', 'admin', '2016-05-27 01:24:44', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@419272a9)][参数2，类型:String，值:(getBytes:[B@5abe4877)][参数3，类型:String，值:(getBytes:[B@287ab2c)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('bf6898a8061743888cffaf8baeeb063b', 'admin', '2016-05-27 01:26:15', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getIcon:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)(getIfSpeak:0)(getNickName:超级管理员)(getPhoneNum:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('bfcfbed494754ed3927e646baf5ef79c', 'admin', '2016-05-27 10:57:41', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getIcon:null)(getSession:null)(getPhoneNum:null)(getNickName:超级管理员)(getIfSpeak:0)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('c32e703158a24eb083b4366471663193', 'admin', '2016-05-28 23:57:09', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getIcon:null)(getSession:null)(getSex:0)(getPhoneNum:null)(getNickName:超级管理员)(getIfSpeak:0)(getLoginorg:null)(getEmail:admin@abc.com)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('c33a2f0aa5b14291a5d69ee6401d43e8', 'admin', '2016-05-27 21:13:50', '删除操作', 'Result com.modules.sys.svc.LogSVC.deltLog(String)', 'deltLog', 'deltLog[参数1，类型:String，值:(getBytes:[B@69cf9511)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('c4975e76e3a9497f80198564463681fe', 'admin', '2016-05-28 22:11:52', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getIcon:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getSex:0)(getEmail:admin@abc.com)(getLoginorg:null)(getPhoneNum:null)(getNickName:超级管理员)(getIfSpeak:0)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('c52a9160cda144ba8442f3f7f38a4494', 'jack', '2016-05-27 11:00:19', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:jack)(getId:be27aef3c5454c10aae90026dc36a5a5)(getLastLoginTime:Tue May 24 00:37:28 CST 2016)(getIcon:null)(getSession:null)(getPhoneNum:10086)(getNickName:杰克)(getIfSpeak:0)(getLoginorg:null)(getEmail:jack@abc.com)(getSex:0)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('c5c6751d0d474fbc80a43bd5b0441ed0', 'admin', '2016-05-27 11:00:08', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getIcon:null)(getSession:null)(getPhoneNum:null)(getNickName:超级管理员)(getIfSpeak:0)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('c77b01b24c92428297d424a6f8974982', 'admin', '2016-05-28 20:42:43', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getSex:0)(getLoginorg:null)(getEmail:admin@abc.com)(getIfSpeak:0)(getNickName:超级管理员)(getPhoneNum:null)(getSession:null)(getIcon:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('c8466ca5fce34b05bb01ebb5d2d30e14', 'admin', '2016-05-27 10:17:42', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSex:0)(getEmail:admin@abc.com)(getLoginorg:null)(getPhoneNum:null)(getIfSpeak:0)(getNickName:超级管理员)(getSession:null)(getIcon:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('c99421a1bbcc4a558bec8163162ed65e', 'admin', '2016-05-28 23:52:55', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getSex:0)(getIcon:null)(getEmail:admin@abc.com)(getLoginorg:null)(getNickName:超级管理员)(getIfSpeak:0)(getPhoneNum:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('c9ffbd47f2374d22843b7e2edc76c901', 'admin', '2016-05-27 01:24:46', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@43d4b03c)][参数2，类型:String，值:(getBytes:[B@407e55ee)][参数3，类型:String，值:(getBytes:[B@263b9d56)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('cb0ac1e9d66743428746ccc956473f21', '小四', '2016-05-27 00:53:09', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@1c6e0713)][参数2，类型:String，值:(getBytes:[B@22f1dab)][参数3，类型:String，值:(getBytes:[B@6344c6ab)]', '192.168.0.101');
INSERT INTO `s_log` VALUES ('cbdb66d82e4741f3abb37adedff54732', 'admin', '2016-05-27 09:47:38', '删除操作', 'Result com.modules.sys.svc.LogSVC.deltLog(String)', 'deltLog', 'deltLog[参数1，类型:String，值:(getBytes:[B@37494733)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('ce183fd7408448fdbca19c574caf5d5e', 'admin', '2016-05-28 21:33:19', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getIfSpeak:0)(getNickName:超级管理员)(getPhoneNum:null)(getSession:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getLoginorg:null)(getSex:0)(getEmail:admin@abc.com)(getIcon:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('cf6fd2ad6d334aa6b7a805e958abd669', 'admin', '2016-05-27 22:16:24', '删除操作', 'Result com.modules.sys.svc.LogSVC.deltLog(String)', 'deltLog', 'deltLog[参数1，类型:String，值:(getBytes:[B@288ee601)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('d2da86eb4b8a44c7afa38c0f15a8023a', 'jack', '2016-05-27 00:54:48', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@7d02bdc)][参数2，类型:String，值:(getBytes:[B@6fd83b39)][参数3，类型:String，值:(getBytes:[B@5d18548c)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('d42e862db292435593dc552bb992d82f', 'admin', '2016-05-28 23:12:23', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getIcon:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getNickName:超级管理员)(getPhoneNum:null)(getIfSpeak:0)(getLoginorg:null)(getSex:0)(getEmail:admin@abc.com)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('d729473f9e444bcc89cc814a9a036c66', 'admin', '2016-05-28 22:49:14', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editUserRole(String,String)', 'editUserRole', 'editUserRole[参数1，类型:String，值:(getBytes:[B@1f9cad3f)][参数2，类型:String，值:(getBytes:[B@6732134f)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('d8977df59a50422fbc69b37dc3b1ee13', 'admin', '2016-05-27 01:25:59', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@3d79a306)][参数2，类型:String，值:(getBytes:[B@7cbdfe71)][参数3，类型:String，值:(getBytes:[B@1d8becb2)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('d94e58aedd564a86b84399c3a861e276', 'admin', '2016-05-28 23:10:31', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getIcon:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)(getNickName:超级管理员)(getIfSpeak:0)(getPhoneNum:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('daf578dde5034993b1b6de57110ee0e2', 'admin', '2016-05-28 22:16:22', '更新操作', 'Result com.modules.sys.svc.RoleSVC.editRole(Role)', 'editRole', 'editRole[参数1，类型:Role，值:(getId:5ee4ec5d-24de-11e6-837d-f0761c357cc1)(getSerialversionuid:1)(getRolename:22)(getRoleremark:1232656565)(getRoleno:11121212121212)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('ddf2cde462d447abb7327b2a1d76cc70', 'admin', '2016-05-27 01:10:18', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getIcon:null)(getSession:null)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)(getIfSpeak:0)(getPhoneNum:null)(getNickName:超级管理员)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('de89db52224e4c0390c2f8782a41d30d', 'admin', '2016-05-28 23:20:46', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getIcon:null)(getIfSpeak:0)(getPhoneNum:null)(getNickName:超级管理员)(getSex:0)(getEmail:admin@abc.com)(getLoginorg:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('e0abdc17b3c64f429b618162190ae37a', '小四', '2016-05-27 00:55:30', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editUser(Subscriber)', 'editUser', 'editUser[参数1，类型:Subscriber，值:(getId:4b233ac4ec00432da6e11a82654155f5)(getCookie:null)(getUsername:2323)(getSex:1)(getPhonenum:878)(getRoleName:null)(getLoginorg:null)(getEmail:1212@qq.com)(getIfspeak:null)(getNickname:额为)(getIfactivate:null)(getActivity:null)(getRoleid:f6128b7e92024a9082cf020f2a3bb5c9)(getPassword:null)(getLastlogintime:null)(getLogindevice:null)(getSubject:null)(getIcon:null)(getSalt:null)(getCredentialsSalt:2323null)(getAge:200)]', '192.168.0.101');
INSERT INTO `s_log` VALUES ('e5fd03b864bb4eee9cd43cfc013e8697', 'admin', '2016-05-27 21:22:39', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getNickName:超级管理员)(getPhoneNum:null)(getIfSpeak:0)(getIcon:null)(getEmail:admin@abc.com)(getSex:0)(getLoginorg:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('e934d9c56d0042f2ba789b186f50cc0c', 'admin', '2016-05-27 15:44:06', '退出系统', null, null, null, '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('e958ef71e5a5481c97c839cdff28a7d0', 'admin', '2016-05-27 01:24:44', '更新操作', 'Result com.modules.sys.svc.SubscriberSVC.editActivity(String,String,String)', 'editActivity', 'editActivity[参数1，类型:String，值:(getBytes:[B@46ce989e)][参数2，类型:String，值:(getBytes:[B@2585d163)][参数3，类型:String，值:(getBytes:[B@621c1360)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('ecf0b5c163ef4c51b0b7ee9ba90e61e7', 'admin', '2016-05-28 23:47:07', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getIcon:null)(getSession:null)(getSex:0)(getLoginorg:null)(getEmail:admin@abc.com)(getPhoneNum:null)(getNickName:超级管理员)(getIfSpeak:0)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('ed572bc55146430cb36fdd1113951366', 'admin', '2016-05-28 22:14:52', '更新操作', 'Result com.modules.sys.svc.RoleSVC.editRole(Role)', 'editRole', 'editRole[参数1，类型:Role，值:(getId:5ee4ec5d-24de-11e6-837d-f0761c357cc1)(getRolename:22)(getSerialversionuid:1)(getRoleno:11)(getRoleremark:1232656565)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('ee5b48b59e5a44cb957ffa65af811732', 'admin', '2016-05-28 23:54:13', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getSession:null)(getIcon:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getEmail:admin@abc.com)(getSex:0)(getLoginorg:null)(getNickName:超级管理员)(getPhoneNum:null)(getIfSpeak:0)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('effc24f06f394ce79aefbf0e291bc4df', 'admin', '2016-05-28 22:16:13', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getSession:null)(getSex:0)(getLoginorg:null)(getEmail:admin@abc.com)(getIfSpeak:0)(getNickName:超级管理员)(getPhoneNum:null)(getIcon:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('f0b09185494f49ee9d800da3f73c699a', 'admin', '2016-05-28 23:17:02', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getSession:null)(getIcon:null)(getEmail:admin@abc.com)(getLoginorg:null)(getSex:0)(getPhoneNum:null)(getIfSpeak:0)(getNickName:超级管理员)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('f3221e77f999452b8517693de21ed5d3', 'admin', '2016-05-28 10:32:09', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getSession:null)(getIcon:null)(getSex:0)(getLoginorg:null)(getEmail:admin@abc.com)(getNickName:超级管理员)(getIfSpeak:0)(getPhoneNum:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('f38c680727c04fba9c19dfe66e48074b', 'admin', '2016-05-28 23:09:00', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getEmail:admin@abc.com)(getSession:null)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getIcon:null)(getLoginorg:null)(getSex:0)(getIfSpeak:0)(getPhoneNum:null)(getNickName:超级管理员)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('f52bf38ab0464f7ca749feb158b8cef1', 'jack', '2016-05-27 11:00:39', '新增操作', 'Result com.modules.sys.svc.PermissionSVC.savePermit(String,String)', 'savePermit', 'savePermit[参数1，类型:String，值:(getBytes:[B@1be6a51c)][参数2，类型:String，值:(getBytes:[B@4361df93)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('f944304a78fa45f4899c7d1fe98508cc', 'admin', '2016-05-27 12:30:15', '删除操作', 'Result com.modules.sys.svc.LogSVC.deltLog(String)', 'deltLog', 'deltLog[参数1，类型:String，值:(getBytes:[B@3780e6dc)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('faf1d275db4d41a2ac1f01207d292950', 'admin', '2016-05-27 21:26:47', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getNickName:超级管理员)(getPhoneNum:null)(getIfSpeak:0)(getSession:null)(getSex:0)(getEmail:admin@abc.com)(getLoginorg:null)(getIcon:null)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('fd7e3e965bea476595ed4f748caaf104', 'jack', '2016-05-27 01:01:42', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:jack)(getId:be27aef3c5454c10aae90026dc36a5a5)(getIcon:null)(getSession:null)(getLoginorg:null)(getEmail:jack@abc.com)(getSex:0)(getIfSpeak:0)(getPhoneNum:10086)(getNickName:杰克)(getLastLoginTime:Tue May 24 00:37:28 CST 2016)]', '0:0:0:0:0:0:0:1');
INSERT INTO `s_log` VALUES ('feb88493903e4330bf27005c1bf85703', 'admin', '2016-05-27 12:05:01', '登陆系统', 'void com.modules.sys.svc.SubscriberSVC.login(User)', 'login', 'login[参数1，类型:User，值:(getName:admin)(getId:363211dd328d4bcf862b640c23c23bee)(getLastLoginTime:Tue May 03 00:37:23 CST 2016)(getIcon:null)(getSession:null)(getPhoneNum:null)(getNickName:超级管理员)(getIfSpeak:0)(getLoginorg:null)(getEmail:admin@abc.com)(getSex:0)]', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for s_module
-- ----------------------------
DROP TABLE IF EXISTS `s_module`;
CREATE TABLE `s_module` (
  `id` varchar(40) COLLATE utf8_bin NOT NULL COMMENT 'id',
  `pid` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '父类id',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `url` varchar(214) COLLATE utf8_bin DEFAULT NULL COMMENT 'url',
  `ifopen` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '是否展开',
  `icon` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '一般图标',
  `dir` varchar(6) COLLATE utf8_bin DEFAULT '0' COMMENT '是否目录',
  `menu` varchar(6) COLLATE utf8_bin DEFAULT '0' COMMENT '是否菜单',
  `valid` varchar(6) COLLATE utf8_bin DEFAULT '0' COMMENT '是否有效',
  `rank` int(6) DEFAULT NULL COMMENT '排序',
  `permitno` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '权限no',
  `permitmark` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '权限解析',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of s_module
-- ----------------------------
INSERT INTO `s_module` VALUES ('0d5b42627db74586a9a1d921d4e5b01b', null, '日志管理', '', '1', 'images/calendar.png', '0', '1', '0', '1', '12323', '');
INSERT INTO `s_module` VALUES ('1', null, '系统管理', '', '1', 'images/setting.png', '1', '1', '0', '0', 'sys', '');
INSERT INTO `s_module` VALUES ('2', '1', '用户管理', 'sys/userIndex.do', '1', 'images/user.png', '0', '1', '0', '1', 'roles[admin]', '管理用户基本信息');
INSERT INTO `s_module` VALUES ('3', '1', '角色管理', 'sys/role/index.do', null, 'images/role.png', '0', '1', '0', '2', 'role', '管理角色的基本信息');
INSERT INTO `s_module` VALUES ('4', '1', '权限管理', 'sys/perms/permsIndex.do', '1', 'images/pswd.png', '1', '1', '0', '3', 'permission', '管理权限信息');
INSERT INTO `s_module` VALUES ('5813c90684014eaeb2538d0522789c05', '2', '用户删除', '', null, null, '1', '0', '0', null, 'user:delete', '用户具有删除的功能');
INSERT INTO `s_module` VALUES ('7b57bff5b63d49989bdbab6bd166a8d8', '1', '功能模块', '', null, null, '0', '1', '0', '4', 'function', '');
INSERT INTO `s_module` VALUES ('aa202855ec2c4a1685783f812eca32aa', '0d5b42627db74586a9a1d921d4e5b01b', '日志列表', 'sys/log/logIndex.do', null, 'images/computer_edit.png', '1', '1', '0', '1', 'sys:log', '日志管理列表');
INSERT INTO `s_module` VALUES ('d9fe50aae3964f3a9b8c5a9230a7fdf2', '2', '用户修改', '', null, null, '1', '0', '0', '1', 'user:edit', '用户具有修改用户信息的功能');
INSERT INTO `s_module` VALUES ('fab0dc96932d4ee5a7be74e6f1f79861', '2', '用户查询', '', null, null, '1', '0', '0', '3', 'perms[\"user:view\"]', '用户具有查询的功能');
INSERT INTO `s_module` VALUES ('ff34edcb9e5e470fa9b520d9057e8d1d', '2', '用户新增', '', null, null, '1', '0', '0', '1', 'Q8', '新增用户');

-- ----------------------------
-- Table structure for s_permission
-- ----------------------------
DROP TABLE IF EXISTS `s_permission`;
CREATE TABLE `s_permission` (
  `id` varchar(40) COLLATE utf8_bin NOT NULL,
  `roleid` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `moduleid` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '对应的菜单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of s_permission
-- ----------------------------
INSERT INTO `s_permission` VALUES ('1a6f8b0f-4d90-46ce-9f01-de66030833a8', '1', '2');
INSERT INTO `s_permission` VALUES ('1e4f04ca-756f-4397-a179-52b43b5623bd', 'f6128b7e92024a9082cf020f2a3bb5c9', '5813c90684014eaeb2538d0522789c05');
INSERT INTO `s_permission` VALUES ('2eea7bee-ad4a-4d77-b747-91f794247d6e', '1', '4');
INSERT INTO `s_permission` VALUES ('4b1b18b5-969a-4fe5-a473-8a652e44973c', '2', '2');
INSERT INTO `s_permission` VALUES ('6c46ed03-875f-43af-bda6-2c14ee39b8df', '9a68bdd6-df4a-11e5-a938-f0761c357cc1', '2');
INSERT INTO `s_permission` VALUES ('73e8364f-4984-41c6-bf4a-06712c1b3664', '1', 'aa202855ec2c4a1685783f812eca32aa');
INSERT INTO `s_permission` VALUES ('75e4e235-bd30-4fa1-b3e4-24b70ad7c855', '2', 'aa202855ec2c4a1685783f812eca32aa');
INSERT INTO `s_permission` VALUES ('7b67e618-b81b-4498-b057-9f42dc64519c', 'f6128b7e92024a9082cf020f2a3bb5c9', '2');
INSERT INTO `s_permission` VALUES ('7e3f6729-424f-4cfd-9112-132ca5948e71', '1', '3');
INSERT INTO `s_permission` VALUES ('ab6804e3-46b9-4230-9266-31860f99f62e', '1', 'ff34edcb9e5e470fa9b520d9057e8d1d');
INSERT INTO `s_permission` VALUES ('b391389e-fcca-4a8a-b839-5755d6336237', '2', '3');
INSERT INTO `s_permission` VALUES ('b994ef73-5b9e-44c5-9d86-f4e893eeb4ba', '2', '0d5b42627db74586a9a1d921d4e5b01b');
INSERT INTO `s_permission` VALUES ('bd5cd3de-e895-40a7-9a95-709f76cf0a6b', '1', '1');
INSERT INTO `s_permission` VALUES ('bea4906c-a674-418e-ab08-ea0849b33af4', 'f6128b7e92024a9082cf020f2a3bb5c9', '3');
INSERT INTO `s_permission` VALUES ('c565bdff-41e5-4830-aea0-0e9b0fb518cb', '9a68bdd6-df4a-11e5-a938-f0761c357cc1', '4');
INSERT INTO `s_permission` VALUES ('ce6fad6f-93cc-4680-a7e9-4d8c7f1fd47c', '9a68bdd6-df4a-11e5-a938-f0761c357cc1', '3');
INSERT INTO `s_permission` VALUES ('cebe7a6c-a566-4179-a147-5adefd31fdf8', 'f6128b7e92024a9082cf020f2a3bb5c9', '1');
INSERT INTO `s_permission` VALUES ('d457e905-95a8-4f4e-9949-f5b43c5d5525', '2', '1');
INSERT INTO `s_permission` VALUES ('e5175fca-aadd-4b98-96b7-a31fed16d0bb', '9a68bdd6-df4a-11e5-a938-f0761c357cc1', '1');
INSERT INTO `s_permission` VALUES ('f1d281ee-6884-4c54-b3f6-afcbc38464d5', '1', '0d5b42627db74586a9a1d921d4e5b01b');

-- ----------------------------
-- Table structure for s_role
-- ----------------------------
DROP TABLE IF EXISTS `s_role`;
CREATE TABLE `s_role` (
  `id` varchar(40) COLLATE utf8_bin NOT NULL,
  `roleno` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '角色代号',
  `rolename` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '角色名称',
  `roleremark` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '角色说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of s_role
-- ----------------------------
INSERT INTO `s_role` VALUES ('1', 'admin', '超级管理员', '超级管理员');
INSERT INTO `s_role` VALUES ('2', 'employee', '一般用户', '一般的用户');
INSERT INTO `s_role` VALUES ('5ee4ec5d-24de-11e6-837d-f0761c357cc1', '11121212121212', '22', '1232656565');
INSERT INTO `s_role` VALUES ('9a68bdd6-df4a-11e5-a938-f0761c357cc1', 'teacher11', '教师11', '这是一个教师的权限111');
INSERT INTO `s_role` VALUES ('f6128b7e92024a9082cf020f2a3bb5c9', 'student', '学生', '这是一个学生的查看权限');

-- ----------------------------
-- Table structure for s_user
-- ----------------------------
DROP TABLE IF EXISTS `s_user`;
CREATE TABLE `s_user` (
  `id` varchar(40) COLLATE utf8_bin NOT NULL,
  `username` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '帐号',
  `password` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `salt` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '盐',
  `nickname` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '昵称',
  `sex` int(4) DEFAULT NULL COMMENT '性别（‘0’：男；‘1’：女；‘2’：隐藏）',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱地址',
  `phonenum` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `roleid` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '对应的角色id',
  `icon` varchar(520) COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `ifactivate` varchar(8) COLLATE utf8_bin DEFAULT '0' COMMENT '是否激活',
  `ifspeak` varchar(8) COLLATE utf8_bin DEFAULT '0' COMMENT '是否禁言',
  `lastlogintime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `logindevice` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '登录设备',
  `loginorg` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '登录域名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of s_user
-- ----------------------------
INSERT INTO `s_user` VALUES ('0e57211084c6467094abed09501bf208', '张三', '0503901680926412f56ffe0e70c2ba06', 'cb378980aada177c4434ad7e84bf2912', '小三', '1', 'zhangsan@123.com', '10086', '11', 'f6128b7e92024a9082cf020f2a3bb5c9', null, '0', '0', '2016-05-24 00:37:32', null, null);
INSERT INTO `s_user` VALUES ('111111', '小四', '329d0aba46c7d08660e1f5ebe197a12a', 'cdb06733de7b2c9e55730135a770cf0d', '小四', '0', 'xiaosi@abc.com', '12212', '12', '1', null, '0', '0', null, null, null);
INSERT INTO `s_user` VALUES ('363211dd328d4bcf862b640c23c23bee', 'admin', '9153b615e5a097f0ad52d969b86726c8', '213705243de2de830511e130371ee664', '超级管理员', '0', 'admin@abc.com', null, null, '1', null, '0', '0', '2016-05-03 00:37:23', null, null);
INSERT INTO `s_user` VALUES ('4b043975d61b42fd9d51f8d32fd23d0c', 'xiaoming', '4a4a8cd471aceece31a502398df83862', '9808643be7d248f33a338d64db8c9386', '小明', '0', 'xiaoming@abc.om', '10086', '10', '2', null, '0', '0', null, null, null);
INSERT INTO `s_user` VALUES ('4b233ac4ec00432da6e11a82654155f5', '2323', '4574f276593c5e2991f6444bcd802b90', '64f028ef15d7936afb0335fd070450c9', '额为', '1', '1212@qq.com', '878', '200', '5ee4ec5d-24de-11e6-837d-f0761c357cc1', null, '0', '1', null, null, null);
INSERT INTO `s_user` VALUES ('5ae97e7c4f9b477ca629f636102ea075', '呵呵', '0db9b2d2114b64819522d837bb319404', 'c2ed04b92f0546d485f3f0f362cd0cbd', '呵呵', '0', '呵呵1@com.com', '', '0', '2', null, '0', '1', null, null, null);
INSERT INTO `s_user` VALUES ('be27aef3c5454c10aae90026dc36a5a5', 'jack', 'db725991faad6afa9dec2ac23f2bdfaf', '856a5f842964cd40cbd721ae13c30edd', '杰克', '0', 'jack@abc.com', '10086', '16', '2', null, '0', '0', '2016-05-24 00:37:28', null, null);
