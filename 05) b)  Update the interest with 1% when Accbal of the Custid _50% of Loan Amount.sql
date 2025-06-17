UPDATE Loan L
SET Interest = Interest + 1
WHERE L.Custid IN (
    SELECT A.Custid
    FROM Account A
    JOIN Loan L2 ON A.Custid = L2.Custid
    WHERE A.Accbal > 0.5 * L2.Amount
);
