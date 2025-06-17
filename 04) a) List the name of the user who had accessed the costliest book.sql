CREATE TABLE Book (
    Bookid INT PRIMARY KEY,
    Book_name VARCHAR(100),
    Author VARCHAR(100),
    Publication VARCHAR(100),
    Price DECIMAL(8, 2)
);

CREATE TABLE UserT (
    Userid INT PRIMARY KEY,
    Name VARCHAR(100),
    Dept VARCHAR(50),
    Bookid INT,
    Accdate DATE,
    FOREIGN KEY (Bookid) REFERENCES Book(Bookid)
);

INSERT INTO Book (Bookid, Book_name, Author, Publication, Price) VALUES
(101, 'Database Systems', 'C.J. Date', 'Pearson', 550.00),
(102, 'Operating Systems', 'Silberschatz', 'Wiley', 670.50),
(103, 'Computer Networks', 'Tanenbaum', 'Pearson', 720.00),
(104, 'Data Structures', 'Seymour Lipschutz', 'McGraw-Hill', 430.75);

INSERT INTO UserT (Userid, Name, Dept, Bookid, Accdate) VALUES
(1, 'Sanfeer', 'CSE', 101, '2025-06-10'),
(2, 'Aisha', 'IT', 102, '2025-06-11'),
(3, 'Rahul', 'ECE', 103, '2025-06-12'),
(4, 'Meera', 'CSE', 104, '2025-06-13');

SELECT u.Name
FROM UserT u
JOIN Book b ON u.Bookid = b.Bookid
WHERE b.Price = (SELECT MAX(Price) FROM Book);
