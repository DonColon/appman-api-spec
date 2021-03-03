create table if not exists Country(
	`code` varchar(2) primary key,
    `key` varchar(3) unique not null,
    `name` varchar(64) not null,
    diallingCode varchar(8) not null,
    addressFormat bigint not null,
    numberSeparator bigint not null,
    unitSystem bigint not null
);

create table if not exists AddressFormat(
	formatID bigint auto_increment primary key,
    `format` varchar(256) not null
);

create table if not exists NumberSeparator(
	separatorID bigint auto_increment primary key,
    decimalSeparator varchar(1) not null,
    thousandSeparator varchar(1) not null
);

create table if not exists UnitSystem(
	systemID bigint auto_increment primary key,
    `name` varchar(64) not null
);

create table if not exists UnitCategory(
	categoryID bigint auto_increment primary key,
    `name` varchar(64) not null
);

create table if not exists Unit(
	unitID bigint auto_increment primary key,
    `name` varchar(64) not null,
    abbreviation varchar(16) not null,
    factor double precision not null,
    `offset` real not null,
    category bigint not null
);

create table if not exists UnitAssignment(
	`system` bigint,
    unit bigint,
    primary key(`system`, unit)
);

create table if not exists Currency(
	currencyID bigint auto_increment primary key,
    `name` varchar(64) not null,
    abbreviation varchar(8) not null,
    symbol varchar(4)
);

create table if not exists LocaleCurrency(
	country varchar(2),
    currency bigint,
    primary key(country, currency)
);

create table if not exists Language(
	`code` varchar(2) primary key,
	`name` varchar(64) not null
);

create table if not exists LocaleLanguage(
	country varchar(2),
    `language` varchar(2),
    isOfficial boolean not null,
    primary key(country, `language`)
);

create table if not exists DateFormat(
	formatID bigint auto_increment primary key,
    `format` varchar(32) not null
);

create table if not exists LocaleDate(
	country varchar(2),
    `format` bigint,
    displayStyle varchar(16),
    primary key(country, `format`)
);

create table if not exists TimeFormat(
	formatID bigint auto_increment primary key,
    format varchar(32) not null
);

create table if not exists LocaleTime(
	country varchar(2),
    `format` bigint,
    displayStyle varchar(16),
    primary key(country, `format`)
);

create table if not exists Timezone(
	zoneID bigint auto_increment primary key,
    zone varchar(32) not null
);

create table if not exists LocaleZone(
	country varchar(2),
    zone bigint,
    primary key(country, zone)
);
