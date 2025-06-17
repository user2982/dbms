SELECT Userid, COUNT(Bookid) AS Book_Count
FROM UserT
GROUP BY Userid;
