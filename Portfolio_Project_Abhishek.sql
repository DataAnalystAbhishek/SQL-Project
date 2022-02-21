use portfolio_project

#Data Definition Language (Common DDL statements are CREATE, ALTER, and DROP)
#Data Manipulation Language (Common DML statements are SELECT,INSERT,UPDATE,DELETE)

# (1) Create Table
create table student(student_id int primary key not null, 
student_name varchar(25) not null, 
std int not null, 
address varchar(50));

# (2) Insert into table
insert into student
values(101,'Abhishek',12,'Bharuch'),
(102,'Bhargav',12,'Bharuch'),
(103,'Ruchi',12,'Anand'),
(104,'Mansi',12,'surat');

# (3) Select Statement

select * from student;

#(4) Update Table

update student set std=11 where student_id=103;

# (5) Delete Statement

delete from student where student_id=104;

# (6) ALter Table

alter table student add student_grade int;      #add new column student_grade
alter table student modify student_grade smallint;        #modify new column student_grade data type
alter table student drop student_grade;         #drop new column student_grade

#(7) Drop Table

drop table student;

#(8) Truncate table

truncate table student;

insert into student
values(104,'Mansi',12,'surat'),
(105,'Rahul',11,'surat'),(106,'Maulik',12,'surat'),
(107,'Raj',11,'Bharuch'),(108,'Sagar',12,'Anand'),
(109,'Raul',11,'Anand'),(110,'Foram',12,'surat'),
(111,'Madhu',11,'Bharuch'),(112,'Hetvi',12,'Bharuch'),
(113,'Ila',11,'surat'),(114,'Parita',12,'surat'),
(115,'Hemu',11,'Vadodara'),(116,'Parth',12,'surat'),
(117,'Alpana',11,'Vadodara'),(118,'Khush',12,'Bharuch'),
(119,'Arvind',11,'Vadodara'),(120,'Vidhi',12,'Vadodara'),
(121,'Lata',11,'Anand'),(122,'Pooja',12,'Bharuch');

# Question-1: List distinct address from student table.

select distinct(address) from student;
select count(distinct(address)) from student;

# Question-2: List student name start with 'Ra'.

select * from student where student_name like 'Ra%';

#Question-3: Count student who studied in std 12.

select count(std) as std_12 from student where std=12;

#Question-4: Sort top 5 student in asc order based on student_name

select * from student order by student_name limit 5;

#Question-5: List student whos address is bharuch and std is 12

select * from student where address='Bharuch' and std=12;


use imdb;

#Question-6: Join two table movie and role based on Id.

select * from movies join roles where id=movie_id;

#Question-7: select movies between 2002 and 2006;

select name,year,rankscore from movies where year between 2002 and 2006;

#Question-8: Select movies with highest rankscore sort by desc year

select * from movies where rankscore=(select max(rankscore) from movies) order by year desc;

#Question-9: List the movies whos genre is comedy or action

select * from movies where id in
(select movie_id from movies_genres where genre in ('comedy','action'));

#Question-10: Print years which have>1000 movies and also display number of movies in desc order

select year,count(year) as total_movies from movies group by year having total_movies>1000 order by total_movies desc; 