USE xyz;

CREATE TABLE sales (
    id INT,
    total_sales INT
);

INSERT INTO sales (id, total_sales)
VALUES 
(1, 25),
(1, 30),
(3, 15);

select * from sales;

-- store procedure --
DELIMITER $$

CREATE PROCEDURE GetTotalSales(
    IN product_id INT,
    OUT total_sales DECIMAL(10, 2)
)
BEGIN
    SELECT SUM(total_sales)
    INTO total_sales
    FROM sales
    WHERE id = product_id;
END $$

DELIMITER ;

CALL GetTotalSales(1, @total);
SELECT @total;

SELECT SUM(total_sales) FROM sales WHERE id = 1;

DELIMITER $$

-- functions ----

CREATE FUNCTION CalculateCircleArea(radius DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
NO SQL
BEGIN
    RETURN PI() * radius * radius;
END $$

DELIMITER ;

SELECT CalculateCircleArea(5);

DELIMITER $$

-- functions-------

CREATE FUNCTION SalaryBand(salary DECIMAL(10,2))
RETURNS VARCHAR(50)
DETERMINISTIC
NO SQL
BEGIN
    DECLARE band VARCHAR(50);
    
    IF salary < 30000 THEN
        SET band = 'Low';
    ELSEIF salary BETWEEN 30000 AND 60000 THEN
        SET band = 'Medium';
    ELSE
        SET band = 'High';
    END IF;
    
    RETURN band;
END $$

DELIMITER ;

select SalaryBand(5000);


-- in View Mysql

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees (id, name, department, salary) VALUES
(1, 'Alice Johnson', 'Sales', 50000),
(2, 'Bob Smith', 'HR', 60000),
(3, 'Carol White', 'Sales', 55000),
(4, 'David Brown', 'IT', 70000);

-- views

CREATE VIEW SalesEmployees AS
SELECT id, name, salary
FROM employees
WHERE department = 'Sales';

-- Update 
UPDATE SalesEmployees
SET salary = 52000
WHERE id = 1;

SELECT * FROM SalesEmployees;
-- remove views
DROP VIEW SalesEmployees;

-- Indexes in MySQL
-- Indexes in MySQL improve query performance by allowing the database to quickly locate rows based on the indexed columns.
-- Here’s a concise example demonstrating how to create and use indexes.

CREATE INDEX idx_department ON employees (department);

SELECT * FROM employees 
WHERE department = 'Sales' AND salary > 50000;

SHOW INDEX FROM employees;




 
 


