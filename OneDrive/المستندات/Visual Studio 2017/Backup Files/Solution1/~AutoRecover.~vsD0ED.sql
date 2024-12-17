--Explore
--DatabaseDigram
--Data
use Company_SD
select* from Employee
select* from Departments
select* from Project
insert into Departments(Dname,Dnum,mgrssn)
 values('DP4',40,223344),('Dp5',50,223344)
 

 --DQL
select*from employee
where Sex ='M'and Salary >=2000
select * from employee
where Dno=10 or Dno=20 or Dno=30
select * from employee
where Dno in (10,20,30)
select * from employee
where salary >=1000 or salary <=2000
select * from employee
where dno is null
select * from employee
where dno is not null


--like
select * from employee
where Fname like 'a%'
select * from employee
where fname like '%d'
select * from employee
where Address like '%cairo%' and superssn =223344

-- % zero or more ch
--_>> one char

select * from employee
where fname like '_a%'
select * from employee
where fname like '__m%'
select ssn ,fname ,lname 
from employee

select ssn as EMP_ID
from employee
--???? ???? ???????
select ssn ,fname ,0.1*salary AS Tax
from employee
--grouping function 
--sum,average, 
select avg(salary)  Avg_salary
from  employee
select avg(salary)  Avg_salary , sum(salary) total_salary , max(salary) max_salary, min(salary) min_salary,count(salary)'#EMPS'
from  employee
select count(Dno)
from employee
select count(sex) from employee

--distinct
select distinct sex from employee
select*from employee
--count(name of column)>> without null + duplicated
--count(distinct column name)>> without null +  without duplicated
--count (*)>> null +   duplicated
select * from works_for
select sum(hours) total_hours,avg(hours) avg_hours,max(hours) max_hours,min(hours) min_hours
from works_for
select distinct pno from works_for
select sum(salary) '#emp'
group by salary



-- simple project
create database simple_project
use simple_project

select*from Emp 
select count(id),avg(salary) avg_salary,count(salary) total_salary,count(department) '#dep'
from Emp
--Total salary by dep
select sum (salary) total_salary
from Emp
group by department
--#emp by gender &dep
select  gender , department, count(id) count_dep 
from Emp
group by gender, department
--Emps by gender 
select  gender , count(id) count_dep 
from Emp
group by gender

select department ,count(id) '#emps'
from Emp
group by rollup(department)

select  coalesce (department,'grand total') ,count(id) '#emps'
from Emp
group by rollup(department)


select  coalesce (department,'grand total') ,count(id) '#emps'
from Emp
group by cube(department)

select department, gender ,  count(id) count_dep 
from Emp
group by  rollup (department,gender)
select* from emp
select  department ,avg(salary) avg_salary
from emp
group by department 
having sum (salary) >6000
