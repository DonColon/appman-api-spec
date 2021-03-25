create table if not exists MonitoringGroup(
	groupID tinyint unsigned auto_increment primary key,
    `name` varchar(64) unique not null,
	modifiedBy smallint unsigned not null,
    modifiedOn datetime not null
);

create table if not exists Metric(
	metricID int unsigned auto_increment primary key,
    `name` varchar(64) unique not null,
    `description` varchar(128) not null,
    monitoringGroup tinyint unsigned not null,
    unit smallint unsigned,
	modifiedBy smallint unsigned not null,
    modifiedOn datetime not null
);

create table if not exists Dimension(
	dimensionID int unsigned auto_increment primary key,
	`name` varchar(64) unique not null,
    `description` varchar(128) not null,
	modifiedBy smallint unsigned not null,
    modifiedOn datetime not null
);

create table if not exists DimensionExpression(
	dimension int unsigned,
    expression varchar(64),
	addedBy smallint unsigned not null,
    addedOn datetime not null,
    primary key(dimension, expression)
);

create table if not exists MetricDimension(
	metric int unsigned,
    dimension int unsigned,
	addedBy smallint unsigned not null,
    addedOn datetime not null,
    primary key(metric, dimension)
);

create table if not exists Measurement(
	app int unsigned,
    appVersion varchar(16),
    metric int unsigned,
	dimension int unsigned,
    expression varchar(64),
    addedOn datetime,
    `system` int unsigned,
    systemVersion varchar(16),
    `value` double precision not null,
    primary key(app, appVersion, metric, dimension, expression, addedOn)
);
