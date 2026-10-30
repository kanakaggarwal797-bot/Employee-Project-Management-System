-- Basic Queries

-- task 1 Show all employees.
select * from employees;

-- task 2 Display employee names only
select concat(first_name," ",last_name) from employees;

-- task 3 Find employees earning more than ₹50,000.
select * from employees where salary > 50000;

-- task 4 Find employees hired after 2023
select * from employees where year(hire_date) > 2023;

-- task 5 Display employees from HR department.
select e.* ,d.department_name from employees e inner join departments d on e.department_id = d.department_id where d.department_name = "Hr";
              -- OR 
select * from departments where department_name = "HR";
select * from employees where department_id = 101;

-- TASK 6 Sort salary descending
SELECT * from employees order by salary desc;

-- task 7 Show top 5 highest salaries.
SELECT * from employees order by salary desc limit 5;

-- task 8 Find employees whose first name starts with A.
select * from employees where first_name like "A%";

--  task 9 Find employees whose email ends with gmail.com.
select * from employees where email like "%gmail.com";

-- task 10 Count total employees.
select count(*) as total_employees from employees;
