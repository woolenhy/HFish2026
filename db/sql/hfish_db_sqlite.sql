-- 删除表（如果存在）
DROP TABLE IF EXISTS hfish_colony;
DROP TABLE IF EXISTS hfish_info;
DROP TABLE IF EXISTS hfish_passwd;
DROP TABLE IF EXISTS hfish_setting;

-- 创建 hfish_colony 表
CREATE TABLE hfish_colony (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    agent_name TEXT NOT NULL DEFAULT '',
    agent_ip TEXT NOT NULL DEFAULT '',
    web_status INTEGER NOT NULL DEFAULT 0,
    deep_status INTEGER NOT NULL DEFAULT 0,
    ssh_status INTEGER NOT NULL DEFAULT 0,
    redis_status INTEGER NOT NULL DEFAULT 0,
    mysql_status INTEGER NOT NULL DEFAULT 0,
    http_status INTEGER NOT NULL DEFAULT 0,
    telnet_status INTEGER NOT NULL DEFAULT 0,
    ftp_status INTEGER NOT NULL DEFAULT 0,
    mem_cache_status INTEGER NOT NULL DEFAULT 0,
    plug_status INTEGER NOT NULL DEFAULT 0,
    es_status INTEGER NOT NULL DEFAULT 0,
    tftp_status INTEGER NOT NULL DEFAULT 0,
    vnc_status INTEGER NOT NULL DEFAULT 0,
    custom_status INTEGER NOT NULL DEFAULT 0,
    last_update_time TEXT NOT NULL
);

-- 创建 hfish_colony 表的唯一索引
CREATE UNIQUE INDEX un_agent ON hfish_colony (agent_name);

-- 创建 hfish_info 表
CREATE TABLE hfish_info (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT NOT NULL DEFAULT '',
    project_name TEXT NOT NULL DEFAULT '',
    agent TEXT NOT NULL DEFAULT '',
    ip TEXT NOT NULL DEFAULT '',
    country TEXT NOT NULL DEFAULT '',
    region TEXT NOT NULL DEFAULT '',
    city TEXT NOT NULL DEFAULT '',
    info TEXT NOT NULL,
    create_time TEXT NOT NULL
);

-- 创建 hfish_info 表的索引
CREATE INDEX info_index_1 ON hfish_info (type);
CREATE INDEX info_index_2 ON hfish_info (country);
CREATE INDEX info_index_3 ON hfish_info (type, create_time);
CREATE INDEX info_index_4 ON hfish_info (ip);
CREATE INDEX info_index_5 ON hfish_info (agent);

-- 创建 hfish_passwd 表
CREATE TABLE hfish_passwd (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT NOT NULL DEFAULT '',
    account TEXT NOT NULL DEFAULT '',
    password TEXT NOT NULL DEFAULT '',
    create_time TEXT NOT NULL
);

-- 创建 hfish_passwd 表的索引
CREATE INDEX index_key_1 ON hfish_passwd (account);
CREATE INDEX index_key_2 ON hfish_passwd (password);
CREATE INDEX index_key_3 ON hfish_passwd (type);

-- 创建 hfish_setting 表
CREATE TABLE hfish_setting (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT NOT NULL DEFAULT '',
    info TEXT,
    update_time TEXT NOT NULL,
    status INTEGER NOT NULL DEFAULT 0,
    setting_name TEXT NOT NULL DEFAULT '',
    setting_dis TEXT NOT NULL DEFAULT '',
    UNIQUE (type)
);

-- 插入初始数据
INSERT INTO hfish_setting (id, type, info, update_time, status, setting_name, setting_dis) 
VALUES 
(1, 'mail', '', '2026-01-01 00:00:00', 0, 'E-mail 群发', '群发邮件SMTP服务器配置'),
(2, 'alertMail', '', '2026-01-01 00:00:00', 0, 'E-mail 通知', '蜜罐告警会通过邮件告知信息'),
(3, 'webHook', '', '2026-01-01 00:00:00', 0, 'WebHook 通知', '蜜罐告警会请求指定API告知信息'),
(4, 'whiteIp', '', '2026-01-01 00:00:00', 0, 'IP 白名单', '蜜罐上钩会过滤掉白名单IP'),
(5, 'passwdTM', '', '2026-01-01 00:00:00', 0, '密码脱敏', '发送邮件如果有密码内容自动加星');
