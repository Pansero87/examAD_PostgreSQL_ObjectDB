-- This table is designed to store general information about employees.


CREATE TABLE Employee (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    superior_id INT REFERENCES Employee(employee_id) 
);


-- Table for sellers Inherits from the Employee table, meaning it will contain all 
-- the columns defined in the Employee table along with its specific columns.
CREATE TABLE Seller (
    commission DECIMAL(5, 2) NOT NULL,
    role VARCHAR(50) CHECK (role IN ('telephone', 'distributor', 'door')),
    seller_id INT PRIMARY KEY REFERENCES Employee(employee_id)
) INHERITS (Employee);


-- Table for Commercial is Similar to the Seller table, this table inherits from the Employee table.
CREATE TABLE Commercial (
    remuneration DECIMAL(10, 2) NOT NULL,
    area_of_action VARCHAR(50) CHECK (area_of_action IN ('Levante', 'South', 'Central', 'North')),
    commercial_id INT PRIMARY KEY REFERENCES Employee(employee_id)
) INHERITS (Employee);


-- Table for Address this table is designed to store address information for employees.
CREATE TABLE Address (
    address_id SERIAL PRIMARY KEY,
    type VARCHAR(50) CHECK (type IN ('Street', 'Avenue', 'Part')),
    street_name VARCHAR(100) NOT NULL,
    street_number VARCHAR(20) NOT NULL,
    employee_id INT REFERENCES Employee(employee_id) 
);

-- Table for Telephone this table is designed to store telephone number information for employees.
CREATE TABLE Telephone (
    telephone_id SERIAL PRIMARY KEY,
    number VARCHAR(15) NOT NULL,
    employee_id INT REFERENCES Employee(employee_id) 
);


