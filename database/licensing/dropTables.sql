set foreign_key_checks=0;

drop table if exists License;
drop table if exists Permission;
drop table if exists `Condition`;
drop table if exists Limitation;

drop table if exists LicensePermission;
drop table if exists LicenseCondition;
drop table if exists LicenseLimitation;

set foreign_key_checks=1;
