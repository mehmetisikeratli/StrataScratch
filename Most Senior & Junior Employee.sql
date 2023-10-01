
/*

Most Senior & Junior Employee
Difficulty: Hard

Question ID: ID 2044

Link to the question: 
https://platform.stratascratch.com/coding/2044-most-senior-junior-employee

*/

WITH cte AS (
    SELECT id
        , hire_date
        , RANK() OVER(ORDER BY hire_date) AS rnk_for_short
        , RANK() OVER(ORDER BY hire_date DESC) AS rnk_for_long
    FROM uber_employees
    WHERE termination_date IS NULL
    GROUP BY id
    )
SELECT COUNT(CASE WHEN rnk_for_short = 1 THEN id END ) AS n_shortest
    , COUNT(CASE WHEN rnk_for_long = 1 THEN id END ) AS n_longest
    , DATEDIFF( (SELECT MAX(hire_date) FROM uber_employees WHERE termination_date IS NULL) ,  (SELECT MIN(hire_date) FROM uber_employees WHERE termination_date IS NULL) ) AS diff
FROM cte
;
