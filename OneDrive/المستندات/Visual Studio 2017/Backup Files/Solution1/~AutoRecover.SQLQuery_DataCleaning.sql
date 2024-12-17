use ntig3
-- Create the employees table
CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
	employee_name VARCHAR(50),
	salary DECIMAL(10, 2),
	hire_date VARCHAR(20),
	department VARCHAR(50)
);
-- Insert 20 sample records 
INSERT INTO employees (employee_id, employee_name, salary, hire_date, department) VALUES
(1, 'Amy West', 60000.00, '2021-01-15', 'HR'),
(2, 'Ivy Lee', 75000.50, '2020-05-22', 'Sales'),
(3, 'joe smith', 80000.75, '2019-08-10', 'Marketing'), 
(4, 'John White', 90000.00, '2020-11-05', 'Finance'),
(5, 'Jane Hill', 55000.25, '2022-02-28', 'IT'),
(6, 'Dave West', 72000.00, '2020-03-12', 'Marketing'),
(7, 'Fanny Lee', 85000.50, '2018-06-25', 'Sales'),
(8, 'Amy Smith', 95000.25, '2019-11-30', 'Finance'),
(9, 'Ivy Hill', 62000.75, '2021-07-18', 'IT'),
(10, 'Joe White', 78000.00, '2022-04-05', 'Marketing'),
(11, 'John Lee', 68000.50, '2018-12-10', 'HR'),
(12, 'Jane West', 89000.25, '2017-09-15', 'Sales'),
(13, 'Dave Smith', 60000.75, '2022-01-08', NULL),
(14, 'Fanny White', 72000.00, '2019-04-22', 'IT'),
(15, 'Amy Hill', 84000.50, '2020-08-17', 'Marketing'),
(16, 'Ivy West', 92000.25, '2021-02-03', 'Finance'),
(17, 'Joe Lee', 58000.75, '2018-05-28', 'IT'),
(18, 'John Smith', 77000.00, '2019-10-10', 'HR'),
(19, 'Jane Hill', 81000.50, '2022-03-15', 'Sales'),
(20, 'Dave White', 70000.25, '2017-12-20', 'Marketing');

Select * From employees

-- 1. Missing Values
-- You can use the COALESCE() function to use the  Unknown  string for the NULL value
select * from employees
where employee_id is null or employee_name is null or salary is null or hire_date is null or department is null
update employees
set department='HR'
where employee_id=13

-- 2. Duplicate Records 
-- Detect Duplicate Data
select employee_id ,count(employee_id)
from employees
group by employee_id
having 2>1

select employee_name ,count(employee_name)
from employees
group by employee_name
having count(employee_name)>1

-- 3. Data Type Conversion
alter table employees alter column hire_date date
--date& time function--
select GETDATE()
Alter table employees add nOM_of_exp INT
select* from employees
alter table employees add today date
update employees
set today = GETDATE()
select month(hire_date) month_num, day(hire_date) day_num, YEAR(hire_date) year_num
from employees
select DATEPART(QUARTER,hire_date),DATEPART(WEEK,hire_date),DATEPART(WEEKDAY,hire_date)
from employees
select DATEDIFF(YEAR,hire_date,GETDATE())
from employees

update employees
set nOM_of_exp = DATEDIFF(YEAR,hire_date,GETDATE())
SELECT* FROM employees
ALTER TABLE employees drop  column no_of_exp 
ALTER TABLE employees drop  column num_of_exp 

--alter column TAx
ALTER TABLE Employees add TAX int
update employees
set TAX = salary *0.1
select* from employees

-- 4. Outliers
--Outliers in one or more numeric fields can skew analysis. So we should check for 
--and remove outliers so as to filter out the data that is not relevant. 
select * from employees
where salary>3000000

-- 5. Inconsistent Data Entry 
--Inconsistent data entries and formatting are quite common 
--especially in date and string columns.
-- EX: Fix the Capitalization of Values
--uper- lower-trim- left -
select UPPER(department),LOWER(department),trim(department)
from employees
select LEFT(30204058800685,2), right(30204058800685,4),substring('30204058800685',2,6),len(30204058800685)

-- 7. Deriving New Columns
-- ex: years_of_service

