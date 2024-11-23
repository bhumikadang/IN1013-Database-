--Task 2 Aggregate Queries

1. Total income of the restaurant

SELECT SUM(bill_total) AS Income 
FROM restBill;

2. Total income in February 2016

SELECT SUM(bill_total) AS Feb_Income 
FROM restBill 
WHERE bill_date BETWEEN 160201 AND 160229;

3. Average bill for table 2

SELECT AVG(bill_total) AS Average_Bill 
FROM restBill 
WHERE table_no = 2;

4. Min, Max, Avg seats in Blue room

SELECT 
    MIN(no_of_seats) AS Min,
    MAX(no_of_seats) AS Max,
    AVG(no_of_seats) AS Avg 
FROM restRest_table 
WHERE room_name = 'Blue';

5. Distinct tables served by waiters 004 and 002

SELECT COUNT(DISTINCT table_no) AS Distinct_Tables 
FROM restBill 
WHERE waiter_no IN (004, 002);