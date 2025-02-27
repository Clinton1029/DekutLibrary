-- Books Table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    isbn VARCHAR(20) UNIQUE,
    quantity INT DEFAULT 1,
    added_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



-- Borrowed Books Table
CREATE TABLE borrowed_books (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    borrow_date DATE NOT NULL,
    return_date DATE NOT NULL,
    status ENUM('borrowed', 'returned') DEFAULT 'borrowed',
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE CASCADE
);


-- Staff Table
CREATE TABLE staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'librarian') DEFAULT 'librarian'
);

SHOW TABLES;




INSERT INTO Books (book_id, title, author, genre, isbn, quantity, added_date) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', '9780743273565', 5, '2024-01-01'),
(2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', '9780061120084', 8, '2024-01-02'),
(3, '1984', 'George Orwell', 'Dystopian', '9780451524935', 10, '2024-01-03'),
(4, 'Pride and Prejudice', 'Jane Austen', 'Romance', '9780141439518', 7, '2024-01-04'),
(5, 'Moby-Dick', 'Herman Melville', 'Adventure', '9781503280786', 6, '2024-01-05'),
(6, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', '9780316769488', 9, '2024-01-06'),
(7, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', '9780618640157', 4, '2024-01-07'),
(8, 'Harry Potter and the Sorcerer’s Stone', 'J.K. Rowling', 'Fantasy', '9780590353427', 12, '2024-01-08'),
(9, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', '9780345339683', 6, '2024-01-09'),
(10, 'Brave New World', 'Aldous Huxley', 'Dystopian', '9780060850524', 7, '2024-01-10'),
(11, 'Crime and Punishment', 'Fyodor Dostoevsky', 'Classic', '9780486415871', 5, '2024-01-11'),
(12, 'The Alchemist', 'Paulo Coelho', 'Philosophy', '9780061122415', 8, '2024-01-12'),
(13, 'War and Peace', 'Leo Tolstoy', 'Historical Fiction', '9780199232765', 6, '2024-01-13'),
(14, 'The Shining', 'Stephen King', 'Horror', '9780307743657', 9, '2024-01-14'),
(15, 'The Da Vinci Code', 'Dan Brown', 'Thriller', '9780307474278', 7, '2024-01-15'),
(16, 'A Game of Thrones', 'George R.R. Martin', 'Fantasy', '9780553593716', 10, '2024-01-16'),
(17, 'The Hunger Games', 'Suzanne Collins', 'Science Fiction', '9780439023481', 12, '2024-01-17'),
(18, 'Percy Jackson & The Olympians: The Lightning Thief', 'Rick Riordan', 'Fantasy', '9780786838653', 11, '2024-01-18'),
(19, 'The Maze Runner', 'James Dashner', 'Science Fiction', '9780385737951', 7, '2024-01-19'),
(20, 'Dune', 'Frank Herbert', 'Science Fiction', '9780441172719', 5, '2024-01-20');


INSERT INTO members (member_id, name, email, phone, join_date) VALUES
(101, 'John Doe', 'johndoe101@gmail.com', '0712345678', '2023-01-05'),
(102, 'Jane Smith', 'janesmith102@gmail.com', '0722345678', '2023-01-06'),
(103, 'Robert Brown', 'robertbrown103@gmail.com', '0732345678', '2023-01-07'),
(104, 'Emily Johnson', 'emilyjohnson104@gmail.com', '0742345678', '2023-01-08'),
(105, 'Michael Wilson', 'michaelwilson105@gmail.com', '0752345678', '2023-01-09'),
(106, 'Sarah Thompson', 'sarahthompson106@gmail.com', '0762345678', '2023-01-10'),
(107, 'David Martinez', 'davidmartinez107@gmail.com', '0772345678', '2023-01-11'),
(108, 'Emma Garcia', 'emmagarcia108@gmail.com', '0782345678', '2023-01-12'),
(109, 'James Anderson', 'jamesanderson109@gmail.com', '0792345678', '2023-01-13'),
(110, 'Olivia Clark', 'oliviaclark110@gmail.com', '0711345678', '2023-01-14'),
(111, 'Daniel Lewis', 'daniellewis111@gmail.com', '0721345678', '2023-01-15'),
(112, 'Sophia Walker', 'sophiawalker112@gmail.com', '0731345678', '2023-01-16'),
(113, 'Benjamin Hall', 'benjaminhall113@gmail.com', '0741345678', '2023-01-17'),
(114, 'Ava Young', 'avayoung114@gmail.com', '0751345678', '2023-01-18'),
(115, 'William Allen', 'williamallen115@gmail.com', '0761345678', '2023-01-19'),
(116, 'Mia King', 'miaking116@gmail.com', '0771345678', '2023-01-20'),
(117, 'Alexander Wright', 'alexanderwright117@gmail.com', '0781345678', '2023-01-21'),
(118, 'Isabella Scott', 'isabellascott118@gmail.com', '0791345678', '2023-01-22'),
(119, 'Ethan Green', 'ethangreen119@gmail.com', '0712345679', '2023-01-23'),
(120, 'Charlotte Baker', 'charlottebaker120@gmail.com', '0722345679', '2023-01-24');
 

INSERT INTO borrowed_books (book_id, member_id, borrow_date, return_date, status) VALUES
(1, 101, '2024-01-05', '2024-01-15', 'returned'),
(2, 102, '2024-01-07', '2024-01-17', 'returned'),
(3, 103, '2024-01-10', '2024-01-20', 'borrowed'),
(4, 104, '2024-01-12', '2024-01-22', 'returned'),
(5, 105, '2024-01-14', '2024-01-24', 'borrowed'),
(6, 106, '2024-01-15', '2024-01-25', 'returned'),
(7, 107, '2024-01-17', '2024-01-27', 'borrowed'),
(8, 108, '2024-01-18', '2024-01-28', 'returned'),
(9, 109, '2024-01-20', '2024-01-30', 'borrowed'),
(10, 110, '2024-01-22', '2024-02-01', 'returned'),
(11, 111, '2024-01-23', '2024-02-02', 'borrowed'),
(12, 112, '2024-01-24', '2024-02-03', 'returned'),
(13, 113, '2024-01-25', '2024-02-04', 'borrowed'),
(14, 114, '2024-01-26', '2024-02-05', 'returned'),
(15, 115, '2024-01-27', '2024-02-06', 'borrowed'),
(16, 116, '2024-01-28', '2024-02-07', 'returned'),
(17, 117, '2024-01-29', '2024-02-08', 'borrowed'),
(18, 118, '2024-01-30', '2024-02-09', 'returned'),
(19, 119, '2024-02-01', '2024-02-11', 'borrowed'),
(20, 120, '2024-02-02', '2024-02-12', 'returned');



INSERT INTO staff (name, email, password, role) VALUES
('Alice Johnson', 'alice.johnson@gmail.com', 'password123', 'admin'),
('Bob Smith', 'bob.smith@gmail.com', 'securepass', 'librarian'),
('Charlie Brown', 'charlie.brown@gmail.com', 'libpass1', 'librarian'),
('Diana Roberts', 'diana.roberts@gmail.com', 'adminpass', 'admin'),
('Edward Wilson', 'edward.wilson@gmail.com', 'staffpass', 'librarian'),
('Fiona Clark', 'fiona.clark@gmail.com', 'libsecure', 'librarian'),
('George Miller', 'george.miller@gmail.com', 'georgepass', 'librarian'),
('Helen Adams', 'helen.adams@gmail.com', 'helen123', 'librarian'),
('Ian Thomas', 'ian.thomas@gmail.com', 'ianpass', 'librarian'),
('Jessica Turner', 'jessica.turner@gmail.com', 'jesspass', 'admin');




-- Exporatory data analysis

show tables;
