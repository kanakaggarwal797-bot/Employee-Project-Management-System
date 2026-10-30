--  Views

-- 1  Employee Summary View

create view  employee_summary  As 
select 
e.employee_id,
concat(e.first_name," ",e.last_name) As employee_name,
e.Email,
e.salary,
e.hire_date,
d.department_name,
concat(m.first_name," ",m.last_name) As manager_name
from employees e
left join departments d
on e.department_id = d.department_id
left join employees m
on e.employee_id = m.employee_id;

-- 2 Payroll View

create view payroll_view As
select 
p.payroll_id,
e.employee_id,
concat(e.first_name," ",e.last_name) As employee_name,
p.month,
p.basic_salary,
p.bonus,
p.deduction,
p.net_salary,
d.department_name
from payroll p 
join employees e
on p.employee_id = e.employee_id
join departments d
on e.department_id = d.department_id;

-- 3 Department Salary View

create view department_salary As
select
d.department_id,
d.department_name,
count(e.employee_id) As employee_count,
sum(e.salary) As total_salary,
avg(e.salary) As average_salary,
min(e.salary) As minimun_salary,
max(e.salary) As maximum_salary
from departments d 
left join employees e
on d.department_id = e.department_id
group by  
d.department_id,
d.department_name;