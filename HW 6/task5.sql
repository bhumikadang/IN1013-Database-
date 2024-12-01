-- Task 5- Groups

1. Which waiters have taken 2 or more bills on a single date?

mysql> SELECT S.first_name, S.surname, B.bill_date, COUNT(*) AS num_bills
    -> FROM restBill B
    -> INNER JOIN restStaff S ON B.waiter_no = S.staff_no
    -> GROUP BY S.staff_no, B.bill_date
    -> HAVING COUNT(*) >= 2;
    
    
2. List the rooms with tables that can serve more than 6 people and how many of such tables they have.

mysql> SELECT T.room_name, COUNT(*) AS num_large_tables
    -> FROM restRest_table T
    -> WHERE T.no_of_seats > 6
    -> GROUP BY T.room_name;
    
    
3. List the names of the rooms and the total amount of bills in each room.

mysql> SELECT T.room_name, SUM(B.bill_total) AS total_bill_amount
    -> FROM restBill B
    -> INNER JOIN restRest_table T ON B.table_no = T.table_no
    -> GROUP BY T.room_name;
    
    
4.  List the headwaiter’s name and surname and the total bill amount their waiters have taken.

mysql> SELECT H.first_name AS headwaiter_first_name, H.surname AS headwaiter_surname, SUM(B.bill_total) AS total_bill_amount
    -> FROM restBill B
    -> INNER JOIN restStaff W ON B.waiter_no = W.staff_no
    -> INNER JOIN restStaff H ON W.headwaiter = H.staff_no
    -> GROUP BY H.staff_no
    -> ORDER BY total_bill_amount DESC;


5. List any customers who have spent more than £400 on average.

mysql> SELECT B.cust_name, AVG(B.bill_total) AS avg_spent
    -> FROM restBill B
    -> GROUP BY B.cust_name
    -> HAVING AVG(B.bill_total) > 400;
    
    
6. Which waiters have taken 3 or more bills on a single date?

mysql> SELECT S.first_name, S.surname, COUNT(*) AS num_bills
    -> FROM restBill B
    -> INNER JOIN restStaff S ON B.waiter_no = S.staff_no
    -> GROUP BY S.staff_no, B.bill_date
    -> HAVING COUNT(*) >= 3;

