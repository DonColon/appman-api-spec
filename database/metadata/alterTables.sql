alter table Developer
	add constraint Developer_Email check(`email` regexp '(?:[a-z0-9!#$%&\'*+\\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&\'*+\/=?^_`{|}~-]+)*|"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])'),
    add constraint Developer_Password check(`password` regexp '^[$]2[abxy]?[$](?:0[4-9]|[12][0-9]|3[01])[$][.\/0-9a-zA-Z]{53}$'),
    add constraint Developer_PhoneNumber check(phoneNumber regexp '^\\+[1-9]\\d{1,14}$'),
    add constraint Developer_MobileNumber check(mobileNumber regexp '^\\+[1-9]\\d{1,14}$'),
    add constraint Developer_Birthday check(birthday < createdOn);

alter table Collaborator
	add constraint Collaborator_Developer foreign key(developer) references Developer(developerID),
    add constraint Collaborator_Application foreign key(app) references Application(appID);
 
 alter table `System`
	add constraint System_Developer foreign key(modifiedBy) references Developer(developerID);
 
 alter table SystemVersion
	add constraint SystemVersion_System foreign key(`system`) references `System`(systemID),
    add constraint SystemVersion_Developer foreign key(addedBy) references Developer(developerID),
	add constraint SystemVersion_Version check(version regexp '(?<major>0|(?:[1-9]\d*))(?:\.(?<minor>0|(?:[1-9]\d*))(?:\.(?<patch>0|(?:[1-9]\d*))))');
 
 alter table Application
	add constraint Application_Author foreign key(author) references Developer(developerID),
    add constraint Application_License foreign key(license) references License(licenseID),
    add constraint Application_Developer foreign key(modifiedBy) references Developer(developerID);
 
alter table ApplicationVersion
	add constraint ApplicationVersion_Application foreign key(app) references Application(appID),
    add constraint ApplicationVersion_Developer foreign key(addedBy) references Developer(developerID),
    add constraint ApplicationVersion_Version check(version regexp '(?<major>0|(?:[1-9]\d*))(?:\.(?<minor>0|(?:[1-9]\d*))(?:\.(?<patch>0|(?:[1-9]\d*))))');

alter table `View`
	add constraint View_Developer foreign key(modifiedBy) references Developer(developerID);
    
alter table ViewVersion
	add constraint ViewVersion_View foreign key(`view`) references `View`(viewID),
    add constraint ViewVersion_Developer foreign key(addedBy) references Developer(developerID),
    add constraint ViewVersion_Version check(version regexp '(?<major>0|(?:[1-9]\d*))(?:\.(?<minor>0|(?:[1-9]\d*))(?:\.(?<patch>0|(?:[1-9]\d*))))');

alter table `Component`
	add constraint Component_Developer foreign key(modifiedBy) references Developer(developerID);
    
alter table ComponentVersion
	add constraint ComponentVersion_Component foreign key(`component`) references `Component`(componentID),
    add constraint ComponentVersion_Developer foreign key(addedBy) references Developer(developerID),
    add constraint ComponentVersion_Version check(version regexp '(?<major>0|(?:[1-9]\d*))(?:\.(?<minor>0|(?:[1-9]\d*))(?:\.(?<patch>0|(?:[1-9]\d*))))');

alter table BackendSystem
	add constraint BackendSystem_SystemVersion foreign key(`system`, systemVersion) references SystemVersion(`system`, version),
    add constraint BackendSystem_ApplicationVersion foreign key(app, appVersion) references ApplicationVersion(app, version),
    add constraint BackendSystem_Developer foreign key(addedBy) references Developer(developerID);
    
alter table ApplicationView
	add constraint ApplicationView_ApplicationVersion foreign key(app, appVersion) references ApplicationVersion(app, version),
    add constraint ApplicationView_ViewVersion foreign key(`view`, viewVersion) references ViewVersion(`view`, version),
    add constraint ApplicationView_Developer foreign key(addedBy) references Developer(developerID);
    
alter table ViewComponent
	add constraint ViewComponent_ViewVersion foreign key(`view`, viewVersion) references ViewVersion(`view`, version),
    add constraint ViewComponent_ComponentVersion foreign key(`component`, componentVersion) references ComponentVersion(`component`, version),
    add constraint ViewComponent_Developer foreign key(addedBy) references Developer(developerID);
    
alter table SubComponent
	add constraint SubComponent_SuperComponentVersion foreign key(`component`, componentVersion) references ComponentVersion(`component`, version),
    add constraint SubComponent_SubComponentVersion foreign key(subComponent, subComponentVersion) references ComponentVersion(`component`, version),
    add constraint SubComponent_Developer foreign key(addedBy) references Developer(developerID);
    
alter table DataFormat
	add constraint DataFormat_DataType foreign key(`type`) references DataType(typeID);
    
alter table NumberFormat
	add constraint NumberFormat_DataFormat foreign key(formatID) references DataFormat(formatID);

alter table ParameterType
	add constraint ParameterType_Developer foreign key(modifiedBy) references Developer(developerID);
    
alter table Parameter
	add constraint Parameter_Developer foreign key(modifiedBy) references Developer(developerID);
    
alter table ParameterVersion
	add constraint ParameterVersion_Parameter foreign key(parameter) references Parameter(parameterID),
    add constraint ParameterVersion_DataFormat foreign key(`format`) references DataFormat(formatID),
    add constraint ParameterVersion_ParameterType foreign key(`type`) references ParameterType(typeID),
    add constraint ParameterVersion_Developer foreign key(modifiedBy) references Developer(developerID),
    add constraint ParameterVersion_Version check(version regexp '(?<major>0|(?:[1-9]\d*))(?:\.(?<minor>0|(?:[1-9]\d*))(?:\.(?<patch>0|(?:[1-9]\d*))))');
    
alter table ParameterOperator
	add constraint ParameterOperator_ParameterVersion foreign key(parameter, parameterVersion) references ParameterVersion(parameter, version),
    add constraint ParameterOperator_Operator foreign key(operator) references Operator(operatorID),
    add constraint ParameterOperator_Developer foreign key(addedBy) references Developer(developerID);
    
alter table ApplicationParameter
	add constraint ApplicationParameter_ApplicationVersion foreign key(app, appVersion) references ApplicationVersion(app, version),
    add constraint ApplicationParameter_ParameterVersion foreign key(parameter, parameterVersion) references ParameterVersion(parameter, version),
    add constraint ApplicationParameter_Developer foreign key(modifiedBy) references Developer(developerID);
    
alter table ViewParameter
	add constraint ViewParameter_ViewVersion foreign key(`view`, viewVersion) references ViewVersion(`view`, version),
    add constraint ViewParameter_ParameterVersion foreign key(parameter, parameterVersion) references ParameterVersion(parameter, version),
    add constraint ViewParameter_Developer foreign key(modifiedBy) references Developer(developerID);
    
alter table ComponentParameter
	add constraint ComponentParameter_ComponentVersion foreign key(`component`, componentVersion) references ComponentVersion(`component`, version),
    add constraint ComponentParameter_ParameterVersion foreign key(parameter, parameterVersion) references ParameterVersion(parameter, version),
    add constraint ComponentParameter_Developer foreign key(modifiedBy) references Developer(developerID);
    