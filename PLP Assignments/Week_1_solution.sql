-- Creating Database for expense tracker
CREATE DATABASE expense_tracker_db;

-- Use the expense_tracker_db
USE expense_tracker_db;

-- Creating table expenses
CREATE TABLE expenses (
    id INT PRIMARY KEY AUTO_INCREMENT,   -- Serial number
    expense_date DATE NOT NULL,           -- Date of the expense
    amount DECIMAL(10, 2) NOT NULL,       -- Amount spent
    description VARCHAR(255)              -- Description of the expense
);
