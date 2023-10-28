use assignment1;
/* PAGE 1(12)..*/
/*Q1- Display all information in the tables EMP and DEPT. ---*/

     select * from departments;
     select *from employees;
  
/*Q2-----Display only the hire date and employee name for each employee. */
 
    select hire_date,first_name from employees;
   
/*Q3-----Display the ename concatenated with the job ID, separated by a comma and space, and
name the column Employee and Title */

    select first_name,job_id,concat(first_name,'   ',job_id)as employees_title from employees;
   
/*Q4---Display the hire date, name and department number for all clerks. */

     select first_name,department_id,hire_date from employees;
   
/*Q5---. Create a query to display all the data from the EMP table. Separate each column by a
comma. Name the column THE OUTPUT */

   select  employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id,
  concat(employee_id,'  ',first_name,'  ',last_name,'  ',email,'  ',phone_number,'  ' ,hire_date,'  ',job_id,'  ',salary,'  ',commission_pct,'  ',manager_id,'  ',department_id)as THE_OUTPUT from employees;
   
  
/*Q6---Display the names and salaries of all employees with a salary greater than 2000.*/

   select first_name,salary from employees where salary>2000;
   
/*Q7-- Display the names and dates of employees with the column headers "Name" and "Start
Date" -*/

   select first_name as 'NAME',hire_date as 'START DATE' from employees;   
   
/*Q8--- Display the names and hire dates of all employees in the order they were hired. */
   
    select first_name,hire_date from employees order by hire_date asc;
 
 /*Q9--- Display the names and salaries of all employees in reverse salary order. */
 
    select first_name,salary from employees order by salary desc;

 /*Q10--- Display 'ename" and "deptno" who are all earned commission and display salary in
reverse order. */
 
	select first_name,department_id,salary from employees where commission_pct is not null order by salary desc;
 
 /*Q11---Display the last name and job title of all employees who do not have a manager */

     select last_name,job_id from employees where manager_id is null;
     select * from  employees;
 
 /*Q12--- Display the last name, job, and salary for all employees whose job is sales representative
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
*/
 
      select last_name,job_id,salary from employees where job_id in ('sa_rep','st_clerk')and salary not in (2500,3500,5000); 
 
 
 
 /*PAGE 2...*/
 
/*Q1---Display the maximum, minimum and average salary and commission earned. */
      select * from employees;
      select max(salary),min(salary),avg(salary),max(commission_pct),min(commission_pct),avg(commission_pct) from employees;
 
 /*Q2---) Display the department number, total salary payout and total commission payout for
each department. */
     select department_id,salary, sum(salary)as total_salary ,sum(commission_pct)as abc
     FROM employees 
     GROUP by(department_id);
 
/*Q3--- Display the department number and number of employees in each department.. */ 

         select department_id,count(*)employee_id from employees group by(department_id);
 
 /*Q4---Display the department number and total salary of employees in each department.*/
 
         select department_id,sum(salary) from employees group by(department_id);
 
 /*Q5- Display the employee's name who doesn't earn a commission. Order the result set
without using the column name .--*/

	   select first_name,commission_pct from employees where commission_pct is null  order by rand();
 
 /*Q6- Display the employees name, department id and commission. If an Employee doesn't
earn the commission, then display as 'No commission'. Name the columns appropriately--*/


        select first_name,department_id,
        coalesce(commission_pct,'no commission') as commission from employees;

 
/*Q7--) Display the employee's name, salary and commission multiplied by 2. If an Employee
doesn't earn the commission, then display as 'No commission. Name the columns
appropriately
*/
      select
     first_name,salary,
     case 
	 when commission_pct>0 then commission_pct*2
     else 'nocommission'
     end as NO_COMMISSION
     from employees;

/*Q8--Display the employee's name, department id who have the first name same as another
employee in the same department*/

      SELECT first_name,department_id
      FROM employees 
      where (first_name,department_id)
      in(select first_name,department_id from employees
      group by department_id,first_name having count(*)>1);
      select * from employees;

 /*Q9--Display the sum of salaries of the employees working under each Manager. */
 
        select manager_id,
	    sum(salary) as total_salary
		from employees 
		group by(manager_id);
 
 /*Q10-- Select the Managers name, the count of employees working under and the department
ID of the manager...*/

        select manager_id as manager_name,count(employee_id) as count_employee,
	    department_id
        from employees
		group by (department_id);


