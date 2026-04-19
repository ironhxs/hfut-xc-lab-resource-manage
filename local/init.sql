SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `gaoxiaoshiyanshizhiyuan`;
CREATE DATABASE `gaoxiaoshiyanshizhiyuan`
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE `gaoxiaoshiyanshizhiyuan`;

CREATE TABLE `config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_config_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `dictionary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dic_code` varchar(100) NOT NULL,
  `dic_name` varchar(100) NOT NULL,
  `code_index` int NOT NULL,
  `index_name` varchar(100) NOT NULL,
  `super_types` int DEFAULT 0,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_dictionary_code` (`dic_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role` varchar(32) NOT NULL,
  `sex_types` int DEFAULT NULL,
  `addtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_users_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `username` varchar(64) NOT NULL,
  `tablename` varchar(64) NOT NULL,
  `role` varchar(32) NOT NULL,
  `token` varchar(200) NOT NULL,
  `expiratedtime` datetime DEFAULT NULL,
  `addtime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_token_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `jiaoshi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `jiaoshi_name` varchar(64) NOT NULL,
  `sex_types` int DEFAULT NULL,
  `jiaoshi_id_number` varchar(32) DEFAULT NULL,
  `jiaoshi_phone` varchar(32) DEFAULT NULL,
  `jiaoshi_email` varchar(128) DEFAULT NULL,
  `jiaoshi_photo` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_jiaoshi_username` (`username`),
  UNIQUE KEY `uk_jiaoshi_phone` (`jiaoshi_phone`),
  UNIQUE KEY `uk_jiaoshi_id_number` (`jiaoshi_id_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `yonghu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `yonghu_name` varchar(64) NOT NULL,
  `sex_types` int DEFAULT NULL,
  `yonghu_id_number` varchar(32) DEFAULT NULL,
  `yonghu_phone` varchar(32) DEFAULT NULL,
  `yonghu_email` varchar(128) DEFAULT NULL,
  `yonghu_photo` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_yonghu_username` (`username`),
  UNIQUE KEY `uk_yonghu_phone` (`yonghu_phone`),
  UNIQUE KEY `uk_yonghu_id_number` (`yonghu_id_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `shiyanshi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shiyanshi_name` varchar(100) NOT NULL,
  `shiyanshi_dizhi` varchar(255) DEFAULT NULL,
  `shiyanshi_fuzeren` varchar(64) DEFAULT NULL,
  `chengyuan_content` longtext,
  `wupin_content` longtext,
  `insert_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `youxing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `youxing_bianhao` varchar(64) DEFAULT NULL,
  `youxing_name` varchar(100) NOT NULL,
  `youxing_types` int DEFAULT NULL,
  `zhuangtai_types` int DEFAULT NULL,
  `youxing_money` decimal(10,2) DEFAULT NULL,
  `youxing_content` longtext,
  `insert_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `weixiu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `youxing_id` int DEFAULT NULL,
  `jieyong_time` datetime DEFAULT NULL,
  `youxing_money` decimal(10,2) DEFAULT NULL,
  `insert_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `jieyong` (
  `id` int NOT NULL AUTO_INCREMENT,
  `youxing_id` int DEFAULT NULL,
  `jieyong_time` datetime DEFAULT NULL,
  `jieyongren` varchar(64) DEFAULT NULL,
  `insert_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `wuxing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wuxing_name` varchar(100) NOT NULL,
  `wuxing_file` varchar(255) DEFAULT NULL,
  `yonghu_id` int DEFAULT NULL,
  `shenhe_types` int DEFAULT NULL,
  `insert_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `huodong` (
  `id` int NOT NULL AUTO_INCREMENT,
  `huodong_name` varchar(100) NOT NULL,
  `jiaoshi_id` int DEFAULT NULL,
  `huodong_types` int DEFAULT NULL,
  `insert_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `qingjia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `yonghu_id` int DEFAULT NULL,
  `shenhe_types` int DEFAULT NULL,
  `qingjia_number` int DEFAULT NULL,
  `qingjia_content` longtext,
  `insert_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `news_name` varchar(150) NOT NULL,
  `news_types` int DEFAULT NULL,
  `news_photo` varchar(255) DEFAULT NULL,
  `insert_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `news_content` longtext,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `config` (`name`, `value`) VALUES
('APIKey', ''),
('SecretKey', ''),
('baidu_ditu_ak', ''),
('faceFile', '');

INSERT INTO `dictionary` (`dic_code`, `dic_name`, `code_index`, `index_name`, `super_types`, `create_time`) VALUES
('sex_types', '性别', 1, '男', 0, NOW()),
('sex_types', '性别', 2, '女', 0, NOW()),
('shenhe_types', '审核状态', 1, '待审核', 0, NOW()),
('shenhe_types', '审核状态', 2, '通过', 0, NOW()),
('shenhe_types', '审核状态', 3, '拒绝', 0, NOW()),
('zhuangtai_types', '资产状态', 1, '空闲', 0, NOW()),
('zhuangtai_types', '资产状态', 2, '已借出', 0, NOW()),
('zhuangtai_types', '资产状态', 3, '维修中', 0, NOW()),
('youxing_types', '有形资产类型', 1, '实验设备', 0, NOW()),
('youxing_types', '有形资产类型', 2, '仪器器材', 0, NOW()),
('youxing_types', '有形资产类型', 3, '办公设备', 0, NOW()),
('huodong_types', '活动类型', 1, '实验教学', 0, NOW()),
('huodong_types', '活动类型', 2, '学术讲座', 0, NOW()),
('huodong_types', '活动类型', 3, '竞赛培训', 0, NOW()),
('news_types', '公告类型', 1, '通知公告', 0, NOW()),
('news_types', '公告类型', 2, '新闻动态', 0, NOW());

INSERT INTO `users` (`username`, `password`, `role`, `sex_types`, `addtime`) VALUES
('贺鑫帅', '123456', '管理员', 1, NOW()),
('陈倩倩', '123456', '管理员', 2, NOW());

INSERT INTO `jiaoshi` (
  `username`, `password`, `jiaoshi_name`, `sex_types`, `jiaoshi_id_number`,
  `jiaoshi_phone`, `jiaoshi_email`, `jiaoshi_photo`, `create_time`
) VALUES (
  '张弛', '123456', '张弛', 1, NULL,
  NULL, NULL, NULL, NOW()
);

INSERT INTO `yonghu` (
  `username`, `password`, `yonghu_name`, `sex_types`, `yonghu_id_number`,
  `yonghu_phone`, `yonghu_email`, `yonghu_photo`, `create_time`
) VALUES
(
  '胡俊贤', '123456', '胡俊贤', 1, NULL,
  NULL, NULL, NULL, NOW()
),
(
  '陈宇翔', '123456', '陈宇翔', 1, NULL,
  NULL, NULL, NULL, NOW()
),
(
  '谢林鑫', '123456', '谢林鑫', 1, NULL,
  NULL, NULL, NULL, NOW()
),
(
  '艾奕爻', '123456', '艾奕爻', 1, NULL,
  NULL, NULL, NULL, NOW()
),
(
  '燕羿飞', '123456', '燕羿飞', 2, NULL,
  NULL, NULL, NULL, NOW()
),
(
  '卢碧瑶', '123456', '卢碧瑶', 2, NULL,
  NULL, NULL, NULL, NOW()
),
(
  '汪博', '123456', '汪博', 1, NULL,
  NULL, NULL, NULL, NOW()
),
(
  '赵思涵', '123456', '赵思涵', 1, NULL,
  NULL, NULL, NULL, NOW()
);

INSERT INTO `shiyanshi` (
  `shiyanshi_name`, `shiyanshi_dizhi`, `shiyanshi_fuzeren`,
  `chengyuan_content`, `wupin_content`, `insert_time`, `create_time`
) VALUES
(
  '507', '电气楼', '张弛',
  '负责人：张弛；主要成员：胡俊贤、陈宇翔、卢碧瑶', '数字示波器、电机控制实验箱、台式计算机', NOW(), NOW()
),
(
  '406', '综合实验楼二', '张弛',
  '负责人：张弛；主要成员：谢林鑫、艾奕爻、赵思涵', '信号发生器、焊台、嵌入式开发板', NOW(), NOW()
);

INSERT INTO `youxing` (
  `youxing_bianhao`, `youxing_name`, `youxing_types`, `zhuangtai_types`,
  `youxing_money`, `youxing_content`, `insert_time`, `create_time`
) VALUES
(
  'YX-2026-001', '数字示波器', 1, 1,
  3999.00, '用于基础电路信号采集与波形分析，当前状态为空闲。', NOW(), NOW()
),
(
  'YX-2026-002', '单片机开发套件', 2, 2,
  1280.00, '用于创新训练项目开发，当前已由学生借用。', NOW(), NOW()
),
(
  'YX-2026-003', '激光打印机', 3, 3,
  1860.00, '用于实验资料打印与归档，当前处于维修中。', NOW(), NOW()
);

INSERT INTO `wuxing` (
  `wuxing_name`, `wuxing_file`, `yonghu_id`, `shenhe_types`,
  `insert_time`, `create_time`
) VALUES
(
  '实验室管理制度文档', NULL, 1, 2, NOW(), NOW()
),
(
  '仪器借用安全规范', NULL, 2, 1, NOW(), NOW()
);

INSERT INTO `huodong` (
  `huodong_name`, `jiaoshi_id`, `huodong_types`, `insert_time`, `create_time`
) VALUES
(
  '实验室安全培训', 1, 3, NOW(), NOW()
),
(
  '电机控制实验教学', 1, 1, NOW(), NOW()
),
(
  '嵌入式系统学术讲座', 1, 2, NOW(), NOW()
);

INSERT INTO `qingjia` (
  `yonghu_id`, `shenhe_types`, `qingjia_number`, `qingjia_content`,
  `insert_time`, `create_time`
) VALUES
(
  1, 2, 1, '参加校级电子设计竞赛培训，申请请假 1 天。', NOW(), NOW()
),
(
  2, 1, 2, '外出参加创新项目答辩，申请请假 2 天。', NOW(), NOW()
);

INSERT INTO `jieyong` (
  `youxing_id`, `jieyong_time`, `jieyongren`,
  `insert_time`, `create_time`
) VALUES
(
  2, '2026-04-18 09:30:00', '胡俊贤', NOW(), NOW()
);

INSERT INTO `weixiu` (
  `youxing_id`, `jieyong_time`, `youxing_money`,
  `insert_time`, `create_time`
) VALUES
(
  3, '2026-04-17 14:00:00', 260.00, NOW(), NOW()
);

INSERT INTO `news` (
  `news_name`, `news_types`, `news_photo`, `insert_time`,
  `news_content`, `create_time`
) VALUES
(
  '系统初始化完成', 1, NULL, NOW(),
  '合肥工业大学宣城校区实验室资源管理系统已完成初始化，可直接使用管理员、教师和学生账号登录体验。', NOW()
),
(
  '关于实验室开放时间调整的通知', 1, NULL, NOW(),
  '本周起 507 实验室工作日开放时间调整为 08:30 至 21:00，请各位同学合理安排实验计划。', NOW()
),
(
  '嵌入式系统专题讲座顺利开展', 2, NULL, NOW(),
  '张弛老师组织开展嵌入式系统专题讲座，参与学生围绕开发板应用与项目实践展开交流。', NOW()
);
