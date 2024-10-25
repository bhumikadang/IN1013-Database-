mysql> INSERT INTO petPet (petname, owner, species, gender, birth, death) VALUES 
    ->     ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL),
    ->     ("Claws", "Gwen", "cat", "M", "1994-03-17", NULL),
    ->     ("Buffy", "Harold", "dog", "F", "1989-05-13", NULL),
    ->     ("Fang", "Benny", "dog", "M", "1990-08-27", NULL),
    ->     ("Bowser", "Diane", "dog", "M", "1979-08-31", "1995-07-29"),
    ->     ("Chirpy", "Gwen", "bird", "F", "1998-09-11", NULL),
    ->     ("Whistler", "Gwen", "bird", "M", "1997-12-09", NULL),
    ->     ("Slim", "Benny", "snake", "M", "1996-04-29", NULL),
    ->     ("Puffball", "Diane", "hamster", "F", "1999-03-30", NULL);
Query OK, 9 rows affected (0.00 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO petEvent (petname, eventdate, eventtype, remark) VALUES
    ->     ("Fluffy", "1995-05-15", "litter", "4 kittens, 3 female, 1 male"),
    ->     ("Buffy", "1993-06-23", "litter", "5 puppies, 2 female, 3 male"),
    ->     ("Buffy", "1994-06-19", "litter", "3 puppies, 3 female"),
    ->     ("Chirpy", "1999-03-21", "vet", "needed beak straightened"),
    ->     ("Slim", "1997-08-03", "vet", "broken rib"),
    ->     ("Slim", "1997-10-04", "vet", "broken tooth"),
    ->     ("Bowser", "1991-10-12", "kennel", NULL),
    ->     ("Fang", "1991-10-12", "kennel", NULL),
    ->     ("Fang", "1998-08-28", "birthday", "Gave him a new chew toy"),
    ->     ("Claws", "1998-03-17", "birthday", "Gave him a new flea collar"),
    ->     ("Whistler", "1998-12-09", "birthday", "First birthday");
Query OK, 11 rows affected (0.00 sec)
Records: 11  Duplicates: 0  Warnings: 0

mysql> INSERT INTO petEvent (petname, eventdate, eventtype, remark) VALUES
    ->     ("Fluffy", "2020-10-15", "vet", "antibiotics"),
    ->     ("Hammy", "2020-10-15", "vet", "antibiotics"),  -- Ensure Hammy exists in petPet
    ->     ("Claws", "1997-08-03", "vet", "broken rib"),
    ->     ("Puffball", "2020-09-01", "death", "died"),
    ->     ("Slim", "1997-08-03", "vet", "broken rib");  -- You already have this event
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`pet_database`.`petevent`, CONSTRAINT `petevent_ibfk_1` FOREIGN KEY (`petname`) REFERENCES `petpet` (`petname`))
mysql> INSERT INTO petPet (petname, owner, species, gender, birth, death) VALUES 
    ->     ("Hammy", "Diane", "hamster", "M", "2010-10-30", NULL);
Query OK, 1 row affected (0.00 sec)

mysql> DELETE FROM petPet WHERE owner = 'Harold' AND species = 'dog';
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`pet_database`.`petevent`, CONSTRAINT `petevent_ibfk_1` FOREIGN KEY (`petname`) REFERENCES `petpet` (`petname`))
mysql> SELECT * FROM petPet;
+----------+--------+---------+--------+------------+------------+
| petname  | owner  | species | gender | birth      | death      |
+----------+--------+---------+--------+------------+------------+
| Bowser   | Diane  | dog     | M      | 1979-08-31 | 1995-07-29 |
| Buffy    | Harold | dog     | F      | 1989-05-13 | NULL       |
| Chirpy   | Gwen   | bird    | F      | 1998-09-11 | NULL       |
| Claws    | Gwen   | cat     | M      | 1994-03-17 | NULL       |
| Fang     | Benny  | dog     | M      | 1990-08-27 | NULL       |
| Fluffy   | Harold | cat     | F      | 1993-02-04 | NULL       |
| Hammy    | Diane  | hamster | M      | 2010-10-30 | NULL       |
| Puffball | Diane  | hamster | F      | 1999-03-30 | NULL       |
| Slim     | Benny  | snake   | M      | 1996-04-29 | NULL       |
| Whistler | Gwen   | bird    | M      | 1997-12-09 | NULL       |
+----------+--------+---------+--------+------------+------------+
10 rows in set (0.01 sec)

mysql> SELECT * FROM petEvent;
+----------+----------+------------+-----------+-----------------------------+
| event_id | petname  | eventdate  | eventtype | remark                      |
+----------+----------+------------+-----------+-----------------------------+
|        1 | Fluffy   | 1995-05-15 | litter    | 4 kittens, 3 female, 1 male |
|        2 | Buffy    | 1993-06-23 | litter    | 5 puppies, 2 female, 3 male |
|        3 | Buffy    | 1994-06-19 | litter    | 3 puppies, 3 female         |
|        4 | Chirpy   | 1999-03-21 | vet       | needed beak straightened    |
|        5 | Slim     | 1997-08-03 | vet       | broken rib                  |
|        6 | Slim     | 1997-10-04 | vet       | broken tooth                |
|        7 | Bowser   | 1991-10-12 | kennel    | NULL                        |
|        8 | Fang     | 1991-10-12 | kennel    | NULL                        |
|        9 | Fang     | 1998-08-28 | birthday  | Gave him a new chew toy     |
|       10 | Claws    | 1998-03-17 | birthday  | Gave him a new flea collar  |
|       11 | Whistler | 1998-12-09 | birthday  | First birthday              |
+----------+----------+------------+-----------+-----------------------------+
11 rows in set (0.01 sec)

mysql> 