/*Q11--) Select the employee name, department id, and the salary. Group the result with the
manager name and the employee last name should have second letter 'a!..*/

	select first_name,last_name,department_id,salary,
	manager_id as manager_name
	from employees
	where last_name like "_a%";

/*Q12--Display the average of sum of the salaries and group the result with the department id.
Order the result with the department id...*/

		select sum(salary) as total_salary,
		avg(salary) as avg_salary,
		department_id
		from employees group by(department_id) order by department_id desc;

/*Q13-- Select the maximum salary of each department along with the department id..*/

	select max(salary) as maximum_salary,job_id as department,department_id
	from employees
	group by(job_id);
 
/*Q14--Display the commission, if not null display 10% of salary, if null display a default value 1.*/
 
	select commission_pct,
	case 
	when commission_pct is not null then (salary*10)/100
	else
      "1"
	end as salary
	from employees; 
	select* from employees;
 
 /*PAGE 4(10)*/
/*Q1--. Write a query to display the last name, department number, department name for all
employees. */

	select e.last_name,e.department_id,d.department_name
	from  departments d join employees e 
	on e.department_id = d.department_id;
 
/* Q2--. Create a unique list of all jobs that are in department 40. Include the location of the
department in the output.
 select distinct(jobs) from departments where department_id=40 group by department_id;
 select * from locations;*/
 
 
/* Q3--. Write a query to display the employee last name,department name,location id and city of
all employees who earn commission...*/

	select e.last_name,e.commission_pct,d.department_name,l.location_id,l.city
	from employees e join departments d
	on e.department_id=d.department_id
	join locations l
	on l.location_id=d.location_id
	where commission_pct is not null;
 
select * from employees;
select * from departments;
select * from locations;
/* Q4---Display the employee last name and department name of all employees who have an 'a'
in their last name */

	select e.last_name,d.department_name
	from employees e join departments d
	on e.department_id=d.department_id
	where last_name like'%a%';

/*Q5--rite a query to display the last name,job,department number and department name for
all employees who work in ATLANTA. */

	select e.last_name,e.department_id,e.job_id,d.department_name
	from employees e join departments d 
	on e.department_id=d.department_id=(select location_id from locations  
	where city ='atlanta');
 

select * from locations;
/* Q6--Display the employee last name and employee number along with their manager's last
name and manager number.
SELECT e.employee_id as'Emp_Id', e.last_name as'Employee', 
m.manager_id as'Mgr_Id', m.last_name as 'Manager' 
FROM employees e 
join manager m
ON (e.employee_id = m.employee_id);
 */



/*Q7-- Display the employee last name and employee number along with their manager's last
name and manager number (including the employees who have no manager)..

SELECT e.employee_id as'Emp_Id', e.last_name as'Employee', 
m.manager_id as'Mgr_Id', m.last_name as 'Manager' 
FROM employees e 
join manager m
ON (e.employee_id = m.employee_id) where m.manager_id is not null;*/

select * from employees;

/*Q8. Create a query that displays employees last name,department number,and all the
employees who work in the same department as a given employee...*/

	select last_name,department_id 
	from employees  
	order by department_id desc;

/*Q9---Create a query that displays the name,job,department name,salary,grade for all
employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)..*/

	SELECT E.first_name, E.last_name, E.salary,E.job_id,d.department_name,
	case  
		when salary >= 50000  then 'A'
		when salary >= 30000 then 'B'
		when salary < 30000 then 'C'
     end as grade
     FROM employees E,departments d;


/* Q10--. Display the names and hire date for all employees who were hired before their
managers along withe their manager names and hire date. Label the columns as Employee
name, emp_hire_date,manager name,man_hire_date..

select e.first_name,e.last_name,e.hire_date as emp_hire_date,m.first_name as manager_name,m.hire_date as man_hire_date  
from employees e
join employees m
on e.employee_id=m.employee_id;
*/


/* PAGE 3(14)..*/

