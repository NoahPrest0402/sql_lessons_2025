-- ============================================================
-- SQL Constraint Practice — Student Worksheet
-- Instructions:
-- • Read each prompt carefully and write your SQL beneath it.
-- • Use correct data types and constraint syntax, but write all the SQL yourself.
-- • If you hit an error, leave the query and explain why it failed using a comment.
-- ============================================================


/* ============================================================
   Part A — PRIMARY KEY & AUTO_INCREMENT
   Concepts: PRIMARY KEY, AUTO_INCREMENT, ALTER TABLE ... AUTO_INCREMENT
   ============================================================ */

-- A1) Create a table named students with:
--     • A column for a student ID that should be an integer, act as the primary key, and auto-increment.
--     • Columns for first name and last name that cannot be null.
--     • A column for email that can be left empty for now.
--   Then insert at least three students without providing their ID numbers.
--   Finally, SELECT all rows to verify IDs are automatically assigned.

USE cmp_noprest;
DROP TABLE IF EXISTS students;
CREATE TABLE students(
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(100)
);

INSERT INTO students (first_name, last_name, email) VALUES
("Noah", "Prest", "cmp_noprest@ects.org"),
("James", "Clark", "cmp_jaclark@ects.org"),
("William", "Stempka", "cmp_wistempka@ects.org");

SELECT * FROM students;

-- A2) Modify the students table so that new IDs start at 500.
--     Insert one more student and confirm the new student ID starts from that number.

ALTER TABLE students AUTO_INCREMENT = 500;
INSERT INTO students (first_name, last_name, email) VALUES
("Jordan", "Klemm", "cmp_joklemm@ects.org");

/* ============================================================
   Part B — UNIQUE
   Concepts: UNIQUE on single column, composite UNIQUE across two columns
   ============================================================ */

-- B1) Add a constraint to the students table so that no two students can have the same email address.
--     Assign each existing student a unique email address.
--     Attempt to insert a new student with a duplicate email to see what error occurs.

ALTER TABLE students ADD CONSTRAINT UNIQUE (email);
/* INSERT INTO students (first_name, last_name, email) VALUES 
("Dakota", "Kuhn", "cmp_joklemm@ects.org"); */

-- B2) Create a table named lockers with:
--     • A column for locker ID that should be an integer, act as the primary key, and auto-increment.
--     • A column for the hallway name (text, required).
--     • A column for the locker number (integer, required).
--   Add a rule so that the combination of hallway and locker number must be unique.
--   Insert two valid lockers, then attempt to insert one that duplicates both hall name and locker number.

DROP TABLE IF EXISTS lockers;
CREATE TABLE lockers(
	locker_id INT PRIMARY KEY AUTO_INCREMENT,
    hallway_name VARCHAR(25),
    locker_number INT
);

ALTER TABLE lockers ADD CONSTRAINT UNIQUE (hallway_name, locker_number);
INSERT INTO lockers VALUES
(1, "A", 100),
(2, "B", 101);
-- (3, "B", 101);

/* ============================================================
   Part C — NOT NULL
   Concepts: ALTER COLUMN to NOT NULL, NOT NULL insert failure
   ============================================================ */

-- C1) Update the students table so the email column must always contain a value (cannot be NULL).
--     Test by inserting a student record without an email and observe what happens.

-- ALTER COLUMN email ADD CONSTRAINT NOT NULL;

-- C2) Create a table named courses with:
--     • A column for a course code (short text) that serves as the primary key.
--     • A title (text) that must always have a value.
--     • A credit amount (integer) that must always have a value.
--   Insert one valid record, then test inserting another that leaves a required column blank to trigger an error.

DROP TABLE IF EXISTS courses;
CREATE TABLE courses(
	course_code VARCHAR(10) PRIMARY KEY,
    title VARCHAR(25),
    credit_amount INT
);

INSERT INTO courses VALUES ("Python", "Coding With Python", 250);
-- INSERT INTO courses (title, credit_amount) VALUES ("Coding with Javascript", 400);

/* ============================================================
   Part D — CHECK
   Concepts: CHECK with range; CHECK with IN-list
   ============================================================ */

-- D1) Add a CHECK constraint to the courses table so that credits must be within a sensible range (for example, between 1 and 6).
--     Try inserting one course that violates the rule and one that meets it.
ALTER TABLE courses ADD CONSTRAINT chk_credit CHECK (1.0 <= credit_amount <= 6.0);

