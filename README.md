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
