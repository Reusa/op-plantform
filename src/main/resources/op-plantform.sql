-- ----------------------------
-- Table structure for api
-- ----------------------------
DROP TABLE IF EXISTS `api`;
CREATE TABLE `api`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接口id',
  `num` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接口名称',
  `level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接口等级',
  `module_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属模块id',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求方法',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接口路径',
  `protocol` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求协议',
  `domain_sign` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名标识',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口描述',
  `header` json NULL COMMENT '请求头',
  `body` json NULL COMMENT '请求体',
  `query` json NULL COMMENT '查询参数',
  `rest` json NULL COMMENT '路径参数',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `num`(`num`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE,
  INDEX `module_id`(`module_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10001 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api
-- ----------------------------
INSERT INTO `api` VALUES ('98253357-3f41-488f-a563-d210d74bae55', 10000, 'test1', 'P0', '26116261-5b7c-4566-9005-b0994d3103e6', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 'GET', '/test', 'HTTP', NULL, 'test1', '[{\"name\": \"token\", \"value\": \"123\"}]', '{\"raw\": \"\", \"file\": [], \"form\": [], \"json\": \"{\\\"id\\\":\\\"1\\\"}\", \"type\": \"json\"}', '[]', '[]', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1658910165703, 1658910165703, 'del');
INSERT INTO `api` VALUES ('b76da7c5-838e-4a3d-be44-28a0e8e6581e', 10001, 'test', 'P0', '8a1988e8-4f1c-4604-823a-89b6bb609b09', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 'GET', '/test', 'HTTP', NULL, 'test', '[{\"name\": \"token\", \"value\": \"123\"}]', '{\"raw\": \"\", \"file\": [], \"form\": [], \"json\": \"{\\\"id\\\":\\\"1\\\"}\", \"type\": \"json\"}', '[]', '[]', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660896676341, 1660896676341, 'Normal');

-- ----------------------------
-- Table structure for api_module
-- ----------------------------
DROP TABLE IF EXISTS `api_module`;
CREATE TABLE `api_module`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模块id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模块名称',
  `parent_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父模块id',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_id_2`(`project_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`, `name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of api_module
-- ----------------------------
INSERT INTO `api_module` VALUES ('045b81a8-55a3-4c36-b3fe-1322e39dc4a5', 'test1', NULL, '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811264899, 1660811264899);
INSERT INTO `api_module` VALUES ('094da1c9-33b9-4c13-b212-9a9549ee1c57', 'test1-4', '045b81a8-55a3-4c36-b3fe-1322e39dc4a5', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811689930, 1660811689930);
INSERT INTO `api_module` VALUES ('0ea4afc1-419a-4a77-bb77-179fed8aaf49', 'test1-1-1', '8a1988e8-4f1c-4604-823a-89b6bb609b09', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811753381, 1660811753381);
INSERT INTO `api_module` VALUES ('1d7fcc02-eaa7-41ea-b29e-c023d9a4462f', 'test5', NULL, '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811475543, 1660811475543);
INSERT INTO `api_module` VALUES ('24b2b304-a65a-43e9-8506-67cb2f3902b5', 'test1-3', '045b81a8-55a3-4c36-b3fe-1322e39dc4a5', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811675773, 1660811675773);
INSERT INTO `api_module` VALUES ('26116261-5b7c-4566-9005-b0994d3103e6', 'test7', NULL, '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811491853, 1660811491853);
INSERT INTO `api_module` VALUES ('42229a45-d141-4cab-9a63-31243c2d5919', 'test1-1-1-1', '0ea4afc1-419a-4a77-bb77-179fed8aaf49', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660879796523, 1660879796523);
INSERT INTO `api_module` VALUES ('46316056-eb19-4a2c-8844-19082da770e8', 'test1-5', '045b81a8-55a3-4c36-b3fe-1322e39dc4a5', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811706040, 1660811706040);
INSERT INTO `api_module` VALUES ('5111a1de-1ede-49ef-8aef-078fa86758d9', 'test6', NULL, '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811481178, 1660811481178);
INSERT INTO `api_module` VALUES ('56534f4b-2cd4-4611-a71e-fa6198fb655c', 'test1-2', '045b81a8-55a3-4c36-b3fe-1322e39dc4a5', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811670917, 1660811670917);
INSERT INTO `api_module` VALUES ('61c8f28f-5c45-488e-b549-7097ef2fbbcc', 'test1-2-1', '56534f4b-2cd4-4611-a71e-fa6198fb655c', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811783840, 1660811783840);
INSERT INTO `api_module` VALUES ('6c9b2b9e-4ab8-4869-8fac-09a0e471a95d', 'test1-2-3', '56534f4b-2cd4-4611-a71e-fa6198fb655c', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811792728, 1660811792728);
INSERT INTO `api_module` VALUES ('83ec7c86-f5ee-4788-b241-65c57d53ba04', '测试类型1', NULL, '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660901750265, 1660901750266);
INSERT INTO `api_module` VALUES ('8446e548-82df-413d-9cd8-abc76adb2926', 'test1-1-3', '8a1988e8-4f1c-4604-823a-89b6bb609b09', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811764381, 1660811764381);
INSERT INTO `api_module` VALUES ('8a1988e8-4f1c-4604-823a-89b6bb609b09', 'test1-1', '045b81a8-55a3-4c36-b3fe-1322e39dc4a5', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811655069, 1660811655069);
INSERT INTO `api_module` VALUES ('aa747df5-3c30-41d8-b9c2-94108e8fbed0', 'test1-1-2', '8a1988e8-4f1c-4604-823a-89b6bb609b09', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811758979, 1660811758979);
INSERT INTO `api_module` VALUES ('cead3ae4-5656-4e3e-879b-5a33e394c879', 'test4', NULL, '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811469780, 1660811469780);
INSERT INTO `api_module` VALUES ('e392499a-b8fb-45aa-96bc-3f9b3b1e8711', 'test1-2-2', '56534f4b-2cd4-4611-a71e-fa6198fb655c', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811787922, 1660811787922);
INSERT INTO `api_module` VALUES ('eb8335eb-2049-4258-bea1-fb882db9f9ca', 'test3', NULL, '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811464978, 1660811464978);
INSERT INTO `api_module` VALUES ('ff2d9a5e-60f1-4497-b14b-ded96e86f990', 'test2', NULL, '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660811240683, 1660811240683);

-- ----------------------------
-- Table structure for assertion
-- ----------------------------
DROP TABLE IF EXISTS `assertion`;
CREATE TABLE `assertion`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '断言函数英文',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '断言函数中文',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of assertion
-- ----------------------------
INSERT INTO `assertion` VALUES ('isFalse', 'false');
INSERT INTO `assertion` VALUES ('isNone', 'none/null');
INSERT INTO `assertion` VALUES ('isTrue', 'true');
INSERT INTO `assertion` VALUES ('notEmpty', '不为空');
INSERT INTO `assertion` VALUES ('notContains', '不包含');
INSERT INTO `assertion` VALUES ('notEqual', '不相等');
INSERT INTO `assertion` VALUES ('isNotIn', '不被包含');
INSERT INTO `assertion` VALUES ('isZero', '为0');
INSERT INTO `assertion` VALUES ('empty', '为空');
INSERT INTO `assertion` VALUES ('containsOnly', '仅包含');
INSERT INTO `assertion` VALUES ('isLetter', '仅含字母');
INSERT INTO `assertion` VALUES ('isInt', '仅含数字');
INSERT INTO `assertion` VALUES ('listLenGreaterThan', '列表长度大于');
INSERT INTO `assertion` VALUES ('listLenLessThan', '列表长度小于');
INSERT INTO `assertion` VALUES ('listLenEqual', '列表长度相等');
INSERT INTO `assertion` VALUES ('contains', '包含');
INSERT INTO `assertion` VALUES ('isBetween', '在...之间');
INSERT INTO `assertion` VALUES ('isGreaterThan', '大于');
INSERT INTO `assertion` VALUES ('isGreaterThanOrEqualTo', '大于等于');
INSERT INTO `assertion` VALUES ('isUpper', '大写');
INSERT INTO `assertion` VALUES ('isStrType', '字符串');
INSERT INTO `assertion` VALUES ('equalsDict', '对象相等');
INSERT INTO `assertion` VALUES ('isLessThan', '小于');
INSERT INTO `assertion` VALUES ('isLessThanOrEqualTo', '小于等于');
INSERT INTO `assertion` VALUES ('isLower', '小写');
INSERT INTO `assertion` VALUES ('startWith', '开头是');
INSERT INTO `assertion` VALUES ('isCloseTo', '接近于');
INSERT INTO `assertion` VALUES ('equalsNumber', '数字相等');
INSERT INTO `assertion` VALUES ('equalsList', '数组相等');
INSERT INTO `assertion` VALUES ('isIntType', '整数');
INSERT INTO `assertion` VALUES ('isPositive', '正数');
INSERT INTO `assertion` VALUES ('isFloatType', '浮点数');
INSERT INTO `assertion` VALUES ('equals', '相等');
INSERT INTO `assertion` VALUES ('equalIgnoreCase', '相等(忽略大小写)');
INSERT INTO `assertion` VALUES ('endWith', '结尾是');
INSERT INTO `assertion` VALUES ('isIn', '被包含');
INSERT INTO `assertion` VALUES ('isNegative', '负数');
INSERT INTO `assertion` VALUES ('isNotZero', '非0');

-- ----------------------------
-- Table structure for case
-- ----------------------------
DROP TABLE IF EXISTS `case`;
CREATE TABLE `case`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用例id',
  `num` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用例名称',
  `level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用例等级',
  `module_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属模块id',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用例类型',
  `third_party` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方标识',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用例描述',
  `environment_ids` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '环境标签',
  `common_param` json NULL COMMENT '公共参数',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `num`(`num`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE,
  INDEX `module_id`(`module_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of case
-- ----------------------------
INSERT INTO `case` VALUES ('6c2cd765-ea4d-4446-b09a-50aa0db93fdc', 10008, 'test case 1', 'P0', 'c294229d-8ede-445a-b238-76b60ef32693', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 'WEB', '', 'test', '[\"21d4a869-b41f-4eb8-8234-272f9eb13230\"]', '{\"params\": [], \"functions\": [], \"closeDriver\": true, \"startDriver\": true}', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1661326778186, 1661326778186, 'Normal');
INSERT INTO `case` VALUES ('7db0d97a-bf6f-4f96-bd89-fa19ad688293', 10006, 'test case 1', 'P0', 'c294229d-8ede-445a-b238-76b60ef32693', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 'API', '', 'test', '[\"21d4a869-b41f-4eb8-8234-272f9eb13230\"]', '{\"proxy\": \"\", \"header\": \"\", \"params\": [], \"functions\": []}', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1661325326776, 1661325326776, 'Normal');

-- ----------------------------
-- Table structure for case_api
-- ----------------------------
DROP TABLE IF EXISTS `case_api`;
CREATE TABLE `case_api`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用例接口id',
  `index` int(0) NOT NULL COMMENT '接口序号',
  `case_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用例id',
  `api_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接口id',
  `header` json NULL COMMENT '请求头',
  `body` json NULL COMMENT '请求体',
  `query` json NULL COMMENT '查询参数',
  `rest` json NULL COMMENT '路径参数',
  `assertion` json NULL COMMENT '断言',
  `relation` json NULL COMMENT '关联参数',
  `controller` json NULL COMMENT '逻辑控制器',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `case_id`(`case_id`) USING BTREE,
  INDEX `api_id`(`api_id`) USING BTREE,
  INDEX `index`(`index`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of case_api
-- ----------------------------
INSERT INTO `case_api` VALUES ('2db32958-2b21-4a5f-9ad3-583dd4882c3b', 2, '7db0d97a-bf6f-4f96-bd89-fa19ad688293', 'b76da7c5-838e-4a3d-be44-28a0e8e6581e', '[{\"name\": \"token\", \"value\": \"123\"}]', '{\"raw\": \"\", \"file\": [], \"form\": [], \"json\": \"{\\\"id\\\":\\\"1\\\"}\", \"type\": \"json\"}', '[]', '[]', '[]', '[]', '[]');
INSERT INTO `case_api` VALUES ('b150cc6d-5342-4e84-85ee-2f7d25d690b0', 1, '7db0d97a-bf6f-4f96-bd89-fa19ad688293', '98253357-3f41-488f-a563-d210d74bae55', '[{\"name\": \"token\", \"value\": \"123\"}]', '{\"raw\": \"\", \"file\": [], \"form\": [], \"json\": \"{\\\"id\\\":\\\"1\\\"}\", \"type\": \"json\"}', '[]', '[]', '[]', '[]', '[]');

-- ----------------------------
-- Table structure for case_module
-- ----------------------------
DROP TABLE IF EXISTS `case_module`;
CREATE TABLE `case_module`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模块id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模块名称',
  `parent_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父模块id',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_id_2`(`project_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`, `name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of case_module
-- ----------------------------
INSERT INTO `case_module` VALUES ('8cb0c41b-270b-4415-ab91-7b53e6395787', '测试类型1-1-1-1', 'c28977d4-fb9a-431c-80a5-a9e095a6ba2d', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660901915935, 1660901915935);
INSERT INTO `case_module` VALUES ('b832e688-4c2f-4593-9d1d-883db462bb8f', '测试类型1-1', 'c294229d-8ede-445a-b238-76b60ef32693', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660901877710, 1660901877710);
INSERT INTO `case_module` VALUES ('c28977d4-fb9a-431c-80a5-a9e095a6ba2d', '测试类型1-1-1', 'b832e688-4c2f-4593-9d1d-883db462bb8f', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660901888489, 1660901888489);
INSERT INTO `case_module` VALUES ('c294229d-8ede-445a-b238-76b60ef32693', '测试类型1', NULL, '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660901859127, 1660901859127);

-- ----------------------------
-- Table structure for case_web
-- ----------------------------
DROP TABLE IF EXISTS `case_web`;
CREATE TABLE `case_web`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用例操作id',
  `index` int(0) NOT NULL COMMENT '操作序号',
  `case_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用例id',
  `operation_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作id',
  `element` json NULL COMMENT '操作元素组',
  `data` json NULL COMMENT '操作数据组',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `case_id`(`case_id`) USING BTREE,
  INDEX `operation_id`(`operation_id`) USING BTREE,
  INDEX `index`(`index`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of case_web
-- ----------------------------
INSERT INTO `case_web` VALUES ('2230c564-c72d-4965-a0ce-cb760119e33d', 4, '6c2cd765-ea4d-4446-b09a-50aa0db93fdc', '2bdcbe18-0d86-11ed-8d9c-00ff736d6bc1', '[{\"by\": \"XPATH\", \"id\": \"f5efd886-69c9-4fb9-a3ed-fd19af791266\", \"name\": \"test1\", \"custom\": false, \"moduleId\": \"c9870af8-308b-41ed-941b-48ea566f0924\", \"paramName\": \"element\", \"expression\": \"test\", \"moduleName\": \"测试类型1\", \"description\": \"test\", \"selectElements\": []}]', '[{\"type\": \"String\", \"value\": \"isTrue\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"value\": \"123\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Boolean\", \"value\": false, \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]');
INSERT INTO `case_web` VALUES ('2fb13a69-1170-4550-9f8b-94f19902270c', 2, '6c2cd765-ea4d-4446-b09a-50aa0db93fdc', '2bdcaf87-0d86-11ed-8d9c-00ff736d6bc1', '[]', '[{\"type\": \"String\", \"value\": \"123\", \"paramName\": \"text\", \"description\": \"输入值\"}]');
INSERT INTO `case_web` VALUES ('a9aab267-12cf-412a-aba6-53c93e795e5e', 3, '6c2cd765-ea4d-4446-b09a-50aa0db93fdc', '2bdda167-0d86-11ed-8d9c-00ff736d6bc1', '[{\"by\": \"XPATH\", \"id\": \"f5efd886-69c9-4fb9-a3ed-fd19af791266\", \"name\": \"test1\", \"custom\": false, \"moduleId\": \"c9870af8-308b-41ed-941b-48ea566f0924\", \"paramName\": \"element\", \"expression\": \"test\", \"moduleName\": \"测试类型1\", \"description\": \"test\", \"selectElements\": []}]', '[{\"type\": \"String\", \"value\": \"12333\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]');
INSERT INTO `case_web` VALUES ('ba120fa9-acd9-41b4-9a95-97140ae91066', 1, '6c2cd765-ea4d-4446-b09a-50aa0db93fdc', '2bdc885d-0d86-11ed-8d9c-00ff736d6bc1', '[]', '[]');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '集合id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '集合名称',
  `version_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '集合版本',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '集合描述',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_id`(`project_id`, `name`, `version_id`) USING BTREE,
  INDEX `project_id_2`(`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('123', 'test1', 'a4c938fc-54f0-11ec-99dc-5254aswevf87', 'test1', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660901830898, 1660901830898);
INSERT INTO `collection` VALUES ('c0caf9ff-11cb-4a1a-afa7-00d3a631b537', 'test2', 'a4c938fc-54f0-11ec-99dc-5254aswevf87', 'test2', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1661334127087, 1661334127087);

-- ----------------------------
-- Table structure for collection_case
-- ----------------------------
DROP TABLE IF EXISTS `collection_case`;
CREATE TABLE `collection_case`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '集合用例id',
  `index` int(0) NOT NULL COMMENT '用例序号',
  `collection_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '集合id',
  `case_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用例id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `collection_id`(`collection_id`) USING BTREE,
  INDEX `case_id`(`case_id`) USING BTREE,
  INDEX `index`(`index`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collection_case
-- ----------------------------
INSERT INTO `collection_case` VALUES ('c3b01e15-2bfc-4862-a811-bb7b2d0cd257', 1, 'c0caf9ff-11cb-4a1a-afa7-00d3a631b537', '6c2cd765-ea4d-4446-b09a-50aa0db93fdc');
INSERT INTO `collection_case` VALUES ('ea979099-e456-4700-9452-84ceb82c5e49', 2, 'c0caf9ff-11cb-4a1a-afa7-00d3a631b537', '7db0d97a-bf6f-4f96-bd89-fa19ad688293');

-- ----------------------------
-- Table structure for daily_statistics
-- ----------------------------
DROP TABLE IF EXISTS `daily_statistics`;
CREATE TABLE `daily_statistics`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `stat_date` date NOT NULL COMMENT '统计日期',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `api_case_new` int(0) NOT NULL COMMENT 'API用例当日新增',
  `web_case_new` int(0) NOT NULL COMMENT 'WEB用例当日新增',
  `api_case_sum` int(0) NOT NULL COMMENT 'API用例当日总数',
  `web_case_sum` int(0) NOT NULL COMMENT 'WEB用例当日总数',
  `api_case_run` int(0) NOT NULL COMMENT 'API用例当日执行',
  `web_case_run` int(0) NOT NULL COMMENT 'WEB用例当日执行',
  `api_case_pass_rate` float NOT NULL COMMENT 'API用例当日通过率',
  `web_case_pass_rate` float NOT NULL COMMENT 'WEB用例当日通过率',
  PRIMARY KEY (`stat_date`, `project_id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `stat_date`(`stat_date`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of daily_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for debug_data
-- ----------------------------
DROP TABLE IF EXISTS `debug_data`;
CREATE TABLE `debug_data`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调试数据id',
  `data` json NOT NULL COMMENT '调试数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of debug_data
-- ----------------------------

-- ----------------------------
-- Table structure for domain
-- ----------------------------
DROP TABLE IF EXISTS `domain`;
CREATE TABLE `domain`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '域名id',
  `domain_key_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '域名标识类型',
  `domain_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '域名标识',
  `domain_data` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '域名值',
  `environment_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属环境id',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `environment_id`(`environment_id`, `domain_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of domain
-- ----------------------------

-- ----------------------------
-- Table structure for domain_sign
-- ----------------------------
DROP TABLE IF EXISTS `domain_sign`;
CREATE TABLE `domain_sign`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '域名标识id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '域名标识名称',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名标识描述',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_id`(`project_id`, `name`) USING BTREE,
  INDEX `project_id_2`(`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of domain_sign
-- ----------------------------

-- ----------------------------
-- Table structure for element
-- ----------------------------
DROP TABLE IF EXISTS `element`;
CREATE TABLE `element`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '元素id',
  `num` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '元素名称',
  `module_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属模块id',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定位方式',
  `expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表达式',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '元素描述',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `module_id`(`module_id`, `name`) USING BTREE,
  UNIQUE INDEX `num`(`num`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE,
  INDEX `module_id_2`(`module_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10004 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of element
-- ----------------------------
INSERT INTO `element` VALUES ('123', 10000, 'test', 'c9870af8-308b-41ed-941b-48ea566f0924', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 'XPATH', 'xpath test', 'test', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1658910165703, 1658910165703, 'Normal');
INSERT INTO `element` VALUES ('97ae5709-9699-417c-99d3-4ee7f442e66f', 10002, 'test2', 'c9870af8-308b-41ed-941b-48ea566f0924', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 'XPATH', 'test2', 'test2', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1661150584360, 1661150584360, 'Normal');
INSERT INTO `element` VALUES ('a4bb592b-c176-442a-af15-4dc98b63fd5d', 10004, 'test4', 'c9870af8-308b-41ed-941b-48ea566f0924', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 'XPATH', 'test4', 'test4', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1661150606941, 1661150606941, 'del');
INSERT INTO `element` VALUES ('bf1ae292-bf81-4899-8c59-3983117f1580', 10003, 'test3', 'c9870af8-308b-41ed-941b-48ea566f0924', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 'XPATH', 'test3', 'test3', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1661150595283, 1661150595283, 'Normal');
INSERT INTO `element` VALUES ('f5efd886-69c9-4fb9-a3ed-fd19af791266', 10001, 'test1', 'c9870af8-308b-41ed-941b-48ea566f0924', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 'XPATH', 'test', 'test', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1661150562829, 1661150562829, 'Normal');

-- ----------------------------
-- Table structure for engine
-- ----------------------------
DROP TABLE IF EXISTS `engine`;
CREATE TABLE `engine`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '引擎id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '引擎名称',
  `engine_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '引擎类型',
  `secret` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '引擎秘钥',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '引擎状态',
  `last_heartbeat_time` bigint(0) NULL DEFAULT NULL COMMENT '上次心跳时间',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_id`(`project_id`, `name`) USING BTREE,
  INDEX `project_id_2`(`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of engine
-- ----------------------------
INSERT INTO `engine` VALUES ('cc67bf40fc664a02bb92aeede7a0649a', 'test1', 'custom', '756acbc3d08b45568832f81b1789f1ab', 'offline', NULL, '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660804233715, 1660804233715);
INSERT INTO `engine` VALUES ('d79f50070d8511ed8d9c00ff736d6bc1', '系统引擎4', 'system', 'd79f50290d8511ed8d9c00ff736d6bc1', 'offline', NULL, 'system', 'system_admin_user', 'system_admin_user', 1658910401769, 1658910401769);
INSERT INTO `engine` VALUES ('d79fd16d0d8511ed8d9c00ff736d6bc1', '系统引擎3', 'system', 'd79fd1920d8511ed8d9c00ff736d6bc1', 'offline', NULL, 'system', 'system_admin_user', 'system_admin_user', 1658910401773, 1658910401773);
INSERT INTO `engine` VALUES ('d7a04f190d8511ed8d9c00ff736d6bc1', '系统引擎2', 'system', 'd7a04f400d8511ed8d9c00ff736d6bc1', 'offline', NULL, 'system', 'system_admin_user', 'system_admin_user', 1658910401777, 1658910401777);
INSERT INTO `engine` VALUES ('d7a0b2f00d8511ed8d9c00ff736d6bc1', '系统引擎1', 'system', 'd7a0b3130d8511ed8d9c00ff736d6bc1', 'offline', NULL, 'system', 'system_admin_user', 'system_admin_user', 1658910401779, 1658910401779);

-- ----------------------------
-- Table structure for environment
-- ----------------------------
DROP TABLE IF EXISTS `environment`;
CREATE TABLE `environment`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '环境id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '环境名称',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '环境描述',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_id`(`project_id`, `name`) USING BTREE,
  INDEX `project_id_2`(`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of environment
-- ----------------------------
INSERT INTO `environment` VALUES ('21d4a869-b41f-4eb8-8234-272f9eb13230', 'test1', 'test1', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660574893563, 1660574893563);

-- ----------------------------
-- Table structure for function
-- ----------------------------
DROP TABLE IF EXISTS `function`;
CREATE TABLE `function`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '函数id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '函数名',
  `from` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '函数来源',
  `param` json NULL COMMENT '入参定义',
  `code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '函数代码',
  `expression` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用表达式',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '函数描述',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of function
-- ----------------------------
INSERT INTO `function` VALUES ('3489d54c-0d86-11ed-8d9c-00ff736d6bc1', 'bothify', 'system', '[{\"type\": \"String\", \"paramName\": \"text\", \"description\": \"生成表达式 例 \'##??\'\"}, {\"type\": \"String\", \"paramName\": \"letters\", \"description\": \"生成字母取值范围 默认26个字母\"}]', '', '{{@bothify(text, letters)}}', '随机生成数字字母组合字符串', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489d88f-0d86-11ed-8d9c-00ff736d6bc1', 'lexify', 'system', '[{\"type\": \"String\", \"paramName\": \"text\", \"description\": \"生成表达式 例 \'????\'\"}, {\"type\": \"String\", \"paramName\": \"letters\", \"description\": \"生成字母取值范围 默认26个字母\"}]', '', '{{@lexify(text, letters)}}', '随机生成纯字母字符串', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489d96e-0d86-11ed-8d9c-00ff736d6bc1', 'numerify', 'system', '[{\"type\": \"String\", \"paramName\": \"text\", \"description\": \"生成表达式 例 \'####\'\"}]', '', '{{@numerify(text)}}', '随机生成纯数字字符串', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489da28-0d86-11ed-8d9c-00ff736d6bc1', 'random_int', 'system', '[{\"type\": \"Int\", \"paramName\": \"min\", \"description\": \"最小值\"}, {\"type\": \"Int\", \"paramName\": \"max\", \"description\": \"最大值\"}, {\"type\": \"Int\", \"paramName\": \"step\", \"description\": \"间隔\"}]', '', '{{@random_int(min, max, step)}}', '随机生成指定区间数字', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489db7b-0d86-11ed-8d9c-00ff736d6bc1', 'pyfloat', 'system', '[{\"type\": \"Int\", \"paramName\": \"left_digits\", \"description\": \"小数点左边整数位数\"}, {\"type\": \"Int\", \"paramName\": \"right_digits\", \"description\": \"小数点右边小数位数\"}, {\"type\": \"Boolean\", \"paramName\": \"positive\", \"description\": \"是否只有正数 默认True\"}]', '', '{{@pyfloat(left_digits, right_digits, positive)}}', '随机生成指定长度的小数', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489dc79-0d86-11ed-8d9c-00ff736d6bc1', 'random_number', 'system', '[{\"type\": \"Int\", \"paramName\": \"digits\", \"description\": \"数值长度\"}, {\"type\": \"Boolean\", \"paramName\": \"fix_len\", \"description\": \"是否必须该长度 False时可以小于该长度\"}]', '', '{{@random_number(digits, fix_len)}}', '随机生成指定长度数字', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489dd2e-0d86-11ed-8d9c-00ff736d6bc1', 'country_code', 'system', '[]', '', '{{@country_code}}', '随机生成国家编码', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489ddbe-0d86-11ed-8d9c-00ff736d6bc1', 'ean', 'system', '[{\"type\": \"Int\", \"paramName\": \"length\", \"description\": \"条码长度 8或13\"}]', '', '{{@ean(length)}}', '随机生成国际商品条编码', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489de6e-0d86-11ed-8d9c-00ff736d6bc1', 'localized_ean', 'system', '[{\"type\": \"Int\", \"paramName\": \"length\", \"description\": \"条码长度 8或13\"}]', '', '{{@localized_ean(length)}}', '随机生成当地商品条编码', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489df2a-0d86-11ed-8d9c-00ff736d6bc1', 'credit_card_full', 'system', '[]', '', '{{@credit_card_full}}', '随机生成信用卡完整信息', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489dfc5-0d86-11ed-8d9c-00ff736d6bc1', 'credit_card_number', 'system', '[]', '', '{{@credit_card_number}}', '随机生成信用卡号', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489e062-0d86-11ed-8d9c-00ff736d6bc1', 'credit_card_provider', 'system', '[]', '', '{{@credit_card_provider}}', '随机生成信用卡类型', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489e0e9-0d86-11ed-8d9c-00ff736d6bc1', 'credit_card_security_code', 'system', '[]', '', '{{@credit_card_security_code}}', '随机生成信用卡安全码', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489e17d-0d86-11ed-8d9c-00ff736d6bc1', 'date', 'system', '[{\"type\": \"String\", \"paramName\": \"s\", \"description\": \"时间表达式 例 %Y-%m-%d\"}]', '', '{{@date(s)}}', '随机生成日期', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489e249-0d86-11ed-8d9c-00ff736d6bc1', 'time', 'system', '[{\"type\": \"String\", \"paramName\": \"s\", \"description\": \"时间表达式 例 %H:%M:%S\"}]', '', '{{@time(s)}}', '随机生成时间', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489e2f1-0d86-11ed-8d9c-00ff736d6bc1', 'file_extension', 'system', '[]', '', '{{@file_extension}}', '随机生成文件拓展名', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489e374-0d86-11ed-8d9c-00ff736d6bc1', 'file_name', 'system', '[]', '', '{{@file_name}}', '随机生成文件名', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489e425-0d86-11ed-8d9c-00ff736d6bc1', 'file_path', 'system', '[]', '', '{{@file_path}}', '随机生成文件路径', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489e553-0d86-11ed-8d9c-00ff736d6bc1', 'mime_type', 'system', '[]', '', '{{@mime_type}}', '随机生成mime type', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489e609-0d86-11ed-8d9c-00ff736d6bc1', 'unix_device', 'system', '[]', '', '{{@unix_device}}', '随机生成unix设备', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489e6b1-0d86-11ed-8d9c-00ff736d6bc1', 'unix_partition', 'system', '[]', '', '{{@unix_partition}}', '随机生成unix分区', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489e76b-0d86-11ed-8d9c-00ff736d6bc1', 'domain_name', 'system', '[]', '', '{{@domain_name}}', '随机生成域名地址', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489e7f3-0d86-11ed-8d9c-00ff736d6bc1', 'email', 'system', '[]', '', '{{@email}}', '随机生成邮箱地址', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489e95d-0d86-11ed-8d9c-00ff736d6bc1', 'hostname', 'system', '[]', '', '{{@hostname}}', '随机生成主机地址', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489ea1e-0d86-11ed-8d9c-00ff736d6bc1', 'image_url', 'system', '[]', '', '{{@image_url}}', '随机生成图片地址', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489eab6-0d86-11ed-8d9c-00ff736d6bc1', 'ipv4', 'system', '[]', '', '{{@ipv4}}', '随机生成ipv4地址', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489ebab-0d86-11ed-8d9c-00ff736d6bc1', 'ipv4_private', 'system', '[]', '', '{{@ipv4_private}}', '随机生成局域网ipv4地址', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489ec1d-0d86-11ed-8d9c-00ff736d6bc1', 'ipv4_public', 'system', '[]', '', '{{@ipv4_public}}', '随机生成公网ipv4地址', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489ec8a-0d86-11ed-8d9c-00ff736d6bc1', 'ipv6', 'system', '[]', '', '{{@ipv6}}', '随机生成ipv6地址', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489ecf4-0d86-11ed-8d9c-00ff736d6bc1', 'uri_path', 'system', '[]', '', '{{@uri_path}}', '随机生成网址文件路径', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489ed67-0d86-11ed-8d9c-00ff736d6bc1', 'isbn10', 'system', '[]', '', '{{@isbn10}}', '随机生成10位ISBN', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489eddf-0d86-11ed-8d9c-00ff736d6bc1', 'isbn13', 'system', '[]', '', '{{@isbn13}}', '随机生成13位ISBN', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489ee4f-0d86-11ed-8d9c-00ff736d6bc1', 'paragraph', 'system', '[]', '', '{{@paragraph}}', '随机生成一个段落', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489eec0-0d86-11ed-8d9c-00ff736d6bc1', 'paragraphs', 'system', '[]', '', '{{@paragraphs}}', '随机生成多个段落', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489ef35-0d86-11ed-8d9c-00ff736d6bc1', 'sentence', 'system', '[]', '', '{{@sentence}}', '随机生成一句话', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489efa2-0d86-11ed-8d9c-00ff736d6bc1', 'sentences', 'system', '[]', '', '{{@sentences}}', '随机生成多句话', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f029-0d86-11ed-8d9c-00ff736d6bc1', 'text', 'system', '[]', '', '{{@text}}', '随机生成一篇文章', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f09d-0d86-11ed-8d9c-00ff736d6bc1', 'texts', 'system', '[]', '', '{{@texts}}', '随机生成多篇文章', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f10d-0d86-11ed-8d9c-00ff736d6bc1', 'word', 'system', '[]', '', '{{@word}}', '随机生成一个词语', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f1b7-0d86-11ed-8d9c-00ff736d6bc1', 'words', 'system', '[]', '', '{{@words}}', '随机生成多个词语', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f22a-0d86-11ed-8d9c-00ff736d6bc1', 'password', 'system', '[{\"type\": \"Int\", \"paramName\": \"length\", \"description\": \"密码长度\"}]', '', '{{@password(length)}}', '随机生成指定长度密码', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f2d5-0d86-11ed-8d9c-00ff736d6bc1', 'loadfile', 'system', '[{\"type\": \"String\", \"paramName\": \"uuid\", \"description\": \"文件uuid\"}]', '', '{{@loadfile(uuid)}}', '下载并读取文件', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f369-0d86-11ed-8d9c-00ff736d6bc1', 'b64encode_str', 'system', '[{\"type\": \"String\", \"paramName\": \"s\", \"description\": \"待编码字符串\"}]', '', '{{@b64encode_str(s)}}', '对字符串base64编码', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f40a-0d86-11ed-8d9c-00ff736d6bc1', 'b64encode_bytes', 'system', '[{\"type\": \"Bytes\", \"paramName\": \"s\", \"description\": \"待编码字节流\"}]', '', '{{@b64encode_bytes(s)}}', '对字节流base64编码', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f48a-0d86-11ed-8d9c-00ff736d6bc1', 'b64encode_file', 'system', '[{\"type\": \"String\", \"paramName\": \"uuid\", \"description\": \"文件uuid\"}]', '', '{{@b64encode_file(uuid)}}', '下载读取文件并base64编码', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f50a-0d86-11ed-8d9c-00ff736d6bc1', 'b64decode_toStr', 'system', '[{\"type\": \"String\", \"paramName\": \"s\", \"description\": \"待解码字符串\"}]', '', '{{@b64decode_toStr(s)}}', '对base64解码成字符串', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f58a-0d86-11ed-8d9c-00ff736d6bc1', 'b64decode_toBytes', 'system', '[{\"type\": \"String\", \"paramName\": \"s\", \"description\": \"待解码字符串\"}]', '', '{{@b64decode_toBytes(s)}}', '对base64解码成字节流', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f61a-0d86-11ed-8d9c-00ff736d6bc1', 'arithmetic', 'system', '[{\"type\": \"String\", \"paramName\": \"expression\", \"description\": \"运算表达式\"}]', '', '{{@arithmetic(expression)}}', '四则运算', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f699-0d86-11ed-8d9c-00ff736d6bc1', 'current_time', 'system', '[{\"type\": \"String\", \"paramName\": \"s\", \"description\": \"时间表达式 传None则返回时间戳\"}]', '', '{{@current_time(s)}}', '获取当前时间', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f72d-0d86-11ed-8d9c-00ff736d6bc1', 'year_shift', 'system', '[{\"type\": \"Float\", \"paramName\": \"shift\", \"description\": \"时间偏移量 可为负数\"}, {\"type\": \"String\", \"paramName\": \"s\", \"description\": \"时间表达式 传None则返回时间戳\"}]', '', '{{@year_shift(shift, s)}}', '获取当前时间前后年份时间', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f7db-0d86-11ed-8d9c-00ff736d6bc1', 'month_shift', 'system', '[{\"type\": \"Float\", \"paramName\": \"shift\", \"description\": \"时间偏移量 可为负数\"}, {\"type\": \"String\", \"paramName\": \"s\", \"description\": \"时间表达式 传None则返回时间戳\"}]', '', '{{@month_shift(shift, s)}}', '获取当前时间前后月份时间', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f8ae-0d86-11ed-8d9c-00ff736d6bc1', 'week_shift', 'system', '[{\"type\": \"Float\", \"paramName\": \"shift\", \"description\": \"时间偏移量 可为负数\"}, {\"type\": \"String\", \"paramName\": \"s\", \"description\": \"时间表达式 传None则返回时间戳\"}]', '', '{{@week_shift(shift, s)}}', '获取当前时间前后天数时间', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f940-0d86-11ed-8d9c-00ff736d6bc1', 'date_shift', 'system', '[{\"type\": \"Float\", \"paramName\": \"shift\", \"description\": \"时间偏移量 可为负数\"}, {\"type\": \"String\", \"paramName\": \"s\", \"description\": \"时间表达式 传None则返回时间戳\"}]', '', '{{@date_shift(shift, s)}}', '获取当前时间前后周数时间', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489f9df-0d86-11ed-8d9c-00ff736d6bc1', 'hour_shift', 'system', '[{\"type\": \"Float\", \"paramName\": \"shift\", \"description\": \"时间偏移量 可为负数\"}, {\"type\": \"String\", \"paramName\": \"s\", \"description\": \"时间表达式 传None则返回时间戳\"}]', '', '{{@hour_shift(shift, s)}}', '获取当前时间前后小时时间', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489fa6f-0d86-11ed-8d9c-00ff736d6bc1', 'minute_shift', 'system', '[{\"type\": \"Float\", \"paramName\": \"shift\", \"description\": \"时间偏移量 可为负数\"}, {\"type\": \"String\", \"paramName\": \"s\", \"description\": \"时间表达式 传None则返回时间戳\"}]', '', '{{@minute_shift(shift, s)}}', '获取当前时间前后分钟时间', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489faf8-0d86-11ed-8d9c-00ff736d6bc1', 'second_shift', 'system', '[{\"type\": \"Float\", \"paramName\": \"shift\", \"description\": \"时间偏移量 可为负数\"}, {\"type\": \"String\", \"paramName\": \"s\", \"description\": \"时间表达式 传None则返回时间戳\"}]', '', '{{@second_shift(shift, s)}}', '获取当前时间前后秒钟时间', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489fb9a-0d86-11ed-8d9c-00ff736d6bc1', 'lenof', 'system', '[{\"type\": \"JSONArray\", \"paramName\": \"array\", \"description\": \"被取值数组\"}]', '', '{{@lenof(array)}}', '获取数组长度', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489fc33-0d86-11ed-8d9c-00ff736d6bc1', 'indexof', 'system', '[{\"type\": \"JSONArray\", \"paramName\": \"array\", \"description\": \"被取值数组\"}, {\"type\": \"Int\", \"paramName\": \"index\", \"description\": \"取值序号\"}]', '', '{{@indexof(array, index)}}', '根据序号获取数组元素', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489fce1-0d86-11ed-8d9c-00ff736d6bc1', 'keyof', 'system', '[{\"type\": \"JSONObject\", \"paramName\": \"map\", \"description\": \"被取值字典\"}, {\"type\": \"String\", \"paramName\": \"key\", \"description\": \"取值键值\"}]', '', '{{@keyof(map, key)}}', '根据键值获取字典元素值', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('3489fd79-0d86-11ed-8d9c-00ff736d6bc1', 'pinyin', 'system', '[{\"type\": \"String\", \"paramName\": \"cname\", \"description\": \"中文名\"}]', '', '{{@pinyin(cname)}}', '获取中文的拼音', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('348a5e67-0d86-11ed-8d9c-00ff736d6bc1', 'substing', 'system', '[{\"type\": \"String\", \"paramName\": \"s\", \"description\": \"被截取字符串\"}, {\"type\": \"Int\", \"paramName\": \"start\", \"description\": \"截取开始位数 可为负数\"}, {\"type\": \"Int\", \"paramName\": \"end\", \"description\": \"截取结束位数 可为负数\"}]', '', '{{@substing(s, start, end)}}', '截取字符串', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('348a6011-0d86-11ed-8d9c-00ff736d6bc1', 'extract', 'system', '[{\"type\": \"Other\", \"paramName\": \"data\", \"description\": \"提取后的值\"}]', '', '{{@extract(data)}}', '获取json提取值 通常与#{jsonpath}并用', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('348a60c1-0d86-11ed-8d9c-00ff736d6bc1', 'replace', 'system', '[{\"type\": \"String\", \"paramName\": \"s\", \"description\": \"被替换字符串\"}, {\"type\": \"String\", \"paramName\": \"old\", \"description\": \"替换目标值\"}, {\"type\": \"String\", \"paramName\": \"new\", \"description\": \"替换后的值\"}]', '', '{{@replace(s, old, new)}}', '替换字符串', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('348a6175-0d86-11ed-8d9c-00ff736d6bc1', 'map_dumps', 'system', '[{\"type\": \"JSONObject\", \"paramName\": \"tar\", \"description\": \"序列化字典\"}]', '', '{{@map_dumps(tar)}}', '对字典进行序列化', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('348a620f-0d86-11ed-8d9c-00ff736d6bc1', 'array_dumps', 'system', '[{\"type\": \"JSONArray\", \"paramName\": \"tar\", \"description\": \"序列化数组\"}]', '', '{{@array_dumps(tar)}}', '对数组进行序列化', 'system', 'system_admin_user', 'system_admin_user', 1658910557656, 1658910557656);
INSERT INTO `function` VALUES ('47973a56-a925-4f02-823d-be3dc1630169', 'new', 'new', '[{\"type\": \"String\", \"paramName\": \"expression\", \"description\": \"运算表达式\"}]', '', 'new', 'new', 'system', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660634034377, 1660634034377);

-- ----------------------------
-- Table structure for liuma_version
-- ----------------------------
DROP TABLE IF EXISTS `liuma_version`;
CREATE TABLE `liuma_version`  (
  `installed_rank` int(0) NOT NULL,
  `version` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `script` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `checksum` int(0) NULL DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `installed_on` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `execution_time` int(0) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`) USING BTREE,
  INDEX `liuma_version_s_idx`(`success`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of liuma_version
-- ----------------------------
INSERT INTO `liuma_version` VALUES (1, '0', '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', NULL, 'root', '2022-07-27 17:49:48', 0, 1);
INSERT INTO `liuma_version` VALUES (2, '1.0', 'init system', 'SQL', 'V1.0__init_system.sql', 321757972, 'root', '2022-07-27 17:49:48', 16, 0);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_menu` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleted` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '100', '公共组件', 'icon-gonggongzujian', NULL, NULL, NULL, 0);
INSERT INTO `menu` VALUES (2, '111', '文件管理', 'icon-wenjianguanli', '/common/fileManage', '100', 'NORMAL_MENU', 0);
INSERT INTO `menu` VALUES (3, '121', '公共参数', 'icon-gonggongcanshu', '/common/commonParam', '100', 'NORMAL_MENU', 0);
INSERT INTO `menu` VALUES (4, '131', '函数管理', 'icon-hanshuguanli', '/common/funcManage', '100', 'NORMAL_MENU', 0);
INSERT INTO `menu` VALUES (5, '141', '控件管理', 'icon-kongjianguanli', '/common/operationManage', '100', 'NORMAL_MENU', 0);
INSERT INTO `menu` VALUES (6, '200', '环境中心', 'icon-huanjingzhongxin', NULL, NULL, NULL, 0);
INSERT INTO `menu` VALUES (7, '211', '环境管理', 'icon-huanjingguanli', '/envCenter/envManage', '200', 'NORMAL_MENU', 0);
INSERT INTO `menu` VALUES (8, '221', '引擎管理', 'icon-yinqinguanli', '/envCenter/engineManage', '200', 'NORMAL_MENU', 0);
INSERT INTO `menu` VALUES (9, '300', '用例中心', 'icon-yonglizhongxin', NULL, NULL, NULL, 0);
INSERT INTO `menu` VALUES (10, '311', '接口管理', 'icon-jiekouguanli', '/caseCenter/interfaceManage', '300', 'NORMAL_MENU', 0);
INSERT INTO `menu` VALUES (11, '321', '元素管理', 'icon-yuansuguanli', '/caseCenter/elementManage', '300', 'NORMAL_MENU', 0);
INSERT INTO `menu` VALUES (12, '331', '用例管理', 'icon-yongliguanli', '/caseCenter/caseManage', '300', 'NORMAL_MENU', 0);
INSERT INTO `menu` VALUES (13, '400', '计划管理', 'icon-jihuaguanli', NULL, NULL, NULL, 0);
INSERT INTO `menu` VALUES (14, '411', '测试集合', 'icon-ceshijihe', '/planManage/testCollection', '400', 'NORMAL_MENU', 0);
INSERT INTO `menu` VALUES (15, '421', '测试计划', 'icon-ceshijihua', '/planManage/testPlan', '400', 'NORMAL_MENU', 0);
INSERT INTO `menu` VALUES (16, '500', '测试追踪', 'icon-ceshizhuizong', NULL, NULL, NULL, 0);
INSERT INTO `menu` VALUES (17, '511', '测试报告', 'icon-ceshibaogao', '/report/testReport', '500', 'NORMAL_MENU', 0);
INSERT INTO `menu` VALUES (18, '600', '系统管理', 'icon-xitongguanli', NULL, NULL, NULL, 0);
INSERT INTO `menu` VALUES (19, '611', '用户管理', 'icon-yonghuguanli', '/systemManage/user', '600', 'USER_MENU', 0);
INSERT INTO `menu` VALUES (20, '621', '角色管理', 'icon-jiaoseguanli', '/systemManage/role', '600', 'ROLE_MENU', 0);
INSERT INTO `menu` VALUES (21, '631', '项目管理', 'icon-xiangmuguanli', '/systemManage/project', '600', 'PROJECT_MENU', 0);

-- ----------------------------
-- Table structure for operation
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作名',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作分类',
  `from` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作来源',
  `element` json NULL COMMENT '元素定义',
  `data` json NULL COMMENT '数据定义',
  `code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作代码',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作描述',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_id`(`project_id`, `name`) USING BTREE,
  INDEX `project_id_2`(`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES ('2bdc885d-0d86-11ed-8d9c-00ff736d6bc1', '最大化窗口', 'browser', 'system', '[]', '[]', '', 'driver.maximize_window()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdc9965-0d86-11ed-8d9c-00ff736d6bc1', '最小化窗口', 'browser', 'system', '[]', '[]', '', 'driver.minimize_window()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdc9a5d-0d86-11ed-8d9c-00ff736d6bc1', '全屏窗口', 'browser', 'system', '[]', '[]', '', 'driver.fullscreen_window()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdc9af2-0d86-11ed-8d9c-00ff736d6bc1', '设置窗口位置', 'browser', 'system', '[]', '[{\"type\": \"Int\", \"paramName\": \"x\", \"description\": \"X轴坐标\"}, {\"type\": \"Int\", \"paramName\": \"y\", \"description\": \"Y轴坐标\"}]', '', 'driver.set_window_position(x, y)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdc9c26-0d86-11ed-8d9c-00ff736d6bc1', '设置窗口大小', 'browser', 'system', '[]', '[{\"type\": \"Int\", \"paramName\": \"width\", \"description\": \"窗口宽度\"}, {\"type\": \"Int\", \"paramName\": \"height\", \"description\": \"窗口高度\"}]', '', 'driver.set_window_size(width, height)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdc9d20-0d86-11ed-8d9c-00ff736d6bc1', '切换窗口', 'browser', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"window\", \"description\": \"窗口句柄\"}]', '', 'driver.switch_to.window(window)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdc9ec2-0d86-11ed-8d9c-00ff736d6bc1', '关闭窗口', 'browser', 'system', '[]', '[]', '', 'driver.close()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdc9f9b-0d86-11ed-8d9c-00ff736d6bc1', '屏幕截图', 'browser', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"name\", \"description\": \"截图名称\"}]', '', 'driver.get_screenshot_as_png()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdca0f5-0d86-11ed-8d9c-00ff736d6bc1', '单击跳转新窗口', 'browser', 'system', '[{\"paramName\": \"element\", \"description\": \"被点击元素\"}]', '[]', '', 'driver.find_element(**element).click(), driver.switch_to.window(new_window)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdca1c6-0d86-11ed-8d9c-00ff736d6bc1', '返回并关闭当前窗口', 'browser', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"window\", \"description\": \"窗口句柄\"}]', '', 'driver.close(), driver.switch_to.window(window)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdca268-0d86-11ed-8d9c-00ff736d6bc1', '打开网页', 'browser', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"domain\", \"description\": \"环境域名标识 为空则以path正则提取\"}, {\"type\": \"String\", \"paramName\": \"path\", \"description\": \"页面路由地址\"}]', '', 'driver.get(domain+path)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdca335-0d86-11ed-8d9c-00ff736d6bc1', '刷新', 'browser', 'system', '[]', '[]', '', 'driver.refresh()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdca466-0d86-11ed-8d9c-00ff736d6bc1', '后退', 'browser', 'system', '[]', '[]', '', 'driver.back()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdca4f5-0d86-11ed-8d9c-00ff736d6bc1', '前进', 'browser', 'system', '[]', '[]', '', 'driver.forward()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdca5a3-0d86-11ed-8d9c-00ff736d6bc1', '强制等待', 'browser', 'system', '[]', '[{\"type\": \"Int\", \"paramName\": \"second\", \"description\": \"等待时长 单位秒\"}]', '', 'sleep(second)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdca702-0d86-11ed-8d9c-00ff736d6bc1', '隐式等待', 'browser', 'system', '[]', '[{\"type\": \"Int\", \"paramName\": \"second\", \"description\": \"等待时长 单位秒\"}]', '', 'driver.implicitly_wait(second)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdca7d3-0d86-11ed-8d9c-00ff736d6bc1', '添加cookie', 'browser', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"name\", \"description\": \"cookie名称\"}, {\"type\": \"String\", \"paramName\": \"value\", \"description\": \"cookie值\"}]', '', 'driver.add_cookie(**cookie)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdca89f-0d86-11ed-8d9c-00ff736d6bc1', '删除cookie', 'browser', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"name\", \"description\": \"cookie名称\"}]', '', 'driver.delete_cookie(name)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdca982-0d86-11ed-8d9c-00ff736d6bc1', '删除cookies', 'browser', 'system', '[]', '[]', '', 'driver.delete_all_cookies()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcaa67-0d86-11ed-8d9c-00ff736d6bc1', '执行脚本', 'browser', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"script\", \"description\": \"js脚本\"}, {\"type\": \"JSONArray\", \"paramName\": \"arg\", \"description\": \"js脚本参数值数组 例[\'a\',\'b\']\"}]', '', 'driver.execute_script(script, *arg)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcabc3-0d86-11ed-8d9c-00ff736d6bc1', '执行异步脚本', 'browser', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"script\", \"description\": \"js脚本\"}, {\"type\": \"JSONArray\", \"paramName\": \"arg\", \"description\": \"js脚本参数值数组 例[\'a\',\'b\']\"}]', '', 'driver.execute_async_script(script, *arg)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcac6e-0d86-11ed-8d9c-00ff736d6bc1', '切换frame', 'page', 'system', '[{\"paramName\": \"frame\", \"description\": \"frame元素\"}]', '[]', '', 'driver.switch_to.frame(driver.find_element(**frame)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcad0d-0d86-11ed-8d9c-00ff736d6bc1', '返回默认frame', 'page', 'system', '[]', '[]', '', 'driver.switch_to.default_content()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcada9-0d86-11ed-8d9c-00ff736d6bc1', '返回父级frame', 'page', 'system', '[]', '[]', '', 'driver.switch_to.parent_frame()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcae30-0d86-11ed-8d9c-00ff736d6bc1', '弹出框确认', 'page', 'system', '[]', '[]', '', 'wait.WebDriverWait(driver, timeout=30).until(expected_conditions.alert_is_present()).accept()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcaf03-0d86-11ed-8d9c-00ff736d6bc1', '弹出框取消', 'page', 'system', '[]', '[]', '', 'wait.WebDriverWait(driver, timeout=30).until(expected_conditions.alert_is_present()).dismiss()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcaf87-0d86-11ed-8d9c-00ff736d6bc1', '弹出框输入', 'page', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"text\", \"description\": \"输入值\"}]', '', 'wait.WebDriverWait(driver, timeout=30).until(expected_conditions.alert_is_present()).send_keys(text)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcb01e-0d86-11ed-8d9c-00ff736d6bc1', '鼠标单击', 'page', 'system', '[]', '[]', '', 'ActionChains(driver).click().perform()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcb0a9-0d86-11ed-8d9c-00ff736d6bc1', '清空', 'page', 'system', '[{\"paramName\": \"element\", \"description\": \"被清空元素\"}]', '[]', '', 'driver.find_element(**element).clear()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcb153-0d86-11ed-8d9c-00ff736d6bc1', '输入', 'page', 'system', '[{\"paramName\": \"element\", \"description\": \"待输入元素\"}]', '[{\"type\": \"String\", \"paramName\": \"text\", \"description\": \"输入值\"}]', '', 'driver.find_element(**element).send_keys()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcb1eb-0d86-11ed-8d9c-00ff736d6bc1', '单击', 'page', 'system', '[{\"paramName\": \"element\", \"description\": \"被点击元素\"}]', '[]', '', 'driver.find_element(**element).click()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcb271-0d86-11ed-8d9c-00ff736d6bc1', '提交', 'page', 'system', '[{\"paramName\": \"element\", \"description\": \"被提交元素\"}]', '[]', '', 'driver.find_element(**element).submit()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcb2f5-0d86-11ed-8d9c-00ff736d6bc1', '单击保持', 'page', 'system', '[{\"paramName\": \"element\", \"description\": \"被单击保持元素\"}]', '[]', '', 'ActionChains(driver).click_and_hold(driver.find_element(**element)).perform()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcb3dd-0d86-11ed-8d9c-00ff736d6bc1', '右键点击', 'page', 'system', '[{\"paramName\": \"element\", \"description\": \"被右键点击元素\"}]', '[]', '', 'ActionChains(driver).context_click(driver.find_element(**element)).perform()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcb488-0d86-11ed-8d9c-00ff736d6bc1', '双击', 'page', 'system', '[{\"paramName\": \"element\", \"description\": \"被双击元素\"}]', '[]', '', 'ActionChains(driver).double_click(driver.find_element(**element)).perform()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcb523-0d86-11ed-8d9c-00ff736d6bc1', '拖拽', 'page', 'system', '[{\"paramName\": \"startElement\", \"description\": \"被拖拽元素\"}, {\"paramName\": \"endElement\", \"description\": \"拖拽目标元素\"}]', '[]', '', 'ActionChains(driver).context_click(driver.find_element(**startElement), driver.find_element(**endElement)).perform()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcb5c9-0d86-11ed-8d9c-00ff736d6bc1', '偏移拖拽', 'page', 'system', '[{\"paramName\": \"element\", \"description\": \"被拖拽元素\"}]', '[{\"type\": \"Int\", \"paramName\": \"x\", \"description\": \"X轴偏移量\"}, {\"type\": \"Int\", \"paramName\": \"y\", \"description\": \"Y轴偏移量\"}]', '', 'ActionChains(driver).drag_and_drop_by_offset(driver.find_element(**element), x, y).perform()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcb67c-0d86-11ed-8d9c-00ff736d6bc1', '按下键位', 'page', 'system', '[{\"paramName\": \"element\", \"description\": \"被按下元素\"}]', '[{\"type\": \"String\", \"paramName\": \"value\", \"description\": \"被按下键位\"}]', '', 'ActionChains(driver).key_down(value, driver.find_element(**element)).perform()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcb714-0d86-11ed-8d9c-00ff736d6bc1', '释放键位', 'page', 'system', '[{\"paramName\": \"element\", \"description\": \"被释放元素\"}]', '[{\"type\": \"String\", \"paramName\": \"value\", \"description\": \"被释放键位\"}]', '', 'ActionChains(driver).key_up(value, driver.find_element(**element)).perform()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcb7a6-0d86-11ed-8d9c-00ff736d6bc1', '鼠标移动到坐标', 'page', 'system', '[]', '[{\"type\": \"Int\", \"paramName\": \"x\", \"description\": \"X轴坐标\"}, {\"type\": \"Int\", \"paramName\": \"y\", \"description\": \"Y轴坐标\"}]', '', 'ActionChains(driver).move_by_offset(x, y).perform()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcb83e-0d86-11ed-8d9c-00ff736d6bc1', '鼠标移动到元素', 'page', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[]', '', 'ActionChains(driver).move_to_element(driver.find_element(**element)).perform()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcb8ca-0d86-11ed-8d9c-00ff736d6bc1', '鼠标元素内偏移', 'page', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"Int\", \"paramName\": \"x\", \"description\": \"X轴偏移量\"}, {\"type\": \"Int\", \"paramName\": \"y\", \"description\": \"Y轴偏移量\"}]', '', 'ActionChains(driver).move_to_element_with_offset(driver.find_element(**element), x, y).perform()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcb972-0d86-11ed-8d9c-00ff736d6bc1', '释放点击保持状态', 'page', 'system', '[{\"paramName\": \"element\", \"description\": \"被释放元素\"}]', '[]', '', 'ActionChains(driver).release(driver.find_element(**element)).perform()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcb9fc-0d86-11ed-8d9c-00ff736d6bc1', '等待元素出现', 'page', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"Int\", \"paramName\": \"second\", \"description\": \"等待时间 单位秒\"}]', '', 'WebDriverWait(driver, second, 0.2).until(expected_conditions.presence_of_element_located(driver.find_element(**element))', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcba96-0d86-11ed-8d9c-00ff736d6bc1', '等待元素消失', 'page', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"Int\", \"paramName\": \"second\", \"description\": \"等待时间 单位秒\"}]', '', 'WebDriverWait(driver, second, 0.2).until_not(expected_conditions.presence_of_element_located(driver.find_element(**element))', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcbb2d-0d86-11ed-8d9c-00ff736d6bc1', '断言页面标题', 'assertion', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.title', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcbbdf-0d86-11ed-8d9c-00ff736d6bc1', '断言页面url', 'assertion', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.current_url', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcbc84-0d86-11ed-8d9c-00ff736d6bc1', '断言页面源码', 'assertion', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.page_source', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcbd36-0d86-11ed-8d9c-00ff736d6bc1', '断言元素文本', 'assertion', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.find_element(**element).text', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdcbe18-0d86-11ed-8d9c-00ff736d6bc1', '断言元素tag', 'assertion', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.find_element(**element).tag_name', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd29f8-0d86-11ed-8d9c-00ff736d6bc1', '断言元素尺寸', 'assertion', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值 例{\'height\': 320,\'width\': 480}\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.find_element(**element).size', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd2b8e-0d86-11ed-8d9c-00ff736d6bc1', '断言元素高度', 'assertion', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Int\", \"paramName\": \"expect\", \"description\": \"预期值 高度值\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.find_element(**element).size.get(height)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd2c90-0d86-11ed-8d9c-00ff736d6bc1', '断言元素宽度', 'assertion', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Int\", \"paramName\": \"expect\", \"description\": \"预期值 宽度值\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.find_element(**element).size.get(width)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd2d9c-0d86-11ed-8d9c-00ff736d6bc1', '断言元素位置', 'assertion', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值 例{\'Y\': 320,\'X\': 480}\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.find_element(**element).location', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd2e7d-0d86-11ed-8d9c-00ff736d6bc1', '断言元素X坐标', 'assertion', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Int\", \"paramName\": \"expect\", \"description\": \"预期值 Y轴坐标值\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.find_element(**element).location.get(Y)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd2f57-0d86-11ed-8d9c-00ff736d6bc1', '断言元素Y坐标', 'assertion', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Int\", \"paramName\": \"expect\", \"description\": \"预期值 X轴坐标值\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.find_element(**element).location.get(X)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd3046-0d86-11ed-8d9c-00ff736d6bc1', '断言元素属性', 'assertion', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}, {\"type\": \"String\", \"paramName\": \"name\", \"description\": \"元素属性名\"}]', '', '断言对象: driver.find_element(**element).get_attribute(name)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd325c-0d86-11ed-8d9c-00ff736d6bc1', '断言元素是否选中', 'assertion', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Boolean\", \"paramName\": \"expect\", \"description\": \"预期值 True/False\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.find_element(**element).is_selected()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd333b-0d86-11ed-8d9c-00ff736d6bc1', '断言元素是否启用', 'assertion', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Boolean\", \"paramName\": \"expect\", \"description\": \"预期值 True/False\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.find_element(**element).is_enabled()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd3405-0d86-11ed-8d9c-00ff736d6bc1', '断言元素是否显示', 'assertion', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Boolean\", \"paramName\": \"expect\", \"description\": \"预期值 True/False\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.find_element(**element).is_displayed()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd34e1-0d86-11ed-8d9c-00ff736d6bc1', '断言元素css样式', 'assertion', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}, {\"type\": \"String\", \"paramName\": \"name\", \"description\": \"元素css属性名\"}]', '', '断言对象: driver.find_element(**element).value_of_css_property(name)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd95f5-0d86-11ed-8d9c-00ff736d6bc1', '断言元素是否存在', 'assertion', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Boolean\", \"paramName\": \"expect\", \"description\": \"预期值 True/False\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.find_element(**element)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd97de-0d86-11ed-8d9c-00ff736d6bc1', '断言窗口尺寸', 'assertion', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值 例{\'height\': 320,\'width\': 480}\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.get_window_size()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd98b3-0d86-11ed-8d9c-00ff736d6bc1', '断言窗口高度', 'assertion', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Int\", \"paramName\": \"expect\", \"description\": \"预期值 高度值\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.get_window_size().get(height)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd9997-0d86-11ed-8d9c-00ff736d6bc1', '断言窗口宽度', 'assertion', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Int\", \"paramName\": \"expect\", \"description\": \"预期值 宽度值\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.get_window_size().get(width)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd9a60-0d86-11ed-8d9c-00ff736d6bc1', '断言窗口位置', 'assertion', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值 例{\'Y\': 320,\'X\': 480}\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.get_window_position()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd9b49-0d86-11ed-8d9c-00ff736d6bc1', '断言窗口X坐标', 'assertion', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Int\", \"paramName\": \"expect\", \"description\": \"预期值 Y轴坐标值\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.get_window_position().get(Y)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd9c26-0d86-11ed-8d9c-00ff736d6bc1', '断言窗口Y坐标', 'assertion', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Int\", \"paramName\": \"expect\", \"description\": \"预期值 X轴坐标值\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.get_window_position().get(X)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd9d76-0d86-11ed-8d9c-00ff736d6bc1', '断言cookies', 'assertion', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}]', '', '断言对象: driver.get_cookies()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd9e63-0d86-11ed-8d9c-00ff736d6bc1', '断言cookie', 'assertion', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Boolean\", \"paramName\": \"continue\", \"description\": \"断言失败是否继续执行\"}, {\"type\": \"String\", \"paramName\": \"name\", \"description\": \"cookie名称\"}]', '', '断言对象: driver.get_cookie(name)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd9f41-0d86-11ed-8d9c-00ff736d6bc1', '提取页面标题', 'relation', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.title', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdd9ff6-0d86-11ed-8d9c-00ff736d6bc1', '提取页面url', 'relation', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.current_url', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdda09e-0d86-11ed-8d9c-00ff736d6bc1', '提取元素文本', 'relation', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.find_element(**element).text', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdda167-0d86-11ed-8d9c-00ff736d6bc1', '提取元素tag', 'relation', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.find_element(**element).tag_name', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdda21d-0d86-11ed-8d9c-00ff736d6bc1', '提取元素尺寸', 'relation', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.find_element(**element).size', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdda2db-0d86-11ed-8d9c-00ff736d6bc1', '提取元素高度', 'relation', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.find_element(**element).size.get(height)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdda3b2-0d86-11ed-8d9c-00ff736d6bc1', '提取元素宽度', 'relation', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.find_element(**element).size.get(width)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdda47d-0d86-11ed-8d9c-00ff736d6bc1', '提取元素位置', 'relation', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.find_element(**element).location', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdda541-0d86-11ed-8d9c-00ff736d6bc1', '提取元素X坐标', 'relation', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.find_element(**element).location.get(Y)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdda5f8-0d86-11ed-8d9c-00ff736d6bc1', '提取元素Y坐标', 'relation', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.find_element(**element).location.get(X)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdda6c8-0d86-11ed-8d9c-00ff736d6bc1', '提取元素属性', 'relation', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}, {\"type\": \"String\", \"paramName\": \"name\", \"description\": \"元素属性名\"}]', '', '提取对象: driver.find_element(**element).get_attribute(name)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdda795-0d86-11ed-8d9c-00ff736d6bc1', '提取元素css样式', 'relation', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}, {\"type\": \"String\", \"paramName\": \"name\", \"description\": \"元素css属性名\"}]', '', '提取对象: driver.find_element(**element).value_of_css_property(name)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdda856-0d86-11ed-8d9c-00ff736d6bc1', '提取窗口尺寸', 'relation', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.get_window_size()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdda8f7-0d86-11ed-8d9c-00ff736d6bc1', '提取窗口高度', 'relation', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.get_window_size().get(height)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdda99c-0d86-11ed-8d9c-00ff736d6bc1', '提取窗口宽度', 'relation', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.get_window_size().get(width)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bddaa3d-0d86-11ed-8d9c-00ff736d6bc1', '提取窗口位置', 'relation', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.get_window_position()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bddaad3-0d86-11ed-8d9c-00ff736d6bc1', '提取窗口X坐标', 'relation', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.get_window_position().get(Y)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bddab7d-0d86-11ed-8d9c-00ff736d6bc1', '提取窗口Y坐标', 'relation', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.get_window_position().get(X)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bddac24-0d86-11ed-8d9c-00ff736d6bc1', '提取当前窗口句柄', 'relation', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.current_window_handle', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bddacbd-0d86-11ed-8d9c-00ff736d6bc1', '提取所有窗口句柄', 'relation', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.window_handles', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bddadc8-0d86-11ed-8d9c-00ff736d6bc1', '提取cookies', 'relation', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}]', '', '提取对象: driver.get_cookies()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bddae94-0d86-11ed-8d9c-00ff736d6bc1', '提取cookie', 'relation', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"save_name\", \"description\": \"保存变量名称\"}, {\"type\": \"String\", \"paramName\": \"name\", \"description\": \"cookie名称\"}]', '', '提取对象: driver.get_cookie(name)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bddaf4f-0d86-11ed-8d9c-00ff736d6bc1', '判断页面标题', 'condition', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.title', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bddb045-0d86-11ed-8d9c-00ff736d6bc1', '判断页面url', 'condition', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.current_url', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bddb13a-0d86-11ed-8d9c-00ff736d6bc1', '判断页面源码', 'condition', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.page_source', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bddb220-0d86-11ed-8d9c-00ff736d6bc1', '判断元素文本', 'condition', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.find_element(**element).text', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bddb303-0d86-11ed-8d9c-00ff736d6bc1', '判断元素tag', 'condition', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.find_element(**element).tag_name', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdddaef-0d86-11ed-8d9c-00ff736d6bc1', '判断元素尺寸', 'condition', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值 例{\'height\': 320,\'width\': 480}\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.find_element(**element).size', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdddc8a-0d86-11ed-8d9c-00ff736d6bc1', '判断元素高度', 'condition', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Int\", \"paramName\": \"expect\", \"description\": \"预期值 高度值\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.find_element(**element).size.get(height)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdddd9d-0d86-11ed-8d9c-00ff736d6bc1', '判断元素宽度', 'condition', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Int\", \"paramName\": \"expect\", \"description\": \"预期值 宽度值\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.find_element(**element).size.get(width)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bddde8d-0d86-11ed-8d9c-00ff736d6bc1', '判断元素位置', 'condition', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值 例{\'Y\': 320,\'X\': 480}\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.find_element(**element).location', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdddf7e-0d86-11ed-8d9c-00ff736d6bc1', '判断元素X坐标', 'condition', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Int\", \"paramName\": \"expect\", \"description\": \"预期值 Y轴坐标值\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.find_element(**element).location.get(Y)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdde06a-0d86-11ed-8d9c-00ff736d6bc1', '判断元素Y坐标', 'condition', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Int\", \"paramName\": \"expect\", \"description\": \"预期值 X轴坐标值\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.find_element(**element).location.get(X)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bdde157-0d86-11ed-8d9c-00ff736d6bc1', '判断元素属性', 'condition', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}, {\"type\": \"String\", \"paramName\": \"name\", \"description\": \"元素属性名\"}]', '', '判断对象: driver.find_element(**element).get_attribute(name)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bde154d-0d86-11ed-8d9c-00ff736d6bc1', '判断元素是否选中', 'condition', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Boolean\", \"paramName\": \"expect\", \"description\": \"预期值 True/False\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.find_element(**element).is_selected()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bde1857-0d86-11ed-8d9c-00ff736d6bc1', '判断元素是否启用', 'condition', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Boolean\", \"paramName\": \"expect\", \"description\": \"预期值 True/False\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.find_element(**element).is_enabled()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bde198b-0d86-11ed-8d9c-00ff736d6bc1', '判断元素是否显示', 'condition', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Boolean\", \"paramName\": \"expect\", \"description\": \"预期值 True/False\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.find_element(**element).is_displayed()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bde1a93-0d86-11ed-8d9c-00ff736d6bc1', '判断元素css样式', 'condition', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"String\", \"paramName\": \"name\", \"description\": \"元素css属性名\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.find_element(**element).value_of_css_property(name)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bde1bab-0d86-11ed-8d9c-00ff736d6bc1', '判断元素是否存在', 'condition', 'system', '[{\"paramName\": \"element\", \"description\": \"目标元素\"}]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Boolean\", \"paramName\": \"expect\", \"description\": \"预期值 True/False\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.find_element(**element)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bde1c9c-0d86-11ed-8d9c-00ff736d6bc1', '判断窗口尺寸', 'condition', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值 例{\'height\': 320,\'width\': 480}\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.get_window_size()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bde1daa-0d86-11ed-8d9c-00ff736d6bc1', '判断窗口高度', 'condition', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Int\", \"paramName\": \"expect\", \"description\": \"预期值 高度值\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.get_window_size().get(height)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bde1e94-0d86-11ed-8d9c-00ff736d6bc1', '判断窗口宽度', 'condition', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Int\", \"paramName\": \"expect\", \"description\": \"预期值 宽度值\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.get_window_size().get(width)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bde1f8c-0d86-11ed-8d9c-00ff736d6bc1', '判断窗口位置', 'condition', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值 例{\'Y\': 320,\'X\': 480}\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.get_window_position()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bde206d-0d86-11ed-8d9c-00ff736d6bc1', '判断窗口X坐标', 'condition', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Int\", \"paramName\": \"expect\", \"description\": \"预期值 Y轴坐标值\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.get_window_position().get(Y)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bde2146-0d86-11ed-8d9c-00ff736d6bc1', '判断窗口Y坐标', 'condition', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"Int\", \"paramName\": \"expect\", \"description\": \"预期值 X轴坐标值\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.get_window_position().get(X)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bde2229-0d86-11ed-8d9c-00ff736d6bc1', '判断cookies', 'condition', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}]', '', '判断对象: driver.get_cookies()', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);
INSERT INTO `operation` VALUES ('2bde232b-0d86-11ed-8d9c-00ff736d6bc1', '判断cookie', 'condition', 'system', '[]', '[{\"type\": \"String\", \"paramName\": \"assertion\", \"description\": \"断言方法\"}, {\"type\": \"String\", \"paramName\": \"expect\", \"description\": \"预期值\"}, {\"type\": \"Int\", \"paramName\": \"true\", \"description\": \"执行行数m 条件为真执行接下来[0, m)行\"}, {\"type\": \"Int\", \"paramName\": \"false\", \"description\": \"执行行数n 条件为假执行接下来[m, m+n)行\"}, {\"type\": \"String\", \"paramName\": \"name\", \"description\": \"cookie名称\"}]', '', '判断对象: driver.get_cookie(name)', 'system', 'system_admin_user', 'system_admin_user', 1658910543098, 1658910543098);

-- ----------------------------
-- Table structure for operation_type
-- ----------------------------
DROP TABLE IF EXISTS `operation_type`;
CREATE TABLE `operation_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deleted` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_type
-- ----------------------------
INSERT INTO `operation_type` VALUES (1, 'browser', '浏览器', 0);
INSERT INTO `operation_type` VALUES (2, 'page', '网页', 0);
INSERT INTO `operation_type` VALUES (3, 'relation', '关联', 0);
INSERT INTO `operation_type` VALUES (4, 'assertion', '断言', 0);
INSERT INTO `operation_type` VALUES (5, 'condition', '条件', 0);
INSERT INTO `operation_type` VALUES (6, 'scenario', '场景', 0);

-- ----------------------------
-- Table structure for page_module
-- ----------------------------
DROP TABLE IF EXISTS `page_module`;
CREATE TABLE `page_module`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '页面模块id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '页面模块名称',
  `parent_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父模块id',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_id_2`(`project_id`) USING BTREE,
  INDEX `parent_id`(`parent_id`, `name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of page_module
-- ----------------------------
INSERT INTO `page_module` VALUES ('37c2a051-369c-40fa-adc8-235d6750e34c', '测试类型1-1', 'c9870af8-308b-41ed-941b-48ea566f0924', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660901844637, 1660901844637);
INSERT INTO `page_module` VALUES ('af5738cd-5f50-4b7c-9ff2-5b1134112d0a', '测试删除2', NULL, '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660903886735, 1660903886735);
INSERT INTO `page_module` VALUES ('c9870af8-308b-41ed-941b-48ea566f0924', '测试类型1', NULL, '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660901830898, 1660901830898);

-- ----------------------------
-- Table structure for param_data
-- ----------------------------
DROP TABLE IF EXISTS `param_data`;
CREATE TABLE `param_data`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数名',
  `param_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数值',
  `group_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属参数组',
  `data_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据类型',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数描述',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `group_id`(`group_id`, `name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of param_data
-- ----------------------------
INSERT INTO `param_data` VALUES ('07a98adf-e236-482e-b5a1-0f75db43efc6', 'test_edit', '{\\\"content-type\\\":\\\"application/json\\\"}', 'b56922d3-0d85-11ed-8d9c-00ff736d6bc1', 'JSONObject', '', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660296064393, 1660296064393);
INSERT INTO `param_data` VALUES ('6c77150a-bc01-4445-a01e-0a3a23a26681', 'test3', '{\\\"content-type\\\":\\\"application/json\\\"}', 'b56922d3-0d85-11ed-8d9c-00ff736d6bc1', 'JSONObject', '', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660297890146, 1660297890146);
INSERT INTO `param_data` VALUES ('dc8b98f4-79e1-415c-907a-3b8e0b2ef080', 'test2', '{\\\"content-type\\\":\\\"application/json\\\"}', 'b56922d3-0d85-11ed-8d9c-00ff736d6bc1', 'JSONObject', '', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1660296085267, 1660296085267);

-- ----------------------------
-- Table structure for param_group
-- ----------------------------
DROP TABLE IF EXISTS `param_group`;
CREATE TABLE `param_group`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数组id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数组名',
  `param_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数组类型',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数组描述',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_id`(`project_id`, `name`) USING BTREE,
  INDEX `project_id_2`(`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of param_group
-- ----------------------------
INSERT INTO `param_group` VALUES ('b56922d3-0d85-11ed-8d9c-00ff736d6bc1', 'Header', 'system', '接口请求头参数组', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 'system_admin_user', 'system_admin_user', 1658910344372, 1658910344372);
INSERT INTO `param_group` VALUES ('b569acde-0d85-11ed-8d9c-00ff736d6bc1', 'Proxy', 'system', '接口请求代理参数组', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 'system_admin_user', 'system_admin_user', 1658910344376, 1658910344376);
INSERT INTO `param_group` VALUES ('b56a2900-0d85-11ed-8d9c-00ff736d6bc1', 'Custom', 'custom', '自定义参数组', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 'system_admin_user', 'system_admin_user', 1658910344379, 1658910344379);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('NORMAL_MENU', '平台常规菜单');
INSERT INTO `permission` VALUES ('PROJECT_MENU', '项目管理菜单');
INSERT INTO `permission` VALUES ('ROLE_MENU', '角色管理菜单');
INSERT INTO `permission` VALUES ('SETTING_MENU', '配置中心菜单');
INSERT INTO `permission` VALUES ('SETTING_OPT', '配置中心操作');
INSERT INTO `permission` VALUES ('USER_MENU', '用户管理菜单');

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '计划id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '计划名称',
  `version_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '计划版本',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '计划描述',
  `environment_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行环境',
  `retry` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否失败重试',
  `engine_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行引擎',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_id`(`project_id`, `name`, `version_id`) USING BTREE,
  INDEX `project_id_2`(`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES ('4b39fbab-7df5-4c2d-98cf-bc4ea16d2785', 'test p2', 'a4c938fc-54f0-11ec-99dc-5254aswevf87', '', '21d4a869-b41f-4eb8-8234-272f9eb13230', 'N', 'cc67bf40fc664a02bb92aeede7a0649a', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1661483931603, 1661483931603);
INSERT INTO `plan` VALUES ('f69e4cab-29fb-42cc-8a99-fc778dd9a5de', 'test p1', 'a4c938fc-54f0-11ec-99dc-5254aswevf87', '', '21d4a869-b41f-4eb8-8234-272f9eb13230', 'N', 'cc67bf40fc664a02bb92aeede7a0649a', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1661483498625, 1661483821122);

-- ----------------------------
-- Table structure for plan_collection
-- ----------------------------
DROP TABLE IF EXISTS `plan_collection`;
CREATE TABLE `plan_collection`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '计划集合id',
  `plan_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '计划id',
  `collection_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '集合id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `plan_id`(`plan_id`, `collection_id`) USING BTREE,
  INDEX `plan_id_2`(`plan_id`) USING BTREE,
  INDEX `collection_id`(`collection_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plan_collection
-- ----------------------------
INSERT INTO `plan_collection` VALUES ('d909b411-f9bd-44ec-b50b-f26216af7f7e', '4b39fbab-7df5-4c2d-98cf-bc4ea16d2785', '123');
INSERT INTO `plan_collection` VALUES ('4cc842c8-7cbe-470a-8c21-26aba4d0c721', '4b39fbab-7df5-4c2d-98cf-bc4ea16d2785', 'c0caf9ff-11cb-4a1a-afa7-00d3a631b537');
INSERT INTO `plan_collection` VALUES ('4efb7f81-b0db-452b-afd0-23ac20e9a92e', 'f69e4cab-29fb-42cc-8a99-fc778dd9a5de', '123');
INSERT INTO `plan_collection` VALUES ('237d1687-3f6e-4865-bdbc-54f6a12b9409', 'f69e4cab-29fb-42cc-8a99-fc778dd9a5de', 'c0caf9ff-11cb-4a1a-afa7-00d3a631b537');

-- ----------------------------
-- Table structure for plan_schedule
-- ----------------------------
DROP TABLE IF EXISTS `plan_schedule`;
CREATE TABLE `plan_schedule`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '定时任务id',
  `plan_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属计划id',
  `start_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '启动时间',
  `frequency` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行频率',
  `next_run_time` bigint(0) NOT NULL COMMENT '下次执行时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `plan_id`(`plan_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plan_schedule
-- ----------------------------
INSERT INTO `plan_schedule` VALUES ('49a3f110-9f2a-43da-945e-6fcc1dcfeaad', '4b39fbab-7df5-4c2d-98cf-bc4ea16d2785', '2022-08-26 11:05:00', 'EVERY_MONTH', 1664161500000);
INSERT INTO `plan_schedule` VALUES ('ed7b3ed6-f983-427e-bbb8-59f41166d156', 'f69e4cab-29fb-42cc-8a99-fc778dd9a5de', '2022-08-26 11:05:00', 'EVERY_MONTH', 1664161500000);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '项目id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '项目名',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目描述',
  `project_admin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '项目管理员',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('4aeac506-0d85-11ed-8d9c-00ff736d6bc1', '演示项目', '演示项目', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1658910165703, 1658910165703, 'Normal');

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报告id',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报告名称',
  `task_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务id',
  `environment_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行环境id',
  `source_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联计划/集合/用例',
  `source_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联计划/集合/用例id',
  `start_time` bigint(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` bigint(0) NULL DEFAULT NULL COMMENT '结束时间',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行状态',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `task_id`(`task_id`) USING BTREE,
  INDEX `source_id`(`source_id`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE,
  INDEX `source_type`(`source_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report
-- ----------------------------

-- ----------------------------
-- Table structure for report_collection
-- ----------------------------
DROP TABLE IF EXISTS `report_collection`;
CREATE TABLE `report_collection`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报告集合id',
  `report_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报告id',
  `collection_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '集合id',
  `collection_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集合名称',
  `collection_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集合版本',
  `case_total` int(0) NOT NULL COMMENT '集合总用例数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `report_id`(`report_id`, `collection_id`) USING BTREE,
  INDEX `report_id_2`(`report_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_collection
-- ----------------------------

-- ----------------------------
-- Table structure for report_collection_case
-- ----------------------------
DROP TABLE IF EXISTS `report_collection_case`;
CREATE TABLE `report_collection_case`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报告集合用例id',
  `report_collection_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报告集合id',
  `collection_case_index` int(0) NOT NULL COMMENT '集合用例序号',
  `case_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用例id',
  `case_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用例类型',
  `case_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用例名',
  `case_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用例描述',
  `run_times` int(0) NOT NULL COMMENT '用例执行次数',
  `start_time` bigint(0) NOT NULL COMMENT '开始时间',
  `end_time` bigint(0) NOT NULL COMMENT '结束时间',
  `during` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行时长',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行结果',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `report_collection_id`(`report_collection_id`) USING BTREE,
  INDEX `collection_case_index`(`collection_case_index`) USING BTREE,
  INDEX `case_id`(`case_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_collection_case
-- ----------------------------

-- ----------------------------
-- Table structure for report_collection_case_api
-- ----------------------------
DROP TABLE IF EXISTS `report_collection_case_api`;
CREATE TABLE `report_collection_case_api`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报告集合用例接口id',
  `report_collection_case_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报告集合用例id',
  `case_api_index` int(0) NOT NULL COMMENT '用例接口序号',
  `api_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接口id',
  `api_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接口名称',
  `api_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接口地址',
  `exec_log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行日志',
  `during` int(0) NOT NULL COMMENT '接口执行时长',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行结果',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `report_collection_case_id`(`report_collection_case_id`) USING BTREE,
  INDEX `api_id`(`api_id`) USING BTREE,
  INDEX `case_api_index`(`case_api_index`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_collection_case_api
-- ----------------------------

-- ----------------------------
-- Table structure for report_collection_case_web
-- ----------------------------
DROP TABLE IF EXISTS `report_collection_case_web`;
CREATE TABLE `report_collection_case_web`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报告集合用例操作id',
  `report_collection_case_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报告集合用例id',
  `case_web_index` int(0) NOT NULL COMMENT '用例操作序号',
  `operation_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作id',
  `operation_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作名称',
  `operation_element` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作元素',
  `screen_shot` json NULL COMMENT '操作截图地址',
  `exec_log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行日志',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行结果',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `report_collection_case_id`(`report_collection_case_id`) USING BTREE,
  INDEX `operation_id`(`operation_id`) USING BTREE,
  INDEX `case_web_index`(`case_web_index`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_collection_case_web
-- ----------------------------

-- ----------------------------
-- Table structure for report_statistics
-- ----------------------------
DROP TABLE IF EXISTS `report_statistics`;
CREATE TABLE `report_statistics`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报告统计id',
  `report_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '报告id',
  `total` int(0) NOT NULL COMMENT '报告总用例数',
  `pass_count` int(0) NOT NULL COMMENT '报告成功用例数',
  `fail_count` int(0) NOT NULL COMMENT '报告失败用例数',
  `error_count` int(0) NOT NULL COMMENT '报告错误用例数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `report_id`(`report_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '项目id',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`, `project_id`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('50598994-0d85-11ed-8d9c-00ff736d6bc1', '项目管理员', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 1658910174819, 1658910174819);
INSERT INTO `role` VALUES ('50598c9e-0d85-11ed-8d9c-00ff736d6bc1', '项目普通用户', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 1658910174819, 1658910174819);
INSERT INTO `role` VALUES ('system_admin_role', '系统管理员', 'system', 1658910174819, 1658910174819);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限id',
  `role_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色id',
  `permission_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限id',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_id`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('505a6b09-0d85-11ed-8d9c-00ff736d6bc1', 'system_admin_role', 'NORMAL_MENU', 1658910174825, 1658910174825);
INSERT INTO `role_permission` VALUES ('505a6eea-0d85-11ed-8d9c-00ff736d6bc1', 'system_admin_role', 'USER_MENU', 1658910174825, 1658910174825);
INSERT INTO `role_permission` VALUES ('505a6f85-0d85-11ed-8d9c-00ff736d6bc1', 'system_admin_role', 'ROLE_MENU', 1658910174825, 1658910174825);
INSERT INTO `role_permission` VALUES ('505a6fee-0d85-11ed-8d9c-00ff736d6bc1', 'system_admin_role', 'PROJECT_MENU', 1658910174825, 1658910174825);
INSERT INTO `role_permission` VALUES ('505a7091-0d85-11ed-8d9c-00ff736d6bc1', 'system_admin_role', 'SETTING_MENU', 1658910174825, 1658910174825);
INSERT INTO `role_permission` VALUES ('505a7116-0d85-11ed-8d9c-00ff736d6bc1', 'system_admin_role', 'SETTING_OPT', 1658910174825, 1658910174825);
INSERT INTO `role_permission` VALUES ('505a7225-0d85-11ed-8d9c-00ff736d6bc1', '50598994-0d85-11ed-8d9c-00ff736d6bc1', 'NORMAL_MENU', 1658910174825, 1658910174825);
INSERT INTO `role_permission` VALUES ('505a76a1-0d85-11ed-8d9c-00ff736d6bc1', '50598994-0d85-11ed-8d9c-00ff736d6bc1', 'USER_MENU', 1658910174825, 1658910174825);
INSERT INTO `role_permission` VALUES ('505a788d-0d85-11ed-8d9c-00ff736d6bc1', '50598994-0d85-11ed-8d9c-00ff736d6bc1', 'ROLE_MENU', 1658910174825, 1658910174825);
INSERT INTO `role_permission` VALUES ('505a7ace-0d85-11ed-8d9c-00ff736d6bc1', '50598994-0d85-11ed-8d9c-00ff736d6bc1', 'SETTING_MENU', 1658910174825, 1658910174825);
INSERT INTO `role_permission` VALUES ('505a7c62-0d85-11ed-8d9c-00ff736d6bc1', '50598994-0d85-11ed-8d9c-00ff736d6bc1', 'SETTING_OPT', 1658910174825, 1658910174825);
INSERT INTO `role_permission` VALUES ('505a7dc3-0d85-11ed-8d9c-00ff736d6bc1', '50598c9e-0d85-11ed-8d9c-00ff736d6bc1', 'NORMAL_MENU', 1658910174825, 1658910174825);
INSERT INTO `role_permission` VALUES ('505a7f40-0d85-11ed-8d9c-00ff736d6bc1', '50598c9e-0d85-11ed-8d9c-00ff736d6bc1', 'SETTING_MENU', 1658910174825, 1658910174825);

-- ----------------------------
-- Table structure for sum_statistics
-- ----------------------------
DROP TABLE IF EXISTS `sum_statistics`;
CREATE TABLE `sum_statistics`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `api_case_total` int(0) NOT NULL COMMENT 'API用例总数',
  `api_case_new_week` int(0) NOT NULL COMMENT 'API用例当周新增',
  `web_case_total` int(0) NOT NULL COMMENT 'WEB用例总数',
  `web_case_new_week` int(0) NOT NULL COMMENT 'WEB用例当周新增',
  `plan_run_total` int(0) NOT NULL COMMENT '计划执行总数',
  `plan_run_today` int(0) NOT NULL COMMENT '计划当日执行数',
  `case_run_total` int(0) NOT NULL COMMENT '用例执行总数',
  `case_run_today` int(0) NOT NULL COMMENT '用例当日执行数',
  `plan_run_week_top` json NOT NULL COMMENT '计划执行top10',
  `case_fail_week_top` json NOT NULL COMMENT '用例失败top10',
  PRIMARY KEY (`project_id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sum_statistics
-- ----------------------------

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务id',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务类型: 调试/执行/定时任务',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务状态',
  `engine_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行引擎',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `engine_id`(`engine_id`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------

-- ----------------------------
-- Table structure for test_file
-- ----------------------------
DROP TABLE IF EXISTS `test_file`;
CREATE TABLE `test_file`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '测试文件id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名称',
  `file_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件路径',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件描述',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `create_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_id`(`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_file
-- ----------------------------
INSERT INTO `test_file` VALUES ('b61d2d15d28c416fac4b1623b33803e4', 'test', '/123', NULL, 'a4c938fc-54f0-11ec-99dc-5254001909io', 'test', 'test', 1649227777435, 1649227777435);
INSERT INTO `test_file` VALUES ('bfe0d505a9c24f02bae71938c205e9f4', 'v.bat', '/123', NULL, 'a4c938fc-54f0-11ec-99dc-5254001909io', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1659099471305, 1659099471305);
INSERT INTO `test_file` VALUES ('cbf169136ae14231abf14f0733fac6b8', '测试文件1', '/data/files/op/testfile', 'for test 1', 'projectId', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1659427540547, 1659427540547);
INSERT INTO `test_file` VALUES ('d68445ebc89b4ba38e08f730006d45e9', '753900e23785328d0c40a0f0e.jpeg', '/123', NULL, 'a4c938fc-54f0-11ec-99dc-5254001909io', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1655716534235, 1655716534235);
INSERT INTO `test_file` VALUES ('e61b9e2fe16d4fceba7a9ecfca05c9d1', '测试文件2', '/data/files/op/testfile', 'for test 2', 'a4c938fc-54f0-11ec-99dc-5254001909io', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', 1659427651989, 1659427651989);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录密码',
  `mobile` bigint(0) NOT NULL COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `last_project` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录项目id',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '演示用户', 'demo', 'MTIzNDU2', 10000000001, 'test@163.com', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 1658910158608, 1658910158608, NULL);
INSERT INTO `user` VALUES ('system_admin_user', '系统管理员', 'LMadmin', 'TGl1bWFAMTIzNDU2', 10000000000, 'test@163.com', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 1658910158608, 1658910158608, NULL);

-- ----------------------------
-- Table structure for user_project
-- ----------------------------
DROP TABLE IF EXISTS `user_project`;
CREATE TABLE `user_project`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户项目id',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '项目id',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_project
-- ----------------------------
INSERT INTO `user_project` VALUES ('505b8c8c-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 1658910174833, 1658910174833);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户角色id',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `role_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色id',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('505b0a22-0d85-11ed-8d9c-00ff736d6bc1', 'system_admin_user', 'system_admin_role', 1658910174829, 1658910174829);
INSERT INTO `user_role` VALUES ('505b0d2a-0d85-11ed-8d9c-00ff736d6bc1', '46b0a264-0d85-11ed-8d9c-00ff736d6bc1', '50598994-0d85-11ed-8d9c-00ff736d6bc1', 1658910174829, 1658910174829);

-- ----------------------------
-- Table structure for version
-- ----------------------------
DROP TABLE IF EXISTS `version`;
CREATE TABLE `version`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '迭代版本id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '迭代版本名称',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '迭代版本描述',
  `project_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属项目id',
  `create_time` bigint(0) NOT NULL COMMENT '创建时间',
  `update_time` bigint(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `project_id`(`project_id`, `name`) USING BTREE,
  INDEX `project_id_2`(`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of version
-- ----------------------------
INSERT INTO `version` VALUES ('a4c938fc-54f0-11ec-99dc-5254aswevf87', '1.0.0', '1.0.0', '4aeac506-0d85-11ed-8d9c-00ff736d6bc1', 1638615307516, 1638615307516);

SET FOREIGN_KEY_CHECKS = 1;
