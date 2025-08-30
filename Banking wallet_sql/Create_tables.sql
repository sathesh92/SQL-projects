CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Accounts (
    account_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customers(customer_id),
    account_type VARCHAR(20) CHECK (account_type IN ('SAVINGS','CURRENT')),
    balance DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE Transactions (
    transaction_id SERIAL PRIMARY KEY,
    account_id INT REFERENCES Accounts(account_id),
    transaction_type VARCHAR(20) CHECK (transaction_type IN ('DEPOSIT','WITHDRAW')),
    amount DECIMAL(10,2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
