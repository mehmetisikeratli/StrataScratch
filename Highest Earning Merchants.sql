
/*

Highest Earning Merchants
Difficulty: Hard

Question ID: ID 2094

Link to the question: 
https://platform.stratascratch.com/coding/2094-highest-earning-merchants

*/


WITH cte AS (
    SELECT date(order_timestamp) AS order_date
        , merchant_id
        , ROUND( SUM(total_amount_earned) , 2 ) AS total_amount
        , RANK() OVER(PARTITION BY date(order_timestamp) ORDER BY ROUND( SUM(total_amount_earned) , 2 ) DESC) AS rnk
    FROM order_details
    -- WHERE merchant_id IN (3,2)
    GROUP BY order_date, merchant_id
    )
SELECT DATE_ADD(order_date, INTERVAL 1 DAY) AS prev_day
    -- , merchant_id
    , md.name
FROM cte
LEFT JOIN merchant_details AS md
    ON cte.merchant_id = md.id
WHERE rnk = 1
;