/*Q1--Wr-ite a query that displays the employee's last names only from the string's 2-5th
position with the first letter capitalized and all other letters lowercase, Give each column an
appropriate label. */

	select concat(upper(substring(last_name,1,1)),
				lower(substring(last_name,2,4))) as proper_name
	from employees
	ORDER BY employee_id asc;


/*Q2--Write a query that displays the employee's first name and last name along with a in
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
month on which the employee has joined...*/

	select first_name,last_name,concat(first_name,' - ',last_name) as emp_join from employees;

/*Q3--Write a query to display the employee's last name and if half of the salary is greater than
ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of
1500 each. Provide each column an appropriate label. */

	select last_name,salary, 
	case
	when salary > 10000 then salary+salary*10/100
	else
		salary+1500+salary*11.5/100
	end as total_salary
	from employees;

/*Q4--4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end,
department id, salary and the manager name all in Upper case, if the Manager name
consists of 'z' replace it with '$! ..*/

/*Q5--Write a query that displays the employee's last names with the first letter capitalized and
all other letters lowercase, and the length of the names, for all employees whose name
starts with J, A, or M. Give each column an appropriate label. Sort the results by the
employees' last names...*/


	select length(last_name),
	concat(UPPER(left(last_name,1)), 
	LOWER(right(last_name,length (last_name)-1)))AS lower_last
	from employees where last_name like 'j%' or last_name like 'a%' or last_name like 'm%'
	ORDER BY last_name asc;
 

/*Q6-- . Create a query to display the last name and salary for all employees. Format the salary to
be 15 characters long, left-padded with $. Label the column SALARY..*/

	select last_name,salary , lpad(salary,15,'$') as salary from employees;

/*Q7--Display the employee's name if it is a palindrome ..*/

	select first_name from employees where reverse(first_name);

/*Q8--. Display First names of all employees with initcaps..*/

	select concat(upper(left(first_name,1)),
	substring(first_name,2)) as initcap  from employees;

/*Q9-- From LOCATIONS table, extract the word between first and second space from the
STREET ADDRESS column...*/

	select * from locations;
	SELECT Replace(street_address, ' ', '') AS address
	FROM locations;

/*Q10--. Extract first letter from First Name column and append it with the Last Name. Also add
"@systechusa.com" at the end. Name the column as e-mail address. All characters should
be in lower case. Display this along with their First Name...*/

	select first_name, concat(lcase(substring(first_name,1,1)), 
	lower(last_name), '@systechusa.com' )as email from employees;


/*Q11-. Display the names and job titles of all employees with the same job as Trenna...*/

	select e.first_name,j.job_title from employees e join jobs j
	on e.job_id=j.job_id where e.job_id=(select job_id from employees where first_name='Trenna');


/*Q12--. Display the names and department name of all employees working in the same city as
Trenna...*/

		select e.first_name,d.department_name,l.city
		from employees e join departments d on e.department_id=d.department_id 
		join locations l on d.location_id=l.location_id
		where l.city= (select l.city from employees m 
		join departments dt on m.department_id=dt.department_id 
		join locations l on dt.location_id=l.location_id  where first_name = 'trenna');



/*Q13--13. Display the name of the employee whose salary is the lowest...*/

	SELECT *
	FROM Employees
	WHERE Salary = (SELECT MIN(Salary) FROM Employees);

	select first_name,min(salary) from employees;


/*Q14--Display the names of all employees except the lowest paid...*/

		select min(salary) as lowest_paid from employees;


/*PAGE 5(12)...*/

/* Q1-- Write a query to display the last name and hire date of any employee in the same
department as SALES. .*/


	SELECT e.last_name,e.hire_date
	FROM employees e
	WHERE e.department_id = (SELECT department_id
	FROM departments 
	WHERE department_name= 'sales');


/*Q2--2. Create a query to display the employee numbers and last names of all employees who
earn more than the average salary. Sort the results in ascending order of salary. ..*/

	select employee_id,last_name,salary from employees
	where salary > ( select avg(salary)from employees)
	order by salary asc;

/*Q3--  Write a query that displays the employee numbers and last names of all employees who
work in a department with any employee whose last name contains a' u  ..*/

	select e.employee_id,e.last_name
	from employees e
	where department_id in( select department_id from employees e2 where e.last_name like '%u%');

