CREATE TABLE Department (
    DepartmentID NUMBER PRIMARY KEY,
    DepartmentName VARCHAR2(50)
);

CREATE TABLE Employee (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(50),
    DepartmentID NUMBER,
    Salary NUMBER,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

SELECT * FROM Employee WHERE DepartmentID = 1;

SELECT DepartmentName FROM Department D WHERE EXISTS (
    SELECT 1 FROM Employee E WHERE E.DepartmentID = D.DepartmentID AND E.EmployeeID = 101
);

SELECT DepartmentID, SUM(Salary) AS Total_Salary FROM Employee GROUP BY DepartmentID;

SELECT * FROM Department WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Employee);

SELECT DepartmentID FROM Employee GROUP BY DepartmentID HAVING COUNT(*) > 3;