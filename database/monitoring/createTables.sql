create table if not exists MonitoringGroup(
	groupID tinyint unsigned auto_increment primary key,
    `name` varchar(64) unique not null
);

create table if not exists Metric(
	metricID int unsigned auto_increment primary key,
    `name` varchar(64) unique not null,
    `description` varchar(128) not null,
    monitoringGroup tinyint unsigned not null,
    unit smallint unsigned
);

create table if not exists Measurement(
	app int unsigned,
    appVersion varchar(16),
    metric int unsigned,
    addedOn datetime,
    `system` int unsigned,
    systemVersion varchar(16),
    `value` double precision not null,
    primary key(app, appVersion, metric, addedOn)
);
