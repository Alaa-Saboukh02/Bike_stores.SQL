create database company 
use company
create table EMP(
EMP_ID int primary key,
LAST_Name varchar(25)  not null,
First_Name varchar(25) not null,
Address varchar(250),
DEP_ID varchar(5) ,
FOREIGN KEY (DEP_ID) REFERENCES Department(DEP_ID)
)

 create table department(
 DEP_ID varchar (5) primary key ,
 DEP_Name varchar (25) unique , )

 ALTER TABLE department
ADD Location varchar (50) not null
ALTER TABLE EMP
DROP COLUMN Address
ALTER TABLE EMP
ALTER COLUMN First_Name VARCHAR(50)
ALTER TABLE EMP
ADD Address VARCHAR(250)

-- insert
INSERT INTO EMP (EMP_ID, LAST_NAME, FIRST_NAME, Address, DEP_ID)
VALUES
(1, 'Ahmed', 'Mohamed', 'Alex', 'D1'),
(2, 'Ali', 'Essam', 'Aswan', 'D1'),
(3, 'Eman', 'Ahmed', 'Cairo', 'D2'),
(4, 'Esraa', 'Kamel', 'Giza', 'D3'),
(5, 'Bahaa', 'Mohamed', NULL, 'D1'),  
(6, 'Salma', 'Ahmed', NULL, 'D2');
ALTER TABLE Department
ALTER COLUMN Location VARCHAR(50) NULL;


SELECT * FROM Department
INSERT INTO Department (DEP_ID, DEP_Name)
VALUES ('D1', 'Department 1'),
       ('D2', 'Department 2'),
       ('D3', 'Department 3');
	   select *from EMP
INSERT INTO Department (DEP_ID, Dep_NAME, Location)
VALUES

('D2', 'QA', 'Alex'),
('D3', 'QC', 'Alex'),
('D4', 'HR', 'Alex')
UPDATE Department
SET Dep_NAME = 'IT', Location = 'Alex'
WHERE DEP_ID = 'D1';

UPDATE Department
SET Dep_NAME = 'QA', Location = 'Alex'
WHERE DEP_ID = 'D2';

UPDATE Department
SET Dep_NAME = 'QC', Location = 'Alex'
WHERE DEP_ID = 'D3';

UPDATE Department
SET Dep_NAME = 'HR', Location = 'Alex'
WHERE DEP_ID = 'D4'

select * from department
UPDATE Department
SET Dep_NAME = 'PR'
WHERE Dep_NAME = 'QC'
DELETE FROM Department
WHERE DEP_ID = 'D4';
SELECT * FROM EMP
UPDATE EMP
SET Address = 'Cairo'
WHERE Address IS NULL;



