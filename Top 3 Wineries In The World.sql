
/*

Top 3 Wineries In The World
Difficulty: Hard

Question ID: ID 10042

Link to the question: 
https://platform.stratascratch.com/coding/10042-top-3-wineries-in-the-world

*/

WITH cte AS (
    SELECT country
        , winery
        , AVG(points) AS avg_points
        , ROW_NUMBER() OVER(PARTITION BY country ORDER BY AVG(points) DESC, winery) AS rnk
    FROM winemag_p1
    GROUP BY country, winery
    ORDER BY country, rnk
    )
SELECT country
    , MAX(CASE WHEN rnk = 1 THEN CONCAT(winery,' (',ROUND(avg_points,0),')') END) AS top_winery
    , COALESCE( MAX(CASE WHEN rnk = 2 THEN CONCAT(winery,' (',ROUND(avg_points,0),')') END) ,'No second winery' ) AS second_winery
    , COALESCE( MAX(CASE WHEN rnk = 3 THEN CONCAT(winery,' (',ROUND(avg_points,0),')') END) ,'No third winery' ) AS third_winery 
FROM cte
GROUP BY country
;

