
-- Mini Dashboard Queries

-- Total employees
select  count(employee_id) As total_employees from employees;

-- Total departments
select count(department_id) As total_departments from departments;

-- Total projects
select count(*) As total_project from projects;

-- Average salary
select avg(salary) As Average_salary from employees;

-- Highest salary
select max(salary) As Highest_salary from employees;

-- Lowest salary
select min(salary) As Lowest_salary from employees;

-- Department with highest salary expense
select 
d.department_id,
d.department_name,
sum(e.salary) As total_salary
from employees e
join departments d
on e.department_id = d.department_id
group by department_id 
order by total_salary desc
limit 1;

-- Most active employee
select
e.employee_id,
concat(e.first_name," ",e.last_name) As employee_name,
count(ep.project_id) As total_projects
from employees e 
join employee_project ep
on e.employee_id = ep.employee_id
group by e.employee_id , employee_name
order by total_projects desc
limit 1;

-- Employee with maximum project hours
select
e.employee_id,
concat(e.first_name," ",e.last_name) As employee_name,
sum(ep.hours_worked) As total_project_hours
from employees e 
join employee_project ep
on e.employee_id = ep.employee_id
group by e.employee_id , employee_name
order by total_project_hours desc
limit 1;

-- Project with highest budget
select 
project_id,
project_name,
budget
from projects
order by budget
desc
limit 1;