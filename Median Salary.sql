
/*

Median Salary
Difficulty: Hard

Question ID: ID 9900

Link to the question: 
https://platform.stratascratch.com/coding/9900-median-salary

*/


WITH cte AS (
    SELECT department
        , salary
        , CAST( ( ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary ASC) ) AS SIGNED ) AS rn_asc
        , CAST( (ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) ) AS SIGNED ) AS rn_desc
    FROM employee
    -- WHERE department = 'Sales'
    ORDER BY department, salary ASC
    )
SELECT department, AVG(salary) AS median_salary
FROM cte
WHERE ABS(rn_asc - rn_desc) <= 1
GROUP BY department
;
