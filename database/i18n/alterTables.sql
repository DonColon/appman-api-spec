alter table Country
	add constraint Country_AddressFormat foreign key(addressFormat) references AddressFormat(formatID),
    add constraint Country_NumberSeparator foreign key(numberSeparator) references NumberSeparator(separatorID),
    add constraint Country_UnitSystem foreign key(unitSystem) references UnitSystem(systemID);
    
alter table Unit
	add constraint Unit_UnitCategory foreign key(category) references UnitCategory(categoryID);

alter table UnitAssignment
	add constraint UnitAssignment_UnitSystem foreign key(`system`) references UnitSystem(systemID),
    add constraint UnitAssignment_Unit foreign key(unit) references Unit(unitID);
    
alter table LocaleCurrency
	add constraint LocaleCurrency_Country foreign key(country) references Country(`code`),
    add constraint LocaleCurrency_Currency foreign key(currency) references Currency(`code`);
    
alter table LocaleLanguage
	add constraint LocaleLanguage_Country foreign key(country) references Country(`code`),
    add constraint LocaleLanguage_Language foreign key(`language`) references `Language`(`code`);
    
alter table LocaleDate
	add constraint LocaleDate_Country foreign key(country) references Country(`code`),
    add constraint LocaleDate_DateFormat foreign key(`format`) references DateFormat(formatID);
    
alter table LocaleTime
	add constraint LocaleTime_Country foreign key(country) references Country(`code`),
    add constraint LocaleTime_TimeFormat foreign key(`format`) references TimeFormat(formatID);
    
alter table LocaleZone
	add constraint LocaleZone_Country foreign key(country) references Country(`code`),
    add constraint LocaleZone_Timezone foreign key(zone) references Timezone(zoneID);
