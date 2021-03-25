alter table MonitoringGroup
	add constraint MonitoringGroup_Developer foreign key(modifiedBy) references Developer(developerID);

alter table Metric
	add constraint Metric_MonitoringGroup foreign key(monitoringGroup) references MonitoringGroup(groupID),
    add constraint Metric_Unit foreign key(unit) references Unit(unitID),
    add constraint Metric_Developer foreign key(modifiedBy) references Developer(developerID);

alter table Dimension
	add constraint Dimension_Developer foreign key(modifiedBy) references Developer(developerID);

alter table DimensionExpression
	add constraint DimensionExpression_Dimension foreign key(dimension) references Dimension(dimensionID),
    add constraint DimensionExpression_Developer foreign key(addedBy) references Developer(developerID);
    
alter table MetricDimension
	add constraint MetricDimension_Metric foreign key(metric) references Metric(metricID),
    add constraint MetricDimension_Dimension foreign key(dimension) references Dimension(dimensionID),
    add constraint MetricDimension_Developer foreign key(addedBy) references Developer(developerID);
    
alter table Measurement
	add constraint Measurement_ApplicationVersion foreign key(app, appVersion) references ApplicationVersion(app, version),
    add constraint Measurement_Metric foreign key(metric) references Metric(metricID),
    add constraint Measurement_DimensionExpression foreign key(dimension, expression) references DimensionExpression(dimension, expression),
    add constraint Measurement_SystemVersion foreign key(`system`, systemVersion) references SystemVersion(`system`, version);
