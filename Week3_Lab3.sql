--Exercise: Sub-queries and Nested SELECTs
--Note: the questions asking to write improper queries have not been attempted

--Question 2
select *
from employees
where salary < (select avg(salary) from employees);

--Question 4
select emp_id, salary, (select max(salary) from employees) as max_salary
from employees;

--Question 5
select *
from (select emp_id, f_name, l_name, dep_id from employees);