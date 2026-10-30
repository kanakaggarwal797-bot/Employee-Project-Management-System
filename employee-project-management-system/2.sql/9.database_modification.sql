-- Database Modification

 -- 1	Add a column.
 alter table employees add column city varchar(50);
 
 -- 2   Rename a column
 alter table employees rename column city to location;
 
 -- 3	Modify a data type-- 
 alter table employees modify location varchar(100);
 
 -- 4	Add a CHECK constraint.
 alter table employees
 add constraint location 
 check (location in ("Delhi","Mumbai","Jaipur","Noida"));
 
-- 5	Add a UNIQUE constraint.
alter table employees
add constraint location
unique(location);

-- •	Drop a constraint.
 alter table employees
 drop index location;

-- •  Drop a column.
alter table employees drop column location;
