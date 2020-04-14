

use AdventureWorks2017;
create schema module6;
CREATE TABLE module6.Students
  (StudentId INT NOT NULL IDENTITY(1,1),
   StudentName VARCHAR(50) NOT NULL,
   StudentNumber VARCHAR(50) NOT NULL,
    StudentAddress VARCHAR(50) NOT NULL,
   
  );
 
CREATE TABLE module6.StudentDetails
  (StudentDetailId INT primary key  NOT NULL IDENTITY(1,1),
  StudentId int not null,
	EmailId varchar(50) not null,
	Age int not null);

SET STATISTICS TIME ON;
SET STATISTICS XML ON;
SET STATISTICS IO ON;
select * from module6.Students;

select * from module6.StudentDetails;
 
 --*************************
SELECT * FROM module6.Students ORDER BY StudentId  DESC;

SELECT * FROM module6.StudentDetails ORDER BY Age  DESC;
--***************************
select * from module6.Students where StudentId=1;

select * from module6.StudentDetails where Age=21;

--****************************
select * from module6.Students where StudentName='Krati' order by StudentId;

select * from module6.StudentDetails where Age=21 order by StudentId

--*****************************
Insert into module6.Students vALUES('Krati','834765123','guru-kripa');
Insert into module6.StudentDetails VALUES(1,'krati@gmail.com',22);

SET STATISTICS TIME OFF;
SET STATISTICS XML OFF;
SET STATISTICS IO OFF;