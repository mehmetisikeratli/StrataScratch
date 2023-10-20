
/*

Find Favourite Wine Variety
Difficulty: Hard

Question ID: ID 10037

Link to the question: 
https://platform.stratascratch.com/coding/10037-find-favourite-wine-variety

*/

WITH cte AS (
    SELECT taster_name
        , variety
        , RANK() OVER(PARTITION BY taster_name ORDER BY COUNT(id) DESC) AS rnk
        , COUNT(id) AS n_tastes
    FROM winemag_p2
    WHERE taster_name IS NOT NULL 
    GROUP BY taster_name, variety
    ORDER BY taster_name, rnk DESC
    )
SELECT taster_name
    , variety
FROM cte
WHERE rnk = 1
;

