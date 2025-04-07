CREATE TABLE Customer (
    Cust_id NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Age NUMBER,
    Address VARCHAR2(100),
    Phone_no VARCHAR2(15)
);

DECLARE
BEGIN
    FOR c IN (SELECT * FROM Customer) LOOP
        DBMS_OUTPUT.PUT_LINE(c.Cust_id || ' - ' || c.Name);
    END LOOP;
END;
/

DECLARE
    CURSOR cur IS SELECT Cust_id, Name FROM Customer;
    v_id Customer.Cust_id%TYPE;
    v_name Customer.Name%TYPE;
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO v_id, v_name;
        EXIT WHEN cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_id || ' - ' || v_name);
    END LOOP;
    CLOSE cur;
END;
/