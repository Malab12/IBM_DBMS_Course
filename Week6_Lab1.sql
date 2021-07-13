--Exercise 1: Create a VIEW

create view EMPSALARY as
select emp_id, f_name, l_name, b_date, sex, salary
from employees;

select * from EMPSALARY;

--Exercise 2: Update a VIEW

create or replace view EMPSALARY as
select emp_id, f_name, l_name, b_date, sex, job_title, min_salary, max_salary
from employees, jobs
where job_id = job_ident;

select * from EMPSALARY;

--Exercise 3: Drop a view

drop view EMPSALARY;

select * from EMPSALARY;