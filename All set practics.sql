CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

CREATE TABLE employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    job_title VARCHAR(100),
    salary DECIMAL(10, 2),
    hire_date DATE
);

ALTER TABLE employee
ADD city VARCHAR(100);

INSERT INTO employee (first_name, last_name, email, job_title, salary, hire_date, city) VALUES
('John', 'Does', 'john.does@example.com', 'Software Engineer', 80000.00, '2022-01-15', 'New York'),
('Jane', 'Smith', 'jane.smith@example.com', 'Project Manager', 95000.00, '2021-06-10', 'San Francisco'),
('Michael', 'Johnson', 'michael.johnson@example.com', 'Business Analyst', 75000.00, '2023-03-25', 'Chicago'),
('Emily', 'Davis', 'emily.davis@example.com', 'UX Designer', 70000.00, '2020-08-20', 'Boston'),
('William', 'Brown', 'william.brown@example.com', 'DevOps Engineer', 90000.00, '2019-11-30', 'Seattle'),
-- Duplicate email example
('John', 'Smith', 'john.doe@example.com', 'QA Engineer', 65000.00, '2023-02-05', 'New York'),
('Emily', 'Davie', 'emily.davie@example.com', 'UX Designer', 70000.00, '2020-08-20', 'Boston');


select * from employee;
set sql_safe_updates=0;
delete  from employee; -- Delete (to delete existing rows)
select * from employee where salary between  80000.00 and 95000.00;

select * from employee where salary in ( 80000.00 , 95000.00);

select * from employee limit 3;

select * from employee order by hire_date asc;  -- desc

-- Aggregate Functions
-- Aggregare functions perform a calculation on a set of values, and return a single value.
-- COUNT( )
-- ( )
-- MIN( )
-- SUM( )
-- AVG( )

select count(id)  from employee;
select MAX(salary)  from employee;
select sum(salary)  from employee;

--                     Group By Clause
-- Groups rows that have the same values into summary rows.
-- It collects data from multiple records and groups the result by one or more column.
-- *Generally we use group by with some aggregation function.

select first_name, max(salary)  from employee group by first_name;

--             Having Clause
-- Similar to Where i.e. applies some condition on rows.
-- Used when we want to apply any condition after grouping.

select first_name, max(salary)  from employee group by first_name having max(salary)>80000.00;

--             Table related Queries -----------
-- Update (to update existing rows)

-- UPDATE table_name SET col1 = val1, col2 = val2 WHERE condition;

--                      Cascading for FK ----------------
-- On Delete Cascade
-- When we create a foreign key using this option, it deletes the referencing rows in the child table
-- when the referenced row is deleted in the parent table which has a primary key.

-- On Update Cascade
-- When we create a foreign key using UPDATE CASCADE the referencing rows are updated in the child
-- table when the referenced row is updated in the parent table which has a primary key.


-- Table related Queries

-- Alter (to change the schema)
--             ADD Column
-- ALTER TABLE table_name
-- ADD COLUMN column_name datatype constraint;

--               DROP Column
-- ALTER TABLE table_name
-- DROP COLUMN column_name;

--              RENAME Table
-- ALTER TABLE table_name
-- RENAME TO new_table_name;

--           CHANGE Column (rename)
-- ALTER TABLE table_name
-- CHANGE COLUMN old_name new_name new_datatype new_constraint;

--   MODIFY Column (modify datatype/ constraint)
-- ALTER TABLE table_name
-- MODIFY col_name new_datatype new_constraint;

-- Truncate (to delete table's data)

-- TRUNCATE TABLE table_name ;

-- Inner Join
-- Returns records that have matching values in both tables
-- Syntax

-- SELECT column(s)
-- FROM tableA
-- INNER JOIN tableB
-- ON tableA.col_name = tableB.col_name;

-- Left Join
-- Returns all records from the left table, and the matched records from
-- the right table
-- Syntax

-- SELECT column(s)
-- FROM tableA
-- LEFT JOIN tableB
-- ON tableA.col_name = tableB.col_name;

-- Right Join
-- Returns all records from the right table, and the matched records
-- from the left table
-- Syntax

-- SELECT column(s)
-- FROM tableA
-- RIGHT JOIN tableB
-- ON tableA.col_name = tableB.col_name;

-- Self Join
-- It is a regular join but the table is joined with itself.
-- Syntax

-- SELECT column(s)
-- FROM table as a
-- JOIN table as b
-- ON a.col_name = b.col_name;

-- Union
-- It is used to combine the result-set of two or more SELECT statements.
-- Gives UNIQUE records.

-- Syntax
-- SELECT column(s) FROM tableA
-- UNION
-- SELECT column(s) FROM tableB

-- SQL Sub Queries
-- A Subquery or Inner query or a Nested query is a query within another SQL query.
-- Query
-- Sub Query
-- It involves 2 select statements.
-- Syntax

-- SELECT column(s)
-- FROM table_name
-- WHERE col_name operator
-- ( subquery );

