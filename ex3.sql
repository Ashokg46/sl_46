CREATE TABLE Orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    order_amount NUMBER(10, 2),
    order_date DATE
);

INSERT INTO Orders VALUES (1, 101, 500.75, TO_DATE('2024-03-01', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES (2, 102, 1200.00, TO_DATE('2024-03-05', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES (3, 101, 750.25, TO_DATE('2024-03-10', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES (4, 103, 950.50, TO_DATE('2024-03-25', 'YYYY-MM-DD'));

SELECT customer_id, SUM(order_amount) AS total_order FROM Orders GROUP BY customer_id;

SELECT AVG(order_amount) AS average_order FROM Orders;

SELECT COUNT(*) AS total_orders FROM Orders;

SELECT customer_id, ROUND(AVG(order_amount)) AS avg_order_rounded FROM Orders GROUP BY customer_id;

SELECT * FROM Orders WHERE order_date = TO_DATE('2024-03-10', 'YYYY-MM-DD');

SELECT * FROM Orders WHERE TO_CHAR(order_date, 'MM') = '03';

SELECT * FROM Orders WHERE order_date = LAST_DAY(order_date);

SELECT * FROM Orders WHERE order_date >= SYSDATE - 30;
