alter table Localization
	add constraint Localization_ApplicationVersion foreign key(app, appVersion) references ApplicationVersion(app, version),
    add constraint Localization_Country foreign key(country) references Country(`code`);
    
alter table ApplicationText
	add constraint ApplicationText_Application_Version foreign key(app, appVersion) references ApplicationVersion(app, version),
    add constraint ApplicationText_Text foreign key(`text`, country, `language`) references `Text`(textID, country, `language`);
    
alter table ViewText
	add constraint ViewText_ViewVersion foreign key(`view`, viewVersion) references ViewVersion(`view`, version),
    add constraint ViewText_Text foreign key(`text`, country, `language`) references `Text`(textID, country, `language`);
    
alter table ComponentText
	add constraint ComponentText_ComponentVersion foreign key(`component`, componentVersion) references ComponentVersion(`component`, version),
    add constraint ComponentText_Text foreign key(`text`, country, `language`) references `Text`(textID, country, `language`);
