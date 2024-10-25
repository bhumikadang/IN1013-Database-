mysql> CREATE TABLE petPet (
    ->     petname VARCHAR(20) PRIMARY KEY,
    ->     owner VARCHAR(45),
    ->     species VARCHAR(45),
    ->     gender CHAR(1) CHECK (gender IN ('M', 'F')),
    ->     birth DATE,
    ->     death DATE
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE petEvent (
    ->     petname VARCHAR(20),
    ->     eventdate DATE,
    ->     eventtype VARCHAR(15),
    ->     remark VARCHAR(255),
    ->     PRIMARY KEY (petname, eventdate),
    ->     FOREIGN KEY (petname) REFERENCES petPet(petname)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> 
