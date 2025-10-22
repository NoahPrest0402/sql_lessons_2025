/* Primary Keys */
-- 2 Big Rules
-- 1. Every value is unique in the column
-- 2. No value is null

DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions (
	transaction_id INT PRIMARY KEY,
    amount DECIMAL(5,2)
);

INSERT INTO transactions (transaction_id, amount) VALUES (101, 5.67);

-- null values not supported for pk
-- INSERT INTO transactions (transaction_id, amount) VALUES (null, 5.67);

/* Auto Increment */
DROP TABLE transactions;
CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5,2)
);
-- with auto increment, we can ignore the id for standard inserts
INSERT INTO transactions (amount) VALUES (5.99);
SELECT * FROM transactions;

-- set auto increment to start at 1000
ALTER TABLE transactions AUTO_INCREMENT = 1000;

/* Foreign Keys */
-- What are foreign keys?
-- They create a link between tables
-- They help to prevent storing invalid or redundant data

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
	customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO  customers VALUES 
(1, "Thomas", "Carpenter"),
(2, "Coby", "Hughes"),
(3, "Jordan", "Klemm"),
(4, "Dakota", "Kuhn");

DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY,
    amount DECIMAL(5,2),
    customer_id INT,
    -- Important bit:
    FOREIGN KEY (customer_id) references customers(customer_id) -- references a column in another table table(column)
);

INSERT INTO transactions VALUES (1, 5.67, 3), (2, 8.99, 4);

SELECT * FROM transactions;

-- try to insert a value for the fk that doesn't exist
INSERT INTO transactions VALUES (3, 87.00, 99);
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails