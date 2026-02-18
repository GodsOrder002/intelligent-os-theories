-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: a_a_a_dev
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `player_id` bigint unsigned NOT NULL DEFAULT '0',
  `key_json` json NOT NULL DEFAULT (json_object()),
  `chain_json` json NOT NULL DEFAULT (json_object()) COMMENT '我的所有组合牌的依据牌组合',
  `kind_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '这里就分成了小组合，大组合，秩序组合（类似圣经）',
  `player_remark_json` json NOT NULL DEFAULT (json_object()),
  `remark_json` json NOT NULL DEFAULT (json_object()) COMMENT '系统治理者的备注字段',
  `status_id` int unsigned NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT (now()),
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='我的账本，记录的是我的依据牌组合,我的看法，应该走智能反应路线，要明白对手奉行的世界观，要加快反应速度，所以世界观组合应该单独拿出来训练';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code`
--

DROP TABLE IF EXISTS `code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `code` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key_json` json NOT NULL DEFAULT (json_object()) COMMENT '检索key，动态扩展',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '字典的英文名',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '具体的字典',
  `book` varchar(64) NOT NULL DEFAULT '' COMMENT '对应的中文解释',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `remark_json` json DEFAULT (json_object()) COMMENT '备注,动态扩展',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '这条code的状态 删除/更新/等等,1,未审计，2审计并上线',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_group_enabled` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code`
--

