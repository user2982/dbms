-- Create Employee table
CREATE TABLE Employee (
    Id INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    BasicPay DECIMAL(10, 2) NOT NULL,
    DOB DATE,
    Dept VARCHAR(50)
);

-- Insert sample data
INSERT INTO Employee (Id, Name, BasicPay, DOB, Dept) VALUES
(1, 'John Smith', 50000.00, '1985-05-15', 'IT'),
(2, 'Jane Doe', 60000.00, '1990-08-22', 'HR'),
(3, 'Robert Johnson', 75000.00, '1982-11-30', 'Finance'),
(4, 'Emily Davis', 45000.00, '1995-03-10', 'Marketing');

-- Create a function to generate payslip
CREATE OR REPLACE FUNCTION generate_payslip(emp_id INT)
RETURNS TEXT AS $$
DECLARE
    emp_record Employee%ROWTYPE;
    da_percent DECIMAL(5, 2) := 0.12; -- 12% DA
    hra_percent DECIMAL(5, 2) := 0.15; -- 15% HRA
    tax_percent DECIMAL(5, 2) := 0.10; -- 10% Tax
    da_amount DECIMAL(10, 2);
    hra_amount DECIMAL(10, 2);
    gross_pay DECIMAL(10, 2);
    tax_deduction DECIMAL(10, 2);
    net_pay DECIMAL(10, 2);
    payslip TEXT;
BEGIN
    -- Get employee details
    SELECT * INTO emp_record FROM Employee WHERE Id = emp_id;
    
    -- Check if employee exists
    IF NOT FOUND THEN
        RETURN 'Employee with ID ' || emp_id || ' not found.';
    END IF;
    
    -- Calculate components
    da_amount := emp_record.BasicPay * da_percent;
    hra_amount := emp_record.BasicPay * hra_percent;
    gross_pay := emp_record.BasicPay + da_amount + hra_amount;
    tax_deduction := gross_pay * tax_percent;
    net_pay := gross_pay - tax_deduction;
    
    -- Generate payslip
    payslip := '==================================' || E'\n';
    payslip := payslip || '            PAYSLIP          ' || E'\n';
    payslip := payslip || '==================================' || E'\n';
    payslip := payslip || 'Employee ID   : ' || emp_record.Id || E'\n';
    payslip := payslip || 'Name          : ' || emp_record.Name || E'\n';
    payslip := payslip || 'Department    : ' || emp_record.Dept || E'\n';
    payslip := payslip || 'Date of Birth : ' || emp_record.DOB || E'\n';
    payslip := payslip || '----------------------------------' || E'\n';
    payslip := payslip || 'Basic Pay     : ' || TO_CHAR(emp_record.BasicPay, '99,999.99') || E'\n';
    payslip := payslip || 'DA (' || (da_percent*100) || '%)     : ' || TO_CHAR(da_amount, '99,999.99') || E'\n';
    payslip := payslip || 'HRA (' || (hra_percent*100) || '%)    : ' || TO_CHAR(hra_amount, '99,999.99') || E'\n';
    payslip := payslip || '----------------------------------' || E'\n';
    payslip := payslip || 'Gross Pay     : ' || TO_CHAR(gross_pay, '99,999.99') || E'\n';
    payslip := payslip || 'Tax (' || (tax_percent*100) || '%)      : ' || TO_CHAR(tax_deduction, '99,999.99') || E'\n';
    payslip := payslip || '----------------------------------' || E'\n';
    payslip := payslip || 'NET PAY       : ' || TO_CHAR(net_pay, '99,999.99') || E'\n';
    payslip := payslip || '==================================' || E'\n';
    payslip := payslip || 'Generated on: ' || CURRENT_DATE || E'\n';
    
    RETURN payslip;
END;
$$ LANGUAGE plpgsql;

-- Example usage:
SELECT generate_payslip(10);

-- You can also call it from a DO block (main program) like this:
DO $$
DECLARE
    emp_id INT := 2;
    result TEXT;
BEGIN
    result := generate_payslip(emp_id);
    RAISE NOTICE '%', result;
END $$;
