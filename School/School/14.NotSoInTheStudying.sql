SELECT CONCAT(s.FirstName, ' ', s.MiddleName + ' ', s.LastName) AS FullName
FROM Students AS s
LEFT JOIN StudentsSubjects AS ss
	ON s.Id = ss.StudentId
WHERE ss.SubjectId IS NULL
ORDER BY FullName ASC