
/*

Consecutive Days
Difficulty: Hard

Question ID: ID 2054

Link to the question: 
https://platform.stratascratch.com/coding/2054-consecutive-days

*/


WITH cte AS (
    SELECT *
        -- , CONVERT(SUBSTRING(user_id, 2) AS UNSIGNED) AS new_id
        , ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY date  ASC) AS rn
        , DATE_SUB(date, INTERVAL ( ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY date  ASC) ) DAY) AS difference
    FROM sf_events
    ) , 
    cte2 AS (
    SELECT *
        , COUNT(*) OVER(PARTITION BY difference) AS count_of_repeatition
    FROM cte
    )
SELECT DISTINCT user_id
FROM cte2
WHERE count_of_repeatition >= 3
;
