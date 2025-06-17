CREATE OR REPLACE FUNCTION generate_fibonacci(n integer)
RETURNS TEXT AS $$
DECLARE
	a integer := 0;
	b integer := 1;
	temp integer;
	fibonacci TEXT := '';
BEGIN
	IF n <= 0 THEN
		RETURN fibonacci;
	END IF;

	fibonacci := a::TEXT;

	IF n = 1 THEN
		RETURN fibonacci;
	END IF;

	fibonacci := fibonacci || ', ' || b::TEXT;
	IF n = 2 THEN
		RETURN fibonacci;
	END IF;

	FOR i in 3..n LOOP
		temp := a + b;
		a := b;
		b := temp;
		fibonacci := fibonacci || ', ' || b::TEXT;
	END LOOP

	RETURN fibonacci;

END;
$$ LANGUAGE plpgsql;

SELECT generate_fibonacci(10);
