-- Task 3 - Joins

1. List the names of the waiters who have served the customer Tanya Singh.

mysql> SELECT restStaff.first_name, restStaff.surname
    -> FROM restStaff
    -> INNER JOIN restBill
    -> ON restStaff.staff_no = restBill.waiter_no
    -> WHERE restBill.cust_name = 'Tanya Singh';
    

2. On which dates in February 2016 did the Headwaiter 'Charles' manage the 'Green' room? The output date should be in the format they are stored.

mysql> SELECT room_date
    -> FROM restRoom_management
    -> INNER JOIN restStaff
    -> ON restRoom_management.headwaiter = restStaff.staff_no
    -> WHERE restStaff.first_name = 'Charles'
    -> AND restRoom_management.room_name = 'Green'
    -> AND room_date BETWEEN 160201 AND 160229;
    
    
3. List the names and surnames of the waiters with the same headwaiter as the waiter Zoe Ball.

mysql> SELECT S.first_name, S.surname
    -> FROM restStaff S
    -> WHERE S.headwaiter = (
    ->     SELECT headwaiter
    ->     FROM restStaff
    ->     WHERE first_name = 'Zoe'
    ->     AND surname = 'Ball'
    -> );
    

4.List the customer name, the amount they spent, and the waiter’s name for all bills. Order the list by the amount spent, highest bill first.

mysql> SELECT restBill.cust_name, restBill.bill_total, restStaff.first_name, restStaff.surname
    -> FROM restBill
    -> INNER JOIN restStaff
    -> ON restBill.waiter_no = restStaff.staff_no
    -> ORDER BY restBill.bill_total DESC;
    
    
5.  List the names and surnames of the waiters who serve tables that worked in the same team that served bills 00014 and 00017.

mysql> SELECT DISTINCT S.first_name, S.surname
    -> FROM restStaff S
    -> INNER JOIN restBill B
    -> ON S.staff_no = B.waiter_no
    -> WHERE B.table_no IN (
    ->     SELECT table_no
    ->     FROM restBill
    ->     WHERE bill_no IN (14, 17)
    -> );
    
    
6. List the names and surnames of the waiters in the team (including the headwaiter) that served the Blue room on 160312.

mysql> SELECT DISTINCT S.first_name, S.surname
    -> FROM restStaff S
    -> WHERE S.staff_no IN (
    ->     SELECT headwaiter
    ->     FROM restRoom_management
    ->     WHERE room_name = 'Blue' AND room_date = 160312
    ->     UNION
    ->     SELECT waiter_no
    ->     FROM restBill
    ->     WHERE table_no IN (
    ->         SELECT table_no
    ->         FROM restRest_table
    ->         WHERE room_name = 'Blue'
    ->     )
    ->     AND bill_date = 160312
    -> );
