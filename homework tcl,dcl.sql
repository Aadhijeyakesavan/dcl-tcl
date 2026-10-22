-- Create table
CREATE TABLE employee (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(100),
    salary DECIMAL(10,2)
);

-- Insert records
INSERT INTO employee (emp_name, salary)
VALUES
('Arun', 25000),
('Kumar', 30000),
('Ravi', 35000);

-- Create view
CREATE VIEW employee_names AS
SELECT emp_name
FROM employee;

-- Create user
CREATE USER guest WITH PASSWORD 'guest123';

-- Give SELECT permission
GRANT SELECT ON employee_names TO guest;

-- Display view
SELECT * FROM employee_names;




CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    mark INT
);

INSERT INTO student VALUES
(1, 'Arun', 80),
(2, 'Kumar', 90);

CREATE VIEW student_view AS
SELECT student_id, student_name, mark
FROM student;




-- Vehicle details table
CREATE TABLE vehicle_details (
    vehicle_id SERIAL PRIMARY KEY,
    vehicle_name VARCHAR(100),
    vehicle_number VARCHAR(20),
    capacity INT
);

-- Delivery details table
CREATE TABLE delivery_details (
    delivery_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    shop_name VARCHAR(100),
    delivery_area VARCHAR(100),
    status VARCHAR(30)
);





INSERT INTO vehicle_details
(vehicle_name, vehicle_number, capacity)
VALUES
('Van', 'TN58AB1234', 1000),
('Truck', 'TN59CD5678', 5000),
('Mini Truck', 'TN58EF9012', 2000);


BEGIN;

INSERT INTO delivery_details
(product_name, shop_name, delivery_area, status)
VALUES
('Rice', 'ABC Store', 'Madurai', 'Completed'),
('Sugar', 'XYZ Store', 'Chennai', 'Pending'),
('Oil', 'Kumar Store', 'Madurai', 'Completed');

COMMIT;

SELECT * FROM delivery_details;

BEGIN;

DELETE FROM delivery_details
WHERE delivery_id = 2;

-- Check before rollback
SELECT * FROM delivery_details;

ROLLBACK;

-- Check after rollback
SELECT * FROM delivery_details;