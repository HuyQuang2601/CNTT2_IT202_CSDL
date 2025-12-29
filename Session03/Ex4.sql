USE students;

CREATE TABLE Enrollment (
    student_id INT,
    subject_id VARCHAR(10),
    enroll_date DATE,

    PRIMARY KEY (student_id, subject_id),

    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
);

INSERT INTO Enrollment (student_id, subject_id, enroll_date)
VALUES
('2', 'MH001', '2024-03-01'),
('2', 'MH002', '2024-03-02'),
('3', 'MH001', '2024-03-01'),
('3', 'MH003', '2024-03-03');

SELECT * 
FROM Enrollment;

SELECT *
FROM Enrollment
WHERE student_id = '2';

