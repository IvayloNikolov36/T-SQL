SELECT s.FirstName, s.LastName, 
	COUNT(st.TeacherId) AS TeachersCount
FROM Students AS s
LEFT JOIN StudentsTeachers AS st
ON s.Id = st.StudentId
GROUP BY s.Id, s.FirstName, s.LastName
