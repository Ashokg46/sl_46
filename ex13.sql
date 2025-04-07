CREATE TABLE Customer (
    Cust_id NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Age NUMBER,
    Address VARCHAR2(100),
    Phone_no VARCHAR2(15)
);

CREATE OR REPLACE PROCEDURE insert_customer (
    p_id NUMBER, p_name VARCHAR2, p_age NUMBER, p_address VARCHAR2, p_phone VARCHAR2
) IS
BEGIN
    INSERT INTO Customer VALUES (p_id, p_name, p_age, p_address, p_phone);
END;
/

CREATE OR REPLACE PROCEDURE show_customers IS
    CURSOR c IS SELECT * FROM Customer;
    v_rec Customer%ROWTYPE;
BEGIN
    OPEN c;
    LOOP
        FETCH c INTO v_rec;
        EXIT WHEN c%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_rec.Cust_id || ', ' || v_rec.Name);
    END LOOP;
    CLOSE c;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No such Customer id');
END;
/