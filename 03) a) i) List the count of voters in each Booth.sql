CREATE TABLE Booth(
	BoothId INT PRIMARY KEY,
	Loc VARCHAR(50),
	BIncharge VARCHAR(50)
);

CREATE TABLE Voter (
	VoterId INT PRIMARY KEY,
	Votername VARCHAR(50),
	Gender VARCHAR(10),
	BoothId INT,
	Checkvote INT,
	FOREIGN KEY (BoothId) REFERENCES Booth(BoothId)
);

INSERT INTO Booth (BoothId, Loc, BIncharge) VALUES
(101, 'Green Park', 'Mr. Sharma'),
(102, 'City Hall', 'Mrs. Rani'),
(103, 'Community Center', 'Mr. Patel');

INSERT INTO Voter (VoterId, VoterName, Gender, BoothId, CheckVote) VALUES
(1, 'Rahul Kumar', 'M', 101, 1),
(2, 'Anjali Mehta', 'F', 102, 0),
(3, 'Suresh Das', 'M', 101, 1),
(4, 'Fatima Banu', 'F', 103, 0),
(5, 'John Dsouza', 'M', 102, 1);

SELECT b.BoothId,
b.Loc, COUNT(v.VoterId)
FROM Booth b
LEFT JOIN Voter v
ON b.BoothId = v.BoothId
GROUP BY
	b.BoothId, b.Loc;
