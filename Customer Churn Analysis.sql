-- Creating a simple customer churn analysis using SQL

-- Step 1: Create a Sample Database
CREATE DATABASE IF NOT EXISTS CustomerDB;
USE CustomerDB;

-- Step 2: Create a Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    signup_date DATE,
    last_purchase_date DATE,
    total_spent DECIMAL(10,2)
);

-- Step 3: Insert Sample Data
INSERT INTO Customers (name, signup_date, last_purchase_date, total_spent) VALUES
('Alice Johnson', '2022-01-15', '2023-12-10', 500.00),
('Bob Smith', '2021-06-20', '2022-08-05', 120.00),
('Charlie Brown', '2023-03-10', '2024-03-01', 750.50),
('Dana White', '2020-11-02', '2021-12-15', 200.00),
('Eve Adams', '2023-07-22', '2024-02-18', 980.75);

-- Step 4: Define Churn Criteria (e.g., No purchase in last 12 months)
SELECT 
    customer_id, 
    name, 
    last_purchase_date, 
    CASE 
        WHEN last_purchase_date < CURDATE() - INTERVAL 12 MONTH THEN 'Churned'
        ELSE 'Active'
    END AS churn_status
FROM Customers;