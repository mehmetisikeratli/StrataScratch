
/*

Positive Ad Channels
Difficulty: Hard

Question ID: ID 10013

Link to the question: 
https://platform.stratascratch.com/coding/10013-positive-ad-channels

*/


WITH cte AS (
    SELECT advertising_channel
    FROM uber_advertising
    GROUP BY advertising_channel
    HAVING MIN(customers_acquired) > 1500
    )
SELECT advertising_channel
FROM cte
ORDER BY money_spent DESC
LIMIT 1
;

