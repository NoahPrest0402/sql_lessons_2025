-- Tables!
-- Tables are made up of rows and columns - kind of like spreadsheets
-- Each row is a record - contains information about a single object (eg. one employee)
-- Each column is a type of data (eg. name, date, pay)
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
	employee_id INT,
    first_name VARCHAR(50), /* we want this to be a string, but SQL has 2 text types: char and varchar */
	last_name VARCHAR(50),
    hourly_pay DECIMAL(5,2), -- the 5 means 5 digits, the 2 means that 2 are right of the decimal point -999.99 - 999.99
	hire_date DATE
)

-- insert a record to see what it looks like:
INSERT INTO employees VALUES (0, "Noah", "Prest", 1.18, "2025-10-14");

-- have a look at our table:
SELECT * FROM employees;

-- renaming the table:
RENAME TABLE employees TO suckas;
RENAME TABLE suckas TO employees;

-- altering a table to have another column
ALTER TABLE employees ADD phone_number VARCHAR(15)

-- alter table column name
ALTER TABLE employees RENAME COLUMN phone_number TO email;

-- change a columns datatype
ALTER TABLE employees MODIFY COLUMN email VARCHAR(100);

-- moving a columns position
ALTER TABLE employees MODIFY COLUMN email VARCHAR(100) FIRST /*AFTER last_name*/;

-- remove a column
ALTER TABLE employees DROP COLUMN email;