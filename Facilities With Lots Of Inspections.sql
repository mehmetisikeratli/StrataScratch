
/*

Facilities With Lots Of Inspections
Difficulty: Hard

Question ID: ID 9711

Link to the question: 
https://platform.stratascratch.com/coding/9711-facilities-with-lots-of-inspections

*/

WITH cte AS (
    SELECT YEAR(activity_date) AS year
        , facility_name
        , COUNT(*) AS n_insp
        , RANK() OVER(PARTITION BY facility_name ORDER BY COUNT(record_id) DESC) AS rnk
    FROM los_angeles_restaurant_health_inspections
    GROUP BY facility_name, year
    ORDER BY facility_name, n_insp DESC
    ) , 
    cte2 AS (
    SELECT year
        , facility_name
        , rnk
        , COUNT(*) OVER(PARTITION BY facility_name) AS count_rnks
    FROM cte
    WHERE rnk = 1
    GROUP BY facility_name, year
    )
SELECT facility_name
FROM cte2
WHERE year = 2017
    AND rnk = 1
    AND count_rnks = 1
;
