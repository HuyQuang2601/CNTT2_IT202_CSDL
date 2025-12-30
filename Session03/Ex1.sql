USE students;
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    full_name NVARCHAR(100) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE
);

INSERT INTO student (student_id, full_name, date_of_birth, email)
VALUES 
('1', 'Nguyễn Văn An', '2003-05-12', 'an.nguyen@gmail.com'),
('2', 'Trần Thị Bình', '2002-11-20', 'binh.tran@gmail.com'),
('3', 'Lê Hoàng Minh', '2003-08-01', 'minh.le@gmail.com');


SELECT * 
FROM Student;

SELECT student_id, full_name 
FROM Student;

