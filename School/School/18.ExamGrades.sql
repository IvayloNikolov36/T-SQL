CREATE OR ALTER FUNCTION udf_ExamGradesToUpdate(@studentId INT, @grade DECIMAL(3, 2))
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @studentName NVARCHAR(30)= (SELECT FirstName FROM Students WHERE Id = @studentId);

	IF @studentName IS NULL
	BEGIN
		RETURN 'The student with provided id does not exist in the school!';
	END

	IF @grade > 6.00
	BEGIN
		RETURN 'Grade cannot be above 6.00!';
	END

	DECLARE @gradesToUpdate INT = (SELECT COUNT(se.Grade)
								   FROM Students AS s 
								   JOIN StudentsExams AS se ON s.Id = se.StudentId
								   WHERE s.Id = @studentId AND se.Grade >= @grade and se.Grade <= (@grade + 0.50));
	
	RETURN CONCAT('You have to update ', @gradesToUpdate, ' grades for the student ', @studentName);
END

