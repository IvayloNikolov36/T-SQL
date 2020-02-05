SELECT
	CONCAT(t.FirstName, ' ', t.LastName) AS FullName,
	CONCAT(sub.[Name], '-', sub.Lessons) AS Subjects, 
	COUNT(st.StudentId) AS Students
FROM StudentsTeachers AS st
RIGHT JOIN Teachers AS t
	ON st.TeacherId = t.Id
LEFT JOIN Subjects AS sub
	ON t.SubjectId = sub.Id
GROUP BY st.TeacherId, t.FirstName, t.LastName, sub.[Name], sub.Lessons 
ORDER BY Students DESC, FullName ASC, Subjects ASC