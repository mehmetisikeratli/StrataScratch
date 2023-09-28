
/*

Distance Per Dollar
Difficulty: Hard

Question ID: ID 10302

Link to the question: 
https://platform.stratascratch.com/coding/10302-distance-per-dollar


*/


WITH cte AS (
    SELECT DATE_FORMAT(request_date, '%Y-%m') AS year_month_date
        , AVG(distance_to_travel / monetary_cost) AS avg_distance_per_dollar
        , AVG(distance_to_travel / monetary_cost) OVER(PARTITION BY DATE_FORMAT(request_date, '%Y-%m') ) AS average
    FROM uber_request_logs
    GROUP BY year_month_date
    )
SELECT year_month_date
    , ROUND( ABS(avg_distance_per_dollar - average ) , 2) AS diff
FROM cte
;

