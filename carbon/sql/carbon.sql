/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : carbon-init

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 16/06/2023 17:14:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for double_carbon_energy_prewarning
-- ----------------------------
DROP TABLE IF EXISTS `double_carbon_energy_prewarning`;
CREATE TABLE `double_carbon_energy_prewarning`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `monitoring_points_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检测点名称',
  `monitoring_points_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检测点地址',
  `real_time_power` decimal(10, 2) NULL DEFAULT NULL COMMENT '实时功率',
  `real_time_volt` decimal(10, 2) NULL DEFAULT NULL COMMENT '实时电压',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `report_time` datetime NULL DEFAULT NULL COMMENT '上报时间',
  `mark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '智造双碳—能效预警' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of double_carbon_energy_prewarning
-- ----------------------------
INSERT INTO `double_carbon_energy_prewarning` VALUES (4, '1号检测点', 'A市', 100.00, 100.00, '1', '2023-06-08 13:54:23', '能效异常');
INSERT INTO `double_carbon_energy_prewarning` VALUES (5, '北京检测点', '北京市', 100.00, 220.00, '0', '2023-05-06 16:35:28', '工作正常');

-- ----------------------------
-- Table structure for dv_energy_consumption
-- ----------------------------
DROP TABLE IF EXISTS `dv_energy_consumption`;
CREATE TABLE `dv_energy_consumption`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `power_consumption` double NULL DEFAULT NULL COMMENT '耗电量',
  `water_consumption` double NULL DEFAULT NULL COMMENT '耗水量',
  `carbon_emissions` double NULL DEFAULT NULL COMMENT '碳排放量',
  `office_power_consumption` double NULL DEFAULT NULL COMMENT '办公耗电量',
  `office_water_consumption` double NULL DEFAULT NULL COMMENT '办公用水量',
  `produce_power_consumption` double NULL DEFAULT NULL COMMENT '生产用电量',
  `produce_water_consumption` double NULL DEFAULT NULL COMMENT '生产用水量',
  `total` double NULL DEFAULT NULL COMMENT '能耗总数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '能耗总览表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dv_energy_consumption
-- ----------------------------
INSERT INTO `dv_energy_consumption` VALUES (1, 66.5, 80.5, 50, 26.5, 30.5, 40, 50, 147);
INSERT INTO `dv_energy_consumption` VALUES (2, 30, 45, 40, 10, 15, 20, 30, 75);
INSERT INTO `dv_energy_consumption` VALUES (3, 71, 88, 13, 25, 33, 46, 55, 159);
INSERT INTO `dv_energy_consumption` VALUES (4, 6, 8, 1, 2, 3, 4, 5, 14);
INSERT INTO `dv_energy_consumption` VALUES (5, 90, 79, 45.4, 56, 56, 34, 23, 169);

-- ----------------------------
-- Table structure for mes_factory
-- ----------------------------
DROP TABLE IF EXISTS `mes_factory`;
CREATE TABLE `mes_factory`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品',
  `production_line` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产线名称',
  `product_mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品型号',
  `specifications` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格',
  `factory_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工厂建模' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_factory
-- ----------------------------
INSERT INTO `mes_factory` VALUES (1, '螺丝钉', '产线一', '大号', '小型', 'xxx');
INSERT INTO `mes_factory` VALUES (2, '螺丝钉', '产线二', '大号', '1', '1');
INSERT INTO `mes_factory` VALUES (3, '螺丝钉', '产线三', '大号', '1', 'xxx');

-- ----------------------------
-- Table structure for mes_product
-- ----------------------------
DROP TABLE IF EXISTS `mes_product`;
CREATE TABLE `mes_product`  (
                                `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
                                `mode_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模型名称',
                                `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品',
                                `product_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品型号',
                                `product_sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品规格',
                                `product_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品单位',
                                `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
                                `dv_id` bigint NULL DEFAULT NULL COMMENT '能耗id',
                                `producted_num` bigint NULL DEFAULT NULL COMMENT '已产数量',
                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品建模' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_product
-- ----------------------------
INSERT INTO `mes_product` VALUES (1, '电子模型', '螺丝钉', 'LST101', '小型', '个', 'xxx', 3, 100);
INSERT INTO `mes_product` VALUES (2, '手机模型', '螺母', 'LM101', '小型', '个', 'xxx', 4, 23);
INSERT INTO `mes_product` VALUES (14, '产品模型', '螺母', 'LM101', '小型', '个', 'xxx', 5, 31);

-- ----------------------------
-- Table structure for mes_project_maintenance
-- ----------------------------
DROP TABLE IF EXISTS `mes_project_maintenance`;
CREATE TABLE `mes_project_maintenance`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '项目维护id',
  `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目名',
  `project_header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `start_date` datetime NULL DEFAULT NULL COMMENT '开始日期',
  `end_date` datetime NULL DEFAULT NULL COMMENT '结束日期',
  `status` int NULL DEFAULT NULL COMMENT '项目状态 0：挂起 1：正常',
  `introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目维护' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_project_maintenance
-- ----------------------------
INSERT INTO `mes_project_maintenance` VALUES (5, 'test', 'test', '2023-05-06 00:00:00', '2023-05-06 00:00:00', 0, NULL);
INSERT INTO `mes_project_maintenance` VALUES (6, '项目巡检', '张三', '2023-05-01 00:00:00', '2023-05-31 00:00:00', 1, NULL);

-- ----------------------------
-- Table structure for mes_technology
-- ----------------------------
DROP TABLE IF EXISTS `mes_technology`;
CREATE TABLE `mes_technology`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '工艺建模id',
  `technology_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工艺名称',
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产品id',
  `unit_power_consumption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位耗电量',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `technology_describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工艺描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工艺建模' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mes_technology
-- ----------------------------
INSERT INTO `mes_technology` VALUES (1, '手工', '1', '1000kW·h', 'xxx', 'xxx');
INSERT INTO `mes_technology` VALUES (2, '手工', '2', '999kW·h', 'xxx', 'xxx');

