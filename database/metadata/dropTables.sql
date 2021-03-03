set foreign_key_checks=0;

drop table if exists Developer;
drop table if exists Collaborator;
drop table if exists `System`;
drop table if exists SystemVersion;
drop table if exists Application;
drop table if exists ApplicationVersion;
drop table if exists `View`;
drop table if exists ViewVersion;
drop table if exists `Component`;
drop table if exists ComponentVersion;

drop table if exists BackendSystem;
drop table if exists ApplicationView;
drop table if exists ViewComponent;
drop table if exists SubComponent;

drop table if exists DataType;
drop table if exists DataFormat;
drop table if exists NumberFormat;
drop table if exists ParameterType;

drop table if exists Parameter;
drop table if exists ParameterVersion;
drop table if exists ApplicationParameter;
drop table if exists ViewParameter;
drop table if exists ComponentParameter;

set foreign_key_checks=1;
