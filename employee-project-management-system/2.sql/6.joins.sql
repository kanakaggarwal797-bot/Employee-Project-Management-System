-- JOIN Tasks

-- 1.	Employee + Department
select e.* , d.department_name from employees e inner join departments d on e.department_id = d.department_id;

-- 2.	Employee + Project
select e.* , p.* from employees e inner join employee_project ep on e.employee_id = ep.employee_id inner join projects p on ep.project_id = p.project_id;

-- 3.	Employee + Manager
select concat(e.first_name ," ",e.last_name) as employee_name , concat(m.first_name ," ", m.last_name)as manager_name from employees e left join employees m on e.manager_id = m.employee_id ; 

-- 4.	Employee + Payroll
select e.employee_id , concat(e.first_name , ' ' ,last_name) as employee_name , p.payroll_id , p.month , p.basic_salary , p.bonus , p.deduction , p.net_salary from employees e left join payroll p on e.employee_id = p.employee_id;

-- 5.	Employee + Attendance
select e.employee_id , concat(e.first_name , ' ' ,last_name) as employee_name , a.attendance_id , a.attendance_date , a.status from employees e left join attendance a on e.employee_id = a.employee_id; 

-- 6.	Project + Client
select p.project_id , p.project_name , c.client_id , c.client_name from projects p left join project_client pc on p.project_id = pc.project_id left join clients  c on pc.client_id = c.client_id;

-- 7.	Department + Employee
select e.* , d.department_name from departments d right join employees e on d.department_id = e.department_id union select e.* , d.department_name from departments d left join employees e on d.department_id = e.department_id;

-- 8.	Employees with no project
select e.employee_id , concat(e.first_name ," ", e.last_name) as employee_name from employees e left join employee_project ep on e.employee_id = ep.employee_id where ep.employee_id is null;

-- 9.	Projects with no employees
select p.project_id , p.project_name from projects p left join employee_project ep on p.project_id = ep.project_id where ep.employee_id is null ;

-- 10.	Clients having multiple projects
select c.client_id  , c.client_name , count(pc.project_id) as total_projects from clients c left join project_client pc on pc.client_id = c.client_id group by c.client_id,c.client_name having count(pc.project_id) >1; 
