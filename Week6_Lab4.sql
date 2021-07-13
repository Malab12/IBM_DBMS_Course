--Question 1
select f_name, l_name, start_date
from employees inner join job_history
on emp_id = empl_id
where dept_id = 5;

--Question 2
select f_name, l_name, start_date, job_title
from employees as e inner join job_history as jh
on e.emp_id = jh.empl_id
inner join jobs as j
on e.job_id = j.job_ident
where e.dep_id = '5';

--Question 3
select emp_id, dep_id, dep_name
from employees left outer join departments
on dep_id = dept_id_dep;

--Question 4
select emp_id, dep_id, dep_name
from employees left outer join departments
on dep_id = dept_id_dep
where year(b_date) < 1980;

--Question 5
select emp_id, dep_id, dep_name
from employees left outer join departments
on dep_id = dept_id_dep
and year(b_date) < 1980;

--Question 6
select f_name, l_name, dep_name
from employees full outer join departments
on dep_id = dept_id_dep;

--Question 7
select f_name, l_name, dept_id_dep, dep_name
from employees full outer join departments
on dep_id = dept_id_dep and sex = 'M';