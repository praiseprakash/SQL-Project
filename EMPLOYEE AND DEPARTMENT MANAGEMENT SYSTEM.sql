create database Sql_project;
use Sql_project;

CREATE TABLE Departments (
department_id INT PRIMARY KEY,
department_name VARCHAR(50) NOT NULL
);


CREATE TABLE Employees (
emp_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
age INT,
department_id INT,
FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Departments VALUES
(101,'IT'),
(102,'Human Resources'),
(103,'Finance'),
(104,'Marketing');


INSERT INTO Employees VALUES
(1,'Rahul',28,101),
(2,'Anita',32,102),
(3,'John',26,101),
(4,'Meera',30,103),
(5,'David',35,102),
(6,'Sara',29,104);

select * from Departments;
select * from Employees;

-- SQL QUERIES

-- show all employees and departments


select * from Departments;
select * from Employees;


-- 2.show name of employee

select name from Employees;

-- 3.employee older than 30
select name,age from Employees where age>30;


-- 4 employee btw age 25 and 30
select name,age from Employees where age between 25 and 30;

-- 5 employee from department id
select * from Employees where department_id=101;


-- 6 sort employee by age
select * from Employees order by age;

-- 7 descending order sort
select * from Employees order by emp_id desc;

-- 8 count function
select count(*) from Employees;
select count(age) from Employees;


-- 9 distinct values on employees 
select distinct(age) from Employees;

-- 10 average 
select avg(age) from Employees;

-- 11 max
select max(age) from Employees;

-- 12 min
select min(age) from Employees;


-- 13 join show employee with department name

select e.name,d.department_name 
from Employees  e join Departments d 
on e.department_id= d.department_id; 

-- 14 show employee age,name and department

select e.name,e.age,d.department_name from 
Employees  e join Departments d
on e.department_id=d.department_id;

-- 15 show employee in human resources
select e.name from 
Employees  e join Departments d
on e.department_id=d.department_id
where d.department_name="Human Resources";

-- 16 show employee in it departments;
select e.name from 
Employees  e join Departments d
on e.department_id=d.department_id
where d.department_name="IT";

-- 17 Count employees in each department
select department_id,count(*) as total from Employees group by department_id;

-- 18 average age by department

select department_id,round(avg(age)) from Employees group by department_id;

-- 19 Departments with more than one employee

select department_id,count(*) from Employees group by department_id
having count(*) >1;

-- 20 Employee with maximum age
 Select name
from Employees
where age = (select max(age) from Employees);


-- 21 Employees older than average age

select name
from Employees
where age > (select avg(age) from Employees);

-- 22 Employees in same department as Rahul
select name
from Employees
where department_id =
(
select department_id
from Employees
where name = 'Rahul'
);






