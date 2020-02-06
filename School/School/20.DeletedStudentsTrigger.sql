CREATE OR ALTER TRIGGER tr_ExcludeStudent ON Students AFTER DELETE
AS
BEGIN
	INSERT INTO ExcludedStudents(StudentId, StudentName) 
	SELECT d.Id, CONCAT(d.FirstName, ' ', d.LastName) 
	FROM deleted AS d
END
