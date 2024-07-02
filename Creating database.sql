DROP DATABASE IF EXISTS `Employees`;
CREATE DATABASE `Employees`;
USE `Employees`;


CREATE TABLE employee_demographics (
  employee_id INT NOT NULL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  birth_date DATE
);

CREATE TABLE employee_salary (
  employee_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  occupation VARCHAR(50),
  salary INT,
  dept_id INT
);


INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1,'Lisa', 'Jonas', 44, 'Female','1979-09-25'),
(2,'Tom', 'Hardward', 36, 'Male', '1987-03-04'),
(3, 'Ben', 'Thomas', 29, 'Female', '1994-03-27'),
(4, 'Jerry', 'Knope', 61, 'Male', '1962-08-28'),
(6, 'Donna', 'Meagle', 46, 'Female', '1977-07-30'),
(7, 'Ann', 'Perkins', 35, 'Female', '1988-12-01'),
(8, 'Chris', 'Traeger', 43, 'Male', '1980-11-11'),
(9, 'Ben', 'Wyatt', 38, 'Male', '1985-07-26'),
(10, 'Sophie', 'Turner', 34, 'Male', '1989-03-25'),
(11, 'Harry', 'Potter', 40, 'Male', '1983-06-14'),
(12, 'Eulia', 'vanteur', 37, 'Male', '1986-07-27');


INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Lisa', 'Jonas', 'Deputy Director of Employees', 75000,1),
(2, 'Tom', 'Hardward', 'Director of Employees', 70000,1),
(3, 'Ben', 'Thomas', 'Entrepreneur', 50000,1),
(4, 'Jerry', 'Knope', 'Assistant to the Director of Employees', 25000,1),
(5, 'Nick', 'Marie', 'Office Manager', 50000,1),
(6, 'Donna', 'Meagle', 'Office Manager', 60000,1),
(7, 'Ann', 'Perkins', 'Nurse', 55000,4),
(8, 'Chris', 'Traeger', 'City Manager', 90000,3),
(9, 'Ben', 'Wyatt', 'State Auditor', 70000,6),
(10, 'Sophie', 'Turner', 'Shoe Shiner and Musician', 20000, NULL),
(11, 'Harry', 'Potter', 'City Planner', 57000, 3),
(12, 'Eulia', 'Vanteur', 'Parks Director', 65000,1);



CREATE TABLE employee_departments (
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name varchar(50) NOT NULL,
  PRIMARY KEY (department_id)
);

INSERT INTO employee_departments (department_name)
VALUES
('Parks'),
('Animal Control'),
('Public Works'),
('Healthcare'),
('Library'),
('Finance');
