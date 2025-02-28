# 📚 Dekut Library Management System

*A MySQL-based system for managing books, members, staff, and borrowing transactions in a library.*

--- 

## 📖 Project Overview

The **Dekut Library Management System** is designed to efficiently handle the operations of a library. It allows users to:

- ✅ Add and manage books
- ✅ Register and track members
- ✅ Handle book borrowing and returns
- ✅ Manage staff with different roles (Admins, Librarians)

This system ensures structured, well-maintained, and easily accessible records for a modern library.

---

## 🛠️ Features

### 📌 Book Management
- Store book details such as **title, author, genre, ISBN, and quantity**.
- Track book availability using the **quantity** column.
- Automatically store **timestamps** when books are added.

### 📌 Member Management
- Add members with details such as **name, email, phone, and join date**.
- Ensure data integrity with **unique email validation**.

### 📌 Borrow & Return System
- Track **borrowed books** and their **due dates**.
- Update book status when **returned**.
- Automatically update availability when a book is borrowed.

### 📌 Staff Management
- Add and manage **librarians and admins**.
- Securely store **hashed passwords**.

### 📌 Data Integrity & Constraints
- **Foreign key constraints** ensure valid borrow transactions.
- **On Delete Cascade** removes dependent records automatically.

---
## 🗂️ Database Schema

### 📘 Books Table (`books`)

| Column      | Type           | Description                    |
|------------|--------------|--------------------------------|
| book_id    | INT (PK)      | Unique book identifier        |
| title      | VARCHAR(255)  | Book title                    |
| author     | VARCHAR(255)  | Book author                   |
| genre      | VARCHAR(100)  | Genre of the book             |
| isbn       | VARCHAR(20) UNIQUE | Unique book ISBN code |
| quantity   | INT DEFAULT 1 | Number of copies available    |
| added_date | TIMESTAMP     | Date the book was added       |
