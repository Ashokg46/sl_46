CREATE TABLE Course (
    Courseid NUMBER PRIMARY KEY,
    Coursename VARCHAR2(50),
    Coursefee NUMBER
);

CREATE TABLE Student (
    Studentid NUMBER PRIMARY KEY,
    Studentname VARCHAR2(50),
    Courseid NUMBER,
    FOREIGN KEY (Courseid) REFERENCES Course(Courseid)
);

INSERT INTO Course (Courseid, Coursename, Coursefee)
VALUES (101, 'Oracle SQL', 5000);

INSERT INTO Course (Courseid, Coursename, Coursefee)
VALUES (102, 'Java Programming', 6000);

INSERT INTO Course (Courseid, Coursename, Coursefee)
VALUES (103, 'Web Development', 7000);

INSERT INTO Course (Courseid, Coursename, Coursefee)
VALUES (104, 'Python Basics', 4000);

SELECT * FROM Student s
INNER JOIN Course c ON s.Courseid = c.Courseid;

SELECT * FROM Student s
LEFT OUTER JOIN Course c ON s.Courseid = c.Courseid;

SELECT * FROM Course c
LEFT OUTER JOIN Student s ON c.Courseid = s.Courseid;

SELECT * FROM Student s
LEFT OUTER JOIN Course c ON s.Courseid = c.Courseid
UNION
SELECT * FROM Course c
LEFT OUTER JOIN Student s ON c.Courseid = s.Courseid;
