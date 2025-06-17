CREATE OR REPLACE PROCEDURE GetLoanDetails(p_Loanid INT)
LANGUAGE plpgsql
AS $$
DECLARE
	v_amount NUMERIC;
	v_custid INT;
BEGIN
    SELECT Amount, Custid INTO v_amount, v_custid
    FROM Loan
    WHERE Loanid = p_Loanid;

	RAISE NOTICE 'Amount = %, Custid = %', v_amount, v_custid;
END;
$$;

CALL GetLoanDetails(101); 
