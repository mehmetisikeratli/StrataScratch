
/*

Number Of Inspections By Zip
Difficulty: Hard

Question ID: ID 9734

Link to the question: 
https://platform.stratascratch.com/coding/9734-number-of-inspections-by-zip

*/

SELECT YEAR(inspection_date) AS year
    , COUNT(CASE WHEN MONTH(inspection_date) = 1 THEN inspection_id END) AS jan_insp
    , COUNT(CASE WHEN MONTH(inspection_date) = 5 THEN inspection_id END) AS may_insp
    , COUNT(CASE WHEN MONTH(inspection_date) = 11 THEN inspection_id END) AS nov_insp
FROM sf_restaurant_health_violations
WHERE business_postal_code = 94102
    AND MONTH(inspection_date) IN (1,5,11)
GROUP BY year
;

