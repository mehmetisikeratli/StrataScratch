
/*

Fans vs Opposition
Difficulty: Hard

Question ID: ID 10062

Link to the question: 
https://platform.stratascratch.com/coding/10062-fans-vs-opposition

*/


WITH cte_asc AS (
    SELECT *
        , ROW_NUMBER() OVER(ORDER BY popularity ASC, employee_id ASC) AS rnk_asc
    FROM facebook_hack_survey
    ) ,
    cte_desc AS (
    SELECT *
        , ROW_NUMBER() OVER(ORDER BY popularity DESC, employee_id ASC) AS rnk_desc
    FROM facebook_hack_survey    
    )
SELECT cte_asc.employee_id AS emp_opposition_id
    , cte_desc.employee_id AS emp_fan_id
FROM cte_asc
INNER JOIN cte_desc
    ON cte_asc.rnk_asc = cte_desc.rnk_desc
;
