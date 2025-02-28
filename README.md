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


### 👥 Members Table (`members`)

| Column      | Type          | Description                  |
|------------|--------------|------------------------------|
| member_id  | INT (PK)     | Unique member identifier     |
| name       | VARCHAR(255) | Member's full name          |
| email      | VARCHAR(255) UNIQUE | Member's email  |
| phone      | VARCHAR(15)  | Contact number              |
| join_date  | DATE         | Date when the member joined |

### 🔄 Borrowed Books Table (`borrowed_books`)

| Column      | Type        | Description                              |
|------------|------------|------------------------------------------|
| borrow_id  | INT (PK)   | Unique borrow transaction ID             |
| book_id    | INT (FK)   | ID of the borrowed book (from `books`)   |
| member_id  | INT (FK)   | ID of the borrowing member (from `members`) |
| borrow_date| DATE       | Date when the book was borrowed          |
| return_date| DATE       | Expected return date                     |
| status     | ENUM       | `borrowed` or `returned`                 |

### 👨‍💼 Staff Table (`staff`)

| Column    | Type          | Description                      |
|----------|--------------|----------------------------------|
| staff_id | INT (PK)     | Unique staff identifier         |
| name     | VARCHAR(255) | Staff member’s name            |
| email    | VARCHAR(255) UNIQUE | Email for login |
| password | VARCHAR(255) | Hashed password for security   |
| role     | ENUM        | `admin` or `librarian`          |

---

## 📂 SQL Queries

### 📌 Show All Tables
```sql
SHOW TABLES;
```

### 📌 Retrieve All Books
```sql
SELECT * FROM books;
```

### 📌 List Borrowed Books
```sql
SELECT b.title, m.name, bb.borrow_date, bb.return_date, bb.status
FROM borrowed_books bb
JOIN books b ON bb.book_id = b.book_id
JOIN members m ON bb.member_id = m.member_id;
```

### 📌 Get All Staff Members
```sql
SELECT name, email, role FROM staff;
```

---

## 📊 Exploratory Data Analysis (EDA)

### Example Queries for EDA:

📌 **Find the Most Borrowed Books:**
```sql
SELECT b.title, COUNT(bb.book_id) AS borrow_count
FROM borrowed_books bb
JOIN books b ON bb.book_id = b.book_id
GROUP BY b.title
ORDER BY borrow_count DESC;
```

📌 **Check Active Borrowed Books:**
```sql
SELECT * FROM borrowed_books WHERE status = 'borrowed';
```

📌 **Find Books that Were Never Borrowed:**
```sql
SELECT title FROM books
WHERE book_id NOT IN (SELECT book_id FROM borrowed_books);
```

---

## 🚀 How to Use the Database

### 1️⃣ Setup MySQL Database
1. Install **MySQL** on your system.
2. Open MySQL and create a database:
   ```sql
   CREATE DATABASE DekutLibrarySystem;
   USE DekutLibrarySystem;
   ```

### 2️⃣ Run the SQL File
- Copy and execute the provided SQL script to create tables and insert sample data.

### 3️⃣ Start Running Queries
- Use the queries provided to fetch book, member, and borrowing records.
- Modify or add new queries based on your needs.

---

## 🛠️ Setting Up GitHub Repository

### 1️⃣ Initialize Git
```bash
git init
```

### 2️⃣ Add Remote Repository
```bash
git remote add origin https://github.com/your-username/DekutLibrarySystem.git
```

### 3️⃣ Create and Push README.md
```bash
echo "# Dekut Library Management System" > README.md
git add README.md
git commit -m "Added detailed README"
git push origin main
```

### 4️⃣ Push Entire Project
```bash
git add .
git commit -m "Initial project setup"
git push origin main
```
---

## 🔗 Contributing

Want to contribute? Follow these steps:

1. **Fork** the repository.
2. **Clone** your forked repo:
   ```bash
   git clone https://github.com/your-username/DekutLibrarySystem.git
   ```
3. **Create a new branch:**
   ```bash
   git checkout -b feature-branch
   ```
4. **Make changes and commit:**
   ```bash
   git add .
   git commit -m "Added a new feature"
   ```
5. **Push changes and create a pull request:**
   ```bash
   git push origin feature-branch
   ```

---



