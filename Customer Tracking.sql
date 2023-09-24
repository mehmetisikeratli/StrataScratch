
/*

Customer Tracking
Difficulty: Hard

Question ID: ID 2136

Link to the question: 
https://platform.stratascratch.com/coding/2136-customer-tracking


*/

WITH cte AS (
    SELECT *
        ,(CASE WHEN state = 0 THEN LAG(timestamp) OVER(PARTITION BY cust_id ORDER BY cust_id, timestamp ASC) END)  AS prev_timestamp2
        , TIME_TO_SEC(TIMEDIFF(timestamp, (CASE WHEN state = 0 THEN LAG(timestamp) OVER(PARTITION BY cust_id  ORDER BY cust_id, timestamp ASC) END))) AS difference_in_seconds
    FROM cust_tracking
    ORDER BY cust_id, timestamp ASC
    -- WHERE cust_id = 'c001'
    )
SELECT cust_id, SUM(difference_in_seconds) / 3600 AS total_time_spent
FROM cte
WHERE state = 0
GROUP BY cust_id
;
