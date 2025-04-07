CREATE TABLE Student_details (
    Stud_id NUMBER PRIMARY KEY,
    Student_name VARCHAR2(50),
    Mark1 NUMBER,
    Mark2 NUMBER,
    Mark3 NUMBER,
    Total NUMBER,
    Percentage NUMBER(5,2),
    Grade CHAR(1) CHECK (Grade IN ('A', 'B', 'C', 'D', 'E', 'U'))
);

CREATE VIEW passed_students AS
SELECT Stud_id, Student_name FROM Student_details WHERE Grade IN ('A', 'B', 'C', 'D', 'E');

CREATE OR REPLACE TRIGGER calc_total_percentage
BEFORE INSERT ON Student_details
FOR EACH ROW
BEGIN
    :NEW.Total := :NEW.Mark1 + :NEW.Mark2 + :NEW.Mark3;
    :NEW.Percentage := (:NEW.Total / 300) * 100;
END;
/