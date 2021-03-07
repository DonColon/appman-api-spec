alter table LicensePermission
	add constraint LicensePermission_License foreign key(license) references License(licenseID),
    add constraint LicensePermission_Permission foreign key(permission) references Permission(permissionID);
    
alter table LicenseCondition
	add constraint LicenseCondition_License foreign key(license) references License(licenseID),
    add constraint LicenseCondition_Condition foreign key(`condition`) references `Condition`(conditionID);
    
alter table LicenseLimitation
	add constraint LicenseLimitation_License foreign key(license) references License(licenseID),
    add constraint LicenseLimitation_Limitation foreign key(limitation) references Limitation(limitationID);
