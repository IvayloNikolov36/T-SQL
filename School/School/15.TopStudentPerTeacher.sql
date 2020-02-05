SELECT x.[Teacher Full Name], x.SubjectName, x.[Student Full Name], x.Grade
FROM (SELECT 
		CONCAT(t.FirstName, ' ', t.LastName) AS [Teacher Full Name],
		sub.[Name] AS [SubjectName], 
		CONCAT(s.FirstName, ' ', s.LastName) AS [Student Full Name],
		CAST(AVG(ss.Grade) AS DECIMAL(3,2)) AS [Grade],
		ROW_NUMBER() OVER (PARTITION BY t.Id ORDER BY AVG(ss.Grade) DESC) AS [RowNum]
		FROM Teachers AS t
		JOIN StudentsTeachers AS st ON t.Id = st.TeacherId
		JOIN Students AS s ON st.StudentId = s.Id
		JOIN StudentsSubjects AS ss ON s.Id = ss.StudentId
		JOIN Subjects AS sub ON ss.SubjectId = sub.Id AND sub.Id = t.SubjectId
		GROUP BY t.Id, s.Id, t.FirstName, t.LastName, sub.[Name], s.FirstName, s.LastName) AS x
WHERE x.[RowNum] = 1
ORDER BY x.SubjectName ASC, x.[Teacher Full Name] ASC, x.[Grade] DESC

	 
