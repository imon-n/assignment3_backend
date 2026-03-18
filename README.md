# Vehicle Rental System - SQL Assignment

## 📌 Project Overview
This project is a simple Vehicle Rental System database designed using SQL.  
It demonstrates table creation, relationships, and different SQL queries like JOIN, EXISTS, WHERE, and GROUP BY.

---

## 🗂️ Database Tables
- Users
- Vehicles
- Bookings

These tables are connected using primary keys and foreign keys.

---

## 🔗 Relationships
- One user can have multiple bookings
- One vehicle can have multiple bookings
- Bookings table connects Users and Vehicles

---

## 🧠 Queries Implemented

### 1. JOIN Query
Retrieve booking details with customer and vehicle name.

### 2. EXISTS Query
Find vehicles that have never been booked.

### 3. WHERE Query
Find available vehicles of a specific type (car).

### 4. GROUP BY & HAVING
Count bookings per vehicle and show those with more than 2 bookings.

---

## 🚀 How to Run
1. Create database
2. Run `queries.sql`
3. Execute queries

---

## 📁 Files Included
- queries.sql
- README.md
