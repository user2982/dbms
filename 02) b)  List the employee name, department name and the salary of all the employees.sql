SELECT e.Empname, e.Sal,
d.Dname
FROM Employee e
JOIN Dept d
ON e.Deptno = d.Deptno;
