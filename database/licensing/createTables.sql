create table License(
	licenseID varchar(16) primary key,
    spdxID varchar(16) unique not null,
    `name` varchar(64) not null,
    `description` varchar(128) not null,
    url varchar(256) not null,
    content longtext not null
);

create table Permission(
	permissionID varchar(16) primary key,
    `name` varchar(64) not null,
    `description` varchar(128) not null
);

create table `Condition`(
	conditionID varchar(32) primary key,
    `name` varchar(64) not null,
    `description` varchar(128) not null
);

create table Limitation(
	limitationID varchar(16) primary key,
    `name` varchar(64) not null,
    `description` varchar(128) not null
);

create table LicensePermission(
	license varchar(16),
    permission varchar(16),
    primary key(license, permission)
);

create table LicenseCondition(
	license varchar(16),
    `condition` varchar(32),
    primary key(license, `condition`)
);

create table LicenseLimitation(
	license varchar(16),
    limitation varchar(16),
    primary key(license, limitation)
);
