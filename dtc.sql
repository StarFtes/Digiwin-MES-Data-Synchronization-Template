CREATE DATABASE `dtc`;
USE dtc;

CREATE TABLE `sync_log` (
	`job_id` VARCHAR(40) NOT NULL COMMENT '工作ID',
	`tenantsid` BIGINT(20) NOT NULL COMMENT '租户代码',
	`comp_no` VARCHAR(100) NOT NULL COMMENT '公司编号',
	`site_no` VARCHAR(100) NOT NULL COMMENT '工厂编号',
	`sync_id` VARCHAR(40) NOT NULL COMMENT '任务ID',
	`start_time` DATETIME NULL DEFAULT NULL COMMENT '开始时间',
	`end_time` DATETIME NULL DEFAULT NULL COMMENT '结束时间',
	`exe_status` VARCHAR(10) NULL DEFAULT NULL COMMENT '执行结果 C:完成, E:错误',
	`exe_info` MEDIUMTEXT NULL COMMENT '执行讯息',
	`req_payload` MEDIUMTEXT NULL COMMENT '请求报文',
	`res_payload` MEDIUMTEXT NULL COMMENT '回应报文',
	PRIMARY KEY (`job_id`)
)
COMMENT='同步日志'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;



CREATE TABLE `sync_task` (
	`sync_id` VARCHAR(40) NOT NULL COMMENT '任务ID',
	`tenantsid` BIGINT(20) NOT NULL COMMENT '租户代码',
	`comp_no` VARCHAR(100) NOT NULL COMMENT '公司编号',
	`site_no` VARCHAR(100) NOT NULL COMMENT '工厂编号',
	`sync_name` VARCHAR(50) NOT NULL COMMENT '任务名称',
	`sql_statement` TEXT NULL COMMENT 'SQL语句 取用数据的SQL命令',
	`db_type` VARCHAR(20) NULL DEFAULT NULL COMMENT '数据库类型 Oracle, SQL Server',
	`db_ip` VARCHAR(100) NULL DEFAULT NULL COMMENT '数据库IP',
	`db_port` VARCHAR(10) NULL DEFAULT NULL COMMENT '数据库Port',
	`db_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '数据库名称',
	`username` VARCHAR(50) NULL DEFAULT NULL COMMENT '用戶ID',
	`password` VARCHAR(50) NULL DEFAULT NULL COMMENT '密码 需加密保存',
	`create_date` DATETIME NOT NULL COMMENT '建立时间',
	`create_by` VARCHAR(100) NOT NULL COMMENT '建立人员',
	`create_program` VARCHAR(100) NOT NULL COMMENT '建立功能',
	`last_update_date` DATETIME NULL DEFAULT NULL COMMENT '最后修改时间',
	`last_update_by` VARCHAR(100) NULL DEFAULT NULL COMMENT '最后修改人员',
	`last_update_program` VARCHAR(100) NULL DEFAULT NULL COMMENT '最后修改功能',
	PRIMARY KEY (`sync_id`)
)
COMMENT='数据同步任务'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;



CREATE TABLE `sync_task_subqry` (
	`sync_id` VARCHAR(40) NOT NULL COMMENT '任务ID',
	`subqry_id` VARCHAR(40) NOT NULL COMMENT '子查询代号',
	`sql_statement` TEXT NULL COMMENT 'SQL语句',
	`create_date` DATETIME NOT NULL COMMENT '建立时间',
	`create_by` VARCHAR(100) NOT NULL COMMENT '建立人员',
	`create_program` VARCHAR(100) NOT NULL COMMENT '建立功能',
	`last_update_date` DATETIME NULL DEFAULT NULL COMMENT '最后修改时间',
	`last_update_by` VARCHAR(100) NULL DEFAULT NULL COMMENT '最后修改人员',
	`last_update_program` VARCHAR(100) NULL DEFAULT NULL COMMENT '最后修改功能',
	PRIMARY KEY (`sync_id`, `subqry_id`)
)
COMMENT='数据同步任务子查询'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
