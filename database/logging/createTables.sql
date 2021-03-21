create table if not exists LogType(
	typeID tinyint unsigned auto_increment primary key,
    `name` varchar(64) unique not null
);

create table if not exists LogLevel(
	levelID tinyint unsigned auto_increment primary key,
    `type` tinyint unsigned not null,
    `name` varchar(64) unique not null
);

create table if not exists LogRecord(
	logID bigint unsigned auto_increment primary key,
    eventName varchar(64) not null,
    `level` tinyint unsigned not null,
    levelText varchar(64) not null,
    app int unsigned not null,
    appVersion varchar(16) not null,
    `system` int unsigned not null,
    systemVersion varchar(16) not null,
    `timestamp` datetime not null,
    traceID bigint
);

create table if not exists LogAttribute(
	log bigint unsigned,
    `key` varchar(64),
    `value` varchar(1024) not null,
    primary key(log, `key`)
);

create table if not exists LogBody(
	bodyID bigint unsigned auto_increment primary key,
    log bigint unsigned not null,
	`key` varchar(64),
    `value` varchar(1024),
    parent bigint unsigned
);
