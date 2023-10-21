
/*

Department Manager and Employee Salary Comparison
Difficulty: Hard

Question ID: ID 2146

Link to the question: 
https://platform.stratascratch.com/coding/2146-department-manager-and-employee-salary-comparison

*/

SELECT e2.id
    -- , e2.first_name
    -- , e2.last_name
    , e2.department
    , e2.salary
    , ROUND( AVG(e2.salary) OVER(PARTITION BY department) ,0) AS avg_dep_salary
    , e1.salary AS manager_salary
FROM employee_o AS e1
INNER JOIN employee_o AS e2
    ON e1.id = e2.manager_id
    AND e1.id <> e2.id
ORDER BY department, salary DESC
;
