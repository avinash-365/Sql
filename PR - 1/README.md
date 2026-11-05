# 🛒 E-Commerce Database Management System (DBMS)

![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![Database](https://img.shields.io/badge/Database-Relational-success?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

## 📖 Project Overview
This project demonstrates a fully functional **Relational Database Management System (RDBMS)** designed for an E-Commerce platform using **MySQL**. The script establishes a foundational database named `PROJECT1` and structures it to handle core business operations, including customer management, inventory tracking, order processing, and detailed sales analytics.

The database enforces data integrity using **Primary Keys**, **Foreign Keys**, and `ON DELETE CASCADE` relationships, ensuring seamless data synchronization across multiple tables.

---

## 🏗️ Database Architecture & Schema

The database consists of four highly normalized tables that interact with each other to track the complete lifecycle of a customer order.

### 1. `Customers` Table
Manages customer profiles and contact information.
* **CustomerID** (INT) - 🔑 Primary Key, Auto Increment
* **Name** (VARCHAR) - Full name of the customer
* **Email** (VARCHAR) - 🔒 Unique identifier for contact
* **Address** (VARCHAR) - Delivery address

### 2. `Products` Table
Serves as the inventory management system.
* **ProductID** (INT) - 🔑 Primary Key, Auto Increment
* **ProductName** (VARCHAR) - Display name of the product
* **Price** (INT) - Current retail price
* **Stock** (INT) - Available inventory count

### 3. `Orders` Table
Tracks the high-level details of customer purchases.
* **OrderID** (INT) - 🔑 Primary Key, Auto Increment
* **CustomerID** (INT) - 🔗 Foreign Key (References `Customers`)
* **OrderDate** (DATE) - Timestamp of purchase
* **TotalAmount** (INT) - Gross order value

### 4. `OrderDetails` Table
Acts as a junction table to handle many-to-many relationships between Orders and Products, capturing line-item specifics.
* **OrderDetailID** (INT) - 🔑 Primary Key, Auto Increment
* **OrderID** (INT) - 🔗 Foreign Key (References `Orders`)
* **ProductID** (INT) - 🔗 Foreign Key (References `Products`)
* **Quantity** (INT) - Number of units purchased
* **SubTotal** (INT) - Price * Quantity for the specific line item

---

## 🚀 Key Features & SQL Operations Demonstrated

This project extensively utilizes various SQL commands ranging from basic DDL to complex analytical DQL queries. 

### 🛠️ Data Definition & Manipulation (DDL & DML)
* **Table Creation:** Established schema with strict data types, `NOT NULL` constraints, and cascading foreign keys.
* **Data Insertion:** Bulk inserted realistic dummy data across all four tables.
* **Data Modification:** Updated specific records (e.g., changing a customer's address, updating a product price).
* **Data Deletion:** Safe deletion of records (e.g., removing out-of-stock items, cascading deletions when a customer is removed).

### 📊 Advanced Data Retrieval (DQL)
The script includes powerful queries designed to extract business intelligence:

1. **Pattern Matching:** Filtering customers using `LIKE` clauses (e.g., finding customers named "Alice").
2. **Date Filtering:** Dynamically querying orders placed within the last 30 days using `CURDATE() - INTERVAL 30 DAY`.
3. **Price Range Filtering:** Finding products within a specific price bracket using the `BETWEEN` operator.
4. **Sorting:** Listing inventory items dynamically using `ORDER BY Price DESC`.

### 🧮 Aggregations & Analytics
Built-in aggregate functions are used to generate instant reports:
* **`SUM()`**: Calculating the total overall revenue (`7150`).
* **`MAX()` & `MIN()`**: Identifying the most expensive (`2500`) and cheapest (`450`) products, as well as highest and lowest order values.
* **`AVG()`**: Determining the average order value (`2075`).
* **`COUNT()`**: Tracking how many times a specific product was sold.
* **`GROUP BY` & `LIMIT`**: Identifying the Top 3 highest-selling products by quantity.

---

## 💻 Getting Started

To run this project locally, you will need a MySQL environment (like MySQL Workbench, XAMPP, or the MySQL Command Line Client).

### Installation Steps

1. **Clone the repository** (if applicable) or download the `PROJECT.sql` file.
2. **Open your MySQL terminal** or GUI client.
3. **Execute the script:**
   If you are in the terminal, you can run the following command to execute the entire script at once:
   ```bash
   mysql -u your_username -p < PROJECT.sql
   ```
4. Alternatively, you can log into MySQL and source the file:
   ```sql
   SOURCE /path/to/your/PROJECT.sql;
   ```

---

## 🔍 Example Query: Top Selling Products
Curious about how we extract top-selling products? Here is the query used in the project:

```sql
SELECT ProductID, SUM(Quantity) AS TotalQuantityOrdered
FROM OrderDetails
GROUP BY ProductID
ORDER BY TotalQuantityOrdered DESC
LIMIT 3;
```
**Result:**
| ProductID | TotalQuantityOrdered |
| :---: | :---: |
| 1 | 3 |
| 5 | 2 |
| 2 | 1 |

---

## 🔮 Future Enhancements
While this serves as a solid foundation, future updates could include:
* Adding a `Categories` table to group products.
* Implementing Stored Procedures for complex checkouts.
* Adding Triggers to automatically update product `Stock` when an `Order` is placed.
* Implementing Views for quick daily sales reports.

---
*Created with ❤️ for Database Management and Analytics.*