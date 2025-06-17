CREATE OR REPLACE FUNCTION find_greatest_of_three_numbers(n1 INT, n2 INT, n3 INT)
RETURNS INT AS $$
BEGIN
    IF n1 >= n2 AND n1 >= n3 THEN
        RETURN n1;
    ELSIF n2 >= n1 AND n2 >= n3 THEN
        RETURN n2;
    ELSE
        RETURN n3;
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT find_greatest_of_three_numbers(1,2,3);
