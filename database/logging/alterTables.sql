alter table LogLevel
	add constraint LogLevel_LogType foreign key(`type`) references LogType(typeID);
    
alter table LogRecord
	add constraint LogRecord_LogLevel foreign key(`level`) references LogLevel(levelID),
    add constraint LogRecord_ApplicationVersion foreign key(app, appVersion) references ApplicationVersion(app, version),
    add constraint LogRecord_SystemVersion foreign key(`system`, systemVersion) references SystemVersion(`system`, version);
    
alter table LogAttribute
	add constraint LogAttribute_LogRecord foreign key(log) references LogRecord(logID);
    
alter table LogBody
	add constraint LogBody_LogRecord foreign key(log) references LogRecord(logID);