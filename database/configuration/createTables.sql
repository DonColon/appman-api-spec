create table if not exists ApplicationConfiguration(
	app int unsigned,
    appVersion varchar(16),
    parameter int unsigned,
    parameterVersion varchar(16),
    sequence int unsigned,
	operator varchar(16) not null,
    `value` varchar(1024) not null,
    other varchar(1024) not null,
    primary key(app, appVersion, parameter, parameterVersion, sequence)
);

create table if not exists ViewConfiguration(
	`view` int unsigned,
    viewVersion varchar(16),
    parameter int unsigned,
    parameterVersion varchar(16),
	sequence int unsigned,
	operator varchar(16) not null,
    `value` varchar(1024) not null,
    other varchar(1024) not null,
    primary key(`view`, viewVersion, parameter, parameterVersion, sequence)
);

create table if not exists ComponentConfiguration(
	`component` int unsigned,
    componentVersion varchar(16),
    parameter int unsigned,
    parameterVersion varchar(16),
	sequence int unsigned,
	operator varchar(16) not null,
    `value` varchar(1024) not null,
    other varchar(1024) not null,
    primary key(`component`, componentVersion, parameter, parameterVersion, sequence)
);
