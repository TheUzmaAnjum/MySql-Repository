--  Common Table Expressions (CTE)
-- A CTE allows you to define a subquery block that can be referenced within the main query. 
-- Its kind like a query within a query but with a name and a bit more standardized and in a better format.
-- Main purpose of writing a CTE is to be able to perform more advanced calculations within one query, CTEs are readable

-- Let's take a look at the basics of writing a CTE:
-- First, CTEs start using a "With" Keyword and then name this CTE 
-- Then we say as and within the parenthesis we build our required subquery/table 
WITH CTE_Example AS 
(
SELECT MIN(salary), MAX(salary), COUNT(salary), Gender
FROM employee_demographics demo
JOIN employee_salary sal
	ON demo.employee_id = sal.employee_id
GROUP BY Gender
)
-- Here we are joining two tables and grouping them by gender.Instantly after using it we can query the CTE as it can't
-- be carried forward
SELECT *
FROM CTE_Example;

--Lets perform some complex calculations within this CTE

WITH CTE_Example as 
(
select sum(salary),max(salary), min(salary), count(salary), gender
from employee_demographics demo
join employee_salary sal
on demo.employee_id = sal.employee_id
group by gender
)
SELECT gender, ROUND(AVG(`SUM(salary)`/`COUNT(salary)`),2)
FROM CTE_Example
GROUP BY gender;
-- Note, I have to use back ticks above to specify the table names----without them it doesn't work

-- We can also create multiple CTEs with just one 'With' Expression and separating them with a comma(,)
-- And then performing Joins on them 
WITH CTE_Example as 
(
SELECT employee_id, first_name, age, gender
FROM employee_demographics demo
WHERE age > 40
),
CTE_Example2 as
(
select employee_id, salary 
from employee_salary
where salary > 50000
)
select *
from CTE_Example t1
join CTE_Example2 t2
on t1.employee_id = t2.employee_id;

-- the last thing I want to show here is that we can rename the columns in the CTE
-- let's take our very first CTE we made. We had to use tick marks because of the column names

-- we can rename them like this
WITH CTE_Example (min_salary, max_salary, count_salary, gender) AS 
(
SELECT MIN(salary), MAX(salary), COUNT(salary), Gender
FROM employee_demographics demo
JOIN employee_salary sal
	ON demo.employee_id = sal.employee_id
GROUP BY gender
)








