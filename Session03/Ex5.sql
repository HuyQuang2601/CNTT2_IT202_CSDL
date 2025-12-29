CREATE TABLE Score (
    student_id INT,
    subject_id VARCHAR(10),
    mid_score FLOAT CHECK (mid_score BETWEEN 0 AND 10),
    final_score FLOAT CHECK (final_score BETWEEN 0 AND 10),

    PRIMARY KEY (student_id, subject_id),

    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
);

INSERT INTO Score (student_id, subject_id, mid_score, final_score)
VALUES
(2, 'MH001', 7.5, 8.0),
(2, 'MH002', 6.5, 7.0),
(3, 'MH001', 8.0, 8.5),
(3, 'MH003', 7.0, 9.0);

UPDATE Score
SET final_score = 9.0
WHERE student_id = 2 AND subject_id = 'MH001';

SELECT * 
FROM Score;

SELECT *
FROM Score
WHERE final_score >= 8;
