CREATE OR ALTER PROC usp_EmployeesBySalaryLevel (@levelOfSalary VARCHAR(7))
AS
	SELECT
	e.FirstName, e.LastName
	FROM Employees AS e
	WHERE dbo.ufn_GetSalaryLevel(e.Salary) LIKE @levelOfSalary

GO 

EXEC usp_EmployeesBySalaryLevel 'High'