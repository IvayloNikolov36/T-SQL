CREATE PROC usp_GetTownsStartingWith (@startingString NVARCHAR(10))
AS
	SELECT [Name]
	FROM Towns
	WHERE [Name] LIKE CONCAT(@startingString, '%')
