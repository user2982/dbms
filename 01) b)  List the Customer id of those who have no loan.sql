SELECT C.Custid
FROM Customer C
LEFT JOIN Loan L ON L.Custid = C.Custid
WHERE L.Amount is NULL;
