# 📊 Data Dictionary - Travel Booking System

This document describes the structure of all tables used in the database.

---

## 1. Users Table

| Column Name | Data Type | Description |
|------------|----------|------------|
| user_id | INT (PK) | Unique ID of user |
| name | VARCHAR | Name of the user |
| email | VARCHAR | Email address |
| phone | VARCHAR | Contact number |

---

## 2. Flights Table

| Column Name | Data Type | Description |
|------------|----------|------------|
| flight_id | INT (PK) | Unique flight ID |
| airline | VARCHAR | Airline name |
| source | VARCHAR | Departure city |
| destination | VARCHAR | Arrival city |
| departure_time | DATETIME | Flight departure time |
| arrival_time | DATETIME | Flight arrival time |
| price | DECIMAL | Ticket price |

---

## 3. Hotels Table

| Column Name | Data Type | Description |
|------------|----------|------------|
| hotel_id | INT (PK) | Unique hotel ID |
| name | VARCHAR | Hotel name |
| location | VARCHAR | City/location |
| rating | DECIMAL | Hotel rating |
| price_per_night | DECIMAL | Cost per night |

---

## 4. Booking Table

| Column Name | Data Type | Description |
|------------|----------|------------|
| booking_id | INT (PK) | Unique booking ID |
| user_id | INT (FK) | Linked user |
| booking_date | DATE | Date of booking |
| total_amount | DECIMAL | Total cost |

---

## 5. Flight_Booking Table

| Column Name | Data Type | Description |
|------------|----------|------------|
| booking_id | INT (FK) | Linked booking |
| flight_id | INT (FK) | Linked flight |
| seat_number | VARCHAR | Seat assigned |

---

## 6. Hotel_Booking Table

| Column Name | Data Type | Description |
|------------|----------|------------|
| booking_id | INT (FK) | Linked booking |
| hotel_id | INT (FK) | Linked hotel |
| check_in | DATE | Check-in date |
| check_out | DATE | Check-out date |

---

## 🔑 Key Notes

- PK = Primary Key  
- FK = Foreign Key  
- Tables are linked using foreign keys to maintain relationships  

---
