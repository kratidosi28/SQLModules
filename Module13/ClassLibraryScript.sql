
--demonstration
use AdventureWorks2017

sp_configure;

sp_configure 'show advanced options',1;
RECONFIGURE;

sp_configure 'clr enabled',1;
RECONFIGURE;

Execute sp_configure 'clr strict security', 0;
RECONFIGURE

select dbo.HelloWorld() as name;

--Lab-Exercise

-- create assembly
create assembly [ClassLibrary1]
AUTHORIZATION [dbo]
FROM 'C:\Users\guru kripa\source\repos\ClassLibrary1\bin\Debug\ClassLibrary1.dll'
WITH PERMISSION_SET = SAFE

-- create Function
CREATE FUNCTION IsRegex
   (
      @Input NVARCHAR(MAX),
	  @Pattern NVARCHAR(4000)
   
   )
RETURNS bit
AS
External name ClassLibrary1.[ClassLibrary1.IsRegexMatch].IsRegex
GO
 

--Verifies number Returns 1 or 0
DECLARE @pattern VARCHAR(255)
SELECT @pattern ='[a-zA-Z0-9]\d{2}[a-zA-Z0-9](-\d{3}){2}[A-Za-z0-9]'
SELECT  dbo.IsRegex(@pattern,'1298-673-4192'),
        dbo.IsRegex(@pattern,'A08Z-931-468A'),
        dbo.IsRegex(@pattern,'A90-123-129X'),
        dbo.IsRegex(@pattern,'12345-KKA-1230'),
        dbo.IsRegex(@pattern,'0919-2893-1256')