create table if not exists Localization(
	app int unsigned,
    appVersion varchar(16),
    country varchar(2),
	addedBy smallint unsigned not null,
    addedOn datetime not null default current_timestamp on update current_timestamp,
    primary key(app, appVersion, country)
);

create table if not exists `Text`(
	textID varchar(64),
	country varchar(2),
    `language` varchar(2),
    short varchar(64),
    `medium` varchar(128),
    `long` varchar(256),
	modifiedBy smallint unsigned not null,
    modifiedOn datetime not null default current_timestamp on update current_timestamp,
	primary key(textID, country, `language`)
);

create table if not exists ApplicationText(
	app int unsigned,
    appVersion varchar(16),
	`text` varchar(64),
    country varchar(2),
    `language` varchar(2),
	addedBy smallint unsigned not null,
    addedOn datetime not null default current_timestamp on update current_timestamp,
    primary key(app, appVersion, `text`, country, `language`)
);

create table if not exists ViewText(
	`view` int unsigned,
    viewVersion varchar(16),
	`text` varchar(64),
    country varchar(2),
    `language` varchar(2),
	addedBy smallint unsigned not null,
    addedOn datetime not null default current_timestamp on update current_timestamp,
    primary key(`view`, viewVersion, `text`, country, `language`)
);

create table if not exists ComponentText(
	`component` int unsigned,
    componentVersion varchar(16),
	`text` varchar(64),
    country varchar(2),
    `language` varchar(2),
	addedBy smallint unsigned not null,
    addedOn datetime not null default current_timestamp on update current_timestamp,
    primary key(`component`, componentVersion, `text`, country, `language`)
);
