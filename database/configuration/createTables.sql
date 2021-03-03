create table if not exists ApplicationConfiguration(
	app bigint,
    appVersion varchar(16),
    parameter bigint,
    parameterVersion varchar(16),
    sequence bigint,
	operator varchar(16) not null,
    `value` varchar(1024) not null,
    other varchar(1024) not null,
    primary key(app, appVersion, parameter, parameterVersion, sequence)
);

create table if not exists ViewConfiguration(
	`view` bigint,
    viewVersion varchar(16),
    parameter bigint,
    parameterVersion varchar(16),
	sequence bigint,
	operator varchar(16) not null,
    `value` varchar(1024) not null,
    other varchar(1024) not null,
    primary key(`view`, viewVersion, parameter, parameterVersion, sequence)
);

create table if not exists ComponentConfiguration(
	`component` bigint,
    componentVersion varchar(16),
    parameter bigint,
    parameterVersion varchar(16),
	sequence bigint,
	operator varchar(16) not null,
    `value` varchar(1024) not null,
    other varchar(1024) not null,
    primary key(`component`, componentVersion, parameter, parameterVersion, sequence)
);
