#trigger for update

create table flight(
name varchar(50),
ticket_id int,
address varchar (50),
price int,
primary key(ticket_id));

select * from flight;

create table flight_passenger_detail(
name varchar(50),
ticket_id int,
boarding varchar (50),
primary key(ticket_id));

delimiter //
create trigger update_price
before update
on flight
for each row
begin
if new.price<4000 then 
set new.price=5000;
end if;
end //
delimiter ;

insert into flight values('abhishek',11214,'chennai',4500);
insert into flight values('ruchi',11215,'pune',8000);
insert into flight values('radhu',11216,'vadodara',2500);
insert into flight values('mansi',11217,'surat',3600);

update flight set price=2800 where ticket_id=11216;

#update_after

delimiter //
create trigger passenger_detail
after update
on flight
for each row
begin
insert into flight_passenger_detail values(
new.name, new.ticket_id, concat('passenger boarding at ',date_format(now(), '%d %m %y  %h:%i:%m  %p')));
end //
delimiter ;

insert into flight values('roy',21413,'chennai',1500);
insert into flight values('jennil',21414,'pune',8000);
insert into flight values('parul',21415,'vadodara',3900);

update flight set price=3800 where ticket_id=21415;
update flight set price=3800 where ticket_id=21413;
update flight set price=7000 where ticket_id=21414;
select * from flight_passenger_detail;
select * from flight;
drop trigger passenger_detail