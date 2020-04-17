use AdventureWorks
Go
create schema Resources

firstTable-
create table resources.Employee(EmployeeId int,Name varchar(50),Address varchar(50));

secondTable-
create table resources.TeamMembers(MeambersId int,EmployeeId int,TeamName varchar(50));

creatview-
SELECT emp.EmployeeId, emp.Name, tm.TeamName
FROM   resources.Employee AS emp INNER JOIN
             Resources.TeamMembers AS tm ON emp.EmployeeId = tm.EmployeeId


insertdata-
insert into resources.Employee(Name) values ('krati');
insert into resources.TeamMembers(EmployeeId,TeamName) values (2,'war-2');
select * from dbo.vEmp
select * from resources.Employee
select * from resources.TeamMembers

createTrigger-
alter trigger trigger_update_view
on dbo.vEmp
Instead of update as
begin
    set nocount on;
	if(update(Name))
	begin 
	declare @EmployeeId int,@Name varchar(50)
	select @EmployeeId=ins.EmployeeId,@Name=ins.Name from inserted as ins
	update resources.Employee set Name=@Name where EmployeeId=@EmployeeId;
	end
	
  
  if(UPDATE(TeamName))
  begin
  declare @TeamName varchar(50)
  select @EmployeeId=ins.EmployeeId,@TeamName=ins.TeamName from inserted as ins
  Update resources.TeamMembers set TeamName  = @TeamName where EmployeeId=@EmployeeId;
 End  
 End
  

  update dbo.vEmp set TeamName='kratis' where EmployeeId=2

  select * from dbo.vEmp;