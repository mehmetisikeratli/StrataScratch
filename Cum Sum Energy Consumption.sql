
/*

Cum Sum Energy Consumption
Difficulty: Hard

Question ID: ID 10084

Link to the question: 
https://platform.stratascratch.com/coding/10084-cum-sum-energy-consumption

*/


WITH cte AS (
    SELECT *
    FROM fb_eu_energy
    UNION ALL 
    SELECT *
    FROM fb_na_energy
    UNION ALL 
    SELECT *
    FROM fb_asia_energy
    ) ,
    cte2 AS (
    SELECT date
        , SUM(consumption) AS total_consumption
    FROM cte
    GROUP BY date
    )
SELECT date
    , SUM(total_consumption) OVER(ORDER BY date) AS running_total
    , ROUND( SUM(total_consumption) OVER(ORDER BY date) / (SELECT SUM(consumption) FROM cte) * 100 ) AS perc
FROM cte2
GROUP BY date
ORDER BY date ASC
;

