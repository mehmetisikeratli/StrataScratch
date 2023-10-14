
/*

Highest Number Of High-risk Violations
Difficulty: Hard

Question ID: ID 9736

Link to the question: 
https://platform.stratascratch.com/coding/9736-highest-number-of-high-risk-violations

*/

WITH cte AS (
    SELECT business_id
        , COUNT(violation_id) AS n_violations
        , RANK() OVER(ORDER BY COUNT(violation_id) DESC) AS rnk
    FROM sf_restaurant_health_violations
    WHERE LOWER(risk_category) LIKE '%high risk%'
    GROUP BY business_id
    )
SELECT sf.*
FROM cte
LEFT JOIN sf_restaurant_health_violations AS sf
    USING(business_id)
WHERE cte.rnk = 1
;

