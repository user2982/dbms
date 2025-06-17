ALTER TABLE Book ADD COLUMN created_at DATE;

UPDATE Book SET created_at = '2024-06-16' WHERE acc_no = 101;
UPDATE Book SET created_at = '2024-06-14' WHERE acc_no = 102;
UPDATE Book SET created_at = '2024-05-17' WHERE acc_no = 103;
UPDATE Book SET created_at = '2024-06-15' WHERE acc_no = 104;


SELECT username, acc_no
FROM Book
WHERE EXTRACT(DAY FROM created_at) > 15;
