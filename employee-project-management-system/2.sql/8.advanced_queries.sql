-- Advanced Tasks

-- 1.	Find the second highest salary.
select salary from employees order by salary desc limit 1 offset 1;

-- 2.	Find the third highest salary.
select salary from employees order by salary desc limit 1 offset 2;

-- 3.	Highest paid employee in each department.
select e.employee_id , 
concat(e.first_name," ",e.last_name) as employee_name,
 e.salary ,
 e.department_id ,
 d.department_name
 from 
 employees e 
 join
 departments d 
 on
 e.department_id = d.department_id
 where 
 e.salary =(select max(e2.salary)
 from 
 employees e2 
 where e2.department_id = e.department_id
 );

-- 4.	Employee working on maximum projects.
 select
 e.employee_id,
 concat(e.first_name, " " , e.last_name) as employee_name,
 count(ep.project_id) as total_projects
 from employees e
 join employee_project ep 
 on e.employee_id = ep.employee_id
 group by 
 e.employee_id , 
 concat(e.first_name , " " , e.last_name) 
 having count(ep.project_id) =(select max(project_count) from (select count(*) as project_count from employee_project group by employee_id)as project_count);
 
 -- 5.	Project having maximum employees.
 select 
 p.project_id,
 p.project_name,
 count(ep.employee_id) as total_employees
 from projects p 
 join employee_project ep
 on p.project_id =  ep.project_id
 group by 
 p.project_id,
 p.project_name
 having count(ep.employee_id) = (select max(employee_count) from (select count(*) as employee_count from employee_project group by project_id ) as employee_count);
 
 -- 6.	Department spending maximum salary.
 select d.department_id,
 d.department_name,
 max(salary)
 from 
 departments d
 join employees e
 on e.department_id = d.department_id 
 group by d.department_id , d.department_name 
order by max(salary) desc limit 1;

-- 7.	Employees earning above department average.
 select e.employee_id ,
 concat(e.first_name , " " , e.last_name) as employee_name,
 e.salary,
 e.department_id
 from employees e 
 join 
 employees e2
 on 
 e.employee_id = e2.employee_id
 where e.salary > (select  avg(e2.salary) from employees e2 where e.department_id = e2.department_id
 );
 
 -- 8.	Employees who joined before their manager.
 select e.employee_id,
 concat(e.first_name , ' ' , e.last_name) as employee_name,
 e.hire_date
 from employees e
 where e.hire_date < (select e2.hire_date from employees e2  where e.manager_id = e2.employee_id);
 
 -- 9.	Calculate monthly payroll.
 select 
 month,
 sum(basic_salary) as total_basic_salary ,
 sum(bonus) as total_bonus,
 sum(deduction) as total_deduction,
 sum(net_salary) as  total_net_salary
 from payroll 
 group by month;
 
 -- 10.	Find inactive employees (no project).
 select e.employee_id,
 concat(e.first_name , " " , e.last_name) as employee_name
 from employees e 
 left join employee_project ep 
 on e.employee_id = ep.employee_id 
 where ep.project_id is null;
