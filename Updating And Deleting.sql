SELECT * FROM employees;
/*
So  far we have:
- created a database
- created a table
- inserted into tables
- selected from a single table
*/

-- Today we'll look at updates and deletes (Task 44)
-- update one field for an employee:
UPDATE employees SET hourly_pay = 999.99 WHERE employee_id = 4;

-- update multiple fields for an employees
UPDATE employees SET last_name = "Prest", hourly_pay = 999.99 WHERE employee_id = 1;

-- set a field to null
UPDATE employees SET first_name = "LeBraune", last_name = NULL WHERE employee_id = 1;

-- update all hourly pays
UPDATE employees SET hourly_pay = 55.01;

-- delete a record from our table
DELETE FROM employees WHERE employee_id = 3;
-- careful! Don't delete everything!

START TRANSACTION;
DELETE FROM employees;
ROLLBACK; -- if we wanted to keep it, we'd say commit;

-- by default, MySQL auto-commits everything.
-- let's turn that off

SET autocommit = OFF;
/* this will allow us to review our changed, before saving */
DELETE FROM employees WHERE last_name = "klins";
ROLLBACK;

DELETE FROM employees WHERE last_name = "klins";
COMMIT;

ROLLBACK; -- does nothing immediately after a commit

SET autocommit = ON;