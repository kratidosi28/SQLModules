create schema Resources

create table resources.Employee(EmployeeId int Primary Key,Name varchar(50),Address varchar(50));

create table resources.TeamMembers(MembersId int Primary Key,EmployeeId int,TeamName varchar(50));

Create view ViewEmployeeDetails 
as 
SELECT emp.EmployeeId, emp.Name, tm.TeamName
FROM   resources.Employee AS emp INNER JOIN
             Resources.TeamMembers AS tm ON emp.EmployeeId = tm.EmployeeId

insert into resources.Employee(Name) values ('krati');
insert into resources.TeamMembers(EmployeeId,TeamName) values (1,'radixian');
select * from dbo.ViewEmployeeDetails 
select * from resources.Employee
select * from resources.TeamMembers

Create Trigger tr_InsteadOfUpdate  
on ViewEmployeeDetails  
instead of update  
as  
Begin   
declare @EmployeeId int=(select EmployeeId from inserted)
Update ViewEmployeeDetails  set Name=(select Name from inserted) where EmployeeId=@EmployeeId
Update ViewEmployeeDetails set TeamName=(select TeamName from inserted) where EmployeeId=@EmployeeId
 End 

 
 Update ViewEmployeeDetails  set 
 Name='sakshi',TeamName='Radix' where EmployeeId=1