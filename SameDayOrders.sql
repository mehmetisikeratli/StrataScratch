
/*

Same-Day Orders
Difficulty: Hard

Question ID: ID 10545

Link to the question: 
https://platform.stratascratch.com/coding/10545-same-day-orders

*/

WITH cte AS (
    SELECT user_id
        , session_date
    FROM sessions
    GROUP BY user_id, session_date
) -- SELECT * FROM cte;
SELECT o.user_id
    , DATE(o.order_date) AS date
    , COUNT(o.order_id) AS n_orders
    , SUM(order_value) AS total_order_values
FROM cte
LEFT JOIN order_summary AS o
    ON o.user_id = cte.user_id
    AND DATE(o.order_date) = DATE(cte.session_date)
GROUP BY o.user_id
;

