CREATE OR REPLACE PROCEDURE manage_customer (
    p_action IN VARCHAR2,
    p_id IN NUMBER,
    p_name IN VARCHAR2 DEFAULT NULL,
    p_age IN NUMBER DEFAULT NULL,
    p_address IN VARCHAR2 DEFAULT NULL,
    p_phone IN VARCHAR2 DEFAULT NULL
) IS
BEGIN
    IF p_action = 'INSERT' THEN
        INSERT INTO Customer VALUES (p_id, p_name, p_age, p_address, p_phone);
    ELSIF p_action = 'UPDATE' THEN
        UPDATE Customer SET Name = p_name, Age = p_age, Address = p_address, Phone_no = p_phone WHERE Cust_id = p_id;
    ELSIF p_action = 'DELETE' THEN
        DELETE FROM Customer WHERE Cust_id = p_id;
    END IF;
END;
/