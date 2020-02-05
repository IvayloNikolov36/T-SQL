SELECT TOP(10)
	s.FirstName, s.LastName, CAST(AVG(se.Grade) AS DECIMAL(3,2)) AS Grade
FROM Students AS s
RIGHT JOIN StudentsExams AS se
	ON s.Id = se.StudentId
GROUP BY s.Id, s.FirstName, s.LastName
ORDER BY Grade DESC, s.FirstName ASC, s.LastName ASC
 