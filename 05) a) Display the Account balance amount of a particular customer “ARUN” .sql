-- Customer Table
CREATE TABLE Customer (
    Custid INT PRIMARY KEY,
    Custname VARCHAR(100) NOT NULL,
    Addr TEXT,
    phno VARCHAR(15),
    panno VARCHAR(20) UNIQUE
);

-- Loan Table
CREATE TABLE Loan (
    Loanid INT PRIMARY KEY,
    Amount DECIMAL(12, 2),
    Interest DECIMAL(5, 2),
    Custid INT,
    FOREIGN KEY (Custid) REFERENCES Customer(Custid)
);

-- Account Table
CREATE TABLE Account (
    Acctno INT PRIMARY KEY,
    Accbal DECIMAL(12, 2),
    Custid INT,
    FOREIGN KEY (Custid) REFERENCES Customer(Custid)
);


-- Inserting sample data into Customer table
INSERT INTO Customer (Custid, Custname, Addr, phno, panno) VALUES
(1, 'Rahul Sharma', 'Delhi', '9876543210', 'ABCDE1234F'),
(2, 'Anita Mehra', 'Mumbai', '9988776655', 'PQRSX5678L'),
(3, 'Suresh Kumar', 'Chennai', '9123456780', 'LMNOP9876Z'),
(4, 'ARUN', 'Bangalore', '9132487534', 'HBNP0920B');

-- Inserting sample data into Loan table
INSERT INTO Loan (Loanid, Amount, Interest, Custid) VALUES
(101, 500000.00, 7.5, 1),
(102, 250000.00, 8.0, 2),
(103, 300000.00, 6.5, 1);

-- Inserting sample data into Account table
INSERT INTO Account (Acctno, Accbal, Custid) VALUES
(201, 150000.00, 1),
(202, 300000.00, 2),
(203, 50000.00, 3);

SELECT A.Accbal
FROM Account A
JOIN Customer C ON A.Custid = C.Custid
WHERE C.Custname = 'ARUN';
