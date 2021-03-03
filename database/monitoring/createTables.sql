create table if not exists MonitoringGroup(
	groupID bigint auto_increment primary key,
    `name` varchar(64) not null
);

create table if not exists Metric(
	metricID bigint auto_increment primary key,
    `name` varchar(64) not null,
    `description` varchar(256) not null,
    monitoringGroup bigint not null,
    unit bigint
);

create table if not exists Measurement(
	app bigint,
    appVersion varchar(16),
    metric bigint,
    addedOn datetime,
    `system` bigint,
    systemVersion varchar(16),
    `value` decimal(30, 30),
    primary key(app, appVersion, metric, addedOn)
);
