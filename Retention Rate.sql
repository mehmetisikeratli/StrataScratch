
/*

Retention Rate
Difficulty: Hard

Question ID: ID 2053

Link to the question: 
https://platform.stratascratch.com/coding/2053-retention-rate

*/

WITH cte AS (
    SELECT date
        , account_id
        , user_id
        , LEAD(date) OVER(PARTITION BY account_id, user_id ORDER BY date ASC) AS next_usage_month
    FROM sf_events
    GROUP BY MONTH(date), account_id, user_id
    ) , 
    cte2 AS (
    SELECT account_id, COUNT(next_usage_month) / COUNT(DISTINCT user_id) AS conv
    FROM cte
    WHERE date BETWEEN '2021-01-01' AND '2021-01-31'
    GROUP BY account_id
    ) ,
    cte3 AS (
    SELECT account_id, COUNT(next_usage_month) / COUNT(DISTINCT user_id) AS conv
    FROM cte
    WHERE date BETWEEN '2020-12-01' AND '2020-12-31'
    GROUP BY account_id    
    )
SELECT sf_events.account_id, COALESCE(cte3.conv / cte2.conv , 0) AS retention_rate
FROM sf_events
LEFT JOIN cte2 USING(account_id)
LEFT JOIN cte3 USING(account_id)
GROUP BY sf_events.account_id
;
