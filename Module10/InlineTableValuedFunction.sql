step 1-- Create Student Table
CREATE TABLE Student
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  DOB DATE,
  Branch VARCHAR(50)
)
step 2-- Insert into Student Table 

INSERT INTO Student VALUES(1, 'krati', 'Female','1999-01-28', 'CSE')
INSERT INTO Student VALUES(2, 'Sakshi', 'Female','1998-09-11', 'CSE')

step 3 -- Create a function which accepts student id as input and returns that student details from the table

CREATE FUNCTION FN_GetStudentDetailsByID
(
  @ID INT
)
RETURNS TABLE
AS
RETURN (SELECT * FROM Student WHERE ID = @ID)

step 4 -- Calling the Function:
SELECT * FROM FN_GetStudentDetailsByID(2)