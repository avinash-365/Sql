Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 26.10.0 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE PROJECT1;
Query OK, 1 row affected (0.137 sec)

mysql> USE PROJECT1;
Database changed
mysql> CREATE TABLE Customers (
    ->     CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    ->     Name VARCHAR(100) NOT NULL,
    ->     Email VARCHAR(100) UNIQUE NOT NULL,
    ->     Address VARCHAR(255)
    -> );
Query OK, 0 rows affected (0.959 sec)

mysql> INSERT INTO Customers (Name, Email, Address) VALUES
    -> ('Alice Johnston', 'alice@email.com', '123 MG Road, Ahmedabad'),
    -> ('Bob Smith', 'bob@email.com', '456 Ring Road, Surat'),
    -> ('Charlie Patel', 'charlie@email.com', '789 Kalawad Road, Rajkot'),
    -> ('David Miller', 'david@email.com', '101 Race Course, Vadodara'),
    -> ('Emma Watson', 'emma@email.com', '202 Satellite, Ahmedabad');
Query OK, 5 rows affected (0.150 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Customers;
+------------+----------------+-------------------+---------------------------+
| CustomerID | Name           | Email             | Address                   |
+------------+----------------+-------------------+---------------------------+
|          1 | Alice Johnston | alice@email.com   | 123 MG Road, Ahmedabad    |
|          2 | Bob Smith      | bob@email.com     | 456 Ring Road, Surat      |
|          3 | Charlie Patel  | charlie@email.com | 789 Kalawad Road, Rajkot  |
|          4 | David Miller   | david@email.com   | 101 Race Course, Vadodara |
|          5 | Emma Watson    | emma@email.com    | 202 Satellite, Ahmedabad  |
+------------+----------------+-------------------+---------------------------+
5 rows in set (0.005 sec)

mysql> UPDATE Customers
    -> SET Address = '555 New CG Road, Ahmedabad'
    -> WHERE CustomerID = 1;
Query OK, 1 row affected (0.118 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM Customers
    -> WHERE CustomerID = 5;
Query OK, 1 row affected (0.125 sec)

mysql> SELECT * FROM Customers WHERE Name LIKE 'Alice%';
+------------+----------------+-----------------+----------------------------+
| CustomerID | Name           | Email           | Address                    |
+------------+----------------+-----------------+----------------------------+
|          1 | Alice Johnston | alice@email.com | 555 New CG Road, Ahmedabad |
+------------+----------------+-----------------+----------------------------+
1 row in set (0.006 sec)

mysql> CREATE TABLE Orders (
    ->     OrderID INT PRIMARY KEY AUTO_INCREMENT,
    ->     CustomerID INT,
    ->     OrderDate DATE,
    ->     TotalAmount INT,
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
    -> );
Query OK, 0 rows affected (0.959 sec)

mysql> INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
    -> (1, '2026-10-15', 1500),
    -> (2, '2026-11-01', 2400),
    -> (3, '2026-11-04', 600),
    -> (1, '2026-11-05', 3500),
    -> (4, '2026-10-20', 1200);
Query OK, 5 rows affected (0.171 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Orders WHERE CustomerID = 1;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2026-10-15 |        1500 |
|       4 |          1 | 2026-11-05 |        3500 |
+---------+------------+------------+-------------+
2 rows in set (0.007 sec)

mysql> UPDATE Orders SET TotalAmount = 1800 WHERE OrderID = 1;
Query OK, 1 row affected (0.110 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM Orders WHERE OrderID = 5;
Query OK, 1 row affected (0.105 sec)

mysql> SELECT * FROM Orders WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2026-10-15 |        1800 |
|       2 |          2 | 2026-11-01 |        2400 |
|       3 |          3 | 2026-11-04 |         600 |
|       4 |          1 | 2026-11-05 |        3500 |
+---------+------------+------------+-------------+
4 rows in set (0.098 sec)

mysql> SELECT
    ->     MAX(TotalAmount) AS HighestAmount,
    ->     MIN(TotalAmount) AS LowestAmount,
    ->     AVG(TotalAmount) AS AverageAmount
    -> FROM Orders;
+---------------+--------------+---------------+
| HighestAmount | LowestAmount | AverageAmount |
+---------------+--------------+---------------+
|          3500 |          600 |     2075.0000 |
+---------------+--------------+---------------+
1 row in set (0.013 sec)

mysql> CREATE TABLE Products (
    ->     ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ->     ProductName VARCHAR(100) NOT NULL,
    ->     Price INT NOT NULL,
    ->     Stock INT NOT NULL
    -> );
Query OK, 0 rows affected (0.388 sec)

mysql> INSERT INTO Products (ProductName, Price, Stock) VALUES
    -> ('Wireless Mouse', 600, 50),
    -> ('Mechanical Keyboard', 2500, 15),
    -> ('Gaming Headset', 1800, 0),
    -> ('USB-C Hub', 450, 30),
    -> ('Bluetooth Speaker', 1200, 25);
Query OK, 5 rows affected (0.150 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Products ORDER BY Price DESC;
+-----------+---------------------+-------+-------+
| ProductID | ProductName         | Price | Stock |
+-----------+---------------------+-------+-------+
|         2 | Mechanical Keyboard |  2500 |    15 |
|         3 | Gaming Headset      |  1800 |     0 |
|         5 | Bluetooth Speaker   |  1200 |    25 |
|         1 | Wireless Mouse      |   600 |    50 |
|         4 | USB-C Hub           |   450 |    30 |
+-----------+---------------------+-------+-------+
5 rows in set (0.012 sec)

mysql> UPDATE Products SET Price = 650 WHERE ProductID = 1;
Query OK, 1 row affected (0.101 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM Products WHERE Stock = 0;
Query OK, 1 row affected (0.097 sec)

mysql> SELECT * FROM Products WHERE Price BETWEEN 500 AND 2000;
+-----------+-------------------+-------+-------+
| ProductID | ProductName       | Price | Stock |
+-----------+-------------------+-------+-------+
|         1 | Wireless Mouse    |   650 |    50 |
|         5 | Bluetooth Speaker |  1200 |    25 |
+-----------+-------------------+-------+-------+
2 rows in set (0.085 sec)

mysql> SELECT
    ->     MAX(Price) AS MostExpensive,
    ->     MIN(Price) AS Cheapest
    -> FROM Products;
+---------------+----------+
| MostExpensive | Cheapest |
+---------------+----------+
|          2500 |      450 |
+---------------+----------+
1 row in set (0.012 sec)

mysql> CREATE TABLE OrderDetails (
    ->     OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    ->     OrderID INT,
    ->     ProductID INT,
    ->     Quantity INT NOT NULL,
    ->     SubTotal INT NOT NULL,
    ->     FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    ->     FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
    -> );
Query OK, 0 rows affected (0.879 sec)

mysql> INSERT INTO OrderDetails (OrderID, ProductID, Quantity, SubTotal) VALUES
    -> (1, 1, 2, 1200),
    -> (1, 4, 1, 450),
    -> (2, 2, 1, 2500),
    -> (3, 1, 1, 600),
    -> (4, 5, 2, 2400);
Query OK, 5 rows affected (0.128 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM OrderDetails WHERE OrderID = 1;
+---------------+---------+-----------+----------+----------+
| OrderDetailID | OrderID | ProductID | Quantity | SubTotal |
+---------------+---------+-----------+----------+----------+
|             1 |       1 |         1 |        2 |     1200 |
|             2 |       1 |         4 |        1 |      450 |
+---------------+---------+-----------+----------+----------+
2 rows in set (0.008 sec)

mysql> SELECT SUM(SubTotal) AS TotalRevenue FROM OrderDetails;
+--------------+
| TotalRevenue |
+--------------+
|         7150 |
+--------------+
1 row in set (0.007 sec)

mysql> SELECT ProductID, SUM(Quantity) AS TotalQuantityOrdered
    -> FROM OrderDetails
    -> GROUP BY ProductID
    -> ORDER BY TotalQuantityOrdered DESC
    -> LIMIT 3;
+-----------+----------------------+
| ProductID | TotalQuantityOrdered |
+-----------+----------------------+
|         1 |                    3 |
|         5 |                    2 |
|         2 |                    1 |
+-----------+----------------------+
3 rows in set (0.077 sec)

mysql> SELECT COUNT(*) AS TimesSold FROM OrderDetails WHERE ProductID = 1;
+-----------+
| TimesSold |
+-----------+
|         2 |
+-----------+
1 row in set (0.007 sec)

mysql>