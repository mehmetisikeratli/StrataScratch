
/*

Minimum Number of Platforms
Difficulty: Hard

Question ID: ID 2082

Link to the question: 
https://platform.stratascratch.com/coding/2082-minimum-number-of-platforms

*/

WITH cte AS (
    SELECT train_id
        , arrival_time AS times
        , 1 AS num
    FROM train_arrivals AS a
    UNION ALL 
    SELECT train_id
        , departure_time AS times
        , -1 AS num
    FROM train_departures
    ) ,
    cte2 AS (
    SELECT *
        , SUM(num) OVER(ORDER BY times, num DESC) AS trains_at_same_time
    FROM cte
    ORDER BY times, num
    )
SELECT 
    MAX(trains_at_same_time) AS max_platforms_needed
FROM cte2
;
