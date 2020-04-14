
use AdventureWorks2017;
create table module6.Teachers(
TeacherId int Identity(1,1) not null,
TeacherName varchar(50) not null,
Salary int not null,
ContactNumber varchar(20));

create table module6.TeacherDetails(
TeacherDetailId int Identity not null,
TeacherId int not null,
Email varchar(30));

CREATE VIEW vTeachers 
WITH SCHEMABINDING AS    
SELECT e.TeacherId,e.TeacherName,e.Salary,e.ContactNumber    
FROM module6.Teachers as e    
WHERE e.TeacherName LIKE '[A-P]%' 

create unique clustered index ix_Teacher on vTeachers(TeacherId);

alter database AdventureWorks2017 set QUERY_STORE CLEAR;

SELECT * from vTeachers;

select e.TeacherName as 'Teachers',d.Email as'TeacherDetails'
from
module6.Teachers as e
inner join module6.TeacherDetails as d
on
d.TeacherId=e.TeacherId;

update statistics vTeachers with ROWCOUNT=6000,PAGECOUNT=2000;