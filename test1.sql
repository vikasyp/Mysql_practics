
create database xyz;
use xyz;

CREATE TABLE employeeData(
id int primary key,
name varchar(50),
sallary int);

insert into employeeData
(id,name,sallary)
values 
(1,"adam",25000),
(2,"bob",30000),
(3,"casey",40000);

-- A column is a series of table cells that store a value for table’s each row. we can add column by using ALTER TABLE statement.
ALTER TABLE employeeData ADD COLUMN stack varchar(50);

-- We can remove columns in MySQL by using ALTER TABLE statement.
ALTER TABLE employeeData DROP COLUMN stack; 

-- LENGTH is byte count whereas CHAR_LENGTH is character count. The numbers are the same for Latin characters but
-- different for Unicode and other encodings.
SELECT CHAR_LENGTH(name) FROM employeeData;
SELECT LENGTH(name) FROM employeeData;

-- apply limit for table 
SELECT * FROM employeeData LIMIT 2;

  -- current date and time
SELECT NOW();
SELECT CURRENT_DATE();

-- the DISTINCT keyword allows for the removal of all duplicate records and the retrieval of unique records. The DISTINCT keyword is used with the SELECT statement.
SELECT DISTINCT id FROM employeeData;

-- We can delete a table by using DROP TABLE statement. This statement deletes.
DROP TABLE employeeData;

-- Joins are used to connect two or more tables. It returns only same values in all tables.
-- There are four different ways to join MySQL tables.
-- Inner Join
-- left Join
-- Right Join
-- Full Join

-- How can we save images in MySQL?
-- In MySQL, Blobs can be used to store images. All database images are first converted into blobs then saved and 
-- then they will be added to the database, 
-- and finally, it will later be stored on the disk.


select * from employeeData;

show databases;
show tables;

