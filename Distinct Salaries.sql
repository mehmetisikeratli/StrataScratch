
/*

Distinct Salaries
Difficulty: Hard

Question ID: ID 9898

Link to the question: https://platform.stratascratch.com/coding/9898-unique-salaries

*/


WITH distinct_salaries AS (
    SELECT DISTINCT department, salary
    FROM twitter_employee
) -- the cte retrieves only the distinct combinations of department and salary
SELECT department, salary
FROM (
    SELECT department, salary, DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM distinct_salaries
) ranked_employees
WHERE rnk <= 3
;
