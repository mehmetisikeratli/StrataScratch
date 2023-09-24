
/*

First Day Retention Rate
Difficulty: Hard

Question ID: ID 2090

Link to the question: 
https://platform.stratascratch.com/coding/2090-first-day-retention-rate

*/

WITH cte AS (
    SELECT player_id
        , login_date
        , LAG(login_date) OVER(PARTITION BY player_id ORDER BY login_date) AS prev_login
        , DATEDIFF(login_date, LAG(login_date) OVER(PARTITION BY player_id ORDER BY login_date) ) AS dateDiff
    FROM players_logins
    )
SELECT COUNT(DISTINCT CASE WHEN dateDiff = 1 THEN player_id END) 
    / COUNT(DISTINCT player_id) AS retention_rate
FROM cte 
;

