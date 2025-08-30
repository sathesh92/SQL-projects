CREATE OR REPLACE FUNCTION get_balance(acc_id INT)
RETURNS DECIMAL(10,2) AS $$
DECLARE
    bal DECIMAL(10,2);
BEGIN
    SELECT balance INTO bal FROM Accounts WHERE account_id = acc_id;
    RETURN bal;
END;
$$ LANGUAGE plpgsql;
