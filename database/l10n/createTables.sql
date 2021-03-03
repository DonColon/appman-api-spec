create table if not exists Localization(
	app bigint,
    appVersion varchar(16),
    country varchar(2),
    primary key(app, appVersion, country)
);

create table if not exists `Text`(
	textID varchar(64),
	country varchar(2),
    `language` varchar(2),
    short varchar(64),
    `medium` varchar(128),
    `long` varchar(256),
	primary key(textID, country, `language`)
);

create table if not exists ApplicationText(
	app bigint,
    appVersion varchar(16),
	`text` varchar(64),
    country varchar(2),
    `language` varchar(2),
    primary key(app, appVersion, `text`, country, `language`)
);

create table if not exists ViewText(
	`view` bigint,
    viewVersion varchar(16),
	`text` varchar(64),
    country varchar(2),
    `language` varchar(2),
    primary key(`view`, viewVersion, `text`, country, `language`)
);

create table if not exists ComponentText(
	`component` bigint,
    componentVersion varchar(16),
	`text` varchar(64),
    country varchar(2),
    `language` varchar(2),
    primary key(`component`, componentVersion, `text`, country, `language`)
);
