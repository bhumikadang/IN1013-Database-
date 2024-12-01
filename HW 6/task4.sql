-- Task 4 - Sub Queries

1. List the names of customers who spent more than 450.00 on a single bill on occasions when ‘Charles’ was their Headwaiter.

mysql> SELECT B.cust_name
    -> FROM restBill B
    -> WHERE B.bill_total > 450.00
    -> AND B.waiter_no IN (
    ->     SELECT staff_no
    ->     FROM restStaff
    ->     WHERE headwaiter = (
    ->         SELECT staff_no
    ->         FROM restStaff
    ->         WHERE first_name = 'Charles'
    ->     )
    -> );


2. A customer called Nerida has complained that a waiter was rude to her when she dined at the restaurant on the 11th January 2016. What is the name and surname of the Headwaiter who will have to deal with the matter?

mysql> SELECT S.first_name, S.surname
    -> FROM restStaff S
    -> WHERE S.staff_no = (
    ->     SELECT headwaiter
    ->     FROM restRoom_management R
    ->     WHERE R.room_name = (
    ->         SELECT T.room_name
    ->         FROM restRest_table T
    ->         WHERE T.table_no = (
    ->             SELECT B.table_no
    ->             FROM restBill B
    ->             WHERE B.cust_name = 'Nerida Smith'
    ->             AND B.bill_date = 160111
    ->         )
    ->     )
    ->     AND R.room_date = 160111
    -> );
    
    
3. What are the names of customers with the smallest bill?

mysql> SELECT B.cust_name
    -> FROM restBill B
    -> WHERE B.bill_total = (
    ->     SELECT MIN(bill_total)
    ->     FROM restBill
    -> );


4. List the names of any waiters who have not taken any bills.

mysql> SELECT S.first_name, S.surname
    -> FROM restStaff S
    -> WHERE S.staff_no NOT IN (
    ->     SELECT DISTINCT waiter_no
    ->     FROM restBill
    -> );


5. Which customers had the largest single bill? List the customer name, the name and surname of headwaiters, and the room name where they were served on that occasion.

mysql> SELECT B.cust_name, S.first_name AS headwaiter_first_name, S.surname AS headwaiter_surname, T.room_name
    -> FROM restBill B
    -> INNER JOIN restRest_table T ON B.table_no = T.table_no
    -> INNER JOIN restRoom_management R ON T.room_name = R.room_name AND B.bill_date = R.room_date
    -> INNER JOIN restStaff S ON R.headwaiter = S.staff_no
    -> WHERE B.bill_total = (
    ->     SELECT MAX(bill_total)
    ->     FROM restBill
    -> );