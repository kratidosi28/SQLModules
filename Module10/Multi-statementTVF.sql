step 1 -- Create Department Table
CREATE TABLE Department
(
  ID INT PRIMARY KEY,
  DepartmentName VARCHAR(50)
)
GO

step 2-- Insert into Department Table 
INSERT INTO Department VALUES(1, 'IT')
INSERT INTO Department VALUES(2, 'HR')
INSERT INTO Department VALUES(3, 'Sales')
GO

step 3-- Create Employee Table
CREATE TABLE Employee
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  DOB DATE,
  DeptID INT FOREIGN KEY REFERENCES Department(ID) 
)
GO

step 4-- Insert into Employee Table 
INSERT INTO Employee (1, 'krati', 'Female','1999-01-28', 1)
INSERT INTO EmployeeVALUES(2, 'Sakshi', 'Female','1998-09-11', 2)
GO

step 5-- Multi-statement Table Valued function:
CREATE FUNCTION MSTVF_GetEmployees()
RETURNS @Table Table (ID int, Name nvarchar(20), DOB Date)
AS
BEGIN
  INSERT INTO @Table
    SELECT ID, Name, Cast(DOB AS Date)
    FROM Employee
  Return
End

step 6-- Calling the Multi-statement Table Valued Function:
SELECT * FROM MSTVF_GetEmployees()
