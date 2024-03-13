USE pw2
GO

INSERT Students
VALUES ('Alan', 'Wake', 'alanW@gmail.com', 'alanwake', 1)
GO

INSERT Subjects
VALUES ('History', 'Modern history of America')
GO

INSERT Teachers
VALUES ('Adam', 'Smith', 'adamSmith@gmail.com', 'adamSmith')
GO

INSERT Grades
VALUES (1, 1, '2024-03-13', 5)
GO

SELECT AVG(Grade) AS avg
FROM Grades
WHERE SubjectId = 1
	AND Date BETWEEN '2024-03-01' AND '2024-03-31'
GO

SELECT StudentId, SubjectId, AVG(Grade) AS avg
FROM Grades
GROUP BY StudentId, SubjectId
GO

SELECT *
FROM Schedule
WHERE Weekday = 'MONDAY'
