UPDATE student
SET email = 'newemail3@gmail.com'
WHERE student_id = 3;

UPDATE student
SET date_of_birth = '2003-10-15'
WHERE student_id = 2;

DELETE FROM student
WHERE student_id = 1;

SELECT * 
FROM student;
