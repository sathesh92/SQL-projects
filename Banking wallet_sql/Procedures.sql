CREATE OR REPLACE PROCEDURE make_transaction(acc_id INT, trans_type VARCHAR, amt DECIMAL)
LANGUAGE plpgsql
AS $$
BEGIN
    IF trans_type = 'DEPOSIT' THEN
        UPDATE accounts
        SET balance = balance + amt
        WHERE account_id = acc_id;

        INSERT INTO Transactions(account_id, transaction_type, amount)
        VALUES (acc_id, 'DEPOSIT', amt);

    ELSIF trans_type = 'WITHDRAW' THEN
        IF get_balance(acc_id) < amt THEN
            RAISE EXCEPTION 'Insufficient funds!';
        ELSE
            UPDATE accounts
            SET balance = balance - amt
            WHERE account_id = acc_id;

            INSERT INTO Transactions(account_id, transaction_type, amount)
            VALUES (acc_id, 'WITHDRAW', amt);
        END IF;
    END IF;
END;
$$;
