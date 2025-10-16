-- ============================================================
-- MySQL Practice Worksheet 
-- Focus: tables, columns, data types, creating/renaming/dropping, and basic inserts.
-- Task 43: Create a database table
-- Task 45: Insert a row in a database table
-- ============================================================

/* 0) Setup: Work in a safe sandbox database.
   - Create a database named learning_lab (if it doesn't exist) and switch to it.
*/
-- Answer
DROP DATABASE IF EXISTS learning_lab;

CREATE DATABASE learning_lab;
USE learning_lab;

/* 1) Discover tables.
   - Show all tables in the current database.
*/
-- Answer
DROP TABLE IF EXISTS campers;

/* 2) Create a table.
   - Create a table named `campers` with the following columns:
     camper_id (INT), first_name (VARCHAR 40), last_name (VARCHAR 40),
     daily_rate (DECIMAL with 2 decimals), start_date (DATE).
*/
-- Answer
CREATE TABLE campers (
	camper_id INT,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    daily_rate DECIMAL(5,2),
    start_date DATE
);

/* 3) View your table.
   - Return all columns/rows from `campers`.
*/
-- Answer
SELECT * FROM campers;

/* 4) Add a column.
   - Add a column named contact_email (VARCHAR 80) to `campers`.
*/
-- Answer
ALTER TABLE campers ADD contact_email VARCHAR(80);

/* 5) Rename a column.
   - Rename contact_email to email.
*/
-- Answer
ALTER TABLE campers RENAME COLUMN contact_email TO email;

/* 6) Change a column's type.
   - Increase email length to VARCHAR 120.
*/
-- Answer
ALTER TABLE campers MODIFY COLUMN email VARCHAR(120);

/* 7) Move a column (position change).
   - Move email so it appears after last_name.
*/
ALTER TABLE campers MODIFY COLUMN email VARCHAR(120) AFTER last_name;


/* 8) Move a column to first position.
   - Make email the first column.
*/
ALTER TABLE campers MODIFY COLUMN email VARCHAR(120) FIRST;


/* 9) Delete a column.
   - Remove the email column.
*/
-- Answer
ALTER TABLE campers DROP COLUMN email;

/* 10) Rename a table.
   - Rename campers to participants.
   -- Answer (remove before sharing):
*/
-- Answer
RENAME TABLE campers TO participants;

/* 11) Rename it back.
   - Rename participants back to campers.
*/
-- Answer
RENAME TABLE participants TO campers;

/* 12) Insert one row.
   - Insert a single camper: (101, 'Alex', 'Rivera', 89.50, '2025-06-09').
*/
-- Answer
INSERT INTO campers VALUES (101, "Alex", "Rivera", 89.50, "2025-06-06");

/* 13) Insert multiple rows.
   - Insert four more rows with DIFFERENT data than any samples shown earlier in class.
     Example values (you may adjust dates/rates):
       (102, 'Priya',  'Shah',    95.00, '2025-06-10')
       (103, 'Jordan', 'Lee',     72.25, '2025-06-11')
       (104, 'Mateo',  'Garcia',  80.00, '2025-06-11')
       (105, 'Sakura', 'Tanaka',  99.99, '2025-06-12')
*/
-- Answer
INSERT INTO campers VALUES 
(102, "Priya",  "Shah",    95.00, "2025-06-10"),
(103, "Jordan", "Lee",     72.25, "2025-06-11"),
(104, "Mateo",  "Garcia",  80.00, "2025-06-11"),
(105, "Sakura", "Tanaka",  99.99, "2025-06-12");

/* 14) Insert with specific columns only.
   - Insert a row with ONLY camper_id, first_name, last_name (leave others NULL):
*/
INSERT INTO campers VALUES (106, "Noah", "Prest", NULL, NULL);

/* 15) Verify.
   - Show all rows currently in the campers table.
*/
SELECT * FROM campers;

/* 16) Practice handling mistakes.
   - Try an insert that should FAIL because of a column/value count mismatch,
     then fix it by explicitly listing the column names.
*/
-- Answer
-- Bad Attempt:
-- INSERT INTO campers (107, "James", "Clark")

-- Good Attempt:
INSERT INTO campers (camper_id, first_name, last_name) VALUES (107, "James", "Clark")

/* 17) Drop a table.
   - Delete the campers table entirely.
*/
-- Answer
DROP TABLE campers;
-- End of Exercises
