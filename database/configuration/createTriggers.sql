drop trigger if exists checkApplicationConfiguration;
drop trigger if exists checkViewConfiguration;
drop trigger if exists checkComponentConfiguration;

delimiter $$

create trigger checkApplicationConfiguration before insert on ApplicationConfiguration
for each row call checkConfiguration(new.operator, new.`value`, new.other)$$

create trigger checkViewConfiguration before insert on ViewConfiguration
for each row call checkConfiguration(new.operator, new.`value`, new.other)$$

create trigger checkComponentConfiguration before insert on ComponentConfiguration
for each row call checkConfiguration(new.operator, new.`value`, new.other)$$

delimiter ;
