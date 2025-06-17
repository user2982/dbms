SELECT e.Empname,
m.Empname
FROM Employee e
JOIN Dept d
ON e.Deptno = d.Deptno
JOIN Employee m
ON d.deptmanagerId = m.EmpId;
