USE cmp_noprest;
/*Select means: I want to get data */
/* * means all columns */
/* From employees means we are using the employees table */
SELECT * FROM employees; /* select all cloumns - and all rows */

/* Select specific columns */
SELECT first_name, last_name FROM employees;

/* change the order */
SELECT last_name, first_name FROM employees;

/* change how the columns are shown */
SELECT first_name student_first_name, last_name student_last_name FROM employees;

/* fliter results */
/* use the WHERE clause */
SELECT first_name, last_name, employee_id FROM employees WHERE employee_id = 1;

/* find someone by first name */
SELECT * FROM employees WHERE first_name = "Noah";

SELECT * FROM employees WHERE hourly_pay > 1; -- comparisons: > < >= <= <> !=

/* find everyone hired before June 9, 2025 */
SELECT * FROM employees WHERE hire_date <= "2025-06-09";

/* use not equals */
SELECT * FROM employees WHERE last_name <> "Klins";
SELECT * FROM employees WHERE last_name != "Klins";

/* dealing with null */
SELECT * FROM employees WHERE hire_date IS NULL;
SELECT * FROM employees WHERE hire_date IS NOT NULL;

/* multiple conditions - use and/or */
SELECT * FROM employees WHERE hourly_pay > 1 AND hire_date IS NULL;

SELECT * FROM employees WHERE hire_date IS NULL OR hire_date > "2025-10-01";

/* wildcards in text */
/* find all employees whose first name starts woth "J" */
SELECT * FROM employees WHERE first_name LIKE "j%"; -- notice the "LIKE" and the "%" (zero or many chars)

/* find all employees whose name ends in k */
SELECT * FROM employees WHERE last_name LIKE "%k";

/* find all employees whose last name starts with c and contains an "e" */
-- note, this could be expensive
SELECT * FROM employees WHERE last_name LIKE "c%e%";

-- couple more notes on LIKE
-- single character check
-- find all employees whose name starts with any letter and then has "lins"
SELECT * FROM employees WHERE last_name LIKE "_lins";
