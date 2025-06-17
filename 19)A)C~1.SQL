CREATE TABLE Bank (
	acc_no VARCHAR(20) PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	balance DECIMAL(10,2) NOT NULL,
	branch VARCHAR(50) NOT NULL	
);

INSERT INTO Bank (acc_no, name, balance, branch) VALUES
('5412345', 'John', 400, 'Mumbai'),
('5412346', 'Smith', 1200, 'Hyderabad'),
('5412347', 'Kevin', 1100, 'Chennai'),
('5412348', 'Thomas', 900, 'Kolkata'),
('5412349', 'Rohit' 300, 'Delhi');

SELECT * FROM Bank;

CREATE OR REPLACE FUNCTION check_balance_notification(p_acc_no VARCHAR)
RETURNS TEXT AS $$
DECLARE
    v_balance NUMERIC(10,2);
    v_name VARCHAR(100);
    v_notification TEXT;
BEGIN
    SELECT balance, name INTO v_balance, v_name
    FROM Bank
    WHERE acc_no = p_acc_no::INTEGER;  -- no typecast here

    IF NOT FOUND THEN
        RETURN 'Error: Account number ' || p_acc_no || ' not found.';
    END IF;
    
    IF v_balance < 500 THEN
        v_notification := 'ALERT: Account holder ' || v_name || 
                         ' (Account: ' || p_acc_no || 
                         ') has a low balance of $' || v_balance || 
                         '. Please deposit funds to maintain minimum balance.';
    ELSE
        v_notification := 'Account status: ' || v_name || 
                         ' (Account: ' || p_acc_no || 
                         ') has a sufficient balance of $' || v_balance || '.';
    END IF;
    
    RETURN v_notification;
END;
$$ LANGUAGE plpgsql;

SELECT check_balance_notification('5412345');
