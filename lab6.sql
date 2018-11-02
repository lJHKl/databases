CREATE DATABASE LAB7;
CREATE TABLE locations(
  location_id SERIAL PRIMARY KEY,
  stree_address VARCHAR(25),
  postalcode varchar(12),
  city varchar(30),
  state_province varchar(12)
);

CREATE TABLE departments(
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(50) UNIQUE,
  budget INTEGER,
  location_id INTEGER REFERENCES locations
);

CREATE TABLE employees (
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email varchar(50),
  phone_number VARCHAR(20),
  salary INTEGER,
  manager_id INTEGER REFERENCES employees,
  department_id INTEGER REFERENCES departments
);
CREATE TABLE job_grades(
  grade CHAR(1),
  lowest_salary INTEGER,
  highest_salary INTEGER
);

SELECT e.first_name, e.last_name, d.department_time, l.city, l.state_province FROM employees AS e
JOIN departments AS d ON e.department_id=d.department_id JOIN locations l ON d.location_id=l.location_id;

SELECT e.first_name, e.last_name, e.salary, j.grade FROM employees e JOIN job_grades AS j ON e.salary=j.lowest_salary;

SELECT first_name, last_name, salary FROM employees WHERE
