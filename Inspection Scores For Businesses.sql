
/*

Inspection Scores For Businesses
Difficulty: Hard

Question ID: ID 9741

Link to the question: 
https://platform.stratascratch.com/coding/9741-inspection-scores-for-businesses

*/

WITH cte AS (
    SELECT business_name
        , inspection_score
        , CAST( ROW_NUMBER() OVER(PARTITION BY business_name ORDER BY inspection_score, inspection_id ASC) AS SIGNED) AS rnk_asc
        , CAST( ROW_NUMBER() OVER(PARTITION BY business_name ORDER BY inspection_score, inspection_id DESC) AS SIGNED) AS rnk_desc
    FROM sf_restaurant_health_violations
    WHERE inspection_score IS NOT NULL
    )
SELECT business_name
    , AVG(inspection_score) AS median_inspection_score
FROM cte
WHERE ABS(rnk_asc - rnk_desc) <= 1
GROUP BY business_name
ORDER BY median_inspection_score DESC
;
