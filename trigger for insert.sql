create table students(
name varchar(40),
id int,
std int,
address varchar(50),
fees int,
primary key (id));

select * from students;

create table audit_student(
id int,
descr varchar(50),
primary key (id));

delimiter //
create trigger student_audit_update
after insert
on students
for each row
begin
insert into audit_student values(
new.id,now());
end //
delimiter ;

insert into students(name,id,std,address,fees) 
values('bhargav',101,12,'bharuch',1700),
('nirav',102,12,'bharuch',1700),
('abhishek',103,12,'bharuch',1700);

drop trigger student_update;

delimiter //
create trigger student_update
before insert
on students
for each row
begin
set new.fees=new.fees+100;
end //
delimiter ;

insert into students
values('ruchi',104,12,'bharuch',1700),
('radhu',105,12,'bharuch',1700),
('mansi',106,12,'bharuch',1700);


insert into students
values('raju',107,12,'bharuch',1700),
('hemu',108,12,'bharuch',1700),
('ila',109,12,'bharuch',1700);

insert into students
values('raju',125,11,'bharuch',1900);
select * from students;
select * from audit_student;