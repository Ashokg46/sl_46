CREATE TABLE Employee (
    empno NUMBER PRIMARY KEY,
    ename VARCHAR2(50),
    jobtitle VARCHAR2(50),
    management NUMBER,
    joiningdate DATE,
    salary NUMBER,
    deptno NUMBER
);

INSERT INTO Employee VALUES (1, 'Mani', 'Manager', NULL, TO_DATE('2000-01-01', 'YYYY-MM-DD'), 100000, 1);
INSERT INTO Employee VALUES (2, 'Raj', 'Clerk', 1, TO_DATE('2012-06-01', 'YYYY-MM-DD'), 40000, 1);
INSERT INTO Employee VALUES (3, 'Ravi', 'Clerk', 1, TO_DATE('1998-03-01', 'YYYY-MM-DD'), 42000, 1);
INSERT INTO Employee VALUES (4, 'Sita', 'Analyst', 1, TO_DATE('2010-07-01', 'YYYY-MM-DD'), 80000, 2);

UPDATE Employee
SET Salary = Salary * 1.10
WHERE MONTHS_BETWEEN(SYSDATE, joiningdate)/12 > 10;

DELETE FROM Employee
WHERE MONTHS_BETWEEN(SYSDATE, joiningdate)/12 >= 25;

SELECT management FROM Employee
GROUP BY management
HAVING COUNT(*) = (
    SELECT MAX(CNT) FROM (
        SELECT management, COUNT(*) CNT FROM Employee GROUP BY management
    )
);

CREATE VIEW emp_manager AS
SELECT E1.ename AS Employee_Name, E2.ename AS Manager_Name
FROM Employee E1 JOIN Employee E2 ON E1.management = E2.empno;
