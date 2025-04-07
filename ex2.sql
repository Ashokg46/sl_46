
CREATE TABLE Employee (
    EmpNo NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Department VARCHAR2(30),
    Job_desig VARCHAR2(30),
    DOJ DATE,
    Basic NUMBER(10,2),
    DA NUMBER(10,2),
    HRA NUMBER(10,2),
    Net_Salary NUMBER(10,2)
);


INSERT INTO Employee VALUES (101, 'Alice', 'Accounts', 'Accountant', TO_DATE('2015-03-01', 'YYYY-MM-DD'), 50000, 10000, 5000, 65000);
INSERT INTO Employee VALUES (102, 'Bob', 'IT', 'Developer', TO_DATE('2018-06-15', 'YYYY-MM-DD'), 60000, 12000, 6000, 78000);
INSERT INTO Employee VALUES (103, 'Charlie', 'Accounts', 'Accountant', TO_DATE('2010-01-20', 'YYYY-MM-DD'), 55000, 11000, 5500, 71500);
INSERT INTO Employee VALUES (104, 'David', 'HR', 'Manager', TO_DATE('2000-11-01', 'YYYY-MM-DD'), 70000, 15000, 7000, 92000);

SELECT * FROM Employee WHERE Job_desig = 'Accountant';


SELECT Name FROM Employee WHERE Net_Salary > 80000;

SELECT Name, MONTHS_BETWEEN(SYSDATE, DOJ) AS Months_of_Service FROM Employee;


CREATE OR REPLACE FUNCTION get_netsalary(emp_id NUMBER)
RETURN NUMBER IS
    salary NUMBER;
BEGIN
    SELECT Net_Salary INTO salary FROM Employee WHERE EmpNo = emp_id;
    RETURN salary;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
        RETURN NULL;
END;
/

DECLARE
    netsal NUMBER;
BEGIN
    netsal := get_netsalary(104);
    IF netsal IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Net Salary: ' || netsal);
    END IF;
END;
/
