CREATE DATABASE Student_DB

CREATE TABLE Students
(
StudentId INT PRIMARY KEY,
Name VARCHAR(30) NOT NULL,
Age TinyINT NOT NULL,
Subject VARCHAR(30) NOT NULL,
Grade float,
Review TEXT,
)

CREATE TABLE TEACHER
(
TeacherId INT PRIMARY KEY NOT NULL,
Name VARCHAR(30) NOT NULL,
Subject VARCHAR(30),
StudentId int,
FOREIGN KEY (StudentId) REFERENCES Students(StudentId),
Age TinyINT NOT NULL,
Review TEXT,
)

select * from TEACHER
select * from students

drop table Students

    
	(2,'Roy',19,'Tom',68),

    INSERT INTO Students(StudentId,Name,Age,Subject, Grade) VALUES
	(1,'Alice', 18,'SOM', 85.5)
    (4,'Rushi','SOM', 78.9)

	UPDATE Students set Age = 20 where Name ='Alice' 

	DELETE FROM Students WHERE Name ='Alice'

	SELECT StudentId, Name FROM Students WHERE Grade >=80
	SELECT * FROM Students WHERE Grade >=50
 