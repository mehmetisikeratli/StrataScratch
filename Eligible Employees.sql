
/*

Eligible Employees
Difficulty: Hard

Question ID: ID 10359

Link to the question: 
https://platform.stratascratch.com/coding/10359-eligible-employees

*/

WITH cte AS (
    SELECT *
        , COUNT(employee_id) OVER(PARTITION BY department) AS dept_count
        , PERCENT_RANK() OVER(PARTITION BY department ORDER BY salary) AS percentage
    FROM employee_salaries
    WHERE tenure >= 3
    )
SELECT employee_id
    , salary
    , department
FROM cte
WHERE dept_count >= 5
    AND percentage  >= 0.9
;
