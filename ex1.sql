CREATE TABLE Student (
    Reg_no VARCHAR2(10) PRIMARY KEY,
    Name VARCHAR2(50) NOT NULL,
    DOB DATE,
    Branch VARCHAR2(30),
    Year_of_study NUMBER
);

ALTER TABLE Student ADD (Address VARCHAR2(100), Mobileno VARCHAR2(15), EmailId VARCHAR2(50));

ALTER TABLE Student MODIFY (Reg_no VARCHAR2(10));

ALTER TABLE Student DROP COLUMN Address;


INSERT INTO Student (Reg_no, Name, DOB, Branch, Year_of_study, Mobileno, EmailId)
VALUES ('S001', 'John Doe', TO_DATE('2003-05-14', 'YYYY-MM-DD'), 'CSE', 3, '9876543210', 'john@example.com');

SELECT * FROM Student;

CREATE OR REPLACE PROCEDURE show_students IS
BEGIN
    FOR s IN (SELECT * FROM Student) LOOP
        DBMS_OUTPUT.PUT_LINE('Reg_no: ' || s.Reg_no || ', Name: ' || s.Name || ', Branch: ' || s.Branch);
    END LOOP;
END;
/

-- To run:
BEGIN
    show_students;
END;
/
