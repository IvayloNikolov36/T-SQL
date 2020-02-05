SELECT r.FirstName, r.LastName, r.Grade FROM
	(SELECT s.FirstName, s.LastName, ss.Grade,
	ROW_NUMBER() OVER   
	    (PARTITION BY s.Id ORDER BY ss.Grade DESC) AS Rank
	FROM Students AS s
	RIGHT JOIN StudentsSubjects AS ss
		ON s.Id = ss.StudentId) as r
WHERE r.Rank = 2
ORDER BY r.FirstName ASC, r.LastName ASC