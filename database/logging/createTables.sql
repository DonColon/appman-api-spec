create table if not exists LogType(
	typeID int auto_increment primary key,
    `name` varchar(64) not null
);

create table if not exists LogLevel(
	levelID int auto_increment primary key,
    `type` int not null,
    `name` varchar(64) not null
);

create table if not exists LogRecord(
	logID bigint auto_increment primary key,
    eventName varchar(64) not null,
    `level` int not null,
    levelText varchar(64) not null,
    app bigint not null,
    appVersion varchar(16) not null,
    `system` bigint not null,
    systemVersion varchar(16) not null,
    `timestamp` datetime not null,
    traceID bigint
);

create table if not exists LogAttribute(
	log bigint,
    `key` varchar(64),
    `value` varchar(1024) not null,
    primary key(log, `key`)
);

create table if not exists LogBody(
	bodyID bigint auto_increment primary key,
    log bigint not null,
	`key` varchar(64),
    `value` varchar(1024),
    parent bigint
);
