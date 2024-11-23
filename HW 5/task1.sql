-- Task 1. Single Table Queries

1.	List the dates and bill totals for customer Bob Crow.

 mysql> SELECT bill_date, bill_total
    -> FROM restBill
    -> WHERE cust_name = 'Bob Crow';
    
2.	List the names of all customers whose last name is Smith. List each customer only once in the reverse lexicographical order.

 mysql> SELECT DISTINCT cust_name
    -> FROM restBill
    -> WHERE cust_name LIKE '%Smith'
    -> ORDER BY cust_name DESC;

3.	List the names of all customers whose second names begin with 'C'. List each customer only once.

 mysql> SELECT DISTINCT cust_name
    -> FROM restBill
    -> WHERE cust_name LIKE '% C%'
    -> ORDER BY cust_name;

4.	List the names of all the headwaiters.

 mysql> SELECT first_name, surname
    -> FROM restStaff
    -> WHERE headwaiter IS NOT NULL;
    
5.	List all the details of bills dated February 2016.
    
 mysql> SELECT *
    -> FROM restBill
    -> WHERE bill_date BETWEEN 160201 AND 160229;
    
6.	List the dates the restaurant took money in 2015. List each date only once in the sorted order.
    
    mysql> SELECT DISTINCT bill_date
    -> FROM restBill
    -> WHERE bill_date BETWEEN 150101 AND 151231
    -> ORDER BY bill_date;