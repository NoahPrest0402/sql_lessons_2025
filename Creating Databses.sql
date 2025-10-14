-- DBMS - Database Management System (eg. MySQL server)

-- Create a database:
create database cmp_noprest;
-- tell mysql the default db.
USE cmp_noprest;

-- deleting (dropping) a database:
-- DROP database cmp_noprest;

-- altering a database to make it read only
ALTER database cmp_noprest read only = 1;
-- drop database cmp_noprest;
ALTER database cmp_noprest read only = 0;