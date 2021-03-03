alter table Metric
	add constraint Metric_MonitoringGroup foreign key(monitoringGroup) references MonitoringGroup(groupID),
    add constraint Metric_Unit foreign key(unit) references Unit(unitID);
    
alter table Measurement
	add constraint Measurement_ApplicationVersion foreign key(app, appVersion) references ApplicationVersion(app, version),
    add constraint Measurement_Metric foreign key(metric) references Metric(metricID),
    add constraint Measurement_SystemVersion foreign key(`system`, systemVersion) references SystemVersion(`system`, version);
