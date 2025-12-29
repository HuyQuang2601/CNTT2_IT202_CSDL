USE students;
CREATE TABLE Student (
    student_id VARCHAR(10) PRIMARY KEY,
    full_name NVARCHAR(100) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE
);

INSERT INTO student (student_id, full_name, date_of_birth, email)
VALUES 
('SV001', 'Nguyễn Văn An', '2003-05-12', 'an.nguyen@gmail.com'),
('SV002', 'Trần Thị Bình', '2002-11-20', 'binh.tran@gmail.com'),
('SV003', 'Lê Hoàng Minh', '2003-08-01', 'minh.le@gmail.com');

SELECT * 
FROM Student;

SELECT student_id, full_name 
FROM Student;