/*Q4--Display the last name, department number, and job ID of all employees whose
department location is ATLANTA...*/

	select e.last_name,e.department_id,e.job_id from employees e
	where department_id =
	(select department_id from departments
	where location_id=
	(select location_id from locations where city = 'Southlake'));

select * from departments;

/*Q5--. Display the last name and salary of every employee who reports to FILLMORE...

select last_name, salary
	from employees
	where manager_id = (select employee_id
			    from employees
			    where last_name = 'fillmore');..*/
select * from departments;
/*Q6--Display the department number, last name, and job ID for every employee in the
OPERATIONS department...*/
	SELECT*FROM employees;
	select e.department_id,e.last_name,e.job_id from employees e
	where e.department_id = (select department_id from departments  where department_name = 'operations');


/*Q7. Modify the above query to display the employee numbers, last names, and salaries of all
employees who earn more than the average salary and who work in a department with any
employee with a 'u'in their name...*/

	select employee_id,last_name,salary from employees
	where department_id in (select department_id from departments where last_name like '%u%')
	and salary >(select avg(salary) from employees);


/*Q8 . Display the names of all employees whose job title is the same as anyone in the sales
deptartments...*/
	select * from jobs;
	select e.first_name,j.job_title from employees e
	join jobs j on e.job_id = j.job_id
	where e.department_id  = (select department_id from departments where department_name ='sales');

/*Q10  Write a query to display the top three earners in the EMPLOYEES table. Display their last
names and salaries. ..*/

	select last_name,salary from employees order by salary desc limit 3;

/*Q11--Display the names of all employees with their salary and commission earned. Employees
with a null commission should have O in the commission column..*/

	select first_name,salary,
	case 
	when commission_pct is not null then commission_pct
	else 0
	end as commission from employees;

/*Q12 Display the Managers (name) with top three salaries along with their salaries and
department information..

select concat(first_name,'  ',last_name)as manager_name,department_id from employees order by salary limit 3;

*/


/*DATE FUNCTIONS..*/

/*Q1... Find the date difference between the hire date and resignation_date for all the
employees. Display in no. of days, months and year(1 year 3 months 5 days).
Emp_ID Hire Date Resignation_Date...*/

	select e.employee_id,j.start_date,j.end_date,
	concat( 
         datediff(j.end_date,j.start_date) div 365,' years ',
         (datediff(j.end_date,j.start_date) mod 365) div 30,' months  ',
         (datediff(j.end_date,j.start_date) mod 365) mod 30,' days '
         )
         as datedifference
         from employees e
         join job_history j on e.hire_date=j.start_date;

/*Q2--Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mm dd,
yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900)..*/

		select date_format(start_date,'%m/%d/%Y') as hire_date,
		ifnull(date_format(end_date,'%b %D, %Y'),'DEC, 01th 1900') as resignation_date from job_history;

select * from job_history;

/*Q3--Calcuate experience of the employee till date in Years and months(example 1 year and 3
months)
Use Getdate() as input date for the below three questions...*/

	select concat(datediff(end_date,start_date)div 365,' year  ',
	(datediff(end_date,start_date)mod 365)div 30,' month')as experience
	from job_history;

/*Q4--Display the count of days in the previous quarter..*/

SELECT  
    DATEDIFF(
        MAKEDATE(YEAR(CURDATE()), 2) + INTERVAL QUARTER(CURDATE()) QUARTER - INTERVAL 1 DAY, 
        MAKEDATE(YEAR(CURDATE()), 1) + INTERVAL QUARTER(CURDATE()) QUARTER - INTERVAL 1 QUARTER
    )as pr_q;

/*5--) Fetch the previous Quarter's second week's first day's date .*/
select date_add(
 date_add(makedate(year(curdate()),1),
         interval (quarter(curdate())-2) quarter),
         interval 7 day
         ) as pre_quaterseco_week_first_days;
         
/*Q6-- Fetch the financial year's 15th week's dates (Format: Mon DD YYYY) ..*/
         
         select date_format(date_add(makedate(year(curdate()),1),
         interval 15 week),
         '%m-%d-%Y') AS 15th_week_date;
         


