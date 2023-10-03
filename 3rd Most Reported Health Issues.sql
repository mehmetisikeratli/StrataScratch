
/*

3rd Most Reported Health Issues
Difficulty: Hard

Question ID: ID 9701

Link to the question: 
https://platform.stratascratch.com/coding/9701-3rd-most-reported-health-issues

*/


WITH cte AS (
    SELECT pe_description
        , COUNT(DISTINCT serial_number) AS n_fac
        , RANK() OVER(ORDER BY COUNT(DISTINCT facility_name) DESC) AS rnk
    FROM los_angeles_restaurant_health_inspections
    WHERE LOWER(facility_name) LIKE '%cafe%'
        OR LOWER(facility_name) LIKE '%tea%'
        OR LOWER(facility_name) LIKE '%juice%'
    GROUP BY pe_description
    )
SELECT facility_name
FROM los_angeles_restaurant_health_inspections
WHERE pe_description IN (SELECT pe_description FROM cte WHERE rnk= 3)
    AND (LOWER(facility_name) LIKE '%cafe%'
        OR LOWER(facility_name) LIKE '%tea%'
        OR LOWER(facility_name) LIKE '%juice%')
;
