drop trigger if exists checkMeasurement;

delimiter $$

create trigger checkMeasurement before insert on Measurement 
for each row call checkSystemReference(new.`system`, new.systemVersion)$$

delimiter ;