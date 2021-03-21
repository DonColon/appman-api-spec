create table if not exists Country(
	`code` varchar(2) primary key,
    `key` varchar(3) unique not null,
    `name` varchar(64) unique not null,
    dialingCode varchar(8) not null,
    addressFormat tinyint unsigned not null,
    numberSeparator tinyint unsigned not null,
    unitSystem tinyint unsigned not null
);

create table if not exists AddressFormat(
	formatID tinyint unsigned auto_increment primary key,
    `format` varchar(256) unique not null
);

create table if not exists NumberSeparator(
	separatorID tinyint unsigned auto_increment primary key,
    decimalSeparator varchar(1) not null,
    thousandSeparator varchar(1) not null
);

create table if not exists UnitSystem(
	systemID tinyint unsigned auto_increment primary key,
    `name` varchar(64) unique not null
);

create table if not exists UnitCategory(
	categoryID tinyint unsigned auto_increment primary key,
    `name` varchar(64) unique not null
);

create table if not exists Unit(
	unitID smallint unsigned auto_increment primary key,
    `name` varchar(64) unique not null,
    abbreviation varchar(16) unique not null,
    factor double precision not null,
    `offset` real not null,
    category tinyint unsigned not null
);

create table if not exists UnitAssignment(
	`system` tinyint unsigned,
    unit smallint unsigned,
    primary key(`system`, unit)
);

create table if not exists Currency(
	`code` varchar(3) primary key,
    digitalCode varchar(3) unique not null,
    `name` varchar(64) unique not null,
    symbol varchar(16) not null
);

create table if not exists LocaleCurrency(
	country varchar(2),
    currency varchar(3),
    primary key(country, currency)
);

create table if not exists Language(
	`code` varchar(3) primary key,
	`name` varchar(64) unique not null,
    nativeName varchar(64) unique not null
);

create table if not exists LocaleLanguage(
	country varchar(2),
    `language` varchar(3),
    isOfficial boolean not null,
    primary key(country, `language`)
);

create table if not exists DateFormat(
	formatID smallint unsigned auto_increment primary key,
    `format` varchar(32) unique not null
);

create table if not exists LocaleDate(
	country varchar(2),
    `format` smallint unsigned,
    displayStyle varchar(16),
    primary key(country, `format`)
);

create table if not exists TimeFormat(
	formatID smallint unsigned auto_increment primary key,
    format varchar(32) unique not null
);

create table if not exists LocaleTime(
	country varchar(2),
    `format` smallint unsigned,
    displayStyle varchar(16),
    primary key(country, `format`)
);

create table if not exists Timezone(
	zoneID smallint unsigned auto_increment primary key,
    `name` varchar(32) unique not null,
    `offset` varchar(8) not null,
    offsetDST varchar(8) not null
);

create table if not exists LocaleTimezone(
	country varchar(2),
    timezone smallint unsigned,
    primary key(country, timezone)
);
