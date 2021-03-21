create table if not exists Developer(
	developerID smallint unsigned auto_increment primary key,
    firstName varchar(64) not null,
    familyName varchar(64) not null,
    userName varchar(64) unique not null,
    email varchar(256) unique not null,
    phoneNumber varchar(16),
    mobileNumber varchar(16) not null
);

create table if not exists Collaborator(
	developer smallint unsigned,
    app int unsigned,
    primary key(developer, app)
);

create table if not exists `System`(
	systemID int unsigned auto_increment primary key,
    `name` varchar(64) unique not null,
    `description` varchar(128) not null,
    docUrl varchar(256) not null,
    modifiedBy smallint unsigned not null,
    modifiedOn datetime not null
);

create table if not exists SystemVersion(
	`system` int unsigned,
    version varchar(16),
    addedBy smallint unsigned not null,
    addedOn datetime not null,
    primary key(`system`, version)
);

create table if not exists Application(
	appID int unsigned auto_increment primary key,
    `name` varchar(64) unique not null,
    `description` varchar(128) not null,
    homepageUrl varchar(256),
    repositoryUrl varchar(256),
    gitUrl varchar(256),
    issueUrl varchar(256),
    author smallint unsigned not null,
    license varchar(16) not null,
    modifiedBy smallint unsigned not null,
    modifiedOn datetime not null
);

create table if not exists ApplicationVersion(
	app int unsigned,
    version varchar(16),
    addedBy smallint unsigned not null,
    addedOn datetime not null,
    primary key(app, version)
);

create table if not exists `View`(
	viewID int unsigned auto_increment primary key,
    `name` varchar(64) unique not null,
    `description` varchar(128) not null,
    route varchar(128) not null,
    modifiedBy smallint unsigned not null,
    modifiedOn datetime not null
);

create table if not exists ViewVersion(
	`view` int unsigned,
    version varchar(16),
    addedBy smallint unsigned not null,
    addedOn datetime not null,
    primary key(`view`, version)
);

create table if not exists `Component`(
	componentID int unsigned auto_increment primary key,
    `name` varchar(64) unique not null,
	`description` varchar(128) not null,
	modifiedBy smallint unsigned not null,
    modifiedOn datetime not null
);

create table if not exists ComponentVersion(
	`component` int unsigned,
    version varchar(16),
	addedBy smallint unsigned not null,
    addedOn datetime not null,
    primary key(`component`, version)
);

create table if not exists BackendSystem(
	`system` int unsigned,
    systemVersion varchar(16),
	app int unsigned,
    appVersion varchar(16),
	addedBy smallint unsigned not null,
    addedOn datetime not null,
    primary key(`system`, systemVersion, app, appVersion)
);

create table if not exists ApplicationView(
	app int unsigned,
    appVersion varchar(16),
    `view` int unsigned,
    viewVersion varchar(16),
	addedBy smallint unsigned not null,
    addedOn datetime not null,
    primary key(app, appVersion, `view`, viewVersion)
);

create table if not exists ViewComponent(
	`view` int unsigned,
    viewVersion varchar(16),
	`component` int unsigned,
    componentVersion varchar(16),
	addedBy smallint unsigned not null,
    addedOn datetime not null,
    primary key(`view`, viewVersion, `component`, componentVersion)
);

create table if not exists SubComponent(
	`component` int unsigned,
    componentVersion varchar(16),
    subComponent int unsigned,
    subComponentVersion varchar(16),
	addedBy smallint unsigned not null,
    addedOn datetime not null,
    primary key(`component`, componentVersion, subComponent, subComponentVersion)
);

create table if not exists DataType(
	typeID int unsigned auto_increment primary key,
    `name` varchar(64) unique not null
);

create table if not exists DataFormat(
	formatID int unsigned auto_increment primary key,
    `type` int unsigned not null,
    `name` varchar(64) unique not null,
    `format` varchar(1024) not null
);

create table if not exists NumberFormat(
	formatID int unsigned primary key,
    `min` double precision not null,
    `max` double precision not null
);

create table if not exists ParameterType(
	typeID int unsigned auto_increment primary key,
    `name` varchar(64) unique not null,
	modifiedBy smallint unsigned not null,
    modifiedOn datetime not null
);

create table if not exists Parameter(
	parameterID int unsigned auto_increment primary key,
    `name` varchar(64) unique not null,
	`description` varchar(128) not null,
	modifiedBy smallint unsigned not null,
    modifiedOn datetime not null
);

create table if not exists ParameterVersion(
	parameter int unsigned,
    version varchar(16),
    isArray boolean not null,
    hasValueHelp boolean not null,
    `format` int unsigned not null,
	`type` int unsigned not null,
	modifiedBy smallint unsigned not null,
    modifiedOn datetime not null,
    primary key(parameter, version)
);

create table if not exists ApplicationParameter(
	app int unsigned,
    appVersion varchar(16),
    parameter int unsigned,
    parameterVersion varchar(16),
    required boolean not null,
	modifiedBy smallint unsigned not null,
    modifiedOn datetime not null,
    primary key(app, appVersion, parameter, parameterVersion)
);

create table if not exists ViewParameter(
	`view` int unsigned,
    viewVersion varchar(16),
    parameter int unsigned,
    parameterVersion varchar(16),
    required boolean not null,
	modifiedBy smallint unsigned not null,
    modifiedOn datetime not null,
    primary key(`view`, viewVersion, parameter, parameterVersion)
);

create table if not exists ComponentParameter(
	`component` int unsigned,
    componentVersion varchar(16),
    parameter int unsigned,
    parameterVersion varchar(16),
    required boolean not null,
	modifiedBy smallint unsigned not null,
    modifiedOn datetime not null,
    primary key(`component`, componentVersion, parameter, parameterVersion)
);
