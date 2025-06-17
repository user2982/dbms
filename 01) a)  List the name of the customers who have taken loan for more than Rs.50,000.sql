CREATE TABLE Customer (
    Custid INT PRIMARY KEY,
    Custname VARCHAR(100),
    Age INT,
    Phone VARCHAR(15)
);

CREATE TABLE Loan (
    Loanid INT PRIMARY KEY,
    Amount NUMERIC(12, 2),
    Custid INT,
    EMI NUMERIC(10, 2),
    FOREIGN KEY (Custid) REFERENCES Customer(Custid)
);

INSERT INTO Customer (Custid, Custname, Age, Phone) VALUES
(1, 'Amit Sharma', 30, '9876543210'),
(2, 'Neha Verma', 28, '9876501234'),
(3, 'Raj Patel', 35, '9876512345'),
(4, 'Sneha Das', 26, '9876523456'),
(5, 'Anil Kumar', 40, '9876534567');


INSERT INTO Loan (Loanid, Amount, Custid, EMI) VALUES
(101, 75000.00, 1, 2500.00),
(102, 45000.00, 2, 1500.00),
(103, 100000.00, 1, 4000.00),
(104, 30000.00, 3, 1000.00);


SELECT C.Custname
FROM Customer C
JOIN Loan L ON L.Custid = C.Custid
WHERE L.Amount > 50000;
