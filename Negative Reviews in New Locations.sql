
/*

Negative Reviews in New Locations
Difficulty: Hard

Question ID: ID 2087

Link to the question: 
https://platform.stratascratch.com/coding/2087-negative-reviews-in-new-locations

*/


WITH cte AS (
    SELECT r.store_id
        , s.name
        , COUNT(CASE WHEN r.score < 5 THEN s.id END) AS n_negative
        , COUNT(CASE WHEN r.score < 5 THEN s.id END) / COUNT(s.id) AS negative_ratio
        , COUNT(CASE WHEN r.score < 5 THEN s.id END) / COUNT(CASE WHEN r.score >= 5 THEN s.id END) AS negative_to_positive
    FROM instacart_reviews AS r
    INNER JOIN instacart_stores AS s
        ON r.store_id = s.id
    WHERE YEAR(opening_date) = 2021
        AND MONTH(opening_date) > 6
    GROUP BY s.name
    )
SELECT name
    , negative_to_positive
FROM cte
WHERE negative_ratio > 0.2
;

