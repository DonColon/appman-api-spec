create table if not exists Developer(
	developerID bigint auto_increment primary key,
    firstName varchar(64) not null,
    familyName varchar(64) not null,
    userName varchar(64) not null,
    email varchar(64) not null,
    phoneNumber varchar(16),
    mobileNumber varchar(16) not null
);

create table if not exists Collaborator(
	developer bigint,
    app bigint,
    primary key(developer, app)
);

create table if not exists `System`(
	systemID bigint auto_increment primary key,
    `name` varchar(64) not null,
    `description` varchar(256) not null,
    docUrl varchar(256) not null,
    modifiedBy bigint not null,
    modifiedOn datetime not null
);

create table if not exists SystemVersion(
	`system` bigint,
    version varchar(16),
    addedBy bigint not null,
    addedOn datetime not null,
    primary key(`system`, version)
);

create table if not exists Application(
	appID bigint auto_increment primary key,
    `name` varchar(64) not null,
    `description` varchar(256) not null,
    homepageUrl varchar(256),
    author bigint not null,
    license varchar(16) not null,
    modifiedBy bigint not null,
    modifiedOn datetime not null
);

create table if not exists ApplicationVersion(
	app bigint,
    version varchar(16),
    addedBy bigint not null,
    addedOn datetime not null,
    primary key(app, version)
);

create table if not exists `View`(
	viewID bigint auto_increment primary key,
    `name` varchar(64) not null,
    `description` varchar(256) not null,
    route varchar(256) not null,
    modifiedBy bigint not null,
    modifiedOn datetime not null
);

create table if not exists ViewVersion(
	`view` bigint,
    version varchar(16),
    addedBy bigint not null,
    addedOn datetime not null,
    primary key(`view`, version)
);

create table if not exists `Component`(
	componentID bigint auto_increment primary key,
    `name` varchar(64) not null,
	`description` varchar(256) not null,
	modifiedBy bigint not null,
    modifiedOn datetime not null
);

create table if not exists ComponentVersion(
	`component` bigint,
    version varchar(16),
	addedBy bigint not null,
    addedOn datetime not null,
    primary key(`component`, version)
);

create table if not exists BackendSystem(
	`system` bigint,
    systemVersion varchar(16),
	app bigint,
    appVersion varchar(16),
	addedBy bigint not null,
    addedOn datetime not null,
    primary key(`system`, systemVersion, app, appVersion)
);

create table if not exists ApplicationView(
	app bigint,
    appVersion varchar(16),
    `view` bigint,
    viewVersion varchar(16),
	addedBy bigint not null,
    addedOn datetime not null,
    primary key(app, appVersion, `view`, viewVersion)
);

create table if not exists ViewComponent(
	`view` bigint,
    viewVersion varchar(16),
	`component` bigint,
    componentVersion varchar(16),
	addedBy bigint not null,
    addedOn datetime not null,
    primary key(`view`, viewVersion, `component`, componentVersion)
);

create table if not exists SubComponent(
	`component` bigint,
    componentVersion varchar(16),
    subComponent bigint,
    subComponentVersion varchar(16),
	addedBy bigint not null,
    addedOn datetime not null,
    primary key(`component`, componentVersion, subComponent, subComponentVersion)
);

create table if not exists DataType(
	typeID bigint auto_increment primary key,
    `description` varchar(256) not null
);

create table if not exists DataFormat(
	formatID bigint auto_increment primary key,
    `type` bigint not null,
    `description` varchar(256) not null,
    format varchar(256) not null
);

create table if not exists NumberFormat(
	formatID bigint primary key,
    `min` decimal(30, 30) not null,
    `max` decimal(30, 30) not null
);

create table if not exists ParameterType(
	typeID bigint auto_increment primary key,
    `description` varchar(256) not null
);

create table if not exists Parameter(
	parameterID bigint auto_increment primary key,
    `name` varchar(64) not null,
	`description` varchar(256) not null,
	modifiedBy bigint not null,
    modifiedOn datetime not null
);

create table if not exists ParameterVersion(
	parameter bigint,
    version varchar(16),
    isArray boolean not null,
    hasValueHelp boolean not null,
    `format` bigint not null,
	`type` bigint not null,
	modifiedBy bigint not null,
    modifiedOn datetime not null,
    primary key(parameter, version)
);

create table if not exists ApplicationParameter(
	app bigint,
    appVersion varchar(16),
    parameter bigint,
    parameterVersion varchar(16),
    required boolean not null,
	modifiedBy bigint not null,
    modifiedOn datetime not null,
    primary key(app, appVersion, parameter, parameterVersion)
);

create table if not exists ViewParameter(
	`view` bigint,
    viewVersion varchar(16),
    parameter bigint,
    parameterVersion varchar(16),
    required boolean not null,
	modifiedBy bigint not null,
    modifiedOn datetime not null,
    primary key(`view`, viewVersion, parameter, parameterVersion)
);

create table if not exists ComponentParameter(
	`component` bigint,
    componentVersion varchar(16),
    parameter bigint,
    parameterVersion varchar(16),
    required boolean not null,
	modifiedBy bigint not null,
    modifiedOn datetime not null,
    primary key(`component`, componentVersion, parameter, parameterVersion)
);