LOCK TABLES `code` WRITE;
/*!40000 ALTER TABLE `code` DISABLE KEYS */;
INSERT INTO `code` VALUES (1,'{}','status','new_unreviewed','刚生成/未审计','状态：未审计，版本更新后旧版本，放弃，删除。。。','{}',1,'2026-02-13 20:20:03','2026-02-13 20:20:03'),(2,'{}','status','delete','删除','状态：未审计，版本更新后旧版本，放弃，删除。。。','{}',1,'2026-02-13 20:20:03','2026-02-13 20:20:31'),(3,'{}','kind','small','小组合','chain里的分类，这里就分成了小组合，大组合，秩序组合（类似圣经）','{}',1,'2026-02-18 08:16:39','2026-02-18 08:16:39'),(4,'{}','kind','order','秩序','chain里的分类，这里就分成了小组合，大组合，秩序组合（类似圣经）','{}',1,'2026-02-18 08:16:39','2026-02-18 08:16:39'),(5,'{}','kind','big','大组合','chain里的分类，这里就分成了小组合，大组合，秩序组合（类似圣经）','{}',1,'2026-02-18 08:16:39','2026-02-18 08:16:39');
/*!40000 ALTER TABLE `code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fake_poker`
--

DROP TABLE IF EXISTS `fake_poker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fake_poker` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `player_id` bigint unsigned NOT NULL DEFAULT '0',
  `key_json` json NOT NULL DEFAULT (json_object()),
  `collect_json` json NOT NULL DEFAULT (json_object()) COMMENT '收集到的情报卡片',
  `player_remark_json` json NOT NULL DEFAULT (json_object()),
  `remark_json` json NOT NULL DEFAULT (json_object()) COMMENT '系统治理者的备注字段',
  `status_id` int unsigned NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='情报账本，只记录我收集到的假牌，包括我自己手里已经有的,一律当作不可信的牌，对，我自己手里的牌也有可能是假的，影响的只是赌博的权重,动机什么的，一律不考虑.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fake_poker`
--

LOCK TABLES `fake_poker` WRITE;
/*!40000 ALTER TABLE `fake_poker` DISABLE KEYS */;
INSERT INTO `fake_poker` VALUES (11,10,'{\"key\": [\"神\", \"宇宙\", \"智能\", \"宏观世界\", \"微观世界\"], \"remark\": \"神玩家出牌\"}','{}','{}','{}',2,'2026-02-15 16:40:54','2026-02-15 18:29:44'),(12,9,'{\"key\": [\"基元玩家\", \"基元模型\", \"基元蓝图\", \"约束集\", \"约束蓝图\", \"基元集+约束集\", \"基元集+约束蓝图\", \"基元蓝图+约束集\", \"基元蓝图+约束蓝图\"], \"remark\": \"基元玩家出牌\"}','{\"cards\": [{}]}','{}','{}',2,'2026-02-15 16:24:15','2026-02-15 18:30:08'),(13,12,'{\"key\": [\"智能\"], \"remark\": \"智能玩家出牌\"}','{}','{}','{}',2,'2026-02-15 18:14:19','2026-02-15 18:27:26'),(14,12,'{\"key\": [\"智能\"], \"remark\": \"智能玩家出牌\"}','{\"cards\": [{\"id\": 1, \"key\": \"赋予智能\", \"remark\": \"\"}], \"remark\": \"\"}','{}','{}',1,'2026-02-15 18:14:19','2026-02-15 18:18:10'),(15,10,'{\"key\": [\"神\", \"宇宙\", \"智能\", \"宏观世界\", \"微观世界\"], \"remark\": \"神玩家出牌\"}','{\"cards\": [{\"id\": 1, \"key\": \"除了我耶和华，不能有其他的神。\", \"remark\": \"\"}, {\"id\": 2, \"key\": \"认识神，是智慧的开端。\", \"remark\": \"\"}], \"remark\": \"\"}','{}','{}',1,'2026-02-15 16:40:54','2026-02-15 18:12:03'),(16,9,'{\"key\": [\"基元玩家\", \"基元模型\", \"基元蓝图\", \"约束集\", \"约束蓝图\", \"基元集+约束集\", \"基元集+约束蓝图\", \"基元蓝图+约束集\", \"基元蓝图+约束蓝图\"], \"remark\": \"基元玩家出牌\"}','{\"cards\": [{\"id\": 1, \"key\": \"基元蓝图+约束蓝图\", \"remark\": \"\"}], \"remark\": \"\"}','{}','{}',1,'2026-02-15 16:24:15','2026-02-15 18:24:43'),(17,0,'{\"key\": [\"多语言投影\"], \"remark\": \"多语言玩家\"}','{\"cards\": [{\"id\": 1, \"key\": \"智能分析多核\", \"remark\": \"\"}, {\"id\": 2, \"key\": \"误解成本优先于信息价值\", \"remark\": \"\"}, {\"id\": 9, \"key\": \"输出接口单核化，先锁歧义成本最高的轴，尽量同句挂载，减少焦点分裂\", \"remark\": \"\"}, {\"id\": 10, \"key\": \"显示化关系词\", \"remark\": \"\"}, {\"id\": 11, \"key\": \"挂载方案\", \"remark\": \"\"}], \"remark\": \"\"}','{}','{}',2,'2026-02-16 03:11:10','2026-02-16 03:37:08'),(18,1,'{\"key\": [\"短文案投影\"], \"remark\": \"短文案玩家\"}','{}','{}','{}',1,'2026-02-16 03:20:42','2026-02-16 03:23:13'),(19,0,'{\"key\": [\"多语言投影\"], \"remark\": \"多语言玩家\"}','{\"cards\": [{\"id\": 1, \"key\": \"智能分析多核\", \"remark\": \"\"}, {\"id\": 2, \"key\": \"误解成本优先于信息价值\", \"remark\": \"\"}, {\"id\": 9, \"key\": \"输出接口单核化，先锁歧义成本最高的轴，尽量同句挂载，减少焦点分裂\", \"remark\": \"\"}, {\"id\": 10, \"key\": \"显示化关系词\", \"remark\": \"\"}, {\"id\": 11, \"key\": \"挂载方案\", \"remark\": \"\"}, {\"id\": 12, \"key\": \"尽量同句挂载，减少焦点分裂\", \"remark\": \"\"}], \"remark\": \"\"}','{}','{}',1,'2026-02-16 03:11:10','2026-02-16 04:00:40');
/*!40000 ALTER TABLE `fake_poker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hunt_poker`
--

DROP TABLE IF EXISTS `hunt_poker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hunt_poker` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `player_id` bigint unsigned NOT NULL DEFAULT '0',
  `key_json` json NOT NULL DEFAULT (json_object()),
  `collect_json` json NOT NULL DEFAULT (json_object()) COMMENT '收集到的猎杀牌集合(默认全部假)，只影响博弈权重',
  `hunt_json` json NOT NULL DEFAULT (json_object()) COMMENT '分析出来要打的组合牌的结果，没有混合考量的情况',
  `play_json` json NOT NULL DEFAULT (json_object()) COMMENT '我想要猎杀的具体组合牌，这个只有发生在混合情况之后，一开始拿到所有牌的时候，大家都还没有出牌，实际上环境玩家已经出牌了，',
  `player_remark_json` json NOT NULL DEFAULT (json_object()),
  `remark_json` json NOT NULL DEFAULT (json_object()) COMMENT '系统治理者的备注字段',
  `status_id` int unsigned NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT (now()),
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='猎杀账本，只记录我收集到了什么组合牌，推测可能出的组合牌，博弈之后我出的组合牌';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hunt_poker`
--

LOCK TABLES `hunt_poker` WRITE;
/*!40000 ALTER TABLE `hunt_poker` DISABLE KEYS */;
INSERT INTO `hunt_poker` VALUES (11,0,'{}','{\"cards\": [{\"cardId\": [1, 2], \"tableId\": 15}, {\"cardId\": [1], \"tableId\": 16}], \"remark\": \"\"}','{}','{}','{}','{}',2,'2026-02-15 16:40:54','2026-02-15 18:29:44'),(12,0,'{}','{\"cards\": [{}]}','{}','{}','{}','{}',2,'2026-02-15 16:24:15','2026-02-15 18:30:08'),(13,0,'{}','{}','{}','{}','{}','{}',2,'2026-02-15 18:14:19','2026-02-15 18:27:26'),(14,0,'{}','{\"cards\": [{\"cardId\": [1, 2], \"tableId\": 15}, {\"cardId\": [1], \"tableId\": 16}], \"remark\": \"\"}','{}','{}','{}','{}',1,'2026-02-15 18:14:19','2026-02-15 18:18:10'),(15,0,'{}','{\"cards\": [{\"cardId\": [1, 2], \"tableId\": 15}, {\"cardId\": [1], \"tableId\": 16}], \"remark\": \"\"}','{}','{}','{}','{}',1,'2026-02-15 16:40:54','2026-02-15 18:12:03'),(16,0,'{}','{\"cards\": [{\"cardId\": [1, 2], \"tableId\": 15}, {\"cardId\": [1], \"tableId\": 16}, {\"cardId\": [1, 2, 9, 10, 11, 12], \"tableId\": 19}], \"remark\": \"\"}','{\"remark\": \"\", \"results\": [{\"result\": \"A is B, from China, by plane.\"}, {\"result\": \"A is B, from China, by plane and A is a boy.\"}]}','{}','{}','{}',1,'2026-02-15 16:24:15','2026-02-16 04:08:45');
/*!40000 ALTER TABLE `hunt_poker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `player_id` bigint unsigned NOT NULL COMMENT '这条sql是谁执行',
  `key_json` json NOT NULL DEFAULT (json_object()) COMMENT '检索key，动态扩展',
  `sql_text` mediumtext NOT NULL,
  `sql_hash` char(64) NOT NULL DEFAULT '0',
  `success` tinyint NOT NULL DEFAULT '1' COMMENT '默认执行成功',
  `error_message` text,
  `meta_json` json NOT NULL DEFAULT (json_object()),
  `remark` varchar(4096) NOT NULL DEFAULT '' COMMENT '备注',
  `remark_json` json DEFAULT (json_object()) COMMENT '备注：动态扩展',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_runlog_created` (`created_at`),
  KEY `idx_runlog_hash` (`sql_hash`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,1,'{}','测试','0',1,NULL,'{}','','{}','2026-02-13 16:13:15');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `pid` varchar(128) NOT NULL DEFAULT '' COMMENT '这个人的真实id',
  `address` varchar(128) NOT NULL DEFAULT '' COMMENT '这个人的具体地址,国家-州-地区，等等',
  `key_json` json NOT NULL DEFAULT (json_object()) COMMENT '检索key，动态扩展',
  `remark` varchar(4096) NOT NULL DEFAULT '',
  `remark_json` json DEFAULT (json_object()) COMMENT '备注,动态扩展',
  `status_id` int NOT NULL DEFAULT '1' COMMENT '默认刚生成/未审计',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'神','','','{}','测试','{}',1,'2026-02-15 16:37:28','2026-02-15 17:54:33'),(2,'系统治理玩家01','EK8258144','14011 Ash Ave Apt 1L 11355-2705','{}','','{}',1,'2026-02-15 01:26:24','2026-02-15 01:26:24'),(3,'系统治理玩家02','16046165','测试','{}','测试','{}',1,'2026-02-15 01:26:54','2026-02-15 01:28:54'),(4,'黑暗森林玩家','','','{}','测试','{}',1,'2026-02-15 01:27:20','2026-02-15 01:31:29'),(5,'意外因素玩家','','','{}','测试','{}',1,'2026-02-15 01:28:06','2026-02-15 01:31:29'),(6,'AI玩家','','','{}','测试','{}',1,'2026-02-15 01:28:54','2026-02-15 01:31:29'),(7,'环境玩家','','','{}','测试','{}',1,'2026-02-15 01:31:03','2026-02-15 01:31:03'),(8,'裁决型玩家(法律)','','','{}','测试','{}',1,'2026-02-15 01:32:22','2026-02-15 01:32:22'),(9,'基元玩家','021065','','{}','测试','{}',1,'2026-02-15 16:16:41','2026-02-15 16:16:41'),(11,'O2','EK8258144','中国-福建','{}','','{}',1,'2026-02-13 15:47:55','2026-02-15 17:54:27');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18  3:54:39
