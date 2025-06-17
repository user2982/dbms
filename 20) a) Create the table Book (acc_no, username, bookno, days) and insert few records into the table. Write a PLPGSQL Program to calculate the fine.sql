CREATE TABLE Book(
	acc_no INT,
	username VARCHAR(50),
	bookno 	INT,
	days INT
);

INSERT INTO Book (acc_no, username, bookno, days) VALUES
(101, 'John', 1, 3),
(102, 'Jane', 2, 5),
(103, 'Jilli', 3, 0),
(104, 'Alex', 4, 2);

DO $$
DECLARE
	input_acc INT := 101;
	fine INT;
	overdue_days INT;
BEGIN
	SELECT days INTO overdue_days
	FROM Book WHERE acc_no = input_acc;
	fine := overdue_days * 5;
	RAISE NOTICE 'FINE for account % is Rs %', input_acc, fine;
END $$;
