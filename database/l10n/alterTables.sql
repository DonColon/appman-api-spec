alter table Localization
	add constraint Localization_ApplicationVersion foreign key(app, appVersion) references ApplicationVersion(app, version),
    add constraint Localization_Country foreign key(country) references Country(`code`),
    add constraint Localization_Developer foreign key(addedBy) references Developer(developerID);

alter table `Text`
	add constraint Text_Developer foreign key(modifiedBy) references Developer(developerID);
    
alter table ApplicationText
	add constraint ApplicationText_ApplicationVersion foreign key(app, appVersion) references ApplicationVersion(app, version),
    add constraint ApplicationText_Text foreign key(`text`, country, `language`) references `Text`(textID, country, `language`),
    add constraint ApplicationText_Developer foreign key(addedBy) references Developer(developerID);
    
alter table ViewText
	add constraint ViewText_ViewVersion foreign key(`view`, viewVersion) references ViewVersion(`view`, version),
    add constraint ViewText_Text foreign key(`text`, country, `language`) references `Text`(textID, country, `language`),
    add constraint ViewText_Developer foreign key(addedBy) references Developer(developerID);
    
alter table ComponentText
	add constraint ComponentText_ComponentVersion foreign key(`component`, componentVersion) references ComponentVersion(`component`, version),
    add constraint ComponentText_Text foreign key(`text`, country, `language`) references `Text`(textID, country, `language`),
    add constraint ComponentText_Developer foreign key(addedBy) references Developer(developerID);
