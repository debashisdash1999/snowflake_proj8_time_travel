--  TASK 1: Exploring Time Travel 
-- Use the demo warehouse for executing queries in this assignment
USE WAREHOUSE demo;

-- Create a database to store data for time travel example
CREATE OR REPLACE DATABASE sales_db_time_travel;

-- Create a table to store product details with timestamps
CREATE OR REPLACE TABLE time_travel_table (
    record_id INTEGER,
    product_name STRING,
    quantity INTEGER,
    price FLOAT,
    updated_at TIMESTAMP
);

-- Insert initial records into the table
INSERT INTO time_travel_table (record_id, product_name, quantity, price, updated_at)
VALUES 
    (1, 'Laptop', 10, 999.99, CURRENT_TIMESTAMP),
    (2, 'Smartphone', 15, 699.99, CURRENT_TIMESTAMP);

--Select
Select * from time_travel_table;

-- Update the quantity and price for a specific record
UPDATE time_travel_table
SET quantity = 20, price = 899.99, updated_at = CURRENT_TIMESTAMP
WHERE record_id = 1;

--Select
Select * from time_travel_table;

-- Retrieve data as it existed earlier using Time Travel
SELECT * FROM time_travel_table
AT (OFFSET => -1 * 60);

-- Drop the table to clean up resources
DROP TABLE IF EXISTS time_travel_table;

-- Drop the database to complete cleanup
DROP DATABASE IF EXISTS sales_db_time_travel;



--  TASK 2: Exploring Time Travel with Data Retention & Query ID
-- Use the demo warehouse for task execution
USE WAREHOUSE demo;

-- Create a database named time_travel_db
CREATE OR REPLACE DATABASE time_travel_db;

-- Create a table with a 1-day retention period
CREATE OR REPLACE TABLE time_travel_db.public.retention_table (
    order_id INTEGER,
    customer_id INTEGER,
    order_date DATE,
    amount FLOAT
) DATA_RETENTION_TIME_IN_DAYS = 1;

-- Insert sample data into the retention_table
INSERT INTO time_travel_db.public.retention_table (order_id, customer_id, order_date, amount)
VALUES 
    (1, 1001, CURRENT_DATE, 150.75),
    (2, 1002, CURRENT_DATE, 200.00);

-- Update the amount for order_id = 1
UPDATE time_travel_db.public.retention_table
SET amount = 175.50
WHERE order_id = 1;

-- Retrieve the query ID of the last update
SELECT LAST_QUERY_ID() AS query_id;

-- Retrieve data as it was before the update using the query ID
SELECT * FROM time_travel_db.public.retention_table
BEFORE (STATEMENT => 'my_query_id');

DROP TABLE retention_table;

DROP DATABASE time_travel_db;

