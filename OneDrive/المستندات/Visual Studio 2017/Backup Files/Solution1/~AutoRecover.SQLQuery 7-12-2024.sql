--- Explore
-- 1- Database Diagram
-- 2- Data
USE Company_SD
Select * From Employee
Select * From Departments
Select * From Project
Select * From Works_for

-- Add 2 Departments >> Dp4 40 223344 +++ Dp5 50 223344
Insert Into Departments (Dnum, Dname, MGRSSN)
Values (40,'Dp4',223344),(50,'DP5',223344)
-- Edit employees >> SEX >> M: Male , F:Female
Update Employee
Set Sex = 'Female'
where Sex = 'F'

Update Employee
Set Sex = 'Male'
where Sex = 'M'

--- DQL >>> SELECT
Select * From Employee
Select * From Employee
where SEX = 'Male' and Salary >=2000

Select * 
From Employee 
Where Dno = 10 or Dno = 20 or Dno = 30

Select *
From Employee
where Dno IN (10,20,30) and SEX = 'Female'

Select *
From Employee
Where Salary >=1000 and Salary <=2000

Select *
FRom Employee
where Salary between 1000 and 2000

Select *
FRom Employee
where Dno IS Null

Select *
FRom Employee
where Dno IS NOT Null

--- LIKE -- %>> Zero or more characters
Select *
From Employee
Where Fname LIKE 'a%'

Select *
From Employee
Where Fname like '%d'

Select *
From Employee
Where Address Like '%Cairo%' and Superssn = 223344

--- % >> Zero or more
--- _ >> ONE Character
Select *
FRom Employee
where Fname Like '_a%'

Select *
FRom Employee
where Fname Like '__m%'

Select SSN, Fname , Lname, Salary
From Employee

Select SSN AS 'Emp id', Fname , Lname
From Employee

--- Concatenation >> + ,Concat
Select SSN , Fname +' '+ Lname AS Full_Name
From Employee

Select SSN , Concat(Fname, ' ', Lname) Full_Name
From Employee

Select SSN, Concat(Fname, ' ' , Lname) FullName, (0.2*Salary) TAX
From Employee

-- Aggregate Functions / Grouping Functions
--- Sum - AVG - MAX - MIN - Count

Select * From Employee

Select Avg(Salary) Avg_Salary
From Employee

Select Sum(Salary) Total_Salary, Max(Salary) Max_Salary,
	   Min(Salary) Min_salary, AVG(Salary) AVG_salary,
	   Count(SSN) '#Emps'
From Employee

Select Count(*)
From Employee

Select Dno From Employee

Select * FRom Employee

Select Count(Sex) From Employee

-- Distinct 

Select Distinct Sex From Employee

Select Count(distinct Dno) From Employee

-- Count(Column name) >>> without null + duplicates
-- Count( Distinct Column name) >>> without null + Without duplicates
-- Count(*) >>> With null + with duplicates

Select * From Works_for

-- Total Hours, Average Hours, Max/Min Hours
-- #Projects >> PNO
-- #Essn (Number of employees)


-- Total Salary by Dno

-- Average salary by Dno

-- #Employees by DNO

Select Dno, Sum(Salary) Total, AVG(Salary) Average , Count(Salary) '#Emp'
From Employee
Where DNO IS NOT NULL
Group by DNO

-- #employees by Gender
Select Sex , Count(ssn) '#Emp'
From Employee
Group by SEX

-- #Employees by Dno and Gender

Select Dno,SEX, Sum(Salary) Total, AVG(Salary) Average , Count(Salary) '#Emp'
From Employee
Where DNO IS NOT NULL
Group by DNO,Sex
Order by Dno DESC

Select Dno,SEX, Sum(Salary) Total, AVG(Salary) Average , Count(Salary) '#Emp'
From Employee
Where DNO IS NOT NULL
Group by DNO,Sex
Order by 5 DESC

Select Dno,SEX, Sum(Salary) Total, AVG(Salary) Average , Count(Salary) '#Emp'
From Employee
Where DNO IS NOT NULL
Group by DNO,Sex
Order by Dno, sum(Salary) DESC

-- Order by >> Column name , Position, Alias name

--- Simple Project
Create Database Project_NTI1

USE Project_NTI1
Select * From Emp

--- Questions
-- #Emps , Avg Salary, Total Salary, #deps
-- Total Salary by Dep
-- #Emps by Dep
-- #Emps by Gender
Select Coalesce(Gender,'Total'), Count(id) 'Emps'
From Emp
Group by Rollup(Gender)



Select Coalesce(Department,'Grand Total') Department, Count(ID) '#Emps'
From Emp
Group by Rollup(Department)

Select Coalesce(Department,'Grand Total') Department, Count(ID) '#Emps'
From Emp
Group by Cube(Department)
-- #Emps by Dep & Gender
Select Department, Gender, Count(id) 'Total'
FRom Emp
Group by Rollup( Department, Gender)
--Order by Department

Select Department, Gender, Count(id) 'Total'
FRom Emp
Group by Cube(Gender,Department)

Select Department , Sum(Salary) Total
From Emp
Group by Department
Having Sum(Salary) >20000
--- Rollup - Cube >> Grand total

--- Avg salary by Dep and avg salary >=6000\

-- inner joins
select Dnum,Dname, MGRSSN ,Fname 
from Departments D INNER JOIN Employee e on d.MGRSSN = e.SSN
-- inner joins  
-- display the name of  departments and the name of the project inder its control
select Dname,Pnumber from Departments d inner join  Project p on  d.Dnum =  p.Dnum
--display the full data about all the dependence associated with the name of the employee the depend on him/ her
select fname , lname ,*from Employee e inner join Dependent d on e.SSN = d.ESSN
-- display the id , name and location of the projects in cairo or Alex 
select p.Pnumber,p.Pname,p.Plocation
from Project p
where p.City in ('cairo','Alex')

--display the projects full data of the projects with a name starts eith"a"letter
select p.Pname
from Project p
where pname like 'a%'
--5.display All Employee data and the data of their dependents 
-- even if they have no dependents
select *
from Employee e left  join Dependent d on e.SSN =d.ESSN

--6.display all the employee in departments 10 
--who works more than or equal 10 per week in "el rabwa "project 
select e.*
from Employee e inner join Works_for w
on e.SSN =w.ESSn
inner join Project p
on w.Pno =p.Pnumber
where Dno=10 and Hours>=10 and Pname ='Al Rabwah'
-- find the name of the employee 
-- who directly 