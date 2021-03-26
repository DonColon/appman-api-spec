drop function if exists nextTraceID;

delimiter $$

create function nextTraceID() returns bigint unsigned
	reads sql data 
begin
    declare nextID bigint unsigned;
    
    select max(traceID) into nextID 
    from LogRecord;
    
    if nextID is null then
		set nextID = 0;
	end if;
    
    if nextID is not null then
		set nextID = nextID + 1;
	end if;

    return nextID;
end$$

delimiter ;