-- ----------------------------
-- Table structure for procurement_list
-- ----------------------------
DROP TABLE IF EXISTS `procurement_list`;
CREATE TABLE `procurement_list`  (
  `list_id` int NOT NULL AUTO_INCREMENT COMMENT '列表id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `release_time` datetime NOT NULL COMMENT '发布时间',
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '附件下载地址',
  `publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布者',
  `list_type` int NOT NULL COMMENT '类型 1公告，2法规，3动态',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `sketch` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '简略描述',
  PRIMARY KEY (`list_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告法规动态' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of procurement_list
-- ----------------------------
INSERT INTO `procurement_list` VALUES (2, '财政部召开专家座谈会', '2022-11-09 00:00:00', '<p>中央文化企业主管部门财务部门、资产和财务关系在财政部单列的中央文化企业： </p>\r\n    <p style=\"text-indent: 2em\">2023年4月4日，财政部召开专家座谈会，围绕学习宣传贯彻党的二十大精神，全面落实中央经济工作会议、全国两会确定的重大决策部署，分析研判当前国际国内经济财政形势，听取专家对做好当前及下一阶段财政工作的政策建议。财政部党组书记、部长刘昆出席会议并讲话。专家代表李扬、张宇燕、马海涛、朱青、张连起、时建中、郑新业、陈道富在会上作专题发言。\r\n    </p>\r\n    <p style=\"text-indent: 2em\">会议指出，财政部专家工作室、人才库成立以来，广大专家聚焦党中央决策部署，扎实开展财政理论研究、服务财政政策制定，提出了很多有价值的意见建议，有力提升了财政部研究水平和创新能力。会上，刘昆代表财政部党组，向各专家工作室、人才库专家表示了感谢。</p>\r\n    <p style=\"text-indent: 2em\">会议强调，专家是党和国家的宝贵财富，是党执政兴国的重要依靠力量。要深入学习习近平总书记在学习贯彻习近平新时代中国特色社会主义思想主题教育工作会议上的重要讲话精神，全面落实中央办公厅《关于在全党大兴调查研究的工作方案》相关部署，加强调查研究、坚持开门问策、集聚专家智慧，助力财政事业高质量发展。一是大兴调查研究之风，研究建立会同专家开展调查研究的工作机制。二是健全党组联系专家机制，充分发挥“一库两池一室”平台作用，完善重大政策专家咨询机制。三是发挥专家服务财政中心工作和人才培养作用，增强财政部门研究水平和创新能力。四是加强财政服务保障中国式现代化重大课题研究，围绕中国式现代化的中国特色，深化财税体制改革课题研究。五是构建全国一盘棋人才工作格局，支持指导地方建设吸引和聚集高水平财经人才平台。</p>\r\n    <p style=\"text-indent: 2em\">财政部党组成员、副部长朱忠明主持会议，通报财政部专家工作室、人才库工作进展。中央纪委国家监委驻财政部纪检监察组组长、财政部党组成员杨国中，财政部党组成员、副部长王东伟、夏先德出席会议。各专家工作室、财政人才库共26名专家和财政部人事教育司等15个司局负责同志参加会议。</p>', '', '', 3, 'W020230410341363325876.jpg', '2023年4月4日，财政部召开专家座谈会，围绕学习宣传贯彻党的二十大精神，全面落实中央经济工作会议、全国两会确定的重大决策部署，分析研判当前国际国内经济财政形势，听取专家对做好当前及下一阶段财政工作的政策建议。');
INSERT INTO `procurement_list` VALUES (6, '财政部负责同志出席国务院政策例行吹风会', '2022-11-09 00:00:00', '<p>2023年3月31日上午，国务院新闻办公室举行国务院政策例行吹风会，财政部副部长朱忠明出席吹风会，介绍优化完善部分阶段性税费优惠政策有关情况，并答记者问。 </p>', '', '', 3, 'W020230404719016092125.jpg', '2023年3月31日上午，国务院新闻办公室举行国务院政策例行吹风会，财政部副部长朱忠明出席吹风会，介绍优化完善部分阶段性税费优惠政策有关情况，并答记者问。 ');
INSERT INTO `procurement_list` VALUES (7, '财政部负责同志出席国务院政策例行吹风会', '2022-11-09 00:00:00', '<p>2023年4月21日下午，国务院新闻办公室举行国务院政策例行吹风会，财政部部长助理欧文汉出席吹风会，介绍2023年国家助学贷款免息及本金延期偿还政策有关情况，并答记者问。 </p>', '', '', 3, 'W020230331630657833794.jpg', '2023年4月21日下午，国务院新闻办公室举行国务院政策例行吹风会，财政部部长助理欧文汉出席吹风会，介绍2023年国家助学贷款免息及本金延期偿还政策有关情况，并答记者问。 ');
INSERT INTO `procurement_list` VALUES (8, '王东伟会见香港特别行政区政府财政司司长', '2022-11-09 00:00:00', '<p>4月20日，财政部副部长王东伟会见香港特别行政区政府财政司司长陈茂波一行，双方主要就香港经济社会发展及巩固和提升香港国际金融中心地位等有关具体议题交换了意见。 </p>', '', '', 3, 'W020230418399792494561.jpg', '4月20日，财政部副部长王东伟会见香港特别行政区政府财政司司长陈茂波一行，双方主要就香港经济社会发展及巩固和提升香港国际金融中心地位等有关具体议题交换了意见。 ');
INSERT INTO `procurement_list` VALUES (9, '刘伟参观“建功新时代 奋进新征程 再接再厉再创财政新辉煌”主题展览', '2022-11-09 00:00:00', '<p>中央文化企业主管部门财务部门、资产和财务关系在财政部单列的中央文化企业： </p>\r\n    <p style=\"text-indent: 2em\">2023年4月4日，财政部召开专家座谈会，围绕学习宣传贯彻党的二十大精神，全面落实中央经济工作会议、全国两会确定的重大决策部署，分析研判当前国际国内经济财政形势，听取专家对做好当前及下一阶段财政工作的政策建议。财政部党组书记、部长刘昆出席会议并讲话。专家代表李扬、张宇燕、马海涛、朱青、张连起、时建中、郑新业、陈道富在会上作专题发言。\r\n    </p>\r\n    <p style=\"text-indent: 2em\">会议指出，财政部专家工作室、人才库成立以来，广大专家聚焦党中央决策部署，扎实开展财政理论研究、服务财政政策制定，提出了很多有价值的意见建议，有力提升了财政部研究水平和创新能力。会上，刘昆代表财政部党组，向各专家工作室、人才库专家表示了感谢。</p>\r\n    <p style=\"text-indent: 2em\">会议强调，专家是党和国家的宝贵财富，是党执政兴国的重要依靠力量。要深入学习习近平总书记在学习贯彻习近平新时代中国特色社会主义思想主题教育工作会议上的重要讲话精神，全面落实中央办公厅《关于在全党大兴调查研究的工作方案》相关部署，加强调查研究、坚持开门问策、集聚专家智慧，助力财政事业高质量发展。一是大兴调查研究之风，研究建立会同专家开展调查研究的工作机制。二是健全党组联系专家机制，充分发挥“一库两池一室”平台作用，完善重大政策专家咨询机制。三是发挥专家服务财政中心工作和人才培养作用，增强财政部门研究水平和创新能力。四是加强财政服务保障中国式现代化重大课题研究，围绕中国式现代化的中国特色，深化财税体制改革课题研究。五是构建全国一盘棋人才工作格局，支持指导地方建设吸引和聚集高水平财经人才平台。</p>\r\n    <p style=\"text-indent: 2em\">财政部党组成员、副部长朱忠明主持会议，通报财政部专家工作室、人才库工作进展。中央纪委国家监委驻财政部纪检监察组组长、财政部党组成员杨国中，财政部党组成员、副部长王东伟、夏先德出席会议。各专家工作室、财政人才库共26名专家和财政部人事教育司等15个司局负责同志参加会议。</p>', '', '', 3, 'W020230421599731905286.jpg', '2023年4月14日，财政部党组成员、全国社会保障基金理事会理事长刘伟参观“建功新时代 奋进新征程 再接再厉再创财政新辉煌”主题展览，就推动社保基金会学习贯彻习近平新时代中国特色社会主义思想主题教育走深走实、以工作实绩彰显主题教育成效提出要求。 ');
INSERT INTO `procurement_list` VALUES (11, '关于开展“十四五”第三批系统化全域推进海绵城市建设示范工作的通知', '2022-11-09 00:00:00', '    <p>各省、自治区财政厅、住房和城乡建设厅、水利（务）厅，新疆生产建设兵团财政局、住房和城乡建设局、水利局： </p>\r\n    <p style=\"text-indent: 2em\">为贯彻习近平总书记关于海绵城市建设的重要指示批示精神，落实《中华人民共和国国民经济和社会发展第十四个五年规划和二〇三五年远景目标》关于建设海绵城市的要求，2023年，财政部、住房城乡建设部、水利部将组织第三批海绵城市建设示范竞争性选拔工作。现将有关事项通知如下：\r\n    </p>\r\n    <h4 style=\"text-indent: 2em\">一、工作目标和原则 </h4>\r\n    <p style=\"text-indent: 2em\">“十四五”期间，财政部、住房城乡建设部、水利部通过竞争性选拔，确定部分基础条件好、积极性高、特色突出的城市分批开展典型示范，系统化全域推进海绵城市建设，力争具备建设条件的省份实现全覆盖，中央财政对示范城市给予定额补助。示范城市应充分运用国家海绵城市试点工作经验和成果，制定全域开展海绵城市建设工作方案，重点聚焦解决城市防洪排涝的难题，建立与系统化全域推进海绵城市建设相适应的长效机制，统筹使用中央和地方资金，完善法规制度、规划标准、投融资机制和相关配套政策，全域系统化建设海绵城市。力争通过3年集中建设，示范城市防洪排涝能力明显提升，海绵城市理念得到全面、有效落实，为建设宜居、韧性、智慧城市创造条件，推动全国海绵城市建设迈上新台阶。\r\n    </p>\r\n    <p style=\"text-indent: 2em\">第三批海绵城市建设示范城市总数15个，通过竞争性选拔方式确定。评选时，将综合考虑城市已有海绵城市建设工作基础、工作方案成熟度等因素，并适当向经济基础好、配套能力强、城市洪涝治理任务重、投资拉动效益明显的省份倾斜。\r\n    </p>\r\n    <h4 style=\"text-indent: 2em\">二、示范城市申报条件 </h4>\r\n    <p style=\"text-indent: 2em\">示范城市申报条件如下： </p>\r\n    <p style=\"text-indent: 2em\">（一）未有城市入选“十四五”前两批海绵城市建设示范的省（自治区、兵团）可推荐1个城市参评。 </p>\r\n    <p style=\"text-indent: 2em\">（二）“十四五”前两批海绵城市建设示范2022年度绩效评价均为良好及以上（绩效评价结果为“A”“B”等级）的省（自治区）可推荐1个城市参评。 </p>\r\n    <p style=\"text-indent: 2em\">（三）申报城市应具备相应基础条件，其中：城市多年平均降雨量不低于400毫米；财力应满足海绵城市建设投入需要，城市地方政府债务风险低，不得因开展海绵城市建设形成新的政府隐性债务。</p>\r\n    <p style=\"text-indent: 2em\">（四）已获得中央财政海绵城市建设试点和示范资金支持的城市不得再次申报；“十四五”以来在城市建设领域出现重大生产安全事故的城市不得申报。 </p>\r\n    <h4 style=\"text-indent: 2em\">三、选拔程序 </h4>\r\n    <p style=\"text-indent: 2em\">（一）省级推荐。 </p>\r\n    <p style=\"text-indent: 2em\">省级财政、住房和城乡建设、水利部门对照通知要求，组织本地区城市参照附件2编制实施方案、提供必要的支撑材料，明确推荐的城市名单，按照附件1填写有关情况，并于2023年5月15日前报财政部、住房城乡建设部、水利部。\r\n    </p>\r\n    <p style=\"text-indent: 2em\">（二）评审。 </p>\r\n    <p style=\"text-indent: 2em\">住房城乡建设部、财政部、水利部组织专家对城市申报方案进行书面评审后，符合条件的城市进入竞争性评审环节，根据专家打分结果，确定入围城市名单，并现场公布。 </p>\r\n    <p style=\"text-indent: 2em\">（三）公示。 </p>\r\n    <p style=\"text-indent: 2em\">入围城市经过公示，无异议的确定为示范城市。存在异议并经查实的，取消资格并按竞争性评审结果依次递补。 </p>\r\n    <h4 style=\"text-indent: 2em\">四、中央补助资金支持标准和支持范围 </h4>\r\n    <p style=\"text-indent: 2em\">中央财政按区域对示范城市给予定额补助。其中：地级及以上城市：东部地区每个城市补助总额9亿元，中部地区每个城市补助总额10亿元，西部地区每个城市补助总额11亿元。县级市：东部地区每个城市补助总额7亿元，中部地区每个城市补助总额8亿元，西部地区每个城市补助总额9亿元。补助资金根据工作推进情况分年拨付到位。\r\n    </p>\r\n    <p style=\"text-indent: 2em\">示范城市统筹使用中央和地方资金系统化全域推进海绵城市建设。其中：新区以目标为导向，统筹规划、强化管理，通过规划建设管控制度建设，将海绵城市理念落实到城市规划建设管理全过程；老区以问题为导向，统筹推进城市防洪排涝设施建设，采用“渗、滞、蓄、净、用、排”等措施，增强城市防洪排涝能力，“干一片、成一片”。示范工作坚持简约适用、因地制宜的原则，严禁出现“调水造景”、“大树进城”等不环保、不节约的情况。\r\n    </p>\r\n    <p style=\"text-indent: 2em\">中央补助资金主要支持城市建成区范围内的与海绵城市建设直接相关的各类项目建设，具体内容包括： </p>\r\n    <p style=\"text-indent: 2em\">1.海绵城市建设相关的排水防涝设施、雨水调蓄设施、城市内部蓄滞洪空间、城市绿地、湿地、透水性道路广场等项目。</p>\r\n    <p style=\"text-indent: 2em\">2.海绵城市建设涉及的城市内河（湖）治理、沟渠等雨洪行泄通道建设改造以及雨污水管网排查、监测设施建设等。 </p>\r\n    <p style=\"text-indent: 2em\">3.居住社区、老旧小区改造和完整社区建设中落实海绵城市建设理念的绿地建设、排水管网建设项目等。 </p>\r\n    <p style=\"text-indent: 2em\">中央财政资金不得用于规划编制、方案制定、人员经费、日常运维等方面支出。</p>\r\n    <h4 style=\"text-indent: 2em\">五、日常跟踪、监督检查及绩效管理 </h4>\r\n    <p style=\"text-indent: 2em\">省级住房和城乡建设、水利、财政部门应建立对示范城市的日常跟踪及监督检查机制，及时将示范城市的任务落实、项目实施进度、存在问题及经验做法等报住房城乡建设部、水利部、财政部（每个示范城市每季度不少于1期）。其中，住房和城乡建设、水利部门重点检查任务完成情况，财政部门重点检查财政资金使用合规情况。住房城乡建设部、水利部、财政部将在汇总地方上报情况的基础上，对示范城市开展抽查，日常监督检查情况将作为年度绩效评价的参考。\r\n    </p>\r\n    <p style=\"text-indent: 2em\">各地在申报材料中应明确地方海绵城市建设3年总体绩效目标以及分年度绩效目标。经竞争性选拔、公示后确定入围的城市，应由城市人民政府对3年总体绩效目标以及分年度绩效目标表盖章后报三部门备案。财政部会同住房城乡建设部、水利部按照预算管理有关要求开展绩效评价。绩效评价结果将与中央财政资金拨付挂钩。\r\n    </p>\r\n    <h4 style=\"text-indent: 2em\">六、其他说明事项 </h4>\r\n    <p style=\"text-indent: 2em\">（一）参与申报的各省级财政、住房和城乡建设、水利部门应联合行文上报三部门，并组织申报城市通过财政部、住房城乡建设部、水利部邮箱报送电子版（含佐证材料），或通过光盘等移动存储方式邮寄。\r\n    </p>\r\n    <p style=\"text-indent: 2em\">（二）为落实过紧日子要求，各申报城市应紧扣要求编制工作方案，避免委托中介机构“编本子、讲故事”，印制豪华材料等情况，切实减少申报工作相关支出。申报材料除正式文件外，实施方案及相关支撑材料一律报送电子版。 </p>\r\n    <p style=\"text-indent: 2em\">（三）请各地严格按照通知明确的数量和要求推进城市、报送材料等，并对报送内容真实性负责。对不按要求报送或申报内容明显不实的城市，将取消当年申报资格。</p>\r\n    <p style=\"text-indent: 2em\">联系方式：</p>\r\n    <p style=\"text-indent: 2em\">财政部经济建设司： </p>\r\n    <p style=\"text-indent: 2em\">电话：010-61965043，邮箱：shikelu@mof.gov.cn  </p>\r\n    <p style=\"text-indent: 2em\">住房城乡建设部城市建设司： </p>\r\n    <p style=\"text-indent: 2em\">电话：010-58933160，邮箱：hmcs@mohurd.gov.cn </p>\r\n    <p style=\"text-indent: 2em\">水利部规划计划司联系方式： </p>\r\n    <p style=\"text-indent: 2em\">电话：010-63202245，邮箱：jhyc@mwr.gov.cn </p>\r\n    <p style=\"text-indent: 2em\">附件1.示范城市申报条件情况表 </p>\r\n    <p style=\"text-indent: 2em\">附件2（附2）-2023年项目清单样式表.xlsx</p>\r\n    <div style=\"text-align: right\">财政部办公厅   住房城乡建设部办公厅   水利部办公厅 </div>', '附件1.示范城市申报条件情况表 .doc,附件2（附2）-2023年项目清单样式表.xlsx', '财政部办公厅', 1, NULL, '为贯彻习近平总书记关于海绵城市建设的重要指示批示精神，落实《中华人民共和国国民经济和社会发展第十四个五年规划和二〇三五年远景目标》关于建设海绵城市的要求，2023年，财政部、住房城乡建设部、水利部将组织第三批海绵城市建设示范竞争性选拔工作。现将有关事项通知如下：');
INSERT INTO `procurement_list` VALUES (12, '关于做好2022年度中央文化企业财务会计决算报告工作的通知', '2022-11-09 00:00:00', '    <p>中央文化企业主管部门财务部门、资产和财务关系在财政部单列的中央文化企业： </p>\r\n    <p style=\"text-indent: 2em\">根据《财政部关于做好2022年度国有企业财务会计决算报告工作的通知》（财资〔2023〕2号）要求，为做好2022年度财政部代表国务院履行出资人职责的中央文化企业（以下称中央文化企业）财务会计决算报告工作，现将有关事项通知如下：\r\n    </p>\r\n    <h4 style=\"text-indent: 2em\">一、编报范围 </h4>\r\n    <p style=\"text-indent: 2em\">中央文化企业及其各级子企业。</p>\r\n    <h4 style=\"text-indent: 2em\">二、报送内容 </h4>\r\n    <p style=\"text-indent: 2em\">（一）中央文化企业主管部门报送材料。 </p>\r\n    <p style=\"text-indent: 2em\">1.主管部门文函（部发文）。正式文函应详细介绍财务会计决算工作情况和成果。企业审计报告有非标准意见或强调事项的，主管部门需要说明情况和意见。涉及资产减值准备财务核销的，主管部门需要提出审核意见。</p>\r\n    <p style=\"text-indent: 2em\">2.主管部门汇总的2022年度财务会计决算报表及会计报表附注。 </p>\r\n    <p style=\"text-indent: 2em\">3.财务情况说明书（中央部门使用格式）。 </p>\r\n    <p style=\"text-indent: 2em\">4.会计师事务所对企业财务会计决算报表（一级企业合并）出具的审计报告。会计师事务所出具保留意见、无法表示意见或否定意见审计报告的企业，应同时提交针对审计报告相关内容的财务处理、账务调整等意见和整改措施。\r\n    </p>\r\n    <p style=\"text-indent: 2em\">5.会计师事务所审计后出具的一级企业管理建议书。 </p>\r\n    <p style=\"text-indent: 2em\">6.一级企业财务情况说明书（企业使用格式）。 </p>\r\n    <p style=\"text-indent: 2em\">7.一级企业资产减值准备财务核销报告、会计师事务所出具的资产减值准备财务核销审核说明。核销报告主要内容包括：核销类别、清理与追索情况、核销金额与原因、内部核销审批程序、责任认定与追究情况等。\r\n    </p>\r\n    <p style=\"text-indent: 2em\">上述材料按顺序加具封面、编排目录和页码，装订成册后加盖本部门印章。第2至7项材料以及全部单户企业的财务会计决算报表、会计报表附注、审计报告、管理建议书、财务情况说明书、企业资产减值准备财务核销材料等电子文档同时报送。</p>\r\n    <p style=\"text-indent: 2em\">（二）资产和财务关系在财政部单列的中央文化企业报送材料。</p>\r\n    <p style=\"text-indent: 2em\">1.中央文化企业文函（企发文）。正式文函应详细介绍财务会计决算工作情况和成果。</p>\r\n    <p style=\"text-indent: 2em\">2.2022年度合并口径的财务会计决算报表及会计报表附注。 </p>\r\n    <p style=\"text-indent: 2em\">2.2022年度合并口径的财务会计决算报表及会计报表附注。 </p>\r\n    <p style=\"text-indent: 2em\">4.会计师事务所对企业财务会计决算报表（一级企业合并）出具的审计报告。会计师事务所出具保留意见、无法表示意见或否定意见审计报告的企业，应同时提交针对审计报告相关内容的财务处理、账务调整等意见和整改措施。\r\n    </p>\r\n    <p style=\"text-indent: 2em\">5.会计师事务所审计后出具的一级企业管理建议书。</p>\r\n    <p style=\"text-indent: 2em\">6.一级企业财务情况说明书（企业使用格式）。</p>\r\n    <p style=\"text-indent: 2em\">7.一级企业资产减值准备财务核销报告、会计师事务所出具的资产减值准备财务核销审核说明。核销报告主要内容包括：核销类别、清理与追索情况、核销金额与原因、内部核销审批程序、责任认定与追究情况等。\r\n    </p>\r\n    <p style=\"text-indent: 2em\">上述材料按顺序加具封面、编排目录和页码，装订成册后加盖本部门印章。第2至7项材料以及全部单户企业的财务会计决算报表、会计报表附注、审计报告、管理建议书、财务情况说明书、企业资产减值准备财务核销材料等电子文档同时报送。\r\n    </p>\r\n    <h4 style=\"text-indent: 2em\">三、报送方式 </h4>\r\n    <p style=\"text-indent: 2em\">（一）主管部门和中央文化企业应于2023年5月15日前完成财务会计决算报告报送工作。资产和财务关系在财政部单列的中央文化企业将财务会计决算材料直接报送财政部（科教和文化司），其他中央文化企业财务会计决算材料由主管部门审核汇总后报送财政部（科教和文化司）。</p>\r\n    <p style=\"text-indent: 2em\">（一）主管部门和中央文化企业应于2023年5月15日前完成财务会计决算报告报送工作。资产和财务关系在财政部单列的中央文化企业将财务会计决算材料直接报送财政部（科教和文化司），其他中央文化企业财务会计决算材料由主管部门审核汇总后报送财政部（科教和文化司）。</p>\r\n    <p style=\"text-indent: 2em\">（一）主管部门和中央文化企业应于2023年5月15日前完成财务会计决算报告报送工作。资产和财务关系在财政部单列的中央文化企业将财务会计决算材料直接报送财政部（科教和文化司），其他中央文化企业财务会计决算材料由主管部门审核汇总后报送财政部（科教和文化司）。</p>\r\n    <h4 style=\"text-indent: 2em\">四、工作要求</h4>\r\n    <p style=\"text-indent: 2em\">（一）持续提升财务会计决算报告质量。主管部门和中央文化企业要高度重视企业财务会计决算报告工作，层层压实责任，严格审核把关，进一步完善和细化财务会计决算编制和审核流程，建立健全会计信息质量治理架构。中央文化企业要切实履行会计信息质量主体责任，严格遵循会计准则、会计制度和财务管理有关规定，按照《财政部\r\n        国资委 银保监会 证监会关于严格执行企业会计准则\r\n        切实做好企业2022年年报工作的通知》（财会〔2022〕32号）要求，准确如实确认、计量、记录和报告经济业务事项，做到数据统计全面完整、应报尽报，确保企业资产状况、经营业绩真实可靠。中央文化企业负责人对本企业财务会计决算报告的真实性、完整性负责。\r\n    </p>\r\n    <p style=\"text-indent: 2em\">（二）切实加强财务信息分析利用。主管部门和中央文化企业要建立健全国有资产监督管理机制，夯实向全国人大常委会报告国有资产管理情况工作基础，充分运用智能化、集成化、信息化手段，提高财务会计决算管理水平。中央文化企业应注重数据挖掘和利用，加强财务信息分析研究，厘清国有资本权益分布和变动情况，合理评估潜在风险，客观反映新情况、新变化、新问题，研究提出有关政策建议。\r\n    </p>\r\n    <p style=\"text-indent: 2em\">（三）扎实做好财务会计决算审计问题整改。主管部门和中央文化企业要充分发挥财务会计决算审计财会监督作用，坚持“整改全覆盖、问题零容忍”原则，在决算报告中全面反映整改效果。中央文化企业要不断完善财务会计决算审计工作制度，对各级子企业财务会计决算审计质量严格把关；要依法依规聘请会计师事务所，确保审计报告信息披露符合国家有关规定；要加强财务会计决算审计对企业经营行为的约束，不得要求审计机构出具指定意见的审计报告。\r\n    </p>\r\n    <p style=\"text-indent: 2em\">（四）严格遵守信息保密制度要求。按照“谁产生信息，谁确定密级”的原则，由填报单位确定信息密级。对确定为涉密或敏感的财务信息，其收发、传递、复制、保存等应符合相关保密要求。凡认定为涉密的信息，应通过离线报送。严禁通过互联网和未采取保密安全措施的载体传递涉密信息。</p>\r\n    <p style=\"text-indent: 2em\">主管部门和中央文化企业在财务会计决算工作中遇到相关问题，请及时与我们联系。 </p>\r\n    <p style=\"text-indent: 2em\">联系人及电话： </p>\r\n    <p style=\"text-indent: 2em\">财政部科教和文化司 刘 涛 010-68553722</p>\r\n    <p style=\"text-indent: 2em\">王 昱 010-68553788</p>\r\n    <p style=\"text-indent: 2em\">监管系统运维人员 曹莉娟 010-68553763    </p>\r\n    <p style=\"text-indent: 2em\">主管部门和中央文化企业在财务会计决算工作中遇到相关问题，请及时与我们联系。 </p>\r\n    <p style=\"text-indent: 2em\"></p>\r\n    <div style=\"text-align: right\">财政部办公厅 </div>', '', '财政部办公厅', 1, NULL, '根据《财政部关于做好2022年度国有企业财务会计决算报告工作的通知》（财资〔2023〕2号）要求，为做好2022年度财政部代表国务院履行出资人职责的中央文化企业（以下称中央文化企业）财务会计决算报告工作，现将有关事项通知如下： ');
INSERT INTO `procurement_list` VALUES (16, '关于印发《农业防灾减灾和水利救灾资金管理办法》的通知', '2022-11-09 00:00:00', '<p>各省、自治区、直辖市、计划单列市财政厅（局）、农业农村（农牧、畜牧兽医、渔业）厅（局、委）、水利（水务）厅（局），新疆生产建设兵团财政局、农业农村局、水利局，北大荒农垦集团有限公司、广东省农垦总局： </p>\r\n    <p style=\"text-indent: 2em\">为加强中央财政农业防灾减灾和水利救灾资金管理，提高资金使用效益，根据《中华人民共和国预算法》等有关法律法规、文件及预算管理相关规定，我们制定了《农业防灾减灾和水利救灾资金管理办法》。现予印发，请遵照执行。此前印发的办法同时废止。</p>\r\n    <p style=\"text-indent: 2em\">附件：农业防灾减灾和水利救灾资金管理办法 </p>\r\n    <div style=\"text-align: right\">财政部 农业农村部 水利部</div>', '农业防灾减灾和水利救灾资金管理办法.pdf', '', 2, NULL, '为加强中央财政农业防灾减灾和水利救灾资金管理，提高资金使用效益，根据《中华人民共和国预算法》等有关法律法规、文件及预算管理相关规定，我们制定了《农业防灾减灾和水利救灾资金管理办法》。现予印发，请遵照执行。此前印发的办法同时废止。');
INSERT INTO `procurement_list` VALUES (17, '关于印发《耕地建设与利用资金管理办法》的通知', '2022-11-09 00:00:00', '<p>各省、自治区、直辖市、计划单列市财政厅（局）、农业农村（农牧）厅（局、委），新疆生产建设兵团财政局、农业农村局，北大荒农垦集团有限公司、广东省农垦总局：</p>\r\n    <p style=\"text-indent: 2em\">为规范和加强耕地建设与利用资金管理，提高资金使用效益，推动落实党中央、国务院关于加强耕地建设与利用的决策部署，根据《中华人民共和国预算法》及其实施条例等法律法规和有关制度规定，财政部、农业农村部研究制定了《耕地建设与利用资金管理办法》。现予印发，请遵照执行。 </p>\r\n    <p style=\"text-indent: 2em\">附件：耕地建设与利用资金管理办法 </p>\r\n    <div style=\"text-align: right\">财政部 农业农村部</div>', '耕地建设与利用资金管理办法.pdf', '', 2, NULL, '为规范和加强耕地建设与利用资金管理，提高资金使用效益，推动落实党中央、国务院关于加强耕地建设与利用的决策部署，根据《中华人民共和国预算法》及其实施条例等法律法规和有关制度规定，财政部、农业农村部研究制定了《耕地建设与利用资金管理办法》。现予印发，请遵照执行。');
INSERT INTO `procurement_list` VALUES (18, '关于印发农业相关转移支付资金管理办法的通知', '2022-11-09 00:00:00', '<p>各省、自治区、直辖市、计划单列市财政厅（局）、农业农村（农牧、畜牧兽医、渔业）厅（委、局），新疆生产建设兵团财政局、农业农村局，北大荒农垦集团有限公司、广东省农垦总局：</p>\r\n    <p style=\"text-indent: 2em\">为规范和加强农业相关转移支付资金管理，提高资金使用效益，加快建设农业强国，推进农业农村现代化，根据《中华人民共和国预算法》等有关规定，财政部会同农业农村部制定了农业相关转移支付资金管理办法。现予印发，请遵照执行。此前印发的《财政部\r\n        农业农村部关于修订农业相关转移支付资金管理办法的通知》（财农〔2022〕25号）、《财政部 农业农村部关于印发〈渔业发展补助资金管理办法〉的通知》（财农〔2021〕24号）同时废止。 </p>\r\n    <p style=\"text-indent: 2em\">附件：1.粮油生产保障资金管理办法 </p>\r\n    <p style=\"text-indent: 2em\">2.粮油生产保障资金分配测算方法及标准 </p>\r\n    <div style=\"text-align: right\">财政部 农业农村部</div>', '粮油生产保障资金管理办法.docx,粮油生产保障资金分配测算方法及标准.docx', '', 2, NULL, '为规范和加强农业相关转移支付资金管理，提高资金使用效益，加快建设农业强国，推进农业农村现代化，根据《中华人民共和国预算法》等有关规定，财政部会同农业农村部制定了农业相关转移支付资金管理办法。现予印发，请遵照执行。此前印发的《财政部 农业农村部关于修订农业相关转移支付资金管理办法的通知》（财农〔2022〕25号）、《财政部 农业农村部关于印发〈渔业发展补助资金管理办法〉的通知》（财农〔2021〕24号）同时废止。 ');
INSERT INTO `procurement_list` VALUES (19, '关于延续实施残疾人就业保障金优惠政策的公告', '2022-11-09 00:00:00', '    <p>各省、自治区、直辖市、计划单列市财政厅（局）、农业农村（农牧、畜牧兽医、渔业）厅（委、局），新疆生产建设兵团财政局、农业农村局，北大荒农垦集团有限公司、广东省农垦总局：</p>\r\n    <p style=\"text-indent: 2em\">为促进小微企业发展，进一步减轻用人单位负担，现就延续实施《财政部关于调整残疾人就业保障金征收政策的公告》（财政部公告2019年第98号）相关优惠政策公告如下：</p>\r\n    <p style=\"text-indent: 2em\">一、延续实施残疾人就业保障金分档减缴政策。其中：用人单位安排残疾人就业比例达到1%（含）以上，但未达到所在地省、自治区、直辖市人民政府规定比例的，按规定应缴费额的50%缴纳残疾人就业保障金；用人单位安排残疾人就业比例在1%以下的，按规定应缴费额的90%缴纳残疾人就业保障金。</p>\r\n    <p style=\"text-indent: 2em\">二、在职职工人数在30人（含）以下的企业，继续免征残疾人就业保障金。 </p>\r\n    <p style=\"text-indent: 2em\">三、本公告执行期限自2023年1月1日起至2027年12月31日。对符合本公告规定减免条件但缴费人已缴费的，可按规定办理退费。 </p>\r\n    <p style=\"text-indent: 2em\">特此公告。 </p>\r\n    <div style=\"text-align: right\">财 政 部</div>', '', '', 2, NULL, '为促进小微企业发展，进一步减轻用人单位负担，现就延续实施《财政部关于调整残疾人就业保障金征收政策的公告》（财政部公告2019年第98号）相关优惠政策公告如下：');
INSERT INTO `procurement_list` VALUES (20, '关于印发《金融机构国有股权董事议案审议操作指引（2023年修订版）》的通知', '2022-11-09 00:00:00', '    <p>国务院有关部委、有关直属机构，各省、自治区、直辖市、计划单列市财政厅（局），新疆生产建设兵团财政局，全国社会保障基金理事会，各中央管理金融企业：</p>\r\n    <p style=\"text-indent: 2em\">国务院有关部委、有关直属机构，各省、自治区、直辖市、计划单列市财政厅（局），新疆生产建设兵团财政局，全国社会保障基金理事会，各中央管理金融企业：</p>\r\n    <p style=\"text-indent: 2em\">附件：金融机构国有股权董事议案审议操作指引（2023年修订版）</p>', '金融机构国有股权董事议案审议操作指引（2023年修订版）.doc', '', 2, NULL, '国务院有关部委、有关直属机构，各省、自治区、直辖市、计划单列市财政厅（局），新疆生产建设兵团财政局，全国社会保障基金理事会，各中央管理金融企业：');
INSERT INTO `procurement_list` VALUES (21, '关于印发《服务业发展资金管理办法》的通知', '2022-11-09 00:00:00', '    <p>各省、自治区、直辖市、计划单列市财政厅（局），新疆生产建设兵团财政局：</p>\r\n    <p style=\"text-indent: 2em\">为加强服务业发展资金管理，充分发挥中央财政资金在引导促进服务业加快发展方面的作用，财政部修订了《服务业发展资金管理办法》。现予以印发，请遵照执行。</p>\r\n    <div style=\"text-align: right\">财 政 部</div>', '服务业发展资金管理办法.docx', '', 2, NULL, '为加强服务业发展资金管理，充分发挥中央财政资金在引导促进服务业加快发展方面的作用，财政部修订了《服务业发展资金管理办法》。现予以印发，请遵照执行。 \r\n\r\n');
INSERT INTO `procurement_list` VALUES (22, '2023年3月28日，财政部副部长廖岷会见世界银行', '2022-11-09 00:00:00', '<p>2023年3月28日，财政部副部长廖岷会见世界银行（以下简称世行）常务副行长托森伯格、副行长费罗一行。双方就中国宏观经济形势、中国与世行合作等议题交换了意见。</p>', '', '', 3, 'W020230421664563298489.jpg', '2023年3月28日，财政部副部长廖岷会见世界银行（以下简称世行）常务副行长托森伯格、副行长费罗一行。双方就中国宏观经济形势、中国与世行合作等议题交换了意见。');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-04-19 10:30:51', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-04-19 10:30:51', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-04-19 10:30:51', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2023-04-19 10:30:51', 'admin', '2023-05-12 17:55:31', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-04-19 10:30:51', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-04-19 10:30:51', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '双碳系统', 0, 'admin', '15888888888', 'admin@qq.com', '0', '0', 'admin', '2023-04-19 10:30:51', 'admin', '2023-05-05 17:02:48');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '北京总公司', 1, 'admin', '15888888888', 'admin@qq.com', '0', '0', 'admin', '2023-04-19 10:30:51', 'admin', '2023-05-05 17:03:15');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '大连分公司', 2, 'admin', '15888888888', 'admin@qq.com', '0', '0', 'admin', '2023-04-19 10:30:51', 'admin', '2023-05-05 17:03:28');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, 'admin', '15888888888', 'admin@qq.com', '0', '0', 'admin', '2023-04-19 10:30:51', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, 'admin', '15888888888', 'admin@qq.com', '0', '0', 'admin', '2023-04-19 10:30:51', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, 'admin', '15888888888', 'admin@qq.com', '0', '0', 'admin', '2023-04-19 10:30:51', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, 'admin', '15888888888', 'admin@qq.com', '0', '0', 'admin', '2023-04-19 10:30:51', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, 'admin', '15888888888', 'admin@qq.com', '0', '0', 'admin', '2023-04-19 10:30:51', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, 'admin', '15888888888', 'admin@qq.com', '0', '0', 'admin', '2023-04-19 10:30:51', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, 'admin', '15888888888', 'admin@qq.com', '0', '0', 'admin', '2023-04-19 10:30:51', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 243 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '成品', '0', 'material_type', NULL, 'default', 'N', '0', 'admin', '2023-04-19 15:21:51', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '原料', '1', 'material_type', NULL, 'default', 'N', '0', 'admin', '2023-04-19 15:22:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '挂起', '0', 'mes_pro_status', NULL, 'default', 'N', '0', 'admin', '2023-04-19 15:39:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 1, '正常', '1', 'mes_pro_status', NULL, 'default', 'N', '0', 'admin', '2023-04-19 15:40:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 0, '核心客户', '1', 'scm_custom_type', NULL, 'default', 'N', '0', 'admin', '2023-04-19 16:26:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 0, '普通客户', '2', 'scm_custom_type', NULL, 'default', 'N', '0', 'admin', '2023-04-19 16:26:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 0, '优质', '1', 'scm_credit_level', NULL, 'default', 'N', '0', 'admin', '2023-04-19 16:28:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 0, '良好', '2', 'scm_credit_level', NULL, 'default', 'N', '0', 'admin', '2023-04-19 16:28:51', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 0, '一般', '3', 'scm_credit_level', NULL, 'default', 'N', '0', 'admin', '2023-04-19 16:29:00', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 0, '较差', '4', 'scm_credit_level', NULL, 'default', 'N', '0', 'admin', '2023-04-19 16:29:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 0, '正常', '1', 'scm_custom_status', NULL, 'default', 'N', '0', 'admin', '2023-04-19 16:30:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 0, '禁用', '0', 'scm_custom_status', NULL, 'default', 'N', '0', 'admin', '2023-04-19 16:30:20', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 0, '未提交', '1', 'scm_apply_status', NULL, 'default', 'N', '0', 'admin', '2023-04-19 19:27:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 0, '待审核', '2', 'scm_apply_status', NULL, 'default', 'N', '0', 'admin', '2023-04-19 19:27:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 0, '已审核', '3', 'scm_apply_status', NULL, 'default', 'N', '0', 'admin', '2023-04-19 19:28:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 0, '驳回', '0', 'scm_audit_status', NULL, 'default', 'N', '0', 'admin', '2023-04-19 19:29:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 0, '通过', '1', 'scm_audit_status', NULL, 'default', 'N', '0', 'admin', '2023-04-19 19:29:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 0, '空闲', '1', 'mes_device_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 09:54:20', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 0, '使用中', '2', 'mes_device_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 09:54:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (119, 0, '故障', '3', 'mes_device_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 09:54:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 0, '通过', '0', 'mytask_audit_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 10:52:20', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (124, 0, '驳回', '1', 'mytask_audit_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 10:52:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (125, 0, '未提交', '0', 'mytask_apply_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 11:11:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (126, 0, '待审核', '1', 'mytask_apply_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 11:11:35', 'admin', '2023-04-20 11:11:57', NULL);
INSERT INTO `sys_dict_data` VALUES (127, 0, '已审核', '2', 'mytask_apply_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 11:11:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (128, 0, '申请人1', '0', 'mytask_applicant', NULL, 'default', 'N', '0', 'admin', '2023-04-20 11:14:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (129, 0, '申请人2', '1', 'mytask_applicant', NULL, 'default', 'N', '0', 'admin', '2023-04-20 11:15:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (130, 0, '申请人3', '3', 'mytask_applicant', NULL, 'default', 'N', '0', 'admin', '2023-04-20 11:15:13', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (131, 0, '审核人1', '0', 'mytask_auditor', NULL, 'default', 'N', '0', 'admin', '2023-04-20 11:17:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (132, 0, '审核人2', '1', 'mytask_auditor', NULL, 'default', 'N', '0', 'admin', '2023-04-20 11:17:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (133, 0, '审核人3', '2', 'mytask_auditor', NULL, 'default', 'N', '0', 'admin', '2023-04-20 11:17:28', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (134, 0, '生产入库', '0', 'wms_application_business', NULL, 'default', 'N', '0', 'admin', '2023-04-20 11:58:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (135, 1, '采购入库', '1', 'wms_application_business', NULL, 'default', 'N', '0', 'admin', '2023-04-20 11:58:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (136, 2, '退货入库', '2', 'wms_application_business', NULL, 'default', 'N', '0', 'admin', '2023-04-20 11:58:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (137, 0, '采购合同', '0', 'wms_application_contract', NULL, 'default', 'N', '0', 'admin', '2023-04-20 11:59:13', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (138, 1, '销售合同', '1', 'wms_application_contract', NULL, 'default', 'N', '0', 'admin', '2023-04-20 11:59:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (139, 0, '未提交', '0', 'wms_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 13:17:45', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (140, 1, '待审核', '1', 'wms_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 13:17:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (141, 2, '已审核', '2', 'wms_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 13:18:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (142, 0, '通过', '0', 'wms_approved_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 13:18:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (143, 1, '驳回', '1', 'wms_approved_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 13:18:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (144, 0, '未分拣', '0', 'wms_document_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 13:19:12', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (145, 1, '已分拣', '1', 'wms_document_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 13:19:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (146, 2, '已盘点', '2', 'wms_document_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 13:19:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (147, 3, '已发货', '3', 'wms_document_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 13:19:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (148, 0, '快递', '1', 'scm_shipping_type', NULL, 'default', 'N', '0', 'admin', '2023-04-20 13:36:00', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (149, 0, '物流', '2', 'scm_shipping_type', NULL, 'default', 'N', '0', 'admin', '2023-04-20 13:36:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (150, 0, '正常', '0', 'wms_application_status1', NULL, 'default', 'N', '0', 'admin', '2023-04-20 13:37:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (151, 1, '停止', '1', 'wms_application_status1', NULL, 'default', 'N', '0', 'admin', '2023-04-20 13:37:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (152, 0, '未出库', '1', 'scm_cargo_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 17:24:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (153, 0, '出库中', '2', 'scm_cargo_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 17:24:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (154, 0, '已出库', '3', 'scm_cargo_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 17:24:41', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (155, 0, '正常', '0', 'dc_prewarning', NULL, 'default', 'N', '0', 'admin', '2023-04-20 18:07:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (156, 0, '异常', '1', 'dc_prewarning', NULL, 'default', 'N', '0', 'admin', '2023-04-20 18:07:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (157, 0, '未入库', '1', 'scm_put_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 18:27:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (158, 0, '已入库', '2', 'scm_put_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 18:28:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (159, 0, '入库中', '3', 'scm_put_status', NULL, 'default', 'N', '0', 'admin', '2023-04-20 18:28:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (160, 0, '未发布', '1', 'mes_publish_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 09:48:17', 'admin', '2023-04-22 10:02:07', NULL);
INSERT INTO `sys_dict_data` VALUES (161, 0, '已下发', '2', 'mes_publish_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 09:48:25', 'admin', '2023-04-22 10:02:13', NULL);
INSERT INTO `sys_dict_data` VALUES (162, 0, '未领料', '1', 'mes_picking_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 09:51:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (163, 0, '已领料', '2', 'mes_picking_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 09:51:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (164, 0, '未下发', '1', 'mes_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 09:51:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (165, 0, '已下发', '2', 'mes_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 09:52:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (166, 0, '未提交', '0', 'wms_carrier_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 11:09:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (167, 1, '待审核', '1', 'wms_carrier_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 11:09:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (168, 2, '已审核', '2', 'wms_carrier_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 11:09:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (169, 0, '驳回', '0', 'wms_carrier_approved_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 11:10:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (170, 1, '通过', '1', 'wms_carrier_approved_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 11:10:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (171, 0, '未申请', '1', 'mes_apply_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 11:22:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (172, 0, '已申请', '2', 'mes_apply_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 11:23:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (173, 0, '通过', '0', 'mes_auditor_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 11:23:28', 'admin', '2023-04-28 10:01:54', NULL);
INSERT INTO `sys_dict_data` VALUES (174, 0, '驳回', '1', 'mes_auditor_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 11:23:36', 'admin', '2023-04-28 10:02:00', NULL);
INSERT INTO `sys_dict_data` VALUES (175, 0, '未入库', '1', 'mes_production_completion', NULL, 'default', 'N', '0', 'admin', '2023-04-21 13:39:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (176, 0, '入库中', '2', 'mes_production_completion', NULL, 'default', 'N', '0', 'admin', '2023-04-21 13:39:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (177, 0, '已入库', '3', 'mes_production_completion', NULL, 'default', 'N', '0', 'admin', '2023-04-21 13:39:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (178, 0, '检验合格', '4', 'mes_production_completion', NULL, 'default', 'N', '0', 'admin', '2023-04-21 13:39:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (179, 0, '检验未合格', '5', 'mes_production_completion', NULL, 'default', 'N', '0', 'admin', '2023-04-21 13:39:41', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (180, 0, '未入库', '1', 'mes_completion_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 13:58:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (181, 0, '入库中', '2', 'mes_completion_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 13:58:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (182, 0, '已入库', '3', 'mes_completion_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 13:59:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (183, 0, '检验合格', '4', 'mes_completion_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 13:59:12', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (184, 0, '检验未合格', '5', 'mes_completion_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 13:59:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (185, 0, '核心供应商', '1', 'scm_supplier_type', NULL, 'default', 'N', '0', 'admin', '2023-04-21 14:20:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (186, 0, '普通供应商', '2', 'scm_supplier_type', NULL, 'default', 'N', '0', 'admin', '2023-04-21 14:20:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (187, 0, '优质', '1', 'scm_supplier_level', NULL, 'default', 'N', '0', 'admin', '2023-04-21 14:21:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (188, 0, '良好', '2', 'scm_supplier_level', NULL, 'default', 'N', '0', 'admin', '2023-04-21 14:21:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (189, 0, '一般', '3', 'scm_supplier_level', NULL, 'default', 'N', '0', 'admin', '2023-04-21 14:22:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (190, 0, '较差', '4', 'scm_supplier_level', NULL, 'default', 'N', '0', 'admin', '2023-04-21 14:22:10', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (191, 0, '未执行', '1', 'mes_assembly_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 14:30:51', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (192, 0, '执行中', '2', 'mes_assembly_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 14:30:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (193, 0, '已完成', '3', 'mes_assembly_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 14:31:00', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (194, 0, '异常', '4', 'mes_assembly_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 14:31:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (195, 0, '启用', '1', 'scm_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 14:32:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (196, 0, '禁用', '2', 'scm_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 14:33:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (197, 0, '待审核', '1', 'mes_plan_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 15:08:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (198, 0, '已审核', '2', 'mes_plan_status', NULL, 'default', 'N', '0', 'admin', '2023-04-21 15:08:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (199, 0, '通过', '0', 'mes_plan_shstatus', NULL, 'default', 'N', '0', 'admin', '2023-04-21 15:09:44', 'admin', '2023-04-28 10:15:30', NULL);
INSERT INTO `sys_dict_data` VALUES (200, 0, '驳回', '1', 'mes_plan_shstatus', NULL, 'default', 'N', '0', 'admin', '2023-04-21 15:09:51', 'admin', '2023-04-28 10:15:41', NULL);
INSERT INTO `sys_dict_data` VALUES (201, 0, '待审核', '1', 'mes_plan_sqstatus', NULL, 'default', 'N', '0', 'admin', '2023-04-21 15:22:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (202, 0, '已审核', '2', 'mes_plan_sqstatus', NULL, 'default', 'N', '0', 'admin', '2023-04-21 15:22:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (203, 0, '领料出库', '0', 'wms_ountbound_application_type', NULL, 'default', 'N', '0', 'admin', '2023-04-22 19:04:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (204, 1, '销售出库', '1', 'wms_ountbound_application_type', NULL, 'default', 'N', '0', 'admin', '2023-04-22 19:04:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (205, 0, '销售合同', '0', 'wms_outbound_application_order_type', NULL, 'default', 'N', '0', 'admin', '2023-04-22 19:09:39', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (206, 1, '采购合同', '1', 'wms_outbound_application_order_type', NULL, 'default', 'N', '0', 'admin', '2023-04-22 19:09:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (207, 0, '未提交', '0', 'wms_outbound_application_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-23 09:48:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (208, 1, '待审核', '1', 'wms_outbound_application_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-23 09:48:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (209, 2, '已审核', '2', 'wms_outbound_application_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-23 09:48:41', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (210, 0, '通过', '0', 'wms_outbound_application_approved_status', NULL, 'default', 'N', '0', 'admin', '2023-04-23 09:49:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (211, 1, '驳回', '1', 'wms_outbound_application_approved_status', NULL, 'default', 'N', '0', 'admin', '2023-04-23 09:49:51', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (212, 0, '未分拣', '0', 'wms_outbound_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-23 09:50:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (213, 1, '已分拣', '1', 'wms_outbound_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-23 09:50:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (214, 2, '已盘点', '2', 'wms_outbound_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-23 09:50:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (215, 3, '已发货', '3', 'wms_outbound_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-23 09:50:59', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (216, 0, '驳回', '1', 'mytask_plan_status', NULL, 'default', 'N', '0', 'admin', '2023-04-23 10:48:39', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (217, 0, '通过', '2', 'mytask_plan_status', NULL, 'default', 'N', '0', 'admin', '2023-04-23 10:48:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (218, 0, '计划申请', '1', 'mytask_apply_type', NULL, 'default', 'N', '0', 'admin', '2023-04-24 11:02:22', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (219, 0, '补货申请', '2', 'mytask_apply_type', NULL, 'default', 'N', '0', 'admin', '2023-04-24 11:02:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (220, 0, '未配送', '0', 'wms_delivery_status', NULL, 'default', 'N', '0', 'admin', '2023-04-24 11:03:52', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (221, 1, '已收货', '1', 'wms_delivery_status', NULL, 'default', 'N', '0', 'admin', '2023-04-24 11:04:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (222, 2, '配送中', '2', 'wms_delivery_status', NULL, 'default', 'N', '0', 'admin', '2023-04-24 11:04:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (223, 0, '未提交', '0', 'wms_replenishment_application_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-25 13:35:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (224, 1, '待审核', '1', 'wms_replenishment_application_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-25 13:35:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (225, 2, '已审核', '2', 'wms_replenishment_application_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-25 13:35:47', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (226, 0, '通过', '0', 'wms_replenishment_application_approved_status', NULL, 'default', 'N', '0', 'admin', '2023-04-25 13:36:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (227, 1, '驳回', '1', 'wms_replenishment_application_approved_status', NULL, 'default', 'N', '0', 'admin', '2023-04-25 13:36:10', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (228, 0, '未采购', '0', 'wms_replenishment_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-25 13:45:35', 'admin', '2023-04-25 15:27:55', NULL);
INSERT INTO `sys_dict_data` VALUES (229, 1, '采购中', '1', 'wms_replenishment_application_status', NULL, 'default', 'N', '0', 'admin', '2023-04-25 13:45:42', 'admin', '2023-04-25 15:28:02', NULL);
INSERT INTO `sys_dict_data` VALUES (232, 0, '正常', '1', 'dv_inventory_status', NULL, 'default', 'N', '0', 'admin', '2023-04-25 16:19:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (233, 0, '不足', '2', 'dv_inventory_status', NULL, 'default', 'N', '0', 'admin', '2023-04-25 16:20:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (234, 0, '溢出', '3', 'dv_inventory_status', NULL, 'default', 'N', '0', 'admin', '2023-04-25 16:20:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (235, 4, 'DS5968687', '4', 'wms_warehousing_application_document_no', NULL, 'default', 'N', '0', 'admin', '2023-04-25 17:19:13', 'admin', '2023-04-25 17:44:27', NULL);
INSERT INTO `sys_dict_data` VALUES (236, 1, 'DS5969867', '1', 'wms_warehousing_application_document_no', NULL, 'default', 'N', '0', 'admin', '2023-04-25 17:19:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (237, 2, 'DS3659876', '2', 'wms_warehousing_application_document_no', NULL, 'default', 'N', '0', 'admin', '2023-04-25 17:19:40', 'admin', '2023-04-25 17:19:46', NULL);
INSERT INTO `sys_dict_data` VALUES (238, 3, 'FS5932658', '3', 'wms_warehousing_application_document_no', NULL, 'default', 'N', '0', 'admin', '2023-04-25 17:20:00', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (239, 0, '日常盘点', '0', 'wms_inventory_information_inventory_type', NULL, 'default', 'N', '0', 'admin', '2023-04-27 15:45:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (240, 1, '每周盘点', '1', 'wms_inventory_information_inventory_type', NULL, 'default', 'N', '0', 'admin', '2023-04-27 15:45:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (241, 2, '月低盘点', '2', 'wms_inventory_information_inventory_type', NULL, 'default', 'N', '0', 'admin', '2023-04-27 15:45:26', 'admin', '2023-04-27 15:45:51', NULL);
INSERT INTO `sys_dict_data` VALUES (242, 3, '年底盘点', '3', 'wms_inventory_information_inventory_type', NULL, 'default', 'N', '0', 'admin', '2023-04-27 15:45:37', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '物料类型', 'material_type', '0', 'admin', '2023-04-19 15:21:15', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '项目状态', 'mes_pro_status', '0', 'admin', '2023-04-19 15:39:29', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '客户分类', 'scm_custom_type', '0', 'admin', '2023-04-19 16:25:55', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '信用等级', 'scm_credit_level', '0', 'admin', '2023-04-19 16:28:27', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '状态', 'scm_custom_status', '0', 'admin', '2023-04-19 16:29:38', 'admin', '2023-04-19 16:30:34', NULL);
INSERT INTO `sys_dict_type` VALUES (105, '申请状态', 'scm_apply_status', '0', 'admin', '2023-04-19 19:27:24', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (106, '审核状态', 'scm_audit_status', '0', 'admin', '2023-04-19 19:28:57', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (107, '设备状态', 'mes_device_status', '0', 'admin', '2023-04-20 09:53:30', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (108, '我的任务申请状态', 'mytask_apply_status', '0', 'admin', '2023-04-20 10:48:18', 'admin', '2023-04-20 10:48:54', NULL);
INSERT INTO `sys_dict_type` VALUES (109, '我的任务审核状态', 'mytask_audit_status', '0', 'admin', '2023-04-20 10:51:21', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (110, '我的任务申请人', 'mytask_applicant', '0', 'admin', '2023-04-20 11:14:33', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (111, '我的任务审核人', 'mytask_auditor', '0', 'admin', '2023-04-20 11:17:01', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (112, '入库申请业务类型', 'wms_application_business', '0', 'admin', '2023-04-20 11:57:42', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (113, '合同类型', 'wms_application_contract', '0', 'admin', '2023-04-20 11:58:58', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (114, '入库申请-申请状态', 'wms_application_status', '0', 'admin', '2023-04-20 13:16:54', 'admin', '2023-04-20 13:34:54', NULL);
INSERT INTO `sys_dict_type` VALUES (115, '入库申请-审核状态', 'wms_approved_status', '0', 'admin', '2023-04-20 13:17:26', 'admin', '2023-04-20 13:35:02', NULL);
INSERT INTO `sys_dict_type` VALUES (116, '入库申请单据状态', 'wms_document_status', '0', 'admin', '2023-04-20 13:19:01', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (117, '入库申请-状态', 'wms_application_status1', '0', 'admin', '2023-04-20 13:34:34', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (118, '送货方式', 'scm_shipping_type', '0', 'admin', '2023-04-20 13:35:40', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (119, '仓库', 'wms_warehouse', '0', 'admin', '2023-04-20 13:58:02', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (120, '库区', 'wms_warehouse_area', '0', 'admin', '2023-04-20 13:58:19', 'admin', '2023-04-20 13:58:52', NULL);
INSERT INTO `sys_dict_type` VALUES (121, '库位', 'wms_warehouse_seat', '0', 'admin', '2023-04-20 13:58:41', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (122, '出库状态', 'scm_cargo_status', '0', 'admin', '2023-04-20 17:24:06', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (123, '能效预警状态', 'dc_prewarning', '0', 'admin', '2023-04-20 18:06:36', 'admin', '2023-04-20 18:06:45', NULL);
INSERT INTO `sys_dict_type` VALUES (124, '入库状态', 'scm_put_status', '0', 'admin', '2023-04-20 18:27:05', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (125, '计划排产_发布状态', 'mes_publish_status', '0', 'admin', '2023-04-21 09:46:48', 'admin', '2023-04-21 09:53:03', NULL);
INSERT INTO `sys_dict_type` VALUES (126, '计划排产_领料状态', 'mes_picking_status', '0', 'admin', '2023-04-21 09:47:19', 'admin', '2023-04-21 09:53:18', NULL);
INSERT INTO `sys_dict_type` VALUES (127, '计划排产_申请状态', 'mes_application_status', '0', 'admin', '2023-04-21 09:47:49', 'admin', '2023-04-21 09:53:30', NULL);
INSERT INTO `sys_dict_type` VALUES (128, 'wms承运申请-申请状态', 'wms_carrier_application_status', '0', 'admin', '2023-04-21 11:08:51', 'admin', '2023-04-21 11:10:21', NULL);
INSERT INTO `sys_dict_type` VALUES (129, 'wms承运申请-审核状态', 'wms_carrier_approved_status', '0', 'admin', '2023-04-21 11:10:12', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (130, '领料申请-申请状态', 'mes_apply_status', '0', 'admin', '2023-04-21 11:21:19', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (131, '领料申请-审核状态', 'mes_auditor_status', '0', 'admin', '2023-04-21 11:22:05', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (132, '生产完工单-状态', 'mes_completion_status', '0', 'admin', '2023-04-21 13:38:22', 'admin', '2023-04-21 13:38:50', NULL);
INSERT INTO `sys_dict_type` VALUES (133, '供应商分类', 'scm_supplier_type', '0', 'admin', '2023-04-21 14:20:15', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (134, '供应商等级', 'scm_supplier_level', '0', 'admin', '2023-04-21 14:21:33', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (135, '作业装配-作业状态', 'mes_assembly_status', '0', 'admin', '2023-04-21 14:30:36', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (136, '启用状态', 'scm_status', '0', 'admin', '2023-04-21 14:32:47', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (137, '生产计划-申请状态', 'mes_plan_sqstatus', '0', 'admin', '2023-04-21 15:07:00', 'admin', '2023-04-21 15:07:52', NULL);
INSERT INTO `sys_dict_type` VALUES (138, '生产计划-审核状态', 'mes_plan_shstatus', '0', 'admin', '2023-04-21 15:09:33', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (139, '出库申请-业务类型', 'wms_ountbound_application_type', '0', 'admin', '2023-04-22 19:03:38', 'admin', '2023-04-22 19:03:47', NULL);
INSERT INTO `sys_dict_type` VALUES (140, '出库申请-合同类型', 'wms_outbound_application_order_type', '0', 'admin', '2023-04-22 19:09:27', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (141, '出库申请-申请状态', 'wms_outbound_application_application_status', '0', 'admin', '2023-04-23 09:48:12', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (142, '出库申请-审核状态', 'wms_outbound_application_approved_status', '0', 'admin', '2023-04-23 09:49:33', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (143, '出库申请-单据状态', 'wms_outbound_application_status', '0', 'admin', '2023-04-23 09:50:11', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (144, '生产计划审核-审核状态', 'mytask_plan_status', '0', 'admin', '2023-04-23 10:48:04', 'admin', '2023-04-23 10:48:25', NULL);
INSERT INTO `sys_dict_type` VALUES (145, '我的任务-申请类型', 'mytask_apply_type', '0', 'admin', '2023-04-24 11:01:52', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (146, '运输管理-配送管理-配送状态', 'wms_delivery_status', '0', 'admin', '2023-04-24 11:03:40', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (147, '补货申请-状态', 'wms_replenishment_application_status', '0', 'admin', '2023-04-25 13:25:41', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (148, '补货申请-申请状态', 'wms_replenishment_application_application_status', '0', 'admin', '2023-04-25 13:26:49', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (149, '补货申请-审核状态', 'wms_replenishment_application_approved_status', '0', 'admin', '2023-04-25 13:27:39', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (150, '数据可视化-库存状态', 'dv_inventory_status', '0', 'admin', '2023-04-25 16:19:22', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (151, '入库申请-关联单号', 'wms_warehousing_application_document_no', '0', 'admin', '2023-04-25 17:18:52', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (152, '盘点信息-盘点类型', 'wms_inventory_information_inventory_type', '0', 'admin', '2023-04-27 15:44:53', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-04-19 10:30:51', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 218 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-05 17:05:37');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-05 17:05:41');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-06 10:30:02');
INSERT INTO `sys_logininfor` VALUES (4, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-05-06 10:30:11');
INSERT INTO `sys_logininfor` VALUES (5, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-05-06 10:30:11');
INSERT INTO `sys_logininfor` VALUES (6, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-06 10:30:16');
INSERT INTO `sys_logininfor` VALUES (7, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 10:30:20');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 11:19:21');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-06 11:34:36');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 11:34:39');
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 12:24:21');
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-06 12:24:33');
INSERT INTO `sys_logininfor` VALUES (13, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-06 12:24:57');
INSERT INTO `sys_logininfor` VALUES (14, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 12:25:05');
INSERT INTO `sys_logininfor` VALUES (15, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 13:14:53');
INSERT INTO `sys_logininfor` VALUES (16, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 13:22:22');
INSERT INTO `sys_logininfor` VALUES (17, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 13:49:08');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 14:30:29');
INSERT INTO `sys_logininfor` VALUES (19, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 14:40:31');
INSERT INTO `sys_logininfor` VALUES (20, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-06 14:45:03');
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 14:45:12');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 15:00:39');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 15:19:16');
INSERT INTO `sys_logininfor` VALUES (24, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 15:29:40');
INSERT INTO `sys_logininfor` VALUES (25, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 15:40:02');
INSERT INTO `sys_logininfor` VALUES (26, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-06 15:40:03');
INSERT INTO `sys_logininfor` VALUES (27, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 15:40:18');
INSERT INTO `sys_logininfor` VALUES (28, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 15:45:02');
INSERT INTO `sys_logininfor` VALUES (29, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 15:55:24');
INSERT INTO `sys_logininfor` VALUES (30, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-06 15:59:55');
INSERT INTO `sys_logininfor` VALUES (31, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 15:59:58');
INSERT INTO `sys_logininfor` VALUES (32, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-06 16:01:51');
INSERT INTO `sys_logininfor` VALUES (33, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 16:02:01');
INSERT INTO `sys_logininfor` VALUES (34, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 16:12:51');
INSERT INTO `sys_logininfor` VALUES (35, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-06 17:00:41');
INSERT INTO `sys_logininfor` VALUES (36, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 17:00:48');
INSERT INTO `sys_logininfor` VALUES (37, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-06 17:02:36');
INSERT INTO `sys_logininfor` VALUES (38, 'user2', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 17:03:01');
INSERT INTO `sys_logininfor` VALUES (39, 'user2', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-06 17:03:18');
INSERT INTO `sys_logininfor` VALUES (40, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-05-06 17:06:05');
INSERT INTO `sys_logininfor` VALUES (41, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 17:06:09');
INSERT INTO `sys_logininfor` VALUES (42, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 17:13:30');
INSERT INTO `sys_logininfor` VALUES (43, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-06 17:17:26');
INSERT INTO `sys_logininfor` VALUES (44, 'user2', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 17:17:40');
INSERT INTO `sys_logininfor` VALUES (45, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 17:26:19');
INSERT INTO `sys_logininfor` VALUES (46, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-06 17:52:33');
INSERT INTO `sys_logininfor` VALUES (47, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 09:03:28');
INSERT INTO `sys_logininfor` VALUES (48, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 09:04:00');
INSERT INTO `sys_logininfor` VALUES (49, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 09:45:00');
INSERT INTO `sys_logininfor` VALUES (50, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 09:57:35');
INSERT INTO `sys_logininfor` VALUES (51, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 10:03:08');
INSERT INTO `sys_logininfor` VALUES (52, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-08 10:04:01');
INSERT INTO `sys_logininfor` VALUES (53, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 10:04:05');
INSERT INTO `sys_logininfor` VALUES (54, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 10:12:06');
INSERT INTO `sys_logininfor` VALUES (55, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 11:18:26');
INSERT INTO `sys_logininfor` VALUES (56, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 11:21:14');
INSERT INTO `sys_logininfor` VALUES (57, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 13:11:50');
INSERT INTO `sys_logininfor` VALUES (58, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 13:22:21');
INSERT INTO `sys_logininfor` VALUES (59, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 13:29:29');
INSERT INTO `sys_logininfor` VALUES (60, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 13:48:50');
INSERT INTO `sys_logininfor` VALUES (61, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 14:11:48');
INSERT INTO `sys_logininfor` VALUES (62, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-08 14:18:24');
INSERT INTO `sys_logininfor` VALUES (63, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 14:18:28');
INSERT INTO `sys_logininfor` VALUES (64, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 14:29:58');
INSERT INTO `sys_logininfor` VALUES (65, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 14:46:04');
INSERT INTO `sys_logininfor` VALUES (66, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 15:00:44');
INSERT INTO `sys_logininfor` VALUES (67, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 15:26:16');
INSERT INTO `sys_logininfor` VALUES (68, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 15:37:43');
INSERT INTO `sys_logininfor` VALUES (69, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 15:43:37');
INSERT INTO `sys_logininfor` VALUES (70, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 16:15:29');
INSERT INTO `sys_logininfor` VALUES (71, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-08 17:12:55');
INSERT INTO `sys_logininfor` VALUES (72, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 17:12:59');
INSERT INTO `sys_logininfor` VALUES (73, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 17:24:56');
INSERT INTO `sys_logininfor` VALUES (74, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-08 17:34:53');
INSERT INTO `sys_logininfor` VALUES (75, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 17:34:59');
INSERT INTO `sys_logininfor` VALUES (76, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 09:10:45');
INSERT INTO `sys_logininfor` VALUES (77, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 09:13:49');
INSERT INTO `sys_logininfor` VALUES (78, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 09:17:00');
INSERT INTO `sys_logininfor` VALUES (79, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-09 09:24:18');
INSERT INTO `sys_logininfor` VALUES (80, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 09:24:24');
INSERT INTO `sys_logininfor` VALUES (81, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 09:27:25');
INSERT INTO `sys_logininfor` VALUES (82, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 10:11:48');
INSERT INTO `sys_logininfor` VALUES (83, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 10:28:14');
INSERT INTO `sys_logininfor` VALUES (84, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 10:33:53');
INSERT INTO `sys_logininfor` VALUES (85, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 10:43:31');
INSERT INTO `sys_logininfor` VALUES (86, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 10:46:28');
INSERT INTO `sys_logininfor` VALUES (87, 'admin', '192.168.3.137', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 11:04:12');
INSERT INTO `sys_logininfor` VALUES (88, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 11:34:01');
INSERT INTO `sys_logininfor` VALUES (89, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 13:20:50');
INSERT INTO `sys_logininfor` VALUES (90, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 13:29:07');
INSERT INTO `sys_logininfor` VALUES (91, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 13:32:11');
INSERT INTO `sys_logininfor` VALUES (92, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 13:34:04');
INSERT INTO `sys_logininfor` VALUES (93, 'admin', '192.168.3.137', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 14:05:10');
INSERT INTO `sys_logininfor` VALUES (94, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-09 14:46:37');
INSERT INTO `sys_logininfor` VALUES (95, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 14:46:41');
INSERT INTO `sys_logininfor` VALUES (96, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 14:50:29');
INSERT INTO `sys_logininfor` VALUES (97, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-09 15:14:19');
INSERT INTO `sys_logininfor` VALUES (98, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 15:14:27');
INSERT INTO `sys_logininfor` VALUES (99, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 15:38:02');
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 16:19:09');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 16:46:56');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 17:08:00');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 17:39:31');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-05-09 18:05:39');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-09 18:05:44');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 09:00:06');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-10 09:03:06');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 09:03:12');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 09:11:20');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 09:21:52');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 10:21:03');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 10:21:37');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 11:06:27');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 13:48:06');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 13:49:38');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 14:41:38');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 16:21:00');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 16:34:40');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 16:55:11');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 17:08:53');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 18:05:39');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-11 09:08:10');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-11 09:15:03');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-11 09:15:07');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-11 09:16:06');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-11 10:17:36');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-11 10:28:17');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-11 11:23:26');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-11 13:48:54');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-11 14:46:15');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-11 15:03:49');
INSERT INTO `sys_logininfor` VALUES (132, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '对不起，您的账号：user1 已停用', '2023-05-11 15:03:57');
INSERT INTO `sys_logininfor` VALUES (133, 'user2', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-11 15:04:05');
INSERT INTO `sys_logininfor` VALUES (134, 'user2', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-11 15:04:09');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-11 15:43:43');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-11 15:44:56');
INSERT INTO `sys_logininfor` VALUES (137, 'user1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-11 15:45:13');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-11 16:54:20');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-11 17:11:41');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-11 17:33:09');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-11 18:12:34');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-12 09:28:51');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-12 10:30:21');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-12 10:53:50');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-05-12 14:25:04');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-12 14:25:10');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-12 14:58:03');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-12 15:06:20');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-12 15:44:25');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-12 17:07:31');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-12 17:47:20');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-12 17:54:37');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-12 17:54:45');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-12 17:55:35');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-12 17:55:40');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-12 17:55:46');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-12 17:55:52');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-13 09:04:34');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-13 09:04:56');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-13 09:05:13');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-13 09:07:31');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-13 09:13:19');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-13 09:13:37');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-13 09:19:45');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-13 09:34:24');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-13 09:41:41');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-13 09:44:16');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-13 09:58:15');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-13 09:58:42');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-13 09:59:52');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-13 09:59:57');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-13 10:06:58');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-13 11:04:59');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-13 13:37:03');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-13 13:37:50');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-13 15:04:41');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 10:30:25');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 10:53:06');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-16 11:00:03');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 13:15:44');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 14:47:58');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 15:00:15');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 15:26:37');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-16 15:57:46');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 16:00:43');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-16 16:22:09');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 16:27:39');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-16 17:14:56');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-16 17:15:36');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-16 17:18:03');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-16 17:20:12');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Robot/Spider', 'Unknown', '0', '登录成功', '2023-05-16 17:20:37');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 17:47:32');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-16 17:48:11');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 17:55:29');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 17:55:49');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-22 17:09:12');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '192.168.3.39', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-22 17:21:02');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-22 20:30:24');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-22 20:50:20');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-22 23:19:08');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-31 09:51:42');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-05 16:07:14');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-05 17:08:02');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-06 10:24:41');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 09:21:46');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 14:36:18');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 15:46:39');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 15:54:49');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 16:35:36');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '192.168.3.14', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-08 09:13:15');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-08 13:54:01');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-08 14:06:40');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-08 14:23:33');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-08 14:23:34');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-09 09:05:44');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-16 16:59:46');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2093 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 4, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-04-19 10:30:51', 'admin', '2023-05-16 18:01:13', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2023-04-19 10:30:51', 'admin', '2023-05-05 16:50:26', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2023-04-19 10:30:51', 'admin', '2023-05-16 18:00:31', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '1', '0', 'system:user:list', 'user', 'admin', '2023-04-19 10:30:51', 'admin', '2023-05-22 23:31:48', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '1', '0', 'system:role:list', 'peoples', 'admin', '2023-04-19 10:30:51', 'admin', '2023-05-22 23:30:58', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-04-19 10:30:51', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '1', '0', 'system:dept:list', 'tree', 'admin', '2023-04-19 10:30:51', 'admin', '2023-05-22 23:28:49', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '1', '0', 'system:post:list', 'post', 'admin', '2023-04-19 10:30:51', 'admin', '2023-05-22 23:29:59', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '1', '0', 'system:dict:list', 'dict', 'admin', '2023-04-19 10:30:51', 'admin', '2023-05-22 23:29:03', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '1', '0', 'system:config:list', 'edit', 'admin', '2023-04-19 10:30:51', 'admin', '2023-05-22 23:29:09', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '1', '0', 'system:notice:list', 'message', 'admin', '2023-04-19 10:30:51', 'admin', '2023-05-22 23:29:19', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '1', '0', '', 'log', 'admin', '2023-04-19 10:30:51', 'admin', '2023-05-22 23:29:28', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-04-19 10:30:51', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-04-19 10:30:51', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-04-19 10:30:51', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-04-19 10:30:51', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-04-19 10:30:51', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-04-19 10:30:51', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-04-19 10:30:51', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-04-19 10:30:51', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-04-19 10:30:51', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-04-19 10:30:51', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-04-19 10:30:51', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '智能仓储WMS', 0, 1, 'wms', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'excel', 'admin', '2023-04-19 10:47:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '物料档案', 2000, 1, 'material', 'wms/material/index', NULL, 1, 0, 'C', '0', '0', '', 'documentation', 'admin', '2023-04-19 11:01:29', 'admin', '2023-04-19 15:09:27', '');
INSERT INTO `sys_menu` VALUES (2002, '物料分类', 2000, 2, 'classify', 'wms/classify/index', NULL, 1, 0, 'C', '0', '0', 'wms:classify:list', 'drag', 'admin', '2023-04-19 11:16:26', 'admin', '2023-05-05 13:51:35', '');
INSERT INTO `sys_menu` VALUES (2003, '制造执行MES', 0, 1, 'mes', NULL, NULL, 1, 0, 'M', '0', '0', '', 'example', 'admin', '2023-04-19 15:20:21', 'admin', '2023-04-19 15:20:33', '');
INSERT INTO `sys_menu` VALUES (2004, '项目维护', 2003, 1, 'project/maintenance', 'mes/maintenance/index', NULL, 1, 0, 'C', '0', '0', '', 'documentation', 'admin', '2023-04-19 15:23:20', 'admin', '2023-04-19 15:38:26', '');
INSERT INTO `sys_menu` VALUES (2005, '工厂建模', 2003, 2, 'factory/mode', 'mes/factory/index', NULL, 1, 0, 'C', '0', '0', '', 'excel', 'admin', '2023-04-19 15:24:53', 'admin', '2023-04-20 17:09:09', '');
INSERT INTO `sys_menu` VALUES (2006, '工艺建模', 2003, 3, 'technology/mode', 'mes/technology/index', NULL, 1, 0, 'C', '0', '0', '', 'international', 'admin', '2023-04-19 15:27:15', 'admin', '2023-04-19 16:33:21', '');
INSERT INTO `sys_menu` VALUES (2007, '供应链SCM', 0, 1, 'scm', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'user', 'admin', '2023-04-19 16:44:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '销售管理', 2007, 1, 'sale', NULL, NULL, 1, 0, 'M', '0', '0', '', 'guide', 'admin', '2023-04-19 16:45:18', 'admin', '2023-04-19 16:52:22', '');
INSERT INTO `sys_menu` VALUES (2009, '客户档案', 2008, 1, 'custom', 'scm/custom/index', NULL, 1, 0, 'C', '0', '0', '', '#', 'admin', '2023-04-19 16:46:25', 'admin', '2023-04-19 16:59:00', '');
INSERT INTO `sys_menu` VALUES (2010, '销售订单', 2008, 2, 'order', 'scm/order/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-19 18:57:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '设备信息', 2003, 4, 'device/information', 'mes/information/index', NULL, 1, 0, 'C', '0', '0', '', 'table', 'admin', '2023-04-20 09:38:37', 'admin', '2023-04-20 09:59:28', '');
INSERT INTO `sys_menu` VALUES (2012, '我的任务', 0, 1, 'mytask', NULL, NULL, 1, 0, 'M', '0', '0', '', 'peoples', 'admin', '2023-04-20 09:42:24', 'admin', '2023-04-20 09:44:17', '');
INSERT INTO `sys_menu` VALUES (2013, '入库申请审核', 2012, 1, 'warehousingApplication', 'mytask/warehousingApplication/index', NULL, 1, 0, 'C', '0', '0', '', 'drag', 'admin', '2023-04-20 09:43:21', 'admin', '2023-04-28 15:33:29', '');
INSERT INTO `sys_menu` VALUES (2014, '仓库信息', 2000, 3, 'warehouse', 'wms/warehouse/index', NULL, 1, 0, 'C', '0', '0', NULL, 'table', 'admin', '2023-04-20 09:47:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '库区管理', 2000, 4, 'area', 'wms/area/index', NULL, 1, 0, 'C', '1', '0', '', 'chart', 'admin', '2023-04-20 10:39:12', 'admin', '2023-04-20 11:21:52', '');
INSERT INTO `sys_menu` VALUES (2017, '产品建模', 2003, 5, '/product/mode', 'mes/product/index', NULL, 1, 0, 'C', '0', '0', NULL, 'shopping', 'admin', '2023-04-20 12:44:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '入库申请', 2000, 6, 'warehousing_application', 'wms/warehousingApplication/index', NULL, 1, 0, 'C', '0', '0', '', 'component', 'admin', '2023-04-20 13:42:08', 'admin', '2023-04-20 19:31:25', '');
INSERT INTO `sys_menu` VALUES (2019, '销售合同', 2008, 3, 'contract', 'scm/contract/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-20 13:48:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '物料库存', 2000, 5, 'inventory', 'wms/inventory/index', NULL, 1, 0, 'C', '0', '0', 'wms:material:list', 'education', 'admin', '2023-04-20 14:58:06', 'admin', '2023-05-05 13:51:13', '');
INSERT INTO `sys_menu` VALUES (2021, '销售发货', 2008, 4, 'delivery', 'scm/delivery/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-20 17:32:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '智造双碳', 0, 1, 'dc', NULL, NULL, 1, 0, 'M', '0', '0', '', 'guide', 'admin', '2023-04-20 17:44:19', 'admin', '2023-05-22 23:30:46', '');
INSERT INTO `sys_menu` VALUES (2023, '能效预警', 2022, 1, 'prewarning', 'dc/prewarning/index', NULL, 1, 0, 'C', '0', '0', '', 'server', 'admin', '2023-04-20 17:54:41', 'admin', '2023-04-20 17:55:39', '');
INSERT INTO `sys_menu` VALUES (2024, 'BOM管理', 2003, 6, '/bom/manage', 'mes/bom/index', NULL, 1, 0, 'C', '0', '0', NULL, 'zip', 'admin', '2023-04-20 19:08:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '运输管理', 2000, 11, 'transport', NULL, NULL, 1, 0, 'M', '0', '0', '', 'chart', 'admin', '2023-04-20 19:26:57', 'admin', '2023-04-20 19:31:49', '');
INSERT INTO `sys_menu` VALUES (2026, '销售退货', 2008, 5, 'return', 'scm/return/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-20 19:27:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '承运申请', 2025, 0, 'carrierApplication', 'wms/carrierApplication/index', NULL, 1, 0, 'C', '0', '0', NULL, 'dict', 'admin', '2023-04-20 19:28:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '配送管理', 2025, 1, 'distribution', 'wms/distribution/index', NULL, 1, 0, 'C', '0', '0', NULL, 'drag', 'admin', '2023-04-20 19:29:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '车辆调度', 2025, 2, 'vehicleScheduling', 'wms/vehicleScheduling/index', NULL, 1, 0, 'C', '0', '0', NULL, 'time-range', 'admin', '2023-04-20 19:30:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '出库申请', 2000, 7, 'outboundApplication', 'wms/outboundApplication/index', NULL, 1, 0, 'C', '0', '0', NULL, 'tool', 'admin', '2023-04-20 19:32:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '补货申请', 2000, 8, 'replenishmentApplication', 'wms/replenishmentApplication/index', NULL, 1, 0, 'C', '0', '0', NULL, 'star', 'admin', '2023-04-20 19:34:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '盘点信息', 2000, 9, 'inventoryInformation', 'wms/inventoryInformation/index', NULL, 1, 0, 'C', '0', '0', NULL, 'size', 'admin', '2023-04-20 19:35:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '移库信息', 2000, 10, 'relocationInformation', 'wms/relocation/index', NULL, 1, 0, 'C', '0', '0', '', 'skill', 'admin', '2023-04-20 19:36:17', 'admin', '2023-04-20 20:06:39', '');
INSERT INTO `sys_menu` VALUES (2034, '计划排产', 2003, 7, '/planned/production', 'mes/production/index', NULL, 1, 0, 'C', '0', '0', NULL, 'education', 'admin', '2023-04-21 09:42:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '销售报表', 2007, 2, 'table', NULL, NULL, 1, 0, 'M', '0', '0', '', 'chart', 'admin', '2023-04-21 10:10:18', 'admin', '2023-04-21 10:24:55', '');
INSERT INTO `sys_menu` VALUES (2036, '销售台账', 2035, 1, 'bill', 'scm/bill/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-21 10:14:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '领料申请', 2003, 8, '/material/apply', 'mes/apply/index', NULL, 1, 0, 'C', '0', '0', NULL, 'time', 'admin', '2023-04-21 11:01:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '销售计划', 2008, 5, 'plan', 'scm/plan/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-21 11:01:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '生产完工单', 2003, 9, '/production/completion', 'mes/completion/index', NULL, 1, 0, 'C', '0', '0', NULL, 'date', 'admin', '2023-04-21 13:27:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '财务管理', 2007, 3, 'bill', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'money', 'admin', '2023-04-21 13:38:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '客户对账', 2040, 1, 'clientBill', 'scm/clientBill/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-21 13:38:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '供应商对账', 2040, 2, 'supplierBill', 'scm/supplierBill/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-21 13:52:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '作业装配', 2003, 10, '/job/assembly', 'mes/assembly/index', NULL, 1, 0, 'C', '0', '0', NULL, 'textarea', 'admin', '2023-04-21 14:25:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '采购管理', 2007, 4, 'purchase', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2023-04-21 14:28:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '供应商', 2044, 1, 'supplier', 'scm/supplier/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-21 14:29:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '生产计划', 2003, 11, '/production/plan', 'mes/plan/index', NULL, 1, 0, 'C', '0', '0', NULL, 'zip', 'admin', '2023-04-21 14:41:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '采购申请', 2044, 2, 'purchaseApply', 'scm/purchaseApply/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-21 15:05:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '采购计划', 2044, 3, 'purchasePlan', 'scm/purchasePlan/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-21 16:36:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '采购合同', 2044, 4, 'purchaseContract', 'scm/purchaseContract/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-21 17:02:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '统计分析', 2007, 6, 'analyse', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'international', 'admin', '2023-04-21 17:44:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '采购入库退货报表', 2050, 1, 'returnTable', 'scm/returnTable/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-21 17:45:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '采购到货', 2044, 5, 'purchaseArrival', 'scm/purchaseArrival/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-22 09:45:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '采购退货', 2044, 6, 'purchaseReturn', 'scm/purchaseReturn/index', NULL, 1, 0, 'C', '0', '0', NULL, '#', 'admin', '2023-04-22 10:47:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '销售订单审核', 2012, 12, 'saleOrder', 'mytask/saleOrder/index', NULL, 1, 0, 'C', '0', '0', '', 'cascader', 'admin', '2023-04-22 14:28:34', 'admin', '2023-04-28 10:58:25', '');
INSERT INTO `sys_menu` VALUES (2057, '质检标准', 2064, 9, 'standards', 'mes/standards/index', NULL, 1, 0, 'C', '0', '0', '', 'documentation', 'admin', '2023-04-22 15:22:53', 'admin', '2023-05-05 11:16:48', '');
INSERT INTO `sys_menu` VALUES (2058, '销售合同审核', 2012, 10, 'saleContract', 'mytask/saleContract/index', NULL, 1, 0, 'C', '0', '0', '', 'chart', 'admin', '2023-04-22 15:44:05', 'admin', '2023-04-28 10:57:59', '');
INSERT INTO `sys_menu` VALUES (2059, '数据可视化', 0, 2, 'visualized', 'visualized/index', NULL, 1, 1, 'C', '1', '0', '', 'chart', 'admin', '2023-04-22 16:35:33', 'admin', '2023-05-16 18:00:23', '');
INSERT INTO `sys_menu` VALUES (2060, '生产计划审核', 2012, 11, 'mytask/production/plan', 'mytask/plan/index', NULL, 1, 0, 'C', '0', '0', '', 'date', 'admin', '2023-04-22 17:47:18', 'admin', '2023-04-28 10:58:14', '');
INSERT INTO `sys_menu` VALUES (2061, '来料检验', 2064, 12, 'inspector', 'mes/inspector/index', NULL, 1, 0, 'C', '0', '0', '', 'build', 'admin', '2023-04-22 18:42:25', 'admin', '2023-04-23 16:31:56', '');
INSERT INTO `sys_menu` VALUES (2062, '领料申请审核', 2012, 5, '/mytask/material/apply', 'mytask/apply/index', NULL, 1, 0, 'C', '0', '0', '', 'cascader', 'admin', '2023-04-23 13:26:19', 'admin', '2023-04-23 13:37:40', '');
INSERT INTO `sys_menu` VALUES (2063, '供应商审核', 2012, 6, '/supplier/audit', 'mytask/supplier/index', NULL, 1, 0, 'C', '0', '0', '', 'dict', 'admin', '2023-04-23 15:16:08', 'admin', '2023-04-23 15:23:07', '');
INSERT INTO `sys_menu` VALUES (2064, '质量管理', 2003, 15, '/qms', NULL, NULL, 1, 0, 'M', '0', '0', '', 'cascader', 'admin', '2023-04-23 16:31:36', 'admin', '2023-04-23 16:32:11', '');
INSERT INTO `sys_menu` VALUES (2065, '产品检验', 2064, 1, 'productInspector', 'mes/productInspector/index', NULL, 1, 0, 'C', '0', '0', NULL, 'dict', 'admin', '2023-04-23 16:33:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '采购计划审核', 2012, 7, '/procurement/plan', 'mytask/procurementPlan/index', NULL, 1, 0, 'C', '0', '0', '', 'date-range', 'admin', '2023-04-24 10:01:24', 'admin', '2023-04-28 10:53:05', '');
INSERT INTO `sys_menu` VALUES (2067, '采购申请审核', 2012, 8, '/procurement/apply', 'mytask/procurementApply/index', NULL, 1, 0, 'C', '0', '0', '', 'tool', 'admin', '2023-04-24 10:50:51', 'admin', '2023-04-24 10:57:44', '');
INSERT INTO `sys_menu` VALUES (2068, '采购合同审核', 2012, 9, '/procurement/contract', 'mytask/procurementContract/index', NULL, 1, 0, 'C', '0', '0', '', 'documentation', 'admin', '2023-04-24 13:21:44', 'admin', '2023-04-24 13:22:25', '');
INSERT INTO `sys_menu` VALUES (2069, '质量报告', 2064, 1, 'quality', 'mes/quality/index', NULL, 1, 0, 'C', '0', '0', '', 'clipboard', 'admin', '2023-04-24 17:08:54', 'admin', '2023-04-24 17:10:35', '');
INSERT INTO `sys_menu` VALUES (2070, '承运申请审核', 2012, 3, '/carrier/apply', 'mytask/carrier/index', NULL, 1, 0, 'C', '0', '0', '', 'icon', 'admin', '2023-04-25 09:58:39', 'admin', '2023-04-28 10:56:02', '');
INSERT INTO `sys_menu` VALUES (2071, '数据可视化管理', 0, 1, '/data/visualization/manage', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'color', 'admin', '2023-04-25 14:04:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '能耗管理', 2071, 1, '/energy/consumption/overview', 'dv/energyConsumption/index', NULL, 1, 0, 'C', '0', '0', '', 'dashboard', 'admin', '2023-04-25 14:06:40', 'admin', '2023-04-25 16:15:29', '');
INSERT INTO `sys_menu` VALUES (2073, '生产采样', 2064, 1, 'sampling', 'mes/productionSampling/index', NULL, 1, 0, 'C', '0', '0', NULL, 'date', 'admin', '2023-04-25 15:24:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2074, '库存管理', 2071, 2, '/inventory/manage', 'dv/inventory/index', NULL, 1, 0, 'C', '0', '0', NULL, 'dict', 'admin', '2023-04-25 16:16:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2075, '质量追溯', 2064, 1, 'traceability', 'mes/traceability/index', NULL, 1, 0, 'C', '0', '0', NULL, 'component', 'admin', '2023-04-25 18:01:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2076, '防错管理', 2064, 1, 'errorProofing', 'mes/errorProofing/index', NULL, 1, 0, 'C', '0', '0', '', 'bug', 'admin', '2023-04-25 18:09:23', 'admin', '2023-04-25 18:09:32', '');
INSERT INTO `sys_menu` VALUES (2077, '数据中心', 0, 2, 'dataCenter', 'dataCenter/index', NULL, 1, 1, 'C', '0', '0', '', 'log', 'admin', '2023-04-26 09:12:17', 'admin', '2023-05-16 18:01:03', '');
INSERT INTO `sys_menu` VALUES (2078, '生产统计', 2071, 3, '/production/statistics', 'dv/statistics/index', NULL, 1, 0, 'C', '0', '0', NULL, 'language', 'admin', '2023-04-26 10:51:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2079, '销售管理', 2071, 4, '/sale/manage', 'dv/sale/index', NULL, 1, 0, 'C', '0', '0', NULL, 'cascader', 'admin', '2023-04-26 14:41:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2080, '碳排放', 2071, 5, '/carbon/emission', 'dv/carbon/index', NULL, 1, 0, 'C', '0', '0', NULL, 'monitor', 'admin', '2023-04-26 14:54:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2081, '产品统计', 2092, 1, 'productStatistics', 'scm/productStatistics/index', NULL, 1, 0, 'C', '0', '0', '', 'education', 'admin', '2023-04-26 17:27:32', 'admin', '2023-05-04 15:51:52', '');
INSERT INTO `sys_menu` VALUES (2082, '采购入库统计', 2092, 1, 'purchaseReceipt', 'scm/purchaseReceipt/index', NULL, 1, 0, 'C', '0', '0', '', 'component', 'admin', '2023-04-26 17:39:30', 'admin', '2023-05-04 15:52:14', '');
INSERT INTO `sys_menu` VALUES (2083, '销售发退货统计', 2050, 1, 'monthly', 'scm/monthly/index', NULL, 1, 0, 'C', '0', '0', '', 'date', 'admin', '2023-04-27 09:03:24', 'admin', '2023-05-04 15:52:42', '');
INSERT INTO `sys_menu` VALUES (2084, '能耗数据采集', 2022, 2, 'collection', 'dc/collection/index', NULL, 1, 0, 'C', '0', '0', '', 'tab', 'admin', '2023-04-27 16:03:10', 'admin', '2023-04-27 17:19:57', '');
INSERT INTO `sys_menu` VALUES (2085, '固定碳排放', 2022, 3, 'emissions', 'dc/emissions/index', NULL, 1, 0, 'C', '0', '0', '', 'message', 'admin', '2023-04-27 17:10:25', 'admin', '2023-04-27 17:20:33', '');
INSERT INTO `sys_menu` VALUES (2086, '出库申请审核', 2012, 2, 'outbound', 'mytask/outbound/index', NULL, 1, 0, 'C', '0', '0', NULL, 'tool', 'admin', '2023-04-28 10:55:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2087, '补货申请审核', 2012, 4, 'replenishment', 'mytask/replenishment/index', NULL, 1, 0, 'C', '0', '0', NULL, 'tree-table', 'admin', '2023-04-28 10:57:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2088, '报表管理', 2000, 12, 'report', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'tree', 'admin', '2023-05-04 10:07:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2089, '库存明细报表', 2088, 1, 'inventoryReport', 'wms/inventoryDetails/index', NULL, 1, 0, 'C', '0', '0', '', 'table', 'admin', '2023-05-04 10:09:27', 'admin', '2023-05-04 10:44:01', '');
INSERT INTO `sys_menu` VALUES (2090, '基础数据', 2000, 0, 'basicData', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'clipboard', 'admin', '2023-05-04 14:49:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2091, '货主', 2090, 1, 'cargoOwner', 'wms/cargoOwner/index', NULL, 1, 0, 'C', '0', '0', NULL, 'dict', 'admin', '2023-05-04 14:50:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2092, '采购报表', 2007, 2, 'procureReport', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2023-05-04 15:51:22', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '操作日志', 9, 'com.ruoyi.web.controller.monitor.SysOperlogController.clean()', 'DELETE', 1, 'admin', NULL, '/monitor/operlog/clean', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-05 16:52:02', 167);
INSERT INTO `sys_oper_log` VALUES (2, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-04-19 10:30:51\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"root@qq.com\",\"loginDate\":\"2023-04-19 10:30:51\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"root\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-05 17:01:17', 68);
INSERT INTO `sys_oper_log` VALUES (3, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"双碳系统\",\"email\":\"admin@qq.com\",\"leader\":\"admin\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-05 17:02:48', 27);
INSERT INTO `sys_oper_log` VALUES (4, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"北京总公司\",\"email\":\"admin@qq.com\",\"leader\":\"admin\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"双碳系统\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-05 17:03:15', 43);
INSERT INTO `sys_oper_log` VALUES (5, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"大连分公司\",\"email\":\"admin@qq.com\",\"leader\":\"admin\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"双碳系统\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-05 17:03:28', 44);
INSERT INTO `sys_oper_log` VALUES (6, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/05/05/blob_20230505170518A001.png\",\"code\":200}', 0, NULL, '2023-05-05 17:05:18', 90);
INSERT INTO `sys_oper_log` VALUES (7, '智造双碳—能效预警', 1, 'com.ruoyi.dc.controller.DCEnergyPrewarningController.add()', 'POST', 1, 'user1', NULL, '/dc/prewarning', '127.0.0.1', '内网IP', '{\"monitoringPointsAddress\":\"西藏林芝市\",\"monitoringPointsName\":\"西藏检测点\",\"params\":{},\"realTimePower\":100,\"realTimeVolt\":100,\"reportTime\":\"2023-05-06\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 10:33:41', 42);
INSERT INTO `sys_oper_log` VALUES (8, '智造双碳—能效预警', 1, 'com.ruoyi.dc.controller.DCEnergyPrewarningController.add()', 'POST', 1, 'user1', NULL, '/dc/prewarning', '127.0.0.1', '内网IP', '{\"monitoringPointsAddress\":\"test1\",\"monitoringPointsName\":\"111\",\"params\":{},\"realTimePower\":100,\"realTimeVolt\":100,\"reportTime\":\"2023-05-06\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:50:53', 48);
INSERT INTO `sys_oper_log` VALUES (9, '智造双碳—能效预警', 2, 'com.ruoyi.dc.controller.DCEnergyPrewarningController.edit()', 'PUT', 1, 'user1', NULL, '/dc/prewarning', '127.0.0.1', '内网IP', '{\"id\":4,\"monitoringPointsAddress\":\"test1\",\"monitoringPointsName\":\"111\",\"params\":{},\"realTimePower\":100,\"realTimeVolt\":100,\"reportTime\":\"2023-05-06\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 13:51:03', 19);
INSERT INTO `sys_oper_log` VALUES (10, '项目维护', 3, 'com.ruoyi.mes.controller.MesProjectMaintenanceController.remove()', 'DELETE', 1, 'user1', NULL, '/mes/maintenance/1', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 13:53:55', 50);
INSERT INTO `sys_oper_log` VALUES (11, '项目维护', 1, 'com.ruoyi.mes.controller.MesProjectMaintenanceController.add()', 'POST', 1, 'user1', NULL, '/mes/maintenance', '127.0.0.1', '内网IP', '{\"endDate\":\"2023-05-06\",\"params\":{},\"projectHeader\":\"小李\",\"projectName\":\"电脑维护\",\"startDate\":\"2023-05-05\",\"status\":0}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 13:54:20', 30);
INSERT INTO `sys_oper_log` VALUES (12, '项目维护', 2, 'com.ruoyi.mes.controller.MesProjectMaintenanceController.edit()', 'PUT', 1, 'user1', NULL, '/mes/maintenance', '127.0.0.1', '内网IP', '{\"endDate\":\"2023-04-06\",\"id\":2,\"params\":{},\"projectHeader\":\"小李\",\"projectName\":\"电脑维护\",\"startDate\":\"2023-04-06\",\"status\":1}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 14:04:03', 22);
INSERT INTO `sys_oper_log` VALUES (13, '项目维护', 3, 'com.ruoyi.mes.controller.MesProjectMaintenanceController.remove()', 'DELETE', 1, 'user1', NULL, '/mes/maintenance/2', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 14:04:18', 22);
INSERT INTO `sys_oper_log` VALUES (14, '项目维护', 3, 'com.ruoyi.mes.controller.MesProjectMaintenanceController.remove()', 'DELETE', 1, 'user1', NULL, '/mes/maintenance/4', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 14:21:50', 20);
INSERT INTO `sys_oper_log` VALUES (15, '项目维护', 1, 'com.ruoyi.mes.controller.MesProjectMaintenanceController.add()', 'POST', 1, 'user1', NULL, '/mes/maintenance', '127.0.0.1', '内网IP', '{\"endDate\":\"2023-05-06\",\"params\":{},\"projectHeader\":\"test\",\"projectName\":\"test\",\"startDate\":\"2023-05-06\",\"status\":0}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 14:22:13', 19);
INSERT INTO `sys_oper_log` VALUES (16, '防错管理', 5, 'com.ruoyi.mes.controller.ErrorProofingController.export()', 'POST', 1, 'admin', NULL, '/mes/proofing/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-05-06 14:59:59', 550);
INSERT INTO `sys_oper_log` VALUES (17, '智能仓储WMS-出库申请', 2, 'com.ruoyi.wms.controller.WmsOutboundApplicationController.edit()', 'PUT', 1, 'admin', NULL, '/wms/outboundApplication', '127.0.0.1', '内网IP', '{\"application\":1,\"applicationDate\":\"2023-04-30\",\"applicationStatus\":2,\"approved\":2,\"approvedComments\":\"没问题\",\"approvedDate\":\"2023-05-06\",\"approvedStatus\":0,\"contractNo\":\"HG124544\",\"custom\":\"刘先生\",\"documentNo\":\"OA598756\",\"id\":1,\"orderId\":1,\"orderNo\":\"DS215126\",\"orderType\":0,\"params\":{},\"status\":0,\"type\":1,\"wmsOutboundApplicationDetailsList\":[{\"id\":1,\"materialId\":1,\"outboundApplicationId\":1,\"outboundNumber\":200,\"params\":{}}]}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 16:02:54', 85);
INSERT INTO `sys_oper_log` VALUES (18, '智能仓储WMS-出库申请', 2, 'com.ruoyi.wms.controller.WmsOutboundApplicationController.edit()', 'PUT', 1, 'admin', NULL, '/wms/outboundApplication', '127.0.0.1', '内网IP', '{\"application\":2,\"applicationDate\":\"2023-04-23\",\"applicationStatus\":2,\"approved\":1,\"approvedDate\":\"2023-05-06\",\"approvedStatus\":1,\"contractNo\":\"VF632354\",\"custom\":\"张先生\",\"documentNo\":\"OA365987\",\"id\":2,\"orderId\":2,\"orderNo\":\"EW25464\",\"orderType\":0,\"params\":{},\"status\":0,\"type\":0,\"wmsOutboundApplicationDetailsList\":[{\"id\":2,\"materialId\":1,\"outboundApplicationId\":2,\"outboundNumber\":100,\"params\":{}}]}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 16:02:59', 36);
INSERT INTO `sys_oper_log` VALUES (19, '智能仓储WMS-出库申请', 2, 'com.ruoyi.wms.controller.WmsOutboundApplicationController.edit()', 'PUT', 1, 'admin', NULL, '/wms/outboundApplication', '127.0.0.1', '内网IP', '{\"application\":2,\"applicationDate\":\"2023-04-23\",\"applicationStatus\":2,\"approved\":1,\"approvedDate\":\"2023-05-06\",\"approvedStatus\":1,\"contractNo\":\"VF632354\",\"custom\":\"张先生\",\"documentNo\":\"OA365987\",\"id\":2,\"orderId\":2,\"orderNo\":\"EW25464\",\"orderType\":0,\"params\":{},\"status\":0,\"type\":0,\"wmsOutboundApplicationDetailsList\":[{\"id\":2,\"materialId\":1,\"outboundApplicationId\":2,\"outboundNumber\":100,\"params\":{}}]}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 16:03:00', 45);
INSERT INTO `sys_oper_log` VALUES (20, '智造双碳—能效预警', 2, 'com.ruoyi.dc.controller.DCEnergyPrewarningController.edit()', 'PUT', 1, 'user1', NULL, '/dc/prewarning', '127.0.0.1', '内网IP', '{\"id\":4,\"monitoringPointsAddress\":\"A市\",\"monitoringPointsName\":\"1号检测点\",\"params\":{},\"realTimePower\":100,\"realTimeVolt\":100,\"reportTime\":\"2023-05-06\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:34:40', 29);
INSERT INTO `sys_oper_log` VALUES (21, '智造双碳—能效预警', 1, 'com.ruoyi.dc.controller.DCEnergyPrewarningController.add()', 'POST', 1, 'user1', NULL, '/dc/prewarning', '127.0.0.1', '内网IP', '{\"mark\":\"工作正常\",\"monitoringPointsAddress\":\"北京市\",\"monitoringPointsName\":\"北京检测点\",\"params\":{},\"realTimePower\":100,\"realTimeVolt\":220,\"reportTime\":\"2023-05-06\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:35:26', 14);
INSERT INTO `sys_oper_log` VALUES (22, '智造双碳—能效预警', 1, 'com.ruoyi.dc.controller.DCEnergyPrewarningController.add()', 'POST', 1, 'user1', NULL, '/dc/prewarning', '127.0.0.1', '内网IP', '{\"monitoringPointsAddress\":\"A市\",\"monitoringPointsName\":\"2号检测点\",\"params\":{},\"realTimePower\":100,\"realTimeVolt\":220,\"reportTime\":\"2023-05-06\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:36:36', 23);
INSERT INTO `sys_oper_log` VALUES (23, '智造双碳—能效预警', 2, 'com.ruoyi.dc.controller.DCEnergyPrewarningController.edit()', 'PUT', 1, 'user1', NULL, '/dc/prewarning', '127.0.0.1', '内网IP', '{\"id\":4,\"mark\":\"能效异常\",\"monitoringPointsAddress\":\"A市\",\"monitoringPointsName\":\"1号检测点\",\"params\":{},\"realTimePower\":100,\"realTimeVolt\":100,\"reportTime\":\"2023-05-06\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-06 16:36:49', 17);
INSERT INTO `sys_oper_log` VALUES (24, '项目维护', 1, 'com.ruoyi.mes.controller.MesProjectMaintenanceController.add()', 'POST', 1, 'user1', NULL, '/mes/maintenance', '127.0.0.1', '内网IP', '{\"endDate\":\"2023-05-31\",\"params\":{},\"projectHeader\":\"test\",\"projectName\":\"项目巡检\",\"startDate\":\"2023-05-01\",\"status\":1}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 16:50:27', 21);
INSERT INTO `sys_oper_log` VALUES (25, '项目维护', 2, 'com.ruoyi.mes.controller.MesProjectMaintenanceController.edit()', 'PUT', 1, 'user1', NULL, '/mes/maintenance', '127.0.0.1', '内网IP', '{\"endDate\":\"2023-05-31\",\"id\":6,\"params\":{},\"projectHeader\":\"张三\",\"projectName\":\"项目巡检\",\"startDate\":\"2023-05-01\",\"status\":1}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 16:50:57', 16);
INSERT INTO `sys_oper_log` VALUES (26, '智造双碳—双碳管理—能耗数据采集', 1, 'com.ruoyi.dc.controller.DoubleCarbonEnergyCollectionController.add()', 'POST', 1, 'user2', NULL, '/dc/collection', '127.0.0.1', '内网IP', '{\"carbonEmission\":9000,\"carbonEmissionUnit\":300,\"createDate\":\"2023-05-06\",\"equipmentName\":\"集成电板\",\"id\":2,\"params\":{},\"powerConsumption\":20000,\"powerConsumptionUnit\":4500,\"quantity\":2123}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 17:20:26', 20);
INSERT INTO `sys_oper_log` VALUES (27, '智造双碳—双碳管理—能耗数据采集', 2, 'com.ruoyi.dc.controller.DoubleCarbonEnergyCollectionController.edit()', 'PUT', 1, 'user2', NULL, '/dc/collection', '127.0.0.1', '内网IP', '{\"carbonEmission\":9000,\"carbonEmissionUnit\":300,\"createDate\":\"2023-05-06\",\"equipmentName\":\"集成电路板\",\"id\":2,\"params\":{},\"powerConsumption\":20000,\"powerConsumptionUnit\":4500,\"quantity\":2123}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 17:21:23', 17);
INSERT INTO `sys_oper_log` VALUES (28, '智造双碳—双碳管理—能耗数据采集', 2, 'com.ruoyi.dc.controller.DoubleCarbonEnergyCollectionController.edit()', 'PUT', 1, 'user2', NULL, '/dc/collection', '127.0.0.1', '内网IP', '{\"carbonEmissionUnit\":2,\"createDate\":\"2023-04-27\",\"equipmentName\":\"2\",\"id\":1,\"params\":{},\"powerConsumption\":2,\"powerConsumptionUnit\":22,\"quantity\":2}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 17:27:54', 10);
INSERT INTO `sys_oper_log` VALUES (29, '智造双碳—双碳管理—能耗数据采集', 2, 'com.ruoyi.dc.controller.DoubleCarbonEnergyCollectionController.edit()', 'PUT', 1, 'user2', NULL, '/dc/collection', '127.0.0.1', '内网IP', '{\"createDate\":\"2023-04-27\",\"equipmentName\":\"\",\"id\":1,\"params\":{}}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 17:28:07', 13);
INSERT INTO `sys_oper_log` VALUES (30, '智造双碳—双碳管理—能耗数据采集', 2, 'com.ruoyi.dc.controller.DoubleCarbonEnergyCollectionController.edit()', 'PUT', 1, 'user2', NULL, '/dc/collection', '127.0.0.1', '内网IP', '{\"createDate\":\"2023-04-27\",\"equipmentName\":\"\",\"id\":1,\"params\":{}}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 17:28:44', 9);
INSERT INTO `sys_oper_log` VALUES (31, '智造双碳—双碳管理—能耗数据采集', 2, 'com.ruoyi.dc.controller.DoubleCarbonEnergyCollectionController.edit()', 'PUT', 1, 'user2', NULL, '/dc/collection', '127.0.0.1', '内网IP', '{\"equipmentName\":\"\",\"id\":1,\"params\":{}}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 17:29:24', 8);
INSERT INTO `sys_oper_log` VALUES (32, '智造双碳—双碳管理—能耗数据采集', 2, 'com.ruoyi.dc.controller.DoubleCarbonEnergyCollectionController.edit()', 'PUT', 1, 'user2', NULL, '/dc/collection', '127.0.0.1', '内网IP', '{\"carbonEmission\":400,\"carbonEmissionUnit\":20,\"createDate\":\"2023-04-27\",\"equipmentName\":\"设备001\",\"id\":1,\"params\":{},\"powerConsumption\":2000,\"powerConsumptionUnit\":110,\"quantity\":222}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 17:30:37', 12);
INSERT INTO `sys_oper_log` VALUES (33, '智造双碳—双碳管理—能耗数据采集', 2, 'com.ruoyi.dc.controller.DoubleCarbonEnergyCollectionController.edit()', 'PUT', 1, 'user2', NULL, '/dc/collection', '127.0.0.1', '内网IP', '{\"carbonEmission\":400,\"carbonEmissionUnit\":20,\"createDate\":\"2023-04-27\",\"equipmentName\":\"设备001\",\"id\":1,\"params\":{},\"powerConsumption\":2000,\"powerConsumptionUnit\":110,\"quantity\":222}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-06 17:30:38', 9);
INSERT INTO `sys_oper_log` VALUES (34, '项目维护', 5, 'com.ruoyi.mes.controller.MesProjectMaintenanceController.export()', 'POST', 1, 'admin', NULL, '/mes/maintenance/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-05-06 17:38:36', 1082);
INSERT INTO `sys_oper_log` VALUES (35, '项目维护', 2, 'com.ruoyi.mes.controller.MesProjectMaintenanceController.edit()', 'PUT', 1, 'admin', NULL, '/mes/maintenance', '127.0.0.1', '内网IP', '{\"endDate\":\"2023-05-06\",\"id\":5,\"params\":{},\"projectHeader\":\"test\",\"projectName\":\"test\",\"startDate\":\"2023-05-06\",\"status\":0}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-08 09:27:15', 51);
INSERT INTO `sys_oper_log` VALUES (36, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-08 09:45:29', 33);
INSERT INTO `sys_oper_log` VALUES (37, '智造双碳—能效预警', 3, 'com.ruoyi.dc.controller.DCEnergyPrewarningController.remove()', 'DELETE', 1, 'admin', NULL, '/dc/prewarning/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-08 10:10:20', 20);
INSERT INTO `sys_oper_log` VALUES (38, '智能仓储WMS-运输管理-承运申请', 2, 'com.ruoyi.wms.controller.WmsCarrierApplicationController.edit()', 'PUT', 1, 'admin', NULL, '/wms/carrierApplication', '127.0.0.1', '内网IP', '{\"address\":\"北京市平谷区\",\"applicant\":2,\"applicationDate\":\"2023-04-21\",\"applicationStatus\":2,\"approved\":1,\"approvedComments\":\"1\",\"approvedDate\":\"2023-05-08\",\"approvedStatus\":1,\"carrier\":\"顺丰徐\",\"contacts\":\"李先生\",\"custom\":1,\"deliverNo\":\"SF5694\",\"deliveryDate\":\"2023-04-21 00:00:00\",\"distance\":5671,\"documentNo\":\"KL15676\",\"id\":1,\"outboundNo\":\"DW5446\",\"params\":{},\"remark\":\"1\",\"telephone\":\"19865665656\",\"wmsCarrierApplicationDetailsList\":[{\"area\":\"A1区\",\"batchNumber\":\"S59872\",\"carrierApplicationId\":1,\"id\":1,\"material\":\"螺母\",\"materialId\":2,\"materialPrice\":15.00,\"params\":{},\"seat\":\"S5库位\",\"shipmentQuantity\":100,\"warehouse\":\"C1仓库\",\"warehouseAreaId\":2,\"warehouseId\":1,\"warehouseSeatId\":5,\"wmsWarehouseAreaList\":[{\"areaCode\":\"A1\",\"areaName\":\"A1区\",\"id\":1,\"params\":{},\"warehouseId\":1},{\"areaCode\":\"A2\",\"areaName\":\"A2区\",\"id\":2,\"params\":{},\"warehouseId\":1}],\"wmsWarehouseSeatList\":[{\"id\":2,\"params\":{},\"seatCode\":\"S2\",\"seatName\":\"S2库位\",\"warehouseAreaId\":2},{\"id\":5,\"params\":{},\"seatCode\":\"S5\",\"seatName\":\"S5库位\",\"warehouseAreaId\":2}]}]}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-08 14:21:39', 173);
INSERT INTO `sys_oper_log` VALUES (39, '智能仓储WMS-运输管理-承运申请', 2, 'com.ruoyi.wms.controller.WmsCarrierApplicationController.edit()', 'PUT', 1, 'admin', NULL, '/wms/carrierApplication', '127.0.0.1', '内网IP', '{\"address\":\"辽宁省大连市\",\"applicant\":1,\"applicationDate\":\"2023-04-22\",\"applicationStatus\":2,\"approved\":2,\"approvedComments\":\"2\",\"approvedDate\":\"2023-05-08\",\"approvedStatus\":1,\"carrier\":\"京东孔\",\"contacts\":\"王女士\",\"custom\":1,\"deliverNo\":\"FA1256\",\"deliveryDate\":\"2023-04-22 11:12:49\",\"distance\":4587,\"documentNo\":\"JH33689\",\"id\":2,\"outboundNo\":\"FA56498\",\"params\":{},\"remark\":\"2\",\"telephone\":\"18633655555\",\"wmsCarrierApplicationDetailsList\":[{\"area\":\"B1区\",\"batchNumber\":\"S59872\",\"carrierApplicationId\":2,\"id\":2,\"material\":\"螺丝钉\",\"materialId\":1,\"materialPrice\":20.00,\"params\":{},\"seat\":\"S4库位\",\"shipmentQuantity\":100,\"warehouse\":\"C2仓库\",\"warehouseAreaId\":3,\"warehouseId\":2,\"warehouseSeatId\":4,\"wmsWarehouseAreaList\":[{\"areaCode\":\"B1\",\"areaName\":\"B1区\",\"id\":3,\"params\":{},\"warehouseId\":2}],\"wmsWarehouseSeatList\":[{\"id\":4,\"params\":{},\"seatCode\":\"S4\",\"seatName\":\"S4库位\",\"warehouseAreaId\":3}]}]}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-08 14:21:56', 55);
INSERT INTO `sys_oper_log` VALUES (40, '智能仓储WMS-运输管理-承运申请', 2, 'com.ruoyi.wms.controller.WmsCarrierApplicationController.edit()', 'PUT', 1, 'admin', NULL, '/wms/carrierApplication', '127.0.0.1', '内网IP', '{\"address\":\"辽宁省大连市\",\"applicant\":1,\"applicationDate\":\"2023-04-22\",\"applicationStatus\":2,\"approved\":2,\"approvedComments\":\"2\",\"approvedDate\":\"2023-05-08\",\"approvedStatus\":0,\"carrier\":\"京东孔\",\"contacts\":\"王女士\",\"custom\":1,\"deliverNo\":\"FA1256\",\"deliveryDate\":\"2023-04-22 11:12:49\",\"distance\":4587,\"documentNo\":\"JH33689\",\"id\":2,\"outboundNo\":\"FA56498\",\"params\":{},\"remark\":\"2\",\"telephone\":\"18633655555\",\"wmsCarrierApplicationDetailsList\":[{\"area\":\"B1区\",\"batchNumber\":\"S59872\",\"carrierApplicationId\":2,\"id\":2,\"material\":\"螺丝钉\",\"materialId\":1,\"materialPrice\":20.00,\"params\":{},\"seat\":\"S4库位\",\"shipmentQuantity\":100,\"warehouse\":\"C2仓库\",\"warehouseAreaId\":3,\"warehouseId\":2,\"warehouseSeatId\":4,\"wmsWarehouseAreaList\":[{\"areaCode\":\"B1\",\"areaName\":\"B1区\",\"id\":3,\"params\":{},\"warehouseId\":2}],\"wmsWarehouseSeatList\":[{\"id\":4,\"params\":{},\"seatCode\":\"S4\",\"seatName\":\"S4库位\",\"warehouseAreaId\":3}]}]}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-08 14:22:00', 67);
INSERT INTO `sys_oper_log` VALUES (41, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-08 15:38:12', 28);
INSERT INTO `sys_oper_log` VALUES (42, '领料申请', 1, 'com.ruoyi.mytask.controller.MyTaskMaterialApplyController.add()', 'POST', 1, 'admin', NULL, '/mytask/apply', '127.0.0.1', '内网IP', '{\"code\":\"1\",\"id\":5,\"params\":{},\"plan\":\"2\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-09 11:10:59', 64);
INSERT INTO `sys_oper_log` VALUES (43, '领料申请', 1, 'com.ruoyi.mytask.controller.MyTaskMaterialApplyController.add()', 'POST', 1, 'admin', NULL, '/mytask/apply', '127.0.0.1', '内网IP', '{\"code\":\"2\",\"id\":6,\"params\":{},\"plan\":\"3\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-09 11:11:17', 14);
INSERT INTO `sys_oper_log` VALUES (44, '领料申请', 3, 'com.ruoyi.mytask.controller.MyTaskMaterialApplyController.remove()', 'DELETE', 1, 'admin', NULL, '/mytask/apply/5,6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-09 11:16:11', 27);
INSERT INTO `sys_oper_log` VALUES (45, '智造双碳—能效预警', 2, 'com.ruoyi.dc.controller.DCEnergyPrewarningController.edit()', 'PUT', 1, 'admin', NULL, '/dc/prewarning', '127.0.0.1', '内网IP', '{\"id\":3,\"mark\":\"111\",\"monitoringPointsAddress\":\"西藏林芝市\",\"monitoringPointsName\":\"西藏检测点\",\"params\":{},\"realTimePower\":100,\"realTimeVolt\":100,\"reportTime\":\"2023-05-09\",\"status\":\"0\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-09 13:40:12', 42);
INSERT INTO `sys_oper_log` VALUES (46, '物料分类', 1, 'com.ruoyi.wms.controller.WmsMaterialClassifyController.add()', 'POST', 1, 'admin', NULL, '/wms/classify', '127.0.0.1', '内网IP', '{\"children\":[],\"id\":6,\"params\":{},\"pid\":1}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-09 14:20:14', 33);
INSERT INTO `sys_oper_log` VALUES (47, '物料分类', 3, 'com.ruoyi.wms.controller.WmsMaterialClassifyController.remove()', 'DELETE', 1, 'admin', NULL, '/wms/classify/6', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-09 14:20:47', 17);
INSERT INTO `sys_oper_log` VALUES (48, '物料分类', 1, 'com.ruoyi.wms.controller.WmsMaterialClassifyController.add()', 'POST', 1, 'admin', NULL, '/wms/classify', '127.0.0.1', '内网IP', '{\"children\":[],\"id\":7,\"params\":{},\"pid\":2}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-09 14:58:08', 14);
INSERT INTO `sys_oper_log` VALUES (49, '物料分类', 3, 'com.ruoyi.wms.controller.WmsMaterialClassifyController.remove()', 'DELETE', 1, 'admin', NULL, '/wms/classify/7', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-09 16:28:57', 25);
INSERT INTO `sys_oper_log` VALUES (50, '我的任务-采购申请审核', 2, 'com.ruoyi.mytask.controller.MytaskProcurementApplyController.edit()', 'PUT', 1, 'admin', NULL, '/mytask/procurementApply', '127.0.0.1', '内网IP', '{\"applicant\":\"admin\",\"applyCode\":\"PF101\",\"applyDate\":\"2023-04-27\",\"applyStatus\":\"2\",\"applyType\":\"1\",\"auditDate\":\"2023-05-09\",\"auditNote\":\"101\",\"auditStatus\":\"1\",\"auditor\":\"admin\",\"id\":\"1\",\"params\":{},\"planCode\":\"101\",\"replenishmentCode\":\"101\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-09 16:52:03', 59);
INSERT INTO `sys_oper_log` VALUES (51, '我的任务-采购申请审核', 2, 'com.ruoyi.mytask.controller.MytaskProcurementApplyController.edit()', 'PUT', 1, 'admin', NULL, '/mytask/procurementApply', '127.0.0.1', '内网IP', '{\"applicant\":\"admin\",\"applyCode\":\"PF101\",\"applyDate\":\"2023-04-27\",\"applyStatus\":\"2\",\"applyType\":\"1\",\"auditDate\":\"2023-05-09\",\"auditNote\":\"101\",\"auditStatus\":\"0\",\"auditor\":\"admin\",\"id\":\"1\",\"params\":{},\"planCode\":\"101\",\"replenishmentCode\":\"101\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-09 16:52:09', 32);
INSERT INTO `sys_oper_log` VALUES (52, '项目维护', 5, 'com.ruoyi.mes.controller.MesProjectMaintenanceController.export()', 'POST', 1, 'admin', NULL, '/mes/maintenance/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-05-11 09:48:52', 964);
INSERT INTO `sys_oper_log` VALUES (53, '项目维护', 5, 'com.ruoyi.mes.controller.MesProjectMaintenanceController.export()', 'POST', 1, 'admin', NULL, '/mes/maintenance/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-05-11 09:49:01', 75);
INSERT INTO `sys_oper_log` VALUES (54, '智能仓储WMS-运输管理-配送管理', 2, 'com.ruoyi.wms.controller.WmsDistributionController.edit()', 'PUT', 1, 'admin', NULL, '/wms/distribution', '127.0.0.1', '内网IP', '{\"arrivalTime\":\"2023-04-24\",\"carNumber\":\"京A89868\",\"carrierApplicationId\":1,\"customId\":1,\"deliveryAddress\":\"北京市平谷区\",\"deliveryStatus\":2,\"deliveryTime\":\"2023-04-21\",\"documentNo\":\"DS41547\",\"driver\":\"李先生\",\"driverPhone\":\"18899963636\",\"id\":1,\"params\":{},\"shippingAddress\":\"北京市平谷区\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-11 11:14:28', 32);
INSERT INTO `sys_oper_log` VALUES (55, '智能仓储WMS-运输管理-配送管理', 2, 'com.ruoyi.wms.controller.WmsDistributionController.edit()', 'PUT', 1, 'admin', NULL, '/wms/distribution', '127.0.0.1', '内网IP', '{\"arrivalTime\":\"2023-04-24\",\"carNumber\":\"京A89868\",\"carrierApplicationId\":1,\"customId\":1,\"deliveryAddress\":\"北京市平谷区\",\"deliveryStatus\":1,\"deliveryTime\":\"2023-04-21\",\"documentNo\":\"DS41547\",\"driver\":\"李先生\",\"driverPhone\":\"18899963636\",\"id\":1,\"params\":{},\"shippingAddress\":\"北京市平谷区\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-11 11:14:33', 16);
INSERT INTO `sys_oper_log` VALUES (56, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-11 15:44:35', 19);
INSERT INTO `sys_oper_log` VALUES (57, '供应链SCM-销售管理-销售订单', 5, 'com.ruoyi.scm.controller.ScmSaleOrderController.export()', 'POST', 1, 'admin', NULL, '/scm/order/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-05-12 10:31:30', 601);
INSERT INTO `sys_oper_log` VALUES (58, '能耗总览', 1, 'com.ruoyi.dv.controller.DvEnergyConsumptionController.add()', 'POST', 1, 'admin', NULL, '/dv/energyConsumption', '127.0.0.1', '内网IP', '{\"carbonEmissions\":45.4,\"id\":\"5\",\"officePowerConsumption\":56.0,\"officeWaterConsumption\":56.0,\"params\":{},\"powerConsumption\":90.0,\"producePowerConsumption\":34.0,\"produceWaterConsumption\":23.0,\"total\":169.0,\"waterConsumption\":79.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-12 10:44:40', 22);
INSERT INTO `sys_oper_log` VALUES (59, '数据可视化-碳排放', 1, 'com.ruoyi.dv.controller.DvCarbonEmissionController.add()', 'POST', 1, 'admin', NULL, '/dv/carbon', '127.0.0.1', '内网IP', '{\"carbonEmission\":\"456\",\"date\":\"2023-05-12\",\"device\":\"发射器\",\"id\":\"9\",\"params\":{},\"produceNum\":\"56\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-12 10:48:27', 17);
INSERT INTO `sys_oper_log` VALUES (60, '数据可视化-销售', 1, 'com.ruoyi.dv.controller.DvSaleController.add()', 'POST', 1, 'admin', NULL, '/dv/sale', '127.0.0.1', '内网IP', '{\"company\":\"小米\",\"contractAmount\":555.0,\"date\":\"2023-05-12\",\"id\":1002,\"params\":{},\"planSale\":888.0,\"rate\":\"75%\",\"sold\":666.0}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-12 10:49:02', 20);
INSERT INTO `sys_oper_log` VALUES (61, '数据可视化-销售', 1, 'com.ruoyi.dv.controller.DvSaleController.add()', 'POST', 1, 'admin', NULL, '/dv/sale', '127.0.0.1', '内网IP', '{\"company\":\"小米\",\"contractAmount\":789.0,\"date\":\"2023-05-12\",\"id\":1003,\"params\":{},\"planSale\":123.0,\"rate\":\"531.7%\",\"sold\":654.0}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-12 10:50:25', 11);
INSERT INTO `sys_oper_log` VALUES (62, '数据可视化-销售', 2, 'com.ruoyi.dv.controller.DvSaleController.edit()', 'PUT', 1, 'admin', NULL, '/dv/sale', '127.0.0.1', '内网IP', '{\"company\":\"小米\",\"contractAmount\":789.0,\"date\":\"2023-05-12\",\"id\":1003,\"params\":{},\"planSale\":654.0,\"rate\":\"18.8%\",\"sold\":123.0}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-12 10:56:33', 11);
INSERT INTO `sys_oper_log` VALUES (63, '数据可视化-库存', 1, 'com.ruoyi.dv.controller.DvInventoryController.add()', 'POST', 1, 'admin', NULL, '/dv/inventory', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [D:\\项目管理\\国赛\\前端\\ruoyi-vue\\ruoyi-admin\\target\\classes\\mapper\\dv\\DvInventoryMapper.xml]\r\n### The error may involve com.ruoyi.dv.mapper.DvInventoryMapper.insertDvInventory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into dv_inventory\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-05-12 10:59:50', 78);
INSERT INTO `sys_oper_log` VALUES (64, '数据可视化-库存', 1, 'com.ruoyi.dv.controller.DvInventoryController.add()', 'POST', 1, 'admin', NULL, '/dv/inventory', '127.0.0.1', '内网IP', '{\"id\":\"12\",\"inventory\":1000,\"material\":\"主板\",\"params\":{},\"status\":\"1\",\"warehouse\":\"仓库1\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-12 11:00:37', 22);
INSERT INTO `sys_oper_log` VALUES (65, '产品统计', 2, 'com.ruoyi.scm.controller.ScmProductStatisticsController.edit()', 'PUT', 1, 'admin', NULL, '/scm/statistics', '127.0.0.1', '内网IP', '{\"contractCode\":\"S0981\",\"id\":1,\"materialName\":\"螺丝\",\"model\":\"单\",\"money\":\"1200\",\"params\":{},\"purchaseQuantity\":\"101\",\"signingDate\":\"2023-04-26\",\"specifications\":\"组\",\"supplier\":\"小米\",\"supplierId\":1,\"unit\":\"个\",\"unitPrice\":\"12\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-12 16:00:41', 28);
INSERT INTO `sys_oper_log` VALUES (66, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"N\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-04-19 10:30:51\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-12 17:54:33', 32);
INSERT INTO `sys_oper_log` VALUES (67, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2023-04-19 10:30:51\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-12 17:54:33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-12 17:55:31', 20);
INSERT INTO `sys_oper_log` VALUES (68, '客户档案', 3, 'com.ruoyi.scm.controller.ScmSaleCustomController.remove()', 'DELETE', 1, 'admin', NULL, '/scm/custom/1', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-13 10:01:55', 39);
INSERT INTO `sys_oper_log` VALUES (69, '月份统计', 2, 'com.ruoyi.scm.controller.ScmMonthlyController.edit()', 'PUT', 1, 'admin', NULL, '/scm/monthly', '127.0.0.1', '内网IP', '{\"id\":2,\"materialName\":\"??\",\"params\":{}}', '{\"code\":200,\"data\":0,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-13 11:05:01', 65);
INSERT INTO `sys_oper_log` VALUES (70, '月份统计', 2, 'com.ruoyi.scm.controller.ScmMonthlyController.edit()', 'PUT', 1, 'admin', NULL, '/scm/monthly', '127.0.0.1', '内网IP', '{\"materialName\":\"??\",\"params\":{}}', '{\"code\":200,\"data\":0,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-13 11:11:43', 50);
INSERT INTO `sys_oper_log` VALUES (71, '月份统计', 2, 'com.ruoyi.scm.controller.ScmMonthlyController.edit()', 'PUT', 1, 'admin', NULL, '/scm/monthly', '127.0.0.1', '内网IP', '{\"materialName\":\"??\",\"params\":{}}', '{\"code\":200,\"data\":0,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-13 11:12:00', 12);
INSERT INTO `sys_oper_log` VALUES (72, '月份统计', 2, 'com.ruoyi.scm.controller.ScmMonthlyController.edit()', 'PUT', 1, 'admin', NULL, '/scm/monthly', '127.0.0.1', '内网IP', '{\"id\":10,\"materialName\":\"??\",\"params\":{}}', '{\"code\":200,\"data\":0,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-13 11:19:20', 18);
INSERT INTO `sys_oper_log` VALUES (73, '产品统计', 1, 'com.ruoyi.scm.controller.ScmProductStatisticsController.add()', 'POST', 1, 'admin', NULL, '/scm/statistics', '127.0.0.1', '内网IP', '{\"contractCode\":\"S0981\",\"id\":3,\"materialName\":\"螺丝\",\"model\":\"单\",\"money\":\"1200\",\"params\":{},\"purchaseQuantity\":\"100\",\"signingDate\":\"2023-04-26\",\"specifications\":\"组\",\"supplier\":\"小米\",\"supplierId\":1,\"unit\":\"个\",\"unitPrice\":\"12\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-13 13:37:07', 64);
INSERT INTO `sys_oper_log` VALUES (74, '产品统计', 1, 'com.ruoyi.scm.controller.ScmProductStatisticsController.add()', 'POST', 1, 'admin', NULL, '/scm/statistics', '127.0.0.1', '内网IP', '{\"contractCode\":\"S0981\",\"id\":4,\"materialName\":\"螺丝\",\"model\":\"单\",\"money\":\"1200\",\"params\":{},\"purchaseQuantity\":\"100\",\"signingDate\":\"2023-04-26\",\"specifications\":\"组\",\"supplier\":\"小米\",\"supplierId\":1,\"unit\":\"个\",\"unitPrice\":\"12\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-13 13:37:29', 16);
INSERT INTO `sys_oper_log` VALUES (75, '产品统计', 1, 'com.ruoyi.scm.controller.ScmProductStatisticsController.add()', 'POST', 1, 'admin', NULL, '/scm/statistics', '127.0.0.1', '内网IP', '{\"contractCode\":\"S0981\",\"id\":5,\"materialName\":\"螺丝\",\"model\":\"单\",\"money\":\"1200\",\"params\":{},\"purchaseQuantity\":\"100\",\"signingDate\":\"2023-04-26\",\"specifications\":\"组\",\"supplier\":\"小米\",\"supplierId\":1,\"unit\":\"个\",\"unitPrice\":\"12\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-13 13:38:26', 18);
INSERT INTO `sys_oper_log` VALUES (76, '产品统计', 1, 'com.ruoyi.scm.controller.ScmProductStatisticsController.add()', 'POST', 1, 'admin', NULL, '/scm/statistics', '127.0.0.1', '内网IP', '{\"contractCode\":\"S0981\",\"id\":6,\"materialName\":\"螺丝\",\"model\":\"单\",\"money\":\"1200\",\"params\":{},\"purchaseQuantity\":\"100\",\"signingDate\":\"2023-04-26\",\"specifications\":\"组\",\"supplier\":\"小米\",\"supplierId\":1,\"unit\":\"个\",\"unitPrice\":\"12\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-13 13:39:41', 21);
INSERT INTO `sys_oper_log` VALUES (77, '物料分类', 1, 'com.ruoyi.wms.controller.WmsMaterialClassifyController.add()', 'POST', 1, 'admin', NULL, '/wms/classify', '127.0.0.1', '内网IP', '{\"children\":[],\"id\":8,\"params\":{},\"pid\":0}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-13 15:04:53', 17);
INSERT INTO `sys_oper_log` VALUES (78, '物料分类', 3, 'com.ruoyi.wms.controller.WmsMaterialClassifyController.remove()', 'DELETE', 1, 'admin', NULL, '/wms/classify/8', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-13 15:05:00', 13);
INSERT INTO `sys_oper_log` VALUES (79, '仓库', 1, 'com.ruoyi.wms.controller.WmsWarehouseController.add()', 'POST', 1, 'admin', NULL, '/wms/warehouse', '127.0.0.1', '内网IP', '{\"params\":{},\"wmsWarehouseAreaList\":[]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may exist in file [D:\\国赛\\code\\ruoyi-vue\\ruoyi-admin\\target\\classes\\mapper\\wms\\WmsWarehouseMapper.xml]\r\n### The error may involve com.ruoyi.wms.mapper.WmsWarehouseMapper.insertWmsWarehouse-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into wms_warehouse\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2023-05-13 15:05:06', 115);
INSERT INTO `sys_oper_log` VALUES (80, '智能仓储WMS-出库申请-关联订单', 3, 'com.ruoyi.wms.controller.WmsOutboundApplicationOrderController.remove()', 'DELETE', 1, 'admin', NULL, '/wms/outboundApplicationOrder/1', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-16 10:34:57', 40);
INSERT INTO `sys_oper_log` VALUES (81, '智能仓储WMS-出库申请-关联订单', 3, 'com.ruoyi.wms.controller.WmsOutboundApplicationOrderController.remove()', 'DELETE', 1, 'admin', NULL, '/wms/outboundApplicationOrder/1', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":0,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-16 10:51:46', 87);
INSERT INTO `sys_oper_log` VALUES (82, '智能仓储WMS-基础数据-货主', 2, 'com.ruoyi.wms.controller.WmsCargoOwnerController.edit()', 'PUT', 1, 'admin', NULL, '/wms/cargoOwner', '127.0.0.1', '内网IP', '{\"cargoOwnerName\":\"王先生\",\"companyAddress\":\"北京市\",\"companyName\":\"vivo\",\"contacts\":\"王先生\",\"id\":1,\"params\":{},\"phone\":\"18966652365\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-16 10:53:54', 16);
INSERT INTO `sys_oper_log` VALUES (83, '智能仓储WMS-基础数据-货主', 2, 'com.ruoyi.wms.controller.WmsCargoOwnerController.edit()', 'PUT', 1, 'admin', NULL, '/wms/cargoOwner', '127.0.0.1', '内网IP', '{\"cargoOwnerName\":\"王先生\",\"companyAddress\":\"北京市\",\"companyName\":\"vivo\",\"contacts\":\"王先生\",\"id\":1,\"params\":{},\"phone\":\"18966652365\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-16 10:54:25', 10);
INSERT INTO `sys_oper_log` VALUES (84, '生产统计', 2, 'com.ruoyi.dv.controller.DvProductionStatisticsController.edit()', 'PUT', 1, 'admin', NULL, '/dv/statistics', '127.0.0.1', '内网IP', '{\"carbonEmission\":\"200\",\"id\":1,\"inventory\":\"10001\",\"model\":\"PH101\",\"params\":{},\"product\":\"华为Mate40Pro\",\"productionValue\":\"200\",\"specifications\":\"16+256G\",\"tbProduced\":\"800\",\"unit\":\"部\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-16 15:34:29', 21);
INSERT INTO `sys_oper_log` VALUES (85, '智能仓储WMS-基础数据-货主', 5, 'com.ruoyi.wms.controller.WmsCargoOwnerController.export()', 'POST', 1, 'admin', NULL, '/wms/cargoOwner/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-05-16 15:57:59', 605);
INSERT INTO `sys_oper_log` VALUES (86, '智能仓储WMS-基础数据-货主', 3, 'com.ruoyi.wms.controller.WmsCargoOwnerController.remove()', 'DELETE', 1, 'admin', NULL, '/wms/cargoOwner/1', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-16 16:02:52', 26);
INSERT INTO `sys_oper_log` VALUES (87, '库位', 5, 'com.ruoyi.wms.controller.WmsWarehouseSeatController.export()', 'POST', 1, 'admin', NULL, '/wms/seat/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-05-16 16:23:56', 39);
INSERT INTO `sys_oper_log` VALUES (88, '库位', 5, 'com.ruoyi.wms.controller.WmsWarehouseSeatController.export()', 'POST', 1, 'admin', NULL, '/wms/seat/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-05-16 16:24:34', 25);
INSERT INTO `sys_oper_log` VALUES (89, '库位', 1, 'com.ruoyi.wms.controller.WmsWarehouseSeatController.add()', 'POST', 1, 'admin', NULL, '/wms/seat', '127.0.0.1', '内网IP', '{\"id\":7,\"params\":{},\"seatCode\":\"S1\",\"seatName\":\"S1库位\",\"warehouseAreaId\":1}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-16 16:25:15', 19);
INSERT INTO `sys_oper_log` VALUES (90, '能耗总览', 5, 'com.ruoyi.dv.controller.DvEnergyConsumptionController.export()', 'POST', 1, 'admin', NULL, '/dv/energyConsumption/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-05-16 16:25:51', 31);
INSERT INTO `sys_oper_log` VALUES (91, '能耗总览', 2, 'com.ruoyi.dv.controller.DvEnergyConsumptionController.edit()', 'PUT', 1, 'admin', NULL, '/dv/energyConsumption', '127.0.0.1', '内网IP', '{\"carbonEmissions\":50.0,\"id\":\"1\",\"officePowerConsumption\":26.5,\"officeWaterConsumption\":30.5,\"params\":{},\"powerConsumption\":66.5,\"producePowerConsumption\":40.0,\"produceWaterConsumption\":50.0,\"total\":147.0,\"waterConsumption\":80.5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 16:27:28', 16);
INSERT INTO `sys_oper_log` VALUES (92, '能耗总览', 1, 'com.ruoyi.dv.controller.DvEnergyConsumptionController.add()', 'POST', 1, 'admin', NULL, '/dv/energyConsumption', '127.0.0.1', '内网IP', '{\"carbonEmissions\":51.0,\"id\":\"6\",\"officePowerConsumption\":26.5,\"officeWaterConsumption\":30.5,\"params\":{},\"powerConsumption\":66.5,\"producePowerConsumption\":40.0,\"produceWaterConsumption\":50.0,\"total\":147.0,\"waterConsumption\":80.5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 16:27:59', 14);
INSERT INTO `sys_oper_log` VALUES (93, '能耗总览', 3, 'com.ruoyi.dv.controller.DvEnergyConsumptionController.remove()', 'DELETE', 1, 'admin', NULL, '/dv/energyConsumption/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 16:28:22', 15);
INSERT INTO `sys_oper_log` VALUES (94, '能耗总览', 3, 'com.ruoyi.dv.controller.DvEnergyConsumptionController.remove()', 'DELETE', 1, 'admin', NULL, '/dv/energyConsumption/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-05-16 16:28:27', 16);
INSERT INTO `sys_oper_log` VALUES (95, '库区', 5, 'com.ruoyi.wms.controller.WmsWarehouseAreaController.export()', 'POST', 1, 'admin', NULL, '/wms/area/export', '127.0.0.1', '内网IP', '{\"params\":{}}', NULL, 0, NULL, '2023-05-16 16:28:59', 39);
INSERT INTO `sys_oper_log` VALUES (96, '库区', 3, 'com.ruoyi.wms.controller.WmsWarehouseAreaController.remove()', 'DELETE', 1, 'admin', NULL, '/wms/area/1', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-16 16:30:33', 46);
INSERT INTO `sys_oper_log` VALUES (97, '库区', 1, 'com.ruoyi.wms.controller.WmsWarehouseAreaController.add()', 'POST', 1, 'admin', NULL, '/wms/area', '127.0.0.1', '内网IP', '{\"areaCode\":\"A2\",\"areaName\":\"A2区\",\"id\":2,\"params\":{},\"warehouseId\":1,\"wmsWarehouseSeatList\":[{\"id\":2,\"params\":{},\"seatCode\":\"S2\",\"seatName\":\"S2库位\",\"warehouseAreaId\":2},{\"id\":5,\"params\":{},\"seatCode\":\"S5\",\"seatName\":\"S5库位\",\"warehouseAreaId\":2}]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'wms_warehouse_area.PRIMARY\'\r\n### The error may exist in file [D:\\国赛\\code\\ruoyi-vue\\ruoyi-admin\\target\\classes\\mapper\\wms\\WmsWarehouseAreaMapper.xml]\r\n### The error may involve com.ruoyi.wms.mapper.WmsWarehouseAreaMapper.insertWmsWarehouseArea-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into wms_warehouse_area          ( id,             warehouse_id,             area_code,             area_name )           values ( ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'wms_warehouse_area.PRIMARY\'\n; Duplicate entry \'2\' for key \'wms_warehouse_area.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'wms_warehouse_area.PRIMARY\'', '2023-05-16 16:32:16', 85);
INSERT INTO `sys_oper_log` VALUES (98, '库区', 1, 'com.ruoyi.wms.controller.WmsWarehouseAreaController.add()', 'POST', 1, 'admin', NULL, '/wms/area', '127.0.0.1', '内网IP', '{\"areaCode\":\"A2\",\"areaName\":\"A2区\",\"params\":{},\"warehouseId\":1,\"wmsWarehouseSeatList\":[]}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-16 16:32:41', 29);
INSERT INTO `sys_oper_log` VALUES (99, '库区', 2, 'com.ruoyi.wms.controller.WmsWarehouseAreaController.edit()', 'PUT', 1, 'admin', NULL, '/wms/area', '127.0.0.1', '内网IP', '{\"areaCode\":\"A2\",\"areaName\":\"A2区\",\"id\":2,\"params\":{},\"warehouseId\":1,\"wmsWarehouseSeatList\":[{\"id\":2,\"params\":{},\"seatCode\":\"S2\",\"seatName\":\"S2库位\",\"warehouseAreaId\":2},{\"id\":5,\"params\":{},\"seatCode\":\"S5\",\"seatName\":\"S5库位\",\"warehouseAreaId\":2}]}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-16 16:32:59', 52);
INSERT INTO `sys_oper_log` VALUES (100, '库存明细', 1, 'com.ruoyi.wms.controller.WmsInventoryDetailsController.add()', 'POST', 1, 'admin', NULL, '/wms/inventoryDetails', '127.0.0.1', '内网IP', '{\"batchNumber\":\"G52366\",\"existingInventory\":777,\"id\":6,\"inventoryId\":4,\"manufactureDate\":\"2023-04-20\",\"manufacturer\":\"eee\",\"params\":{},\"remark\":\"5\",\"warehouseAreaId\":4,\"warehouseSeatId\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 16:42:24', 35);
INSERT INTO `sys_oper_log` VALUES (101, '库存明细', 2, 'com.ruoyi.wms.controller.WmsInventoryDetailsController.edit()', 'PUT', 1, 'admin', NULL, '/wms/inventoryDetails', '127.0.0.1', '内网IP', '{\"batchNumber\":\"G52366\",\"existingInventory\":777,\"id\":5,\"inventoryId\":4,\"manufactureDate\":\"2023-04-20\",\"manufacturer\":\"eee\",\"params\":{},\"remark\":\"5\",\"warehouseAreaId\":4,\"warehouseSeatId\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 16:42:52', 12);
INSERT INTO `sys_oper_log` VALUES (102, '库存明细', 3, 'com.ruoyi.wms.controller.WmsInventoryDetailsController.remove()', 'DELETE', 1, 'admin', NULL, '/wms/inventoryDetails/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 16:43:55', 43);
INSERT INTO `sys_oper_log` VALUES (103, '生产计划', 3, 'com.ruoyi.mytask.controller.MyTaskProductionPlanController.remove()', 'DELETE', 1, 'admin', NULL, '/mytask/plan/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 16:48:13', 16);
INSERT INTO `sys_oper_log` VALUES (104, '生产计划', 2, 'com.ruoyi.mytask.controller.MyTaskProductionPlanController.edit()', 'PUT', 1, 'admin', NULL, '/mytask/plan', '127.0.0.1', '内网IP', '{\"applicant\":\"admin\",\"applicantDate\":\"2023-04-21\",\"applicantStatus\":\"2\",\"deliveryDate\":\"2023-04-21\",\"id\":\"1\",\"name\":\"生产计划\",\"orderNo\":\"No1789465465\",\"params\":{},\"planCode\":\"PH10123\",\"project\":\"电器生产项目\",\"remark\":\"xxx\",\"reviewComments\":\"xxx1\",\"reviewer\":\"admin\",\"reviewerDate\":\"2023-05-16\",\"reviewerStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 16:49:10', 12);
INSERT INTO `sys_oper_log` VALUES (105, '物料分类', 2, 'com.ruoyi.wms.controller.WmsMaterialClassifyController.edit()', 'PUT', 1, 'admin', NULL, '/wms/classify', '127.0.0.1', '内网IP', '{\"children\":[],\"code\":\"code1\",\"id\":1,\"name\":\"零件\",\"params\":{},\"pid\":0,\"remark\":\"1113\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-16 16:49:21', 41);
INSERT INTO `sys_oper_log` VALUES (106, '生产计划', 2, 'com.ruoyi.mytask.controller.MyTaskProductionPlanController.edit()', 'PUT', 1, 'admin', NULL, '/mytask/plan', '127.0.0.1', '内网IP', '{\"applicant\":\"admin\",\"applicantDate\":\"2023-04-21\",\"applicantStatus\":\"2\",\"deliveryDate\":\"2023-04-21\",\"id\":\"1\",\"name\":\"生产计划\",\"orderNo\":\"No1789465465\",\"params\":{},\"planCode\":\"PH10123\",\"project\":\"电器生产项目\",\"remark\":\"xxx\",\"reviewComments\":\"xxx\",\"reviewer\":\"admin\",\"reviewerDate\":\"2023-05-16\",\"reviewerStatus\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 16:49:33', 16);
INSERT INTO `sys_oper_log` VALUES (107, '物料分类', 2, 'com.ruoyi.wms.controller.WmsMaterialClassifyController.edit()', 'PUT', 1, 'admin', NULL, '/wms/classify', '127.0.0.1', '内网IP', '{\"children\":[],\"code\":\"code1\",\"id\":1,\"name\":\"零件\",\"params\":{},\"pid\":0,\"remark\":\"1113\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-16 16:50:03', 13);
INSERT INTO `sys_oper_log` VALUES (108, '物料分类', 5, 'com.ruoyi.wms.controller.WmsMaterialClassifyController.export()', 'POST', 1, 'admin', NULL, '/wms/classify/export', '127.0.0.1', '内网IP', '{\"children\":[],\"params\":{}}', NULL, 0, NULL, '2023-05-16 16:51:11', 379);
INSERT INTO `sys_oper_log` VALUES (109, '物料分类', 3, 'com.ruoyi.wms.controller.WmsMaterialClassifyController.remove()', 'DELETE', 1, 'admin', NULL, '/wms/classify/2', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-16 16:55:36', 20);
INSERT INTO `sys_oper_log` VALUES (110, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/05/16/blob_20230516175620A001.png\",\"code\":200}', 0, NULL, '2023-05-16 17:56:19', 63);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"visualized/index\",\"createTime\":\"2023-04-22 16:35:33\",\"icon\":\"chart\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2059,\"menuName\":\"数据可视化\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"visualized\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 18:00:23', 24);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 18:00:31', 16);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"dataCenter/index\",\"createTime\":\"2023-04-26 09:12:17\",\"icon\":\"log\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2077,\"menuName\":\"数据中心\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"dataCenter\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 18:01:03', 21);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 18:01:13', 18);
INSERT INTO `sys_oper_log` VALUES (115, '检验标准', 3, 'com.zhonghui.mes.controller.MesInspectionStandardsController.remove()', 'DELETE', 1, 'admin', NULL, '/mes/standards/1', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-22 17:12:51', 15);
INSERT INTO `sys_oper_log` VALUES (116, '检验标准', 1, 'com.zhonghui.mes.controller.MesInspectionStandardsController.add()', 'POST', 1, 'admin', NULL, '/mes/standards', '192.168.3.39', '内网IP', '{\"checkItem\":\"小米\",\"checkType\":\"类型\",\"lowerLimit\":\"100\",\"materialId\":1,\"params\":{},\"upLimit\":\"11\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-22 17:22:19', 29);
INSERT INTO `sys_oper_log` VALUES (117, '作业装配', 1, 'com.zhonghui.mes.controller.MesJobAssemblyController.add()', 'POST', 1, 'admin', NULL, '/mes/assembly', '192.168.3.39', '内网IP', '{\"endDate\":\"2023-04-18\",\"id\":\"3\",\"jobName\":\"电脑组装\",\"jobStatus\":\"1\",\"model\":\"BH101\",\"params\":{},\"plannedProduction\":\"组装\",\"product\":\"手机\",\"productionNum\":\"989\",\"productionPlan\":\"LP17856\",\"remark\":\"111\",\"specifications\":\"16+256G\",\"startDate\":\"2023-04-21\",\"unit\":\"部\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-22 17:23:16', 19);
INSERT INTO `sys_oper_log` VALUES (118, '作业装配', 2, 'com.zhonghui.mes.controller.MesJobAssemblyController.edit()', 'PUT', 1, 'admin', NULL, '/mes/assembly', '127.0.0.1', '内网IP', '{\"endDate\":\"2023-04-29\",\"id\":\"1\",\"jobName\":\"电脑组装\",\"jobStatus\":\"2\",\"model\":\"TH101\",\"params\":{},\"plannedProduction\":\"组装\",\"product\":\"ThinkPad\",\"productionNum\":\"959\",\"productionPlan\":\"LP465465\",\"remark\":\"xxx\",\"specifications\":\"3060\",\"startDate\":\"2023-04-22\",\"unit\":\"台\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-22 21:15:15', 29);
INSERT INTO `sys_oper_log` VALUES (119, '检验标准', 1, 'com.zhonghui.mes.controller.MesInspectionStandardsController.add()', 'POST', 1, 'admin', NULL, '/mes/standards', '127.0.0.1', '内网IP', '{\"checkItem\":\"11\",\"checkType\":\"22\",\"lowerLimit\":\"1\",\"materialId\":1,\"params\":{},\"upLimit\":\"1\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-22 21:15:40', 19);
INSERT INTO `sys_oper_log` VALUES (120, '检验标准', 3, 'com.zhonghui.mes.controller.MesInspectionStandardsController.remove()', 'DELETE', 1, 'admin', NULL, '/mes/standards/4', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-05-22 21:15:43', 11);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 3, 'com.zhonghui.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-05-22 23:22:52', 8);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.zhonghui.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-22 23:23:24', 34);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.zhonghui.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-22 23:26:14', 11);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.zhonghui.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-22 23:28:37', 13);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.zhonghui.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-22 23:28:49', 16);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.zhonghui.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-22 23:28:56', 15);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.zhonghui.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-22 23:29:03', 10);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.zhonghui.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-22 23:29:09', 14);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.zhonghui.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"通知公告\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":1,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-22 23:29:19', 11);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.zhonghui.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":108,\"menuName\":\"日志管理\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":1,\"path\":\"log\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-22 23:29:28', 11);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.zhonghui.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-22 23:29:36', 17);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.zhonghui.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-22 23:29:51', 13);
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.zhonghui.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-22 23:29:59', 14);
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.zhonghui.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-04-20 17:44:19\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"智造双碳\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"dc\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-22 23:30:46', 9);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.zhonghui.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-22 23:30:58', 16);
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 2, 'com.zhonghui.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-22 23:31:22', 12);
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.zhonghui.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2023-04-19 10:30:51\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-22 23:31:49', 10);
INSERT INTO `sys_oper_log` VALUES (138, '工艺建模', 2, 'com.zhonghui.mes.contorller.MesTechnologyController.edit()', 'PUT', 1, 'admin', NULL, '/mes/technology', '127.0.0.1', '内网IP', '{\"id\":1,\"mesProductList\":[{\"id\":1,\"modeName\":\"电子模型\",\"params\":{},\"productModel\":\"LST101\",\"productName\":\"螺丝钉\",\"productSku\":\"小型\",\"productUnit\":\"个\",\"remark\":\"xxx\"}],\"params\":{},\"productId\":\"1\",\"remark\":\"xxx\",\"technologyDescribe\":\"xxx\",\"technologyName\":\"手工\",\"unitPowerConsumption\":\"1000kW·h\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-06-05 16:11:43', 52);
INSERT INTO `sys_oper_log` VALUES (139, '工厂建模', 2, 'com.zhonghui.mes.contorller.MesFactoryController.edit()', 'PUT', 1, 'admin', NULL, '/mes/factory', '127.0.0.1', '内网IP', '{\"factoryDescribe\":\"xxx\",\"id\":1,\"mesFactoryDeviceItemList\":[{\"deviceCode\":\"1\",\"deviceModel\":\"1\",\"deviceName\":\"123\",\"factoryId\":1,\"id\":1,\"manufacturer\":\"1\",\"params\":{},\"produceCode\":\"11\",\"produceDate\":\"2023-04-13\"}],\"params\":{},\"product\":\"螺丝钉\",\"productMode\":\"大号\",\"productionLine\":\"产线一\",\"specifications\":\"小型\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-06-06 13:37:32', 39);
INSERT INTO `sys_oper_log` VALUES (140, '项目维护', 1, 'com.zhonghui.mes.contorller.MesProjectMaintenanceController.add()', 'POST', 1, 'admin', NULL, '/mes/maintenance', '127.0.0.1', '内网IP', '{\"endDate\":\"2023-06-06\",\"params\":{},\"projectHeader\":\"1\",\"projectName\":\"1\",\"startDate\":\"2023-06-06\",\"status\":0}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-06-06 13:37:48', 13);
INSERT INTO `sys_oper_log` VALUES (141, '项目维护', 3, 'com.zhonghui.mes.contorller.MesProjectMaintenanceController.remove()', 'DELETE', 1, 'admin', NULL, '/mes/maintenance/7', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-06-06 13:37:51', 5);
INSERT INTO `sys_oper_log` VALUES (142, '项目维护', 2, 'com.zhonghui.mes.contorller.MesProjectMaintenanceController.edit()', 'PUT', 1, 'admin', NULL, '/mes/maintenance', '127.0.0.1', '内网IP', '{\"endDate\":\"2023-05-06\",\"id\":5,\"params\":{},\"projectHeader\":\"test\",\"projectName\":\"test\",\"startDate\":\"2023-05-06\",\"status\":0}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-06-07 10:15:17', 31);
INSERT INTO `sys_oper_log` VALUES (143, '智造双碳—能效预警', 3, 'com.zhonghui.dc.controller.DCEnergyPrewarningController.remove()', 'DELETE', 1, 'admin', NULL, '/dc/prewarning/3', '127.0.0.1', '内网IP', '{}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-06-08 13:54:15', 45);
INSERT INTO `sys_oper_log` VALUES (144, '智造双碳—能效预警', 2, 'com.zhonghui.dc.controller.DCEnergyPrewarningController.edit()', 'PUT', 1, 'admin', NULL, '/dc/prewarning', '127.0.0.1', '内网IP', '{\"id\":4,\"mark\":\"能效异常\",\"monitoringPointsAddress\":\"A市\",\"monitoringPointsName\":\"1号检测点\",\"params\":{},\"realTimePower\":100,\"realTimeVolt\":100,\"reportTime\":\"2023-06-08\",\"status\":\"1\"}', '{\"code\":200,\"data\":1,\"msg\":\"操作成功\"}', 0, NULL, '2023-06-08 13:54:22', 18);
INSERT INTO `sys_oper_log` VALUES (145, '智造双碳—能效预警', 5, 'com.zhonghui.dc.controller.DCEnergyPrewarningController.export()', 'POST', 1, 'admin', NULL, '/dc/prewarning/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-06-09 09:05:59', 994);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-04-19 10:30:51', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-04-19 10:30:51', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-04-19 10:30:51', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-04-19 10:30:51', 'admin', '2023-05-05 16:49:49', '普通角色');
INSERT INTO `sys_role` VALUES (100, 'user1', 'user1', 3, '1', 1, 1, '0', '0', 'admin', '2023-05-05 10:44:42', '', '2023-05-05 13:20:50', NULL);
INSERT INTO `sys_role` VALUES (101, 'user2', 'user2', 4, '1', 1, 1, '0', '0', 'admin', '2023-05-05 11:12:19', 'admin', '2023-05-05 13:15:10', NULL);
INSERT INTO `sys_role` VALUES (102, 'user3', 'user3', 5, '1', 1, 1, '0', '0', 'admin', '2023-05-05 11:13:21', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (103, 'user4', 'user4', 6, '1', 1, 1, '0', '0', 'admin', '2023-05-05 11:14:53', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (104, 'user5', 'user5', 7, '1', 1, 1, '0', '0', 'admin', '2023-05-05 11:21:54', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (105, 'user6', 'user6', 8, '1', 1, 1, '0', '0', 'admin', '2023-05-05 11:22:55', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (106, 'user7', 'user7', 9, '1', 1, 1, '0', '0', 'admin', '2023-05-05 11:23:53', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (107, 'user8', 'user8', 10, '1', 1, 1, '0', '0', 'admin', '2023-05-05 11:24:43', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (108, 'user9', 'user9', 11, '1', 1, 1, '0', '0', 'admin', '2023-05-05 11:25:33', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (109, 'user10', 'user10', 12, '1', 1, 1, '0', '0', 'admin', '2023-05-05 11:26:37', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 2059);
INSERT INTO `sys_role_menu` VALUES (101, 2003);
INSERT INTO `sys_role_menu` VALUES (101, 2011);
INSERT INTO `sys_role_menu` VALUES (101, 2017);
INSERT INTO `sys_role_menu` VALUES (101, 2022);
INSERT INTO `sys_role_menu` VALUES (101, 2024);
INSERT INTO `sys_role_menu` VALUES (101, 2034);
INSERT INTO `sys_role_menu` VALUES (101, 2059);
INSERT INTO `sys_role_menu` VALUES (101, 2084);
INSERT INTO `sys_role_menu` VALUES (102, 2003);
INSERT INTO `sys_role_menu` VALUES (102, 2037);
INSERT INTO `sys_role_menu` VALUES (102, 2039);
INSERT INTO `sys_role_menu` VALUES (102, 2059);
INSERT INTO `sys_role_menu` VALUES (102, 2061);
INSERT INTO `sys_role_menu` VALUES (102, 2064);
INSERT INTO `sys_role_menu` VALUES (102, 2065);
INSERT INTO `sys_role_menu` VALUES (102, 2069);
INSERT INTO `sys_role_menu` VALUES (103, 2003);
INSERT INTO `sys_role_menu` VALUES (103, 2043);
INSERT INTO `sys_role_menu` VALUES (103, 2057);
INSERT INTO `sys_role_menu` VALUES (103, 2059);
INSERT INTO `sys_role_menu` VALUES (103, 2064);
INSERT INTO `sys_role_menu` VALUES (103, 2073);
INSERT INTO `sys_role_menu` VALUES (103, 2075);
INSERT INTO `sys_role_menu` VALUES (103, 2076);
INSERT INTO `sys_role_menu` VALUES (104, 2007);
INSERT INTO `sys_role_menu` VALUES (104, 2008);
INSERT INTO `sys_role_menu` VALUES (104, 2012);
INSERT INTO `sys_role_menu` VALUES (104, 2013);
INSERT INTO `sys_role_menu` VALUES (104, 2019);
INSERT INTO `sys_role_menu` VALUES (104, 2026);
INSERT INTO `sys_role_menu` VALUES (104, 2059);
INSERT INTO `sys_role_menu` VALUES (104, 2067);
INSERT INTO `sys_role_menu` VALUES (104, 2087);
INSERT INTO `sys_role_menu` VALUES (105, 2007);
INSERT INTO `sys_role_menu` VALUES (105, 2008);
INSERT INTO `sys_role_menu` VALUES (105, 2012);
INSERT INTO `sys_role_menu` VALUES (105, 2021);
INSERT INTO `sys_role_menu` VALUES (105, 2059);
INSERT INTO `sys_role_menu` VALUES (105, 2063);
INSERT INTO `sys_role_menu` VALUES (105, 2066);
INSERT INTO `sys_role_menu` VALUES (105, 2068);
INSERT INTO `sys_role_menu` VALUES (105, 2086);
INSERT INTO `sys_role_menu` VALUES (106, 2000);
INSERT INTO `sys_role_menu` VALUES (106, 2001);
INSERT INTO `sys_role_menu` VALUES (106, 2012);
INSERT INTO `sys_role_menu` VALUES (106, 2020);
INSERT INTO `sys_role_menu` VALUES (106, 2058);
INSERT INTO `sys_role_menu` VALUES (106, 2059);
INSERT INTO `sys_role_menu` VALUES (106, 2062);
INSERT INTO `sys_role_menu` VALUES (106, 2070);
INSERT INTO `sys_role_menu` VALUES (107, 2000);
INSERT INTO `sys_role_menu` VALUES (107, 2001);
INSERT INTO `sys_role_menu` VALUES (107, 2002);
INSERT INTO `sys_role_menu` VALUES (107, 2012);
INSERT INTO `sys_role_menu` VALUES (107, 2054);
INSERT INTO `sys_role_menu` VALUES (107, 2059);
INSERT INTO `sys_role_menu` VALUES (107, 2060);
INSERT INTO `sys_role_menu` VALUES (107, 2077);
INSERT INTO `sys_role_menu` VALUES (108, 2000);
INSERT INTO `sys_role_menu` VALUES (108, 2018);
INSERT INTO `sys_role_menu` VALUES (108, 2025);
INSERT INTO `sys_role_menu` VALUES (108, 2027);
INSERT INTO `sys_role_menu` VALUES (108, 2028);
INSERT INTO `sys_role_menu` VALUES (108, 2031);
INSERT INTO `sys_role_menu` VALUES (108, 2032);
INSERT INTO `sys_role_menu` VALUES (108, 2059);
INSERT INTO `sys_role_menu` VALUES (109, 2000);
INSERT INTO `sys_role_menu` VALUES (109, 2007);
INSERT INTO `sys_role_menu` VALUES (109, 2008);
INSERT INTO `sys_role_menu` VALUES (109, 2010);
INSERT INTO `sys_role_menu` VALUES (109, 2025);
INSERT INTO `sys_role_menu` VALUES (109, 2029);
INSERT INTO `sys_role_menu` VALUES (109, 2030);
INSERT INTO `sys_role_menu` VALUES (109, 2033);
INSERT INTO `sys_role_menu` VALUES (109, 2035);
INSERT INTO `sys_role_menu` VALUES (109, 2036);
INSERT INTO `sys_role_menu` VALUES (109, 2059);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'admin', '00', 'admin@163.com', '15888888888', '1', '/profile/avatar/2023/05/16/blob_20230516175620A001.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-06-16 16:59:46', 'admin', '2023-04-19 10:30:51', '', '2023-06-16 16:59:46', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'root', 'root', '00', 'root@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-04-19 10:30:51', 'admin', '2023-04-19 10:30:51', 'admin', '2023-05-05 17:01:17', '测试员');
INSERT INTO `sys_user` VALUES (100, 100, 'user1', 'user1', '00', '', '', '0', '', '$2a$10$2LpSkQwQdvpgh8ZT.D67jeRoEZtgfVfV4nSgz6hDcOfWEmoKBGatG', '0', '0', '127.0.0.1', '2023-05-11 15:45:15', 'admin', '2023-05-05 10:21:17', 'admin', '2023-05-11 15:45:13', NULL);
INSERT INTO `sys_user` VALUES (101, 100, 'user2', 'user2', '00', '', '', '0', '', '$2a$10$YpeP5ZHvWFqRYOYnNj.y9eiSU5LjYEqFPzisbUKfSbCZqws3fLxe.', '0', '0', '127.0.0.1', '2023-05-11 15:04:11', 'admin', '2023-05-05 11:09:36', 'admin', '2023-05-11 15:04:09', NULL);
INSERT INTO `sys_user` VALUES (102, NULL, 'user3', 'user3', '00', '', '', '0', '', '$2a$10$oapFM/Pryh3fhzRrZ8Q09e6BCnbrkwml5cDA75e4U.jpfSuYxUThm', '0', '0', '', NULL, 'admin', '2023-05-05 11:10:02', 'admin', '2023-05-05 13:12:14', NULL);
INSERT INTO `sys_user` VALUES (103, NULL, 'user4', 'user4', '00', '', '', '0', '', '$2a$10$0unwkncCmarITewp7MXUBehvqpEA9ZEG2mRbCEg9waX2wOJKlT0Hu', '0', '0', '', NULL, 'admin', '2023-05-05 11:10:12', 'admin', '2023-05-05 13:12:20', NULL);
INSERT INTO `sys_user` VALUES (104, NULL, 'user5', 'user5', '00', '', '', '0', '', '$2a$10$DZ.ZXZfljPDHSG4CpyRlt.Ivws9whBGSTYQVG1xXpsFj7Q5Knu6Le', '0', '0', '', NULL, 'admin', '2023-05-05 11:10:21', 'admin', '2023-05-05 13:12:26', NULL);
INSERT INTO `sys_user` VALUES (105, NULL, 'user6', 'user6', '00', '', '', '0', '', '$2a$10$fJCEHoXQ1CUkYBVO8jC.Q.u8UhEVl9dHlBZfOaRixUuX3FZeypXFG', '0', '0', '', NULL, 'admin', '2023-05-05 11:10:29', 'admin', '2023-05-05 13:12:31', NULL);
INSERT INTO `sys_user` VALUES (106, NULL, 'user7', 'user7', '00', '', '', '0', '', '$2a$10$q1Xs/JlZMaNJL0DBfajkL.7Avl1eFC/kFjSZLnszOxu1tpcYEuX7q', '0', '0', '127.0.0.1', '2023-05-05 13:52:13', 'admin', '2023-05-05 11:10:36', 'admin', '2023-05-05 13:52:12', NULL);
INSERT INTO `sys_user` VALUES (107, NULL, 'user8', 'user8', '00', '', '', '0', '', '$2a$10$wi4f1Mz2dI0pOpTO6itVPOe8push2PIHXtoF9KAsOqAJcAPaRa1N.', '0', '0', '', NULL, 'admin', '2023-05-05 11:10:43', 'admin', '2023-05-05 13:12:41', NULL);
INSERT INTO `sys_user` VALUES (108, NULL, 'user9', 'user9', '00', '', '', '0', '', '$2a$10$TDw0oEQaVQvd60XI.Ioz9umpLB1mmD6FHQYBu1LDBfJujF9lKpg.y', '0', '0', '127.0.0.1', '2023-05-05 16:29:35', 'admin', '2023-05-05 11:10:52', 'admin', '2023-05-05 16:29:35', NULL);
INSERT INTO `sys_user` VALUES (109, NULL, 'user10', 'user10', '00', '', '', '0', '', '$2a$10$YuptoMJf0e6UMFHiWRxui.ay04IAeV5Q7dHMgLLONj5Ad9w7L2vo.', '0', '0', '', NULL, 'admin', '2023-05-05 11:10:58', 'admin', '2023-05-05 13:12:55', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (101, 101);
INSERT INTO `sys_user_role` VALUES (102, 102);
INSERT INTO `sys_user_role` VALUES (103, 103);
INSERT INTO `sys_user_role` VALUES (104, 104);
INSERT INTO `sys_user_role` VALUES (105, 105);
INSERT INTO `sys_user_role` VALUES (106, 106);
INSERT INTO `sys_user_role` VALUES (107, 107);
INSERT INTO `sys_user_role` VALUES (108, 108);
INSERT INTO `sys_user_role` VALUES (109, 109);

-- ----------------------------
-- Table structure for wms_material
-- ----------------------------
DROP TABLE IF EXISTS `wms_material`;
CREATE TABLE `wms_material`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '物料档案ID',
  `classify_id` bigint NULL DEFAULT NULL COMMENT '物料分类ID',
  `material_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料编码',
  `material_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料名称',
  `material_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '型号',
  `material_specifications` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格',
  `material_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `material_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `material_type` tinyint NULL DEFAULT NULL COMMENT '类型',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '智能仓储WMS-物料档案表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_material
-- ----------------------------
INSERT INTO `wms_material` VALUES (1, 5, 'code001', '螺丝钉', 'LST101', '小型', '个', 20.00, 1, '1');
INSERT INTO `wms_material` VALUES (2, 4, 'code002', '螺母', 'LM101', '小型', '个', 15.00, 0, '2');

-- ----------------------------
-- Table structure for wms_material_classify
-- ----------------------------
DROP TABLE IF EXISTS `wms_material_classify`;
CREATE TABLE `wms_material_classify`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '物料分类ID',
  `pid` bigint NULL DEFAULT NULL COMMENT '父级ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类编号',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '智能仓储WMS-物料分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wms_material_classify
-- ----------------------------
INSERT INTO `wms_material_classify` VALUES (1, 0, '零件', 'code1', '1113');
INSERT INTO `wms_material_classify` VALUES (3, 0, '成品', 'code3', NULL);
INSERT INTO `wms_material_classify` VALUES (4, 3, '手机', 'code4', NULL);
INSERT INTO `wms_material_classify` VALUES (5, 1, '螺帽', 'code5', '456');

SET FOREIGN_KEY_CHECKS = 1;
