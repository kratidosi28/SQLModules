use [StudentInformationManagementSystem]
go

--Raw mode queries
select StudentFirstName,
       StudentLastName,
       StudentAge,
       StudentAddress,
      StudentEmailId
	  from dbo.Students
	  WHERE EnrollmentNumber =1002
Order by StudentFirstName,StudentLastName
FOR XML RAW;

--Auto-Mode queries
select StudentFirstName,
       StudentLastName,
       StudentAge,
       StudentAddress,
      StudentEmailId
	  from dbo.Students
	  WHERE EnrollmentNumber =1002
Order by StudentFirstName,StudentLastName
FOR XML Auto;


SELECT dbo.Courses.CourseId, dbo.Courses.CourseName, dbo.CourseSpecialization.CourseSpecializationName, dbo.CourseSpecialization.CourseSpecializationFees
FROM dbo.Courses INNER JOIN dbo.CourseSpecialization ON dbo.Courses.CourseId = dbo.CourseSpecialization.CourseId
For XML Auto, Root('vCourse'),Elements;

--Explicit-Mode queries
SELECT 1 AS Tag, NULL AS Parent,
      Students.StudentFirstName AS [Student!1!StudentFirstName!Element],
	    Students.StudentLastName AS [Student!1!StudentLastName!Element]
 FROM dbo.Students
ORDER BY [Student!1!StudentFirstName!Element],[Student!1!StudentLastName!Element]
FOR XML EXPLICIT,Root('Students');
GO

--Path-Mode queries
select TOP 3 StudentFirstName,StudentAge,StudentEmailId As "Email"
from dbo.Students As students
Order By StudentAge DESC
For xml path('students') , Root('students'),Elements;

--Using Type
SELECT CourseId As '@Id'
       (SELECT CourseSpecializationName, CourseSpecializationFees
        FROM dbo.CourseSpecialization AS specialization
        WHERE specialization.CourseId = Courses.CourseId
		Order by CourseSpecializationName
        FOR XML AUTO, Type, Elements) 
FROM dbo.Courses
For xml path('Courses') , Root('Courses'),Elements;

--Using Same query without Type
SELECT CourseId As '@Id'
       (SELECT CourseSpecializationName, CourseSpecializationFees
        FROM dbo.CourseSpecialization AS specialization
        WHERE specialization.CourseId = Courses.CourseId
		Order by CourseSpecializationName
        FOR XML AUTO)
FROM dbo.Courses
For xml path('Courses') , Root('Courses'),Elements;






