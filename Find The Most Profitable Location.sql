
/*

Find The Most Profitable Location
Difficulty: Hard

Question ID: ID 2033

Link to the question: 
https://platform.stratascratch.com/coding/2033-find-the-most-profitable-location

*/


WITH cte AS (
    SELECT location
        , AVG(amt) AS avg_trx
    FROM transactions AS t
    LEFT JOIN signups AS s
        USING(signup_id)
    GROUP BY location
    ) ,
    cte2 AS (
    SELECT location
        , AVG( DATEDIFF(signup_stop_date, signup_start_date) ) AS avg_duration
    FROM signups
    GROUP BY location
    )
SELECT cte2.location
    , cte2.avg_duration
    , cte.avg_trx
    , cte.avg_trx / cte2.avg_duration AS ratio
FROM cte
JOIN cte2
    USING(location)
ORDER BY ratio DESC
;

