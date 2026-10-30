create table departments(
department_id int primary key , 
department_name varchar(100) not null  unique,
location varchar(100) not null
);

create table employees(
employee_id int primary key auto_increment ,
first_name varchar(50) not null , 
last_name varchar(50) not null,
Email varchar(100) unique,
phone varchar(15) unique ,
salary decimal(10,2) check (salary>0),
hire_date date not null,
department_id int,
foreign key(department_id) 
references departments(department_id),
manager_id int ,
foreign key(manager_id)
references employees(employee_id)
);

create table projects(
project_id int primary key,
project_name varchar(100) unique,
start_date date,
end_date date,
budget decimal(12,2) check(budget>0)
);

create table employee_project(
employee_id int,
project_id int,
role varchar(100),
hours_worked int check(hours_worked >0),
foreign key(employee_id)
references employees(employee_id),
foreign key(project_id)
references projects(project_id)
);

create table clients(
client_id int primary key,
client_name varchar(100),
city varchar(100),
country varchar(100),
contact_person varchar(100)
);

create table project_client(
project_id int,
client_id int,
foreign key(project_id)
references projects(project_id), 
foreign key(client_id)
references clients(client_id)
);

create table attendance(
attendance_id int primary key,
employee_id int,
attendance_date date,
status varchar(100) check(status in ('Present','Absent','WFH','Leave')),
foreign key(employee_id)
references employees(employee_id)
);

create table Payroll(
payroll_id int primary key,
employee_id int,
month varchar(20),
basic_salary decimal(10,2),
bonus decimal(10,2),
deduction decimal(10,2),
net_salary decimal(10,2),
foreign key(employee_id)
references employees(employee_id)
);
