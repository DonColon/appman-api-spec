drop procedure if exists checkConfiguration;
drop procedure if exists checkSystemReference;

delimiter $$

create procedure checkConfiguration(
	in operator varchar(16), 
    in `value` varchar(1024), 
    in other varchar(1024)
) 
begin
	if operator = 'BT' or operator = 'NB' then
		if `value` > other then
			signal sqlstate '2201R' set message_text = 'value is greater than other';
        end if;
    end if;
end$$

create procedure checkSystemReference(
	in `system` int unsigned,
    in systemVersion varchar(16)
)
begin
	if `system` is null and systemVersion is not null then
		signal sqlstate '2201R' set message_text = 'systemID and systemVersion must be maintained together';
    end if;
    
    if systemVersion is null and `system` is not null then
		signal sqlstate '2201R' set message_text = 'systemID and systemVersion must be maintained together';
    end if;
end$$

delimiter ;
