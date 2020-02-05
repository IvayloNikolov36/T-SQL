SELECT TOP(10)
	t.FirstName, t.LastName, COUNT(st.StudentId) AS StudentsCount
FROM Teachers AS t
LEFT JOIN StudentsTeachers AS st
	ON t.Id = st.TeacherId
GROUP BY t.Id, t.FirstName, t.LastName
ORDER BY StudentsCount DESC, t.FirstName ASC, t.LastName ASC
