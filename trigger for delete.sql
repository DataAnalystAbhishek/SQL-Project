#trigger for before delete

select * from flight;

delimiter //
create trigger before_delete
before delete
on flight
for each row
begin
signal sqlstate '45000' set message_text="NOT ALLOWED";
end //
delimiter ;

delete from flight
where ticket_id=11214;

#backup table
create table backup(name varchar(50), ticket_id int primary key, comment varchar(100));

#trigger after delete
delimiter //
create trigger after_delete
after delete
on flight
for each row
begin
insert into backup 
values(old.name, old.ticket_id, concat("user deleted at ",now()));
end //
delimiter ;

delete from flight 
where ticket_id=11217;
select * from backup;

drop trigger after_delete;
drop table backup;