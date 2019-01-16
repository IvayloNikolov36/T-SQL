CREATE PROC usp_GetEmployeesSalaryAboveNumber (@lowerSalaryBound DECIMAL(18, 4))
AS
	SELECT FirstName, LastName
	FROM Employees
	WHERE Salary >= @lowerSalaryBound