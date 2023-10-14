
/*

Worst Businesses
Difficulty: Hard

Question ID: ID 9739

Link to the question: 
https://platform.stratascratch.com/coding/9739-worst-businesses

*/

WITH cte AS (
    SELECT YEAR(inspection_date) AS year
        , business_name
        , RANK() OVER(PARTITION BY YEAR(inspection_date) ORDER BY COUNT(violation_id) DESC) AS rnk
        , COUNT(violation_id) AS n_violations
    FROM sf_restaurant_health_violations
    GROUP BY year, business_name
    )
SELECT year, business_name, n_violations
FROM cte
WHERE rnk = 1
;
