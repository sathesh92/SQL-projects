\# Banking Wallet System (SQL Project)



This project demonstrates a \*\*mini banking transaction system\*\* using PostgreSQL.  





---



\## Tables



\### Customers

Stores basic customer information.



| Column       | Type         | Description                |

|-------------|-------------|----------------------------|

| customer\_id | SERIAL PK   | Unique ID for each customer |

| name        | VARCHAR     | Customer name              |

| email       | VARCHAR     | Customer email (unique)    |



\### Accounts

Stores account details and balances for customers.



| Column       | Type          | Description                |

|-------------|--------------|----------------------------|

| account\_id  | SERIAL PK    | Unique ID for each account |

| customer\_id | INT FK       | References `Customers`     |

| account\_type| VARCHAR      | e.g., SAVINGS, CURRENT     |

| balance     | DECIMAL(10,2)| Current account balance    |



\### Transactions

Logs all deposits and withdrawals.



| Column           | Type          | Description                    |

|-----------------|--------------|--------------------------------|

| transaction\_id   | SERIAL PK    | Unique transaction ID           |

| account\_id       | INT FK       | References `Accounts`           |

| transaction\_type | VARCHAR      | DEPOSIT or WITHDRAW             |

| amount           | DECIMAL(10,2)| Transaction amount              |

| transaction\_date | TIMESTAMP    | Default CURRENT\_TIMESTAMP       |



---



\## Functions



\### `get\_balance(acc\_id INT)`

Returns the current balance of the specified account.



```sql

SELECT get\_balance(1);



