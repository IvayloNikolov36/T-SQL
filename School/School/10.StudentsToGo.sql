SELECT CONCAT(s.FirstName, ' ', s.LastName) as FullName 
FROM Students AS s
LEFT JOIN StudentsExams AS se
ON s.Id = SE.StudentId
WHERE se.ExamId IS NULL
ORDER BY FullName ASC
