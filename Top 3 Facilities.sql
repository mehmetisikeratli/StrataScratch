
/*

Top 3 Facilities
Difficulty: Hard

Question ID: ID 9716

Link to the question: 
https://platform.stratascratch.com/coding/9716-top-3-facilities

*/


WITH cte AS (
    SELECT owner_name
        , facility_id
        , facility_address
        , AVG(score) AS avg_score
        , RANK() OVER(ORDER BY owner_name, AVG(score) DESC) AS rnk
    FROM los_angeles_restaurant_health_inspections
    GROUP BY owner_name, facility_id
    ORDER BY owner_name, rnk
    )
SELECT owner_name
    , MAX(CASE WHEN rnk = 1 THEN facility_address ELSE NULL END) AS facility_1
    , MAX(CASE WHEN rnk = 2 THEN facility_address ELSE NULL END) AS facility_2
    , MAX(CASE WHEN rnk = 3 THEN facility_address ELSE NULL END) AS facility_3
FROM cte
WHERE rnk <= 3
ORDER BY owner_name
;
