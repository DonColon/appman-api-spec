alter table ApplicationConfiguration
	add constraint ApplicationConfiguration_ApplicationVersion foreign key(app, appVersion) references ApplicationVersion(app, version),
    add constraint ApplicationConfiguration_ParameterVersion foreign key(parameter, parameterVersion) references ParameterVersion(parameter, version);

alter table ViewConfiguration
	add constraint ViewConfiguration_ViewVersion foreign key(`view`, viewVersion) references ViewVersion(`view`, version),
    add constraint ViewConfiguration_ParameterVersion foreign key(parameter, parameterVersion) references ParameterVersion(parameter, version);
    
alter table ComponentConfiguration
	add constraint ComponentConfiguration_ComponentVersion foreign key(`component`, componentVersion) references ComponentVersion(`component`, version),
    add constraint ComponentConfiguration_ParameterVersion foreign key(parameter, parameterVersion) references ParameterVersion(parameter, version);
