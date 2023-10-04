
/*

Time Between Two Events
Difficulty: Hard

Question ID: ID 9784

Link to the question: 
https://platform.stratascratch.com/coding/9784-time-between-two-events

*/


WITH cte AS (
    SELECT 
        user_id
        , timestamp
        , action
        , LAG(action) OVER(PARTITION BY user_id ORDER BY timestamp ASC) AS prev_action
        , LAG(timestamp) OVER(PARTITION BY user_id ORDER BY timestamp ASC) AS prev_timestamp
        , TIMEDIFF(timestamp, LAG(timestamp) OVER(PARTITION BY user_id ORDER BY timestamp ASC)) AS timediff
    FROM facebook_web_log
    ) ,
    cte2 AS (
    SELECT 
        user_id
        , timestamp
        , prev_action
        , prev_timestamp
        , TIME_FORMAT(SEC_TO_TIME(timediff),'%H:%i:%s') AS timediff
        , RANK() OVER(ORDER BY timediff ASC) AS rnk
    FROM cte
    WHERE action = 'scroll_down'
        AND prev_action = 'page_load'
    )
SELECT user_id, timestamp, prev_timestamp, timediff
FROM cte2
WHERE rnk = 1
;
