
-- Addresses Entity
CREATE TABLE Addresses (
    address_id SERIAL PRIMARY KEY,
    street TEXT NOT NULL,
    number TEXT NOT NULL,
    block TEXT
);

-- Employees Entity
CREATE TABLE Employees (
    employee_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    hire_date DATE NOT NULL,
    bad_performance BOOLEAN DEFAULT FALSE,
    address_id INT REFERENCES Addresses(address_id)
);

-- Departments Entity
CREATE TABLE Departments (
    department_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    location TEXT
);

-- Department_Employees Entity
CREATE TABLE Department_Employees (
    department_id INT REFERENCES Departments(department_id),
    employee_id INT REFERENCES Employees(employee_id),
    PRIMARY KEY (department_id, employee_id)
);

-- Projects Entity
CREATE TABLE Projects (
    project_id SERIAL PRIMARY KEY,
    description TEXT NOT NULL,
    project_manager_id INT REFERENCES Employees(employee_id)
);

-- Project_Participants Entity
CREATE TABLE Project_Participants (
    project_id INT REFERENCES Projects(project_id),
    employee_id INT REFERENCES Employees(employee_id),
    PRIMARY KEY (project_id, employee_id)
);
