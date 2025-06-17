
CREATE OR REPLACE PROCEDURE getSalary(p_Empid INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_salary NUMERIC;
BEGIN
    SELECT Sal INTO v_salary
    FROM Employee
    WHERE EmpId = p_Empid;

    RAISE NOTICE 'Salary: %', v_salary;
END;
$$;

CALL getSalary(101);
