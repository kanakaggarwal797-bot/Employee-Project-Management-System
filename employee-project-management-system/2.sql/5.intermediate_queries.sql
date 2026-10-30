--  Intermediate Queries

-- 1.	Highest salary.
select max(salary) from employees;

-- 2.	Lowest salary.
select min(salary) from employees;

-- 3.	Average salary.
select avg(salary) from employees;

-- 4.	Total payroll.
select sum(net_salary) from payroll;

-- 5.	Department-wise employee count.
select department_id , count(employee_id) from employees  group by department_id;

-- 6.	Employees hired this year.
select * from employees where year(hire_date) = 2026;

-- 7.	Projects costing more than ₹10 lakh.
select * from projects  where budget > 1000000;

-- 8.	Employees without department.
select * from employees where department_id is null;

-- 9.	Employees without manager.
select * from employees where manager_id is null;

-- 10.	Departments with more than 3 employees.
select department_id , count(employee_id) from employees group by department_id having count(employee_id) > 3;
