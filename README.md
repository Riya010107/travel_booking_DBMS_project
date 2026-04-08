# ✈️ Travel Booking System (Flight + Hotel) 

## 📌 Project Description

This project implements a **Travel Booking Database System** that allows users to book **flights and hotels together** under a single booking.

The system is designed using a **relational database model** and demonstrates how multiple services (flight + hotel) can be integrated efficiently.

---

## 🎯 Objectives

* To design a structured **relational database**
* To implement a **multi-service booking system**
* To perform **data retrieval using SQL queries**
* To understand **table relationships and constraints**
* To apply real-world **DBMS concepts**

---

## 🧱 Database Components

### 📊 Tables Used

* **Users** – stores user details
* **Flights** – stores flight information
* **Hotels** – stores hotel details
* **Booking** – main booking record
* **Flight_Booking** – maps bookings to flights
* **Hotel_Booking** – maps bookings to hotels

---

## 🔗 Relationships

* One **User** can make multiple **Bookings**
* One **Booking** can include both:

  * Flight booking
  * Hotel booking
* Linking tables are used to maintain relationships

---

## 🗂️ Project Structure

```
Travel-Booking-DBMS
│
├── README.md
├── schema.sql
├── insert_data.sql
├── queries.sql
├── advanced_queries.sql
├── views.sql
├── procedures.sql
├── triggers.sql
├── transactions.sql
├── indexes.sql
│
├── screenshots/
│     ├── 01_tables.png
│     ├── 02_data.png
│     ├── 03_join_query.png
│     ├── 04_aggregate.png
│
├── er_diagram.png
└── project_report.pdf
```

---

## ⚙️ Technologies Used

* **Database:** MySQL
* **Language:** SQL
* **Tools:** MySQL Workbench / phpMyAdmin
* **Version Control:** Git & GitHub

---

## 🛠️ How to Run the Project

1. Open MySQL Workbench (or any SQL tool)

2. Create a database:

```sql
CREATE DATABASE travel_booking;
USE travel_booking;
```

3. Execute files in order:

* Run `schema.sql`
* Run `insert_data.sql`
* Run `queries.sql`
* Run other files (optional)

---

## 📊 Features

* User management system
* Flight booking
* Hotel booking
* Combined booking system
* Data retrieval using SQL queries
* Multi-table JOIN operations

---

## 🔍 SQL Concepts Used

* SELECT, INSERT
* INNER JOIN, LEFT JOIN
* GROUP BY, HAVING
* Aggregate functions (SUM, AVG, COUNT)
* Subqueries
* Foreign keys
* Constraints

---

## 🚀 Advanced Features

* **Views** – for simplified data access
* **Stored Procedures** – reusable SQL logic
* **Triggers** – automated actions
* **Transactions** – ensure data consistency
* **Indexes** – improve query performance

---

## 💡 Sample Queries

### 🔹 View all users

```sql
SELECT * FROM Users;
```

### 🔹 Get complete booking details

```sql
SELECT u.name, f.airline, f.source, f.destination,
       h.name AS hotel_name, b.total_amount
FROM Booking b
JOIN Users u ON b.user_id = u.user_id
LEFT JOIN Flight_Booking fb ON b.booking_id = fb.booking_id
LEFT JOIN Flights f ON fb.flight_id = f.flight_id
LEFT JOIN Hotel_Booking hb ON b.booking_id = hb.booking_id
LEFT JOIN Hotels h ON hb.hotel_id = h.hotel_id;
```

### 🔹 Average flight price

```sql
SELECT AVG(price) FROM Flights;
```

---

## 📸 Screenshots

Screenshots of query outputs are available in the **screenshots/** folder.
They show successful execution of:

* Table creation
* Data insertion
* JOIN queries
* Aggregate queries

---

## 📈 ER Diagram

The ER diagram represents:

* Entities
* Attributes
* Relationships between tables

---

## 📚 Learning Outcomes

* Understanding relational database design
* Writing SQL queries
* Implementing multi-table relationships
* Applying DBMS concepts in real-world scenarios

---

## 🚀 Future Scope

* Add payment integration
* Add cancellation system
* Add real-time booking
* Develop frontend interface (Java/Web)

---

## 👩‍💻 Author

**Riya Sharma**

**10214803124**

**Branch: Information Technology**

---

## 📌 Conclusion

This project demonstrates a **Travel Booking System** that integrates **flight and hotel services** in a single database.
It highlights the importance of **DBMS in managing complex real-world applications efficiently**.

---
