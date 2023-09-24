
/*

User Streaks
Difficulty: Hard

Question ID: ID 2131

Link to the question: 
https://platform.stratascratch.com/coding/2131-user-streaks

*/

WITH cte1 AS (
    SELECT *
        -- , CAST(SUBSTRING(user_id, 2) AS UNSIGNED) AS new_id
        , ROW_NUMBER() OVER(PARTITION BY user_id, date_visited ORDER BY date_visited ASC)  AS rn
    FROM user_streaks
    WHERE date_visited <= '2022-08-10'
    ) ,
    cte2 AS (
    SELECT user_id
        , date_visited
        , ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY date_visited ASC) AS nrn
        , DATE_SUB(date_visited, INTERVAL (ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY date_visited ASC) ) DAY ) AS date_difference
    FROM cte1
    WHERE rn = 1
    ) ,
    cte3 AS (
    SELECT *
        , COUNT(*) OVER(PARTITION BY user_id, date_difference ORDER BY date_difference) AS streak_length
    FROM cte2
    )
SELECT DISTINCT user_id, streak_length
FROM cte3
ORDER BY streak_length DESC
LIMIT 3
;
