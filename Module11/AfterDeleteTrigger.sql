-- Step 1 - Create Table Salaries
CREATE TABLE Salaries (
    employeeNumber INT PRIMARY KEY,
    salary DECIMAL(10,2) NOT NULL DEFAULT 0
);

-- Step 2 - Insert Statement
INSERT INTO Salaries(employeeNumber,salary)
VALUES
    (1002,5000),
    (1056,7000),
    (1076,8000);
	
-- Step 3 - Create Table SalaryBudgets
	
CREATE TABLE SalaryBudgets(
    total DECIMAL(15,2) NOT NULL
);

-- Step 4 - INSERT Statement

INSERT INTO SalaryBudgets(total)
SELECT SUM(salary) 
FROM Salaries;

-- Step 5 - Create TRIGGER
CREATE TRIGGER after_salaries_delete
AFTER DELETE
ON Salaries FOR EACH ROW
UPDATE SalaryBudgets 
SET total = total - old.salary;

-- Step 6 - DELETE Statement
DELETE FROM Salaries
WHERE employeeNumber = 1002;

-- Step 7 - Select Statement
SELECT * FROM SalaryBudgets; 