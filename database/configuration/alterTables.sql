alter table ApplicationConfiguration
	add constraint ApplicationConfiguration_ApplicationVersion foreign key(app, appVersion) references ApplicationVersion(app, version),
    add constraint ApplicationConfiguration_ParameterVersion foreign key(parameter, parameterVersion) references ParameterVersion(parameter, version),
    add constraint ApplicationConfiguration_Operator foreign key(operator) references Operator(operatorID),
    add constraint ApplicationConfiguration_Developer foreign key(modifiedBy) references Developer(developerID);

alter table ViewConfiguration
	add constraint ViewConfiguration_ApplicationVersion foreign key(app, appVersion) references ApplicationVersion(app, version),
	add constraint ViewConfiguration_ViewVersion foreign key(`view`, viewVersion) references ViewVersion(`view`, version),
    add constraint ViewConfiguration_ParameterVersion foreign key(parameter, parameterVersion) references ParameterVersion(parameter, version),
    add constraint ViewConfiguration_Operator foreign key(operator) references Operator(operatorID),
    add constraint ViewConfiguration_Developer foreign key(modifiedBy) references Developer(developerID);
    
alter table ComponentConfiguration
	add constraint ComponentConfiguration_ApplicationVersion foreign key(app, appVersion) references ApplicationVersion(app, version),
	add constraint ComponentConfiguration_ViewVersion foreign key(`view`, viewVersion) references ViewVersion(`view`, version),
	add constraint ComponentConfiguration_ComponentVersion foreign key(`component`, componentVersion) references ComponentVersion(`component`, version),
    add constraint ComponentConfiguration_ParameterVersion foreign key(parameter, parameterVersion) references ParameterVersion(parameter, version),
    add constraint ComponentConfiguration_Operator foreign key(operator) references Operator(operatorID),
    add constraint ComponentConfiguration_Developer foreign key(modifiedBy) references Developer(developerID);
