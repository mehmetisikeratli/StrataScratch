
/*

Highest Paid City Employees
Difficulty: Hard

Question ID: ID 9989

Link to the question: 
https://platform.stratascratch.com/coding/9989-highest-paid-city-employees

*/


WITH cte AS (
    SELECT jobtitle
        , employeename
        , totalpaybenefits
        , ROW_NUMBER() OVER(PARTITION BY jobtitle ORDER BY totalpaybenefits DESC) AS rnk
    FROM sf_public_salaries
    )
SELECT jobtitle
    , MAX(CASE WHEN rnk = 1 THEN employeename END) AS best_emp
    , MAX(CASE WHEN rnk = 2 THEN employeename END) AS second_best_emp
FROM cte
GROUP BY jobtitle
;
