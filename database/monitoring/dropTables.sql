set foreign_key_checks=0;

drop table if exists MonitoringGroup;
drop table if exists Metric;

drop table if exists Dimension;
drop table if exists DimensionExpression;
drop table if exists MetricDimension;

drop table if exists Measurement;

set foreign_key_checks=1;