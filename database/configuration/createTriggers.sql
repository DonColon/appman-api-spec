drop procedure if exists checkConfiguration;
drop trigger if exists checkApplicationConfiguration;
drop trigger if exists checkViewConfiguration;
drop trigger if exists checkComponentConfiguration;

delimiter $$

create procedure checkConfiguration(
	in operator varchar(16), 
    in `value` varchar(1024), 
    in other varchar(1024)
) 
begin
	if operator = 'BT' or operator = 'NB' then
		if `value` <= other then
			signal sqlstate '2201R' set message_text = 'value is greater than other';
        end if;
    end if;
end$$

create trigger checkApplicationConfiguration before insert on ApplicationConfiguration
for each row call checkConfiguration(new.operator, new.`value`, new.other)$$

create trigger checkViewConfiguration before insert on ViewConfiguration
for each row call checkConfiguration(new.operator, new.`value`, new.other)$$

create trigger checkComponentConfiguration before insert on ComponentConfiguration
for each row call checkConfiguration(new.operator, new.`value`, new.other)$$

delimiter ;