INSERT INTO courses VALUES ("CSS", "Coding With CSS", 3.0);

-- INSERT INTO courses VALUES ("HTML", "Coding With HTML", 30.0);

-- D2) Create a table named devices with:
--     • A column for asset_tag that should be a unique identifier and act as the primary key.
--     • A column for device_type that must always contain a value.
--     • A column for status that defaults to “in_stock”.
--   Add a rule that only allows specific device types (for example, laptop, tablet, router).
--   Insert one valid record for each allowed type, then insert one with an invalid type to see the constraint in action.

DROP TABLE IF EXISTS devices;
CREATE TABLE devices(
	asset_tag INT UNIQUE PRIMARY KEY,
    device_type VARCHAR(25),
    status VARCHAR(25) DEFAULT "in_stock"
);

ALTER TABLE devices ADD CONSTRAINT chk_device_type CHECK (device_type = "laptop" or device_type = "tablet" or device_type = "router");

INSERT INTO devices (asset_tag, device_type) VALUES
(1, "laptop"),
(2, "tablet");

/* INSERT INTO devices VALUES
("pc", "personal computer", DEFAULT); */

/* ============================================================
   Part E — DEFAULT
   Concepts: DEFAULT on string, DEFAULT on timestamp
   ============================================================ */

-- E1) Add a new record to the devices table, leaving out the status column.
--     Verify that the status automatically fills in with the default value.

INSERT INTO devices (asset_tag, device_type) VALUES (3, "router");

-- E2) Create a table named tickets with:
--     • A column for ticket_id that should be an integer, act as the primary key, and auto-increment.
--     • A column for subject (short text) that must always have a value.
--     • A column for opened_at that automatically fills with the current date and time.
--     • A column for priority that defaults to a typical value like “normal”.
--   Insert at least two tickets without specifying all columns and confirm the defaults are applied.

DROP TABLE IF EXISTS tickets;
CREATE TABLE tickets(
	ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    subjects VARCHAR(10),
    opened_at DATE DEFAULT (CURRENT_DATE()),
    priority VARCHAR(25) DEFAULT "normal"
);

INSERT INTO tickets (subjects, priority) VALUES
("Movie", DEFAULT),
("Concert", DEFAULT);

/* ============================================================
   Part F — FOREIGN KEY
   Concepts: FOREIGN KEY relationships, referential integrity
   ============================================================ */

-- F1) Create a table named checkouts with:
--     • A column for checkout_id that should be an integer, act as the primary key, and auto-increment.
--     • A column for asset_tag that connects to the devices table.
--     • A column for student_id that connects to the students table.
--     • A column for due_date (date).
--   Add foreign key constraints linking asset_tag and student_id to their respective parent tables.
--   Insert one valid record and one that references a non-existent asset_tag to test the foreign key protection.

DROP TABLE IF EXISTS checkouts;
CREATE TABLE checkouts(
	checkout_id INT PRIMARY KEY AUTO_INCREMENT,
    asset_tag INT,
    student_id INT,
    due_date DATE 
);



SELECT * FROM checkouts;

-- F2) Try deleting a student who is still listed in the checkouts table.
--     Note what error appears and explain why.
--     Then delete the related checkout record and delete the student successfully.



/* ============================================================
   Part G — Mixed Practice Mini-Scenarios
   Concepts: Combining PRIMARY KEY, UNIQUE, CHECK, DEFAULT, and FOREIGN KEY
   ============================================================ */

-- G1) Create a table named clubs with:
--     • A club_id column that should be an integer, act as the primary key, and auto-increment.
--     • A club_name column that must always have a value and must be unique.
--     • A column for advisor_email (text) that must always have a value.
--     • A column for budget that defaults to 0.00 and cannot be negative.
--   Insert two valid clubs.
--   Then attempt one with a duplicate name and one with a negative budget, and note what happens.



-- G2) Create a table named memberships with:
--     • A column for membership_id that should be an integer, act as the primary key, and auto-increment.
--     • A column for student_id that connects to the students table.
--     • A column for club_id that connects to the clubs table.
--   Add a rule that prevents the same student from joining the same club more than once.
--   Insert one valid membership, then try inserting the same student/club pair again to test the rule.



