use StudentInformationManagementSystem
go

Declare @students xml;
set @students = '<students>
<Student FirstName="krati"><StudentDetails Age = "21" Address="Mandsaur" /></Student>
<Student FirstName="kratika"><StudentDetails Age = "21" Address="Mandsaur" /></Student>
</students>';

select @students;
