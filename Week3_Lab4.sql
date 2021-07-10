--Exercise 1: Accessing multiple tables using subqueries

--Question 1
select *
from employees
where job_id in (select job_ident from jobs);

--Question 2
select *
from employees
where job_id in (select job_ident from jobs where job_title = 'Jr. Designer');

--Question 3
select job_title, min_salary, max_salary, job_ident
from jobs
where job_ident in (select job_id from employees where salary > 70000);

--Question 4
select job_title, min_salary, max_salary, job_ident
from jobs
where job_ident in (select job_id from employees where year(b_date) > 1976);

--Question 5
select job_title, min_salary, max_salary, job_ident
from jobs
where job_ident in (select job_id from employees where year(b_date) > 1976 and sex = 'F');

--Exercise 2: Accessing multiple tables with implicit joins

--Question 1
select *
from employees, jobs;

--Question 2
select *
from employees, jobs
where job_id = job_ident;

--Question 3
select *
from employees E, jobs J
where E.job_id = J.job_ident;

--Question 4
select emp_id, f_name, l_name, job_title
from employees, jobs
where job_id = job_ident;

--Question 5
select E.emp_id, E.f_name, E.l_name, J.job_title
from employees E, jobs J
where E.job_id = J.job_ident;
