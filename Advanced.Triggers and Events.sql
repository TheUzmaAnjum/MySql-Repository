-------- TRIGGERS------------

-- A Trigger is a block of code that executes automatically when an event takes place on a specific table.

-- For example, if we have 2 tables, invoice and payments - when a client makes a payment,we want "total paid" field in invoice table to automatically get updated 
-- to reflect that the client has indeed paid their invoice

SELECT * FROM employee_salary;
SELECT * FROM employee_demographics;
-- So, when a new row or data is inserted into salary table, we want a trigger to update the demographics table with new values
-- To write this query 

USE employees;
DELIMITER $$
     CREATE TRIGGER employee_insert
     AFTER INSERT ON employee_salary  
     FOR EACH ROW
    -- we can also do on 'BEFORE' but lets see for 'AFTER'
    -- Now this means that the above trigger gets activated for each row that is inserted on salary table.
    --Some sql databses like MSSQL have batch triggers or table level triggers that
    -- only trigger once, but MySQL doesn't have this functionality unfortunately
    -- now we can write our block of code that we want to run when this is triggered
     BEGIN
     INSERT INTO employee_demographics (employee_id, first_name, last_name)
     VALUES (NEW.employee_id,NEW.first_name,NEW.last_name);
     END $$
DELIMITER ;
--  we want to update our demographics table and insert new values
-- 'NEW' keyword says insert only those new rows that were inserted. There is also 'OLD' which says rows 
--  that were deleted or updated, but for now we want NEW
 
-- Now let's run it and create the trigger
-- Now that it's created let's test it out.
-- Let's insert a new row into the salary table and see if it updates in the Demographics table.
-- so let's put the values that we want to insert 

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Jean-Ralphio', 'Saperstein', 'Entertainment 720 CEO', 1000000, NULL);
-- Great!! it was updated in the salary table 
-- The trigger was triggered and updated with the corresponding values in the demographics table.

----------------------------------------------------------------------------------------

--------EVENTS------------

-- Events are tasks or blocks of code that gets executed according to a schedule. 
-- In other words,Importing data on a schedule. 
-- Scheduling reports to be exported to files and so many other things
-- you can schedule all of this to happen every day, every month or whenever you want

-- This really helps with automation in MySQL

-- let's say employees has a policy that anyone over the age of 60 is immediately retired with lifetime pay
-- All we have to do is delete them from the demographics table

SELECT * 
FROM employees.employee_demographics;

SHOW EVENTS;

-- we can drop or alter these events like this:
DROP EVENT IF EXISTS delete_retirees;
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY MONTH
DO 
BEGIN
	DELETE
	FROM employees.employee_demographics
        WHERE age >= 60;
END $$


-- if we run it again you can see Jerry is now retired
SELECT * 
from employee_demographics;
