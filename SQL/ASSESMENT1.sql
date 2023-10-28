create database assessment;
use assessment;
create table worker
 (
   worker_id int,
   first_name varchar(50),
   last_name varchar(60),
   salary int,
   joining_date timestamp,
   department varchar(80)
   );
   
   insert into worker(worker_id,first_name,last_name,salary,joining_date,department)values
(1,'monika','arora',100000,'2014-02-20 9:00','hr'),
(2,'niharika','verma',80000,'2014-06-11 9:00','admin'),
(3,'vishal','singhal',300000,'2014-02-20 9:00','hr'),
(4,'amitabh','singh',500000,'2014-02-20 9:00','admin'),
(5,'vivek','bhati',500000,'2014-06-11 9:00','admin'),
(6,'vipul','diwan',200000,'2014-06-11 9:00','account'),
(7,'satish','kumar',75000,'2014-01-20 9:00','account'),
(8,'geetika','chauhan',90000,'2014-04-11 9:00','admin');

select * from worker;
 
 /* Q1-----*/
   select worker_id,first_name,last_name,salary,joining_date,department from worker order by first_name asc;
   select worker_id,first_name,last_name,salary,joining_date,department from worker order by department desc;
  
  /* Q2-----*/
   
   select* from worker where first_name in('vipul','satish');
     
/* Q3-----*/
  
  select* from worker where first_name like '_____h';
  
/*Q4-----*/
  
   select salary from worker where salary between 10000 and 90000;
   
/*Q5----*/
   
   select  worker_id,first_name,last_name, count(*)as duplicate from worker group by  worker_id having count(*)>1;
   
   
/*Q6----*/

   select * from worker limit 6;  
   
/*Q7-----*/
 
  SELECT department from worker  group by department having department <5;
  
  /*Q8----*/
   
   select department,count(department) from worker group by department;
  
/*Q9-----*/

select first_name,department from worker where salary in (select max(salary) from worker group by department);


/*ASSEMENT2--*/

use assessment;

create table student
(
 std_id int,
 std_name varchar(80),
 sex varchar(80),
 pr float,
 class int,
 sec varchar(60),
 stream varchar(80),
 dob date
 );
 
 insert into student (std_id,std_name,sex,pr,class,sec,stream,dob)values
 (1001,'surekha joshi','female','82.00',12,'A','science','1998-03-08'),
 (1002,'mahi agrwal','female','56.00',11,'C','commerce','2008-11-23'),
 (1003,'sanam verma','male','59.00',11,'C','commerce','2006-06-29'),
 (1004,'ronit kumar','male','63.00',11,'C','commerce','1997-11-05'),
 (1005,'dipesh pulkit','male','78.00',11,'B','science','2003-09-14'),
 (1006,'jahanvi puri','female','60.00',11,'B','commerce','2008-11-07'),
 (1007,'sanam kumar','male','23.00',12,'F','commerce','1998-03-08'),
 (1008,'sahil saras','male','56.00',11,'C','commerce','2008-07-11'),
 (1009,'akshara agarwal','female','72.00',12,'B','commerce','1996-01-010'),
 (1010,'stuti mishra','female','39.00',11,'F','science','2008-11-23'),
 (1011,'harsh agarwal','male','42.00',11,'C','science','1998-03-08'),
 (1012,'nikunj agarwal','male','49.00',12,'C','commerce','1998-06-28'),
 (10013,'akriti saxena','female','89.00',12,'A','science','2008-11-23'),
 (1014,'tani rastogi','female','82.00',12,'A','science','2008-11-23');


select * from student; 

alter table student modify column dob varchar(25);

/* save point ka advantages competitation power save,memory save */







 /*Q1----*/
 
 select * from student;
 
 /*Q2----*/
 
 select std_name,dob from student;
 
 /*Q3----*/
 
 select * from student where pr >=80;
 
 /*Q4---*/
 
 select std_name,stream,pr from student where pr > 80;
 
 /*Q5---*/
 
 select *from student where stream='science' and pr>75;
 
 
 
 
 
use assessment;

create table student
(
 std_id int,
 std_name varchar(80),
 sex varchar(80),
 pr float,
 class int,
 sec varchar(60),
 stream varchar(80),
 dob date
 );
 
 insert into student (std_id,std_name,sex,pr,class,sec,stream,dob)values
 (1001,'surekha joshi','female','82.00',12,'A','science','1998-03-08'),
 (1002,'mahi agrwal','female','56.00',11,'C','commerce','2008-11-23'),
 (1003,'sanam verma','male','59.00',11,'C','commerce','2006-06-29'),
 (1004,'ronit kumar','male','63.00',11,'C','commerce','1997-11-05'),
 (1005,'dipesh pulkit','male','78.00',11,'B','science','2003-09-14'),
 (1006,'jahanvi puri','female','60.00',11,'B','commerce','2008-11-07'),
 (1007,'sanam kumar','male','23.00',12,'F','commerce','1998-03-08'),
 (1008,'sahil saras','male','56.00',11,'C','commerce','2008-07-11'),
 (1009,'akshara agarwal','female','72.00',12,'B','commerce','1996-01-010'),
 (1010,'stuti mishra','female','39.00',11,'F','science','2008-11-23'),
 (1011,'harsh agarwal','male','42.00',11,'C','science','1998-03-08'),
 (1012,'nikunj agarwal','male','49.00',12,'C','commerce','1998-06-28'),
 (10013,'akriti saxena','female','89.00',12,'A','science','2008-11-23'),
 (1014,'tani rastogi','female','82.00',12,'A','science','2008-11-23');


select * from student; 

alter table student modify column dob varchar(25);

/* save point ka advantages competitation power save,memory save */







 /*Q1----*/
 
 select * from student;
 
 /*Q2----*/
 
 select std_name,dob from student;
 
 /*Q3----*/
 
 select * from student where pr >=80;
 
 /*Q4---*/
 
 select std_name,stream,pr from student where pr > 80;
 
 /*Q5---*/
 
 select *from student where stream='science' and pr>75;
 
 
 
 
 
 
  

 