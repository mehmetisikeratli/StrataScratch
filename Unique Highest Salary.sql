
/*

Unique Highest Salary
Difficulty: Hard

Question ID: ID 9919

Link to the question: 
https://platform.stratascratch.com/coding/9919-unique-highest-salary

*/

SELECT MAX(salary) AS max_salary
FROM (
    SELECT salary, COUNT(salary) AS n_salary
    FROM employee
    GROUP BY salary
    HAVING COUNT(salary) = 1
    ORDER BY n_salary DESC
    ) a
;
