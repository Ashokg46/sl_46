CREATE TABLE Product (
    Productid NUMBER PRIMARY KEY,
    Productname VARCHAR2(50),
    Price NUMBER,
    Stock NUMBER
);

CREATE TABLE Purchase (
    Purchaseid NUMBER PRIMARY KEY,
    Productid NUMBER,
    Quantity NUMBER,
    SupplierName VARCHAR2(50),
    FOREIGN KEY (Productid) REFERENCES Product(Productid)
);

CREATE VIEW product_sales AS
SELECT Productid, SUM(Quantity) AS Total_Quantity FROM Purchase GROUP BY Productid;
--
CREATE SEQUENCE Purchaseid_Sequence START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE PROCEDURE display_products IS
BEGIN
    FOR p IN (SELECT * FROM Product) LOOP
        DBMS_OUTPUT.PUT_LINE('Product ID: ' || p.Productid || ', Name: ' || p.Productname);
    END LOOP;
END;
/