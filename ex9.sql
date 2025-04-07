CREATE TABLE Customer (
    Customerno NUMBER PRIMARY KEY,
    Custname VARCHAR2(50),
    City VARCHAR2(50) CHECK (City IN ('Chennai', 'Bangalore', 'Delhi'))
);

CREATE TABLE Cust_Order (
    Orderno NUMBER PRIMARY KEY,
    Orderdate DATE,
    Ord_Amt NUMBER,
    Customerno NUMBER,
    FOREIGN KEY (Customerno) REFERENCES Customer(Customerno)
);

CREATE SYNONYM CustOrder FOR Cust_Order;

CREATE VIEW Customer_order_summary AS
SELECT c.Customerno, c.Custname, COUNT(o.Orderno) AS Total_Orders
FROM Customer c LEFT JOIN Cust_Order o ON c.Customerno = o.Customerno
GROUP BY c.Customerno, c.Custname;

CREATE OR REPLACE PROCEDURE show_customer_orders IS
BEGIN
    FOR r IN (SELECT * FROM Cust_Order) LOOP
        DBMS_OUTPUT.PUT_LINE('Order No: ' || r.Orderno || ', Customer No: ' || r.Customerno);
    END LOOP;
END;
/