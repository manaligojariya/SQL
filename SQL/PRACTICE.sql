create table order2
( 
order_id int primary key,
customer_id int,
order_date datetime,
total_amount decimal(10,2),
delivery_date datetime
);
drop table order2;
insert into order2(order_id,customer_id,order_date,total_amount,delivery_date)values
(1,101,'2023-01-15 08:30:00',150.00,'2023-01-15 08:45:00'),
(2,102,'2024-02-20 02:45:00',220.00,'2023-02-20 04:30:00'),
(3,103,'2023-03-05 10:15:00',75.25,'2023-03-05 11:15:00'),
(4,101,'2023-03-10 04:30:00',100.00,'2023-03-10 07:00:00'),
(5,104,'2023-10-9 09:30:00',300.75,'2023-10-09 03:40:00'),
(6,102,'2024-05-20 11:20:00',180.60,'2023-05-20 04:20:00'),
(7,105,'2024-05-25 01:45:00',90.40,'2023-05-25 01:20:00');

select * from order2;
drop table order2;
/*Q1--- RETIREV ALL ORDER PLACED in the LASTWEEK */

SELECT * FROM order2
WHERE order_date <= curdate() - INTERVAL 1 WEEK;


/*Q2---calcute the total sales for each month in the current year...*/
 
select month(order_date)as month,SUM(total_amount) FROM order2
GROUP BY YEAR(order_date), MONTH(order_date);

/*Q3----weekend data order show...*/

select *from order2 where dayofweek(order_date) in (1,7);

/* Q4-- calculate total sales from each quater of the year..*/

select year(order_date) as year,
   quarter(order_date)as quarter,
   sum(total_amount)as total_sales
   from order2
   group by year(order_date), quarter(order_date);
   
/* Q5---  find the */ 

select * from order2 where timestampdiff(hour,order_date,delivery_date)>3;
select * from order2;
/*Q6--- number of order maximum month---*/

select month(order_date) as month,
max(total_amount) as maximum
from order2
group by(order_date) limit 1 offset 1;
 
select * from employees;
/* candidate key  =behaviour primary key jaisa....*/


/*HR DSTABASE USE KARNA HAI...*/
use assignnment1;
/* write a query to fetch a data of all employess whose salry is lower than the it ptogram job_id employees..*/
select * from employees where salary < any(select salary from employees where job_id="it_prog");

/* write a query display emp_id,name,salary and salary_satatus respectlilly whose salary is more than and less than avg salary more employees..*/
 select employee_id,first_name,salary,
    case when salary >= (select avg(salary) from employees)then 'high'
	  else 'low'
   end as salary_status from employees;    
   
/* avg salary < salary data & id departmnet...*/

select *from employees where salary > (select avg(salary) from employees)
and job_id in(select job_id from employees where job_id='it_prog');

/* write a sql query to find those employees salary exist 50% of their departmnets total salary bill written first name ,last name..*/

select first_name,last_name
from employees e1
where salary > 
(select(sum(salary))/2 as total
from employees e2
where e1.department_id=e2.department_id);
    
      
/* find the customer with most order given months..*/

select customer_id,count(order_id) as max_order 
from order2 where month(order_date)=05 group by(customer_id) 
order by max_order desc limit 1;
select * from order2;
    
/* calcute the avg order amount of each day of the week..*/

select avg(total_amount) as avg_amount,dayofweek(order_date) as DA_Y group by(DA_Y);
    select * from order2;


/*avg time taken by customer repleced in repeat order..*/
 
 SELECT
AVG(timestampdiff(second,o1.order_date,o2.order_date)) AS avg_time
FROM order2 o1
join orders o2 on o1.customer_id=o2.customer_id
			and  o1.orderr_id<>o2.order_id
            and   o1.order_date< o2.order_date
GROUP BY customer_id;

/*from the following tables write a sql quyery those employees whose
 first name cantain letter z return first name,last name,department name,city and state province*/
 use assignment1;
 select e.first_name,e.last_name,d.department_name,l.city,l.state_province
 from employees e join departments d on e.department_id=d.department_id
 join locations l on l.location_id=l.location_id where first_name like "%z%";
select * from employees;

/* write a find the employees who earn < employee of id 182 return first_name,last_name,salary;..*/

select e.first_name,e.last_name,e.salary,e.employee_id
from employees e
join employees m
on e.salary < m.salary
 where m.employee_id = 182;


/* from the following tables,write a sql query to find out which employees have or do not have a depaetment.
return first_name,last_name,departmnt id,department_name...*/

select e.first_name,e.last_name,e.department_id,d.department_name
from employees e
left join departments d
on e.department_id=d.department_id;

select * from employees;

/* from the following table write a sql query to find all employees who join on or 
after first january 1993 and on or before 31 august 1997 return job_title, department_name,employee_name,joining_date of the job..*/

SELECT EMPLOYEES.FIRST_NAME,JOBS.JOB_TITLE,DEPARTMENTS.DEPARTMENT_NAME,JOB_HISTORY.START_DATE
FROM departments 
JOIN employees ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
JOIN JOB_HISTORY ON JOB_HISTORY.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
JOIN JOBS ON EMPLOYEES.JOB_ID = JOBS.JOB_ID
WHERE JOB_HISTORY.START_DATE >= '1993-01-01' AND JOB_HISTORY.START_DATE <='1997-08-31';


select * from departments;