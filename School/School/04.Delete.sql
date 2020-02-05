
DELETE StudentsTeachers
WHERE TeacherId IN (SELECT Id
					FROM Teachers
					WHERE Phone LIKE '%72%')

GO

DELETE Teachers WHERE CHARINDEX('72', Phone) > 0					