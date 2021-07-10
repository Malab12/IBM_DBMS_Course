--Question 1
SELECT *
FROM Employees
WHERE ADDRESS LIKE '%Elgin,IL%';

--Question 2
SELECT F_NAME, L_NAME, B_DATE
FROM Employees
WHERE B_DATE LIKE '197%';

--Question 3
select * 
from employees
where dep_id = 5
and salary between 60000 and 70000;

--Exercise 2: Sorting

--Question 1
select f_name, l_name, dep_id
from employees
order by dep_id;

--Question 2
select f_name, l_name, dep_id
from employees
order by dep_id desc, l_name desc;

--Question 3
select f_name, l_name, dep_name
from employees, departments
where dep_id = dept_id_dep
order by dep_name desc, l_name desc;

--Exercise 3: Grouping

--Question 1
select dep_id, count(emp_id) as no_emp
from employees
group by dep_id;

--Question 2
select dep_id, count(emp_id) as no_emp, avg(salary) as avg_sal
from employees
group by dep_id;

--Question 4
select dep_id, count(emp_id) as no_emp, avg(salary) as avg_sal
from employees
group by dep_id
order by avg_sal;

--Question 5
select dep_id, count(emp_id) as no_emp, avg(salary) as avg_sal
from employees
group by dep_id
having count(emp_id) < 4
order by avg_sal;