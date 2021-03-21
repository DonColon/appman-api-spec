set foreign_key_checks=0;

drop table if exists Country;
drop table if exists AddressFormat;
drop table if exists NumberSeparator;

drop table if exists UnitSystem;
drop table if exists UnitCategory;
drop table if exists Unit;
drop table if exists UnitAssignment;

drop table if exists Currency;
drop table if exists LocaleCurrency;
drop table if exists `Language`;
drop table if exists LocaleLanguage;

drop table if exists DateFormat;
drop table if exists LocaleDate;
drop table if exists TimeFormat;
drop table if exists LocaleTime;
drop table if exists Timezone;
drop table if exists LocaleTimezone;

set foreign_key_checks=1;