drop trigger if exists checkLogRecord;
drop trigger if exists checkLogBody;

delimiter $$

create trigger checkLogRecord before insert on LogRecord 
for each row call checkSystemReference(new.`system`, new.systemVersion)$$

create trigger checkLogBody before insert on LogBody for each row
begin
	if new.`key` is null and new.`value` is null then
		signal sqlstate '2201R' set message_text = 'key and value should not be null';
    end if;
    
    if new.`key` is null and new.`value` is not null and new.parent is not null then
		signal sqlstate '2201R' set message_text = 'A key must be specified for the key/value pair of the parent object';
    end if;
    
    if new.`key` is not null and new.`value` is null and new.parent is not null then
		signal sqlstate '2201R' set message_text = 'A value must be specified for the key/value pair of the parent object';
    end if;
end$$

delimiter ;