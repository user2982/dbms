CREATE TABLE Dept (
    Deptno INT PRIMARY KEY,
    Dname VARCHAR(100),
    Loc VARCHAR(100),
    DeptmanagerId INT
);

CREATE TABLE Employee (
    EmpId INT PRIMARY KEY,
    Empname VARCHAR(100),
    Sal NUMERIC(10,2),
    Deptno INT,
    FOREIGN KEY (Deptno) REFERENCES Dept(Deptno)
);

INSERT INTO Dept (Deptno, Dname, Loc, DeptmanagerId) VALUES
(10, 'HR', 'Mumbai', 101),
(20, 'Finance', 'Delhi', 102),
(30, 'IT', 'Bangalore', 103),
(40, 'Marketing', 'Chennai', 104);

INSERT INTO Employee (EmpId, Empname, Sal, Deptno) VALUES
(101, 'John Doe', 50000.00, 10),
(102, 'Jane Smith', 60000.00, 20),
(103, 'Alice Johnson', 70000.00, 30),
(104, 'Bob Brown', 55000.00, 40),
(105, 'Charlie Davis', 45000.00, 10);

SELECT d.Deptno, d.Dname,
Count(e.Empid), AVG(e.Sal)
FROM Dept d
JOIN Employee e
ON d.Deptno = e.Deptno
GROUP BY d.Deptno, e.Deptno;
