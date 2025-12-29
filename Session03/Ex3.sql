USE students;

CREATE TABLE Subject (
    subject_id VARCHAR(10) PRIMARY KEY,
    subject_name NVARCHAR(100) NOT NULL,
    credit INT CHECK (credit > 0)
);

INSERT INTO Subject (subject_id, subject_name, credit)
VALUES
('MH001', 'Cơ sở dữ liệu', 3),
('MH002', 'Lập trình Web', 4),
('MH003', 'Cấu trúc dữ liệu', 3);

UPDATE Subject
SET credit = 5
WHERE subject_id = 'MH002';

SELECT * 
FROM Subject;
