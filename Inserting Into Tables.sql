USE cmp_noprest;

-- inserting into a table:

-- default appraoch (when you have all data)
INSERT INTO employees VALUES (1, "James", "Clark", 6.70, "2025-06-07") ON DUPLICATE KEY UPDATE employee_id = employee_id;

SELECT * FROM employees;

-- inserting multiple rows at once:
INSERT INTO employees VALUES
(2, "Dakota", "Kuhn", 67.67, "2025-06-08"),
(3, "Noah", "Prest", 5.67, "2025-06-09"),
(4, "Thomas", "Carpenter", 23.54, "2025-06-10") ON DUPLICATE KEY UPDATE employee_id = employee_id;;

SELECT * FROM employees;

-- what happens if we don't have all the data
-- INSERT INTO employees VALUES (5, "Jordan", "Klemm") -- Error: Column count doesn't match value count

-- inserting only some columns
INSERT INTO employees (employee_id, first_name, last_name) 
VALUES (5, "Jordan", "Klemm") ON DUPLICATE KEY UPDATE employee_id = employee_id;;

-- inserting in a different order
INSERT INTO employees (last_name, first_name, employee_id, hourly_pay) 
VALUES ("Stempka", "William", 6, 11.00) ON DUPLICATE KEY UPDATE employee_id = employee_id;

SELECT * FROM employees;

UPDATE employees SET hourly_pay = .50 WHERE employee_id = 4;

UPDATE employees SET hourly_pay = .37 WHERE first_name = "Dakota";

UPDATE employees SET hourly_pay = hourly_pay * .1 WHERE employee_id != 0;

SELECT * FROM employees;