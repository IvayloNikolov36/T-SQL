SELECT x.[Quarter], x.SubjectName, COUNT(x.StudentId) AS [StudentsCount]
FROM (SELECT 
		CASE 
			WHEN MONTH(e.[Date]) BETWEEN 1 AND 3 THEN 'Q1'
			WHEN MONTH(e.[Date]) BETWEEN 4 AND 6 THEN 'Q2'
			WHEN MONTH(e.[Date]) BETWEEN 7 AND 9 THEN 'Q3'
			WHEN MONTH(e.[Date]) BETWEEN 10 AND 12 THEN 'Q4'
			WHEN e.[Date] IS NULL THEN 'TBA'
		END AS [Quarter],s.[Name] AS [SubjectName], se.Grade, se.StudentId
	  FROM StudentsExams se
	  JOIN Exams AS e ON se.ExamId = e.Id
	  JOIN Subjects AS s ON e.SubjectId = s.Id
	  WHERE se.Grade >= 4) AS x
GROUP BY x.[Quarter], x.SubjectName
ORDER BY x.[Quarter] ASC


