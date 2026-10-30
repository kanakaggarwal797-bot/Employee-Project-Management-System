-- GROUP BY & HAVING

-- 1.	Department-wise salary.
select d.department_name , sum(e.salary) as total_salary from employees e inner join departments d on d.department_id = e.department_id group by d.department_name;

-- 2.	Department-wise average salary.
select d.department_name , avg(e.salary) asaverage_salary from employees e inner join departments d on d.department_id = e.department_id group by d.department_name;

-- 3.	Count employees in each department.
select d.department_name , count(e.employee_id) as no_of_employees from employees e right join departments d on d.department_id = e.department_id group by d.department_name;

-- 4.	Project-wise hours.
select p.project_name , sum(ep.hours_worked) as total_working_hours from projects p left join employee_project ep on ep.project_id = p.project_id group by p.project_name;

-- 5.	Employees working on more than one project.
select e.employee_id , concat(e.first_name," ",e.last_name) as employee_name  , count(ep.project_id) as no_of_projects from employees e inner join employee_project ep on e.employee_id = ep.employee_id group by e.employee_id,concat(e.first_name," ",e.last_name) having count(ep.project_id) > 1;

-- 6.	Departments where average salary exceeds ₹60,000.
select d.department_name , avg(e.salary) as average_salary from employees e inner join departments d on d.department_id = e.department_id group by d.department_name having avg(salary) > 60000;

-- 7.	Projects with more than 200 working hours.
select p.project_id , p.project_name , sum(ep.hours_worked) as total_working_hours from projects p inner join employee_project ep on ep.project_id = p.project_id group by p.project_id having sum(ep.hours_worked) >200;

-- 8.	Clients with more than two projects.
select c.client_id , c.client_name , count(pc.project_id) as total_projects from clients c inner join project_client pc on pc.client_id = c.client_id group by c.client_id,c.client_name having count(pc.project_id)>2;
