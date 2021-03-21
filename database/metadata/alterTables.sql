alter table Application
	add constraint Application_Developer foreign key(author) references Developer(developerID),
    add constraint Application_License foreign key(license) references License(licenseID);

alter table Collaborator
	add constraint Collaborator_Developer foreign key(developer) references Developer(developerID),
    add constraint Collaborator_Application foreign key(app) references Application(appID);
    
alter table SystemVersion
	add constraint SystemVersion_System foreign key(`system`) references `System`(systemID),
	add constraint SystemVersion_Version check(version regexp '(?<Major>0|(?:[1-9]\d*))(?:\.(?<Minor>0|(?:[1-9]\d*))(?:\.(?<Patch>0|(?:[1-9]\d*))))');
    
alter table ApplicationVersion
	add constraint ApplicationVersion_Application foreign key(app) references Application(appID),
    add constraint ApplicationVersion_Version check(version regexp '(?<Major>0|(?:[1-9]\d*))(?:\.(?<Minor>0|(?:[1-9]\d*))(?:\.(?<Patch>0|(?:[1-9]\d*))))');
    
alter table ViewVersion
	add constraint ViewVersion_View foreign key(`view`) references `View`(viewID),
    add constraint ViewVersion_Version check(version regexp '(?<Major>0|(?:[1-9]\d*))(?:\.(?<Minor>0|(?:[1-9]\d*))(?:\.(?<Patch>0|(?:[1-9]\d*))))');
    
alter table ComponentVersion
	add constraint ComponentVersion_Component foreign key(`component`) references `Component`(componentID),
    add constraint ComponentVersion_Version check(version regexp '(?<Major>0|(?:[1-9]\d*))(?:\.(?<Minor>0|(?:[1-9]\d*))(?:\.(?<Patch>0|(?:[1-9]\d*))))');

alter table BackendSystem
	add constraint BackendSystem_SystemVersion foreign key(`system`, systemVersion) references SystemVersion(`system`, version),
    add constraint BackendSystem_ApplicationVersion foreign key(app, appVersion) references ApplicationVersion(app, version);
    
alter table ApplicationView
	add constraint ApplicationView_ApplicationVersion foreign key(app, appVersion) references ApplicationVersion(app, version),
    add constraint ApplicationView_ViewVersion foreign key(`view`, viewVersion) references ViewVersion(`view`, version);
    
alter table ViewComponent
	add constraint ViewComponent_ViewVersion foreign key(`view`, viewVersion) references ViewVersion(`view`, version),
    add constraint ViewComponent_ComponentVersion foreign key(`component`, componentVersion) references ComponentVersion(`component`, version);
    
alter table SubComponent
	add constraint SubComponent_SuperComponentVersion foreign key(`component`, componentVersion) references ComponentVersion(`component`, version),
    add constraint SubComponent_SubComponentVersion foreign key(subComponent, subComponentVersion) references ComponentVersion(`component`, version);
    
alter table DataFormat
	add constraint DataFormat_DataType foreign key(`type`) references DataType(typeID);
    
alter table NumberFormat
	add constraint NumberFormat_DataFormat foreign key(formatID) references DataFormat(formatID);
    
alter table ParameterVersion
	add constraint ParameterVersion_Parameter foreign key(parameter) references Parameter(parameterID),
    add constraint ParameterVersion_DataFormat foreign key(`format`) references DataFormat(formatID),
    add constraint ParameterVersion_ParameterType foreign key(`type`) references ParameterType(typeID),
    add constraint ParameterVersion_Version check(version regexp '(?<Major>0|(?:[1-9]\d*))(?:\.(?<Minor>0|(?:[1-9]\d*))(?:\.(?<Patch>0|(?:[1-9]\d*))))');
    
alter table ParameterOperator
	add constraint ParameterOperator_ParameterVersion foreign key(parameter, parameterVersion) references ParameterVersion(parameter, version),
    add constraint ParameterOperator_Operator foreign key(operator) references Operator(operatorID);
    
alter table ApplicationParameter
	add constraint ApplicationParameter_ApplicationVersion foreign key(app, appVersion) references ApplicationVersion(app, version),
    add constraint ApplicationParameter_ParameterVersion foreign key(parameter, parameterVersion) references ParameterVersion(parameter, version);
    
alter table ViewParameter
	add constraint ViewParameter_ViewVersion foreign key(`view`, viewVersion) references ViewVersion(`view`, version),
    add constraint ViewParameter_ParameterVersion foreign key(parameter, parameterVersion) references ParameterVersion(parameter, version);
    
alter table ComponentParameter
	add constraint ComponentParameter_ComponentVersion foreign key(`component`, componentVersion) references ComponentVersion(`component`, version),
    add constraint ComponentParameter_ParameterVersion foreign key(parameter, parameterVersion) references ParameterVersion(parameter, version);