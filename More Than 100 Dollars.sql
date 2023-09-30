
/*

Average Time Between Steps
Difficulty: Hard

Question ID: ID 2115

Link to the question: 
https://platform.stratascratch.com/coding/2115-more-than-100-dollars

*/

WITH cte AS (
    SELECT MONTH(d_o.actual_delivery_time) AS month
        , restaurant_id
        , SUM(sales_amount) AS total_sales
        , IF(SUM(sales_amount) >= 100 , 1 , 0) AS flag
    FROM delivery_orders AS d_o
    LEFT JOIN order_value AS ov
        USING(delivery_id)
    WHERE d_o.actual_delivery_time IS NOT NULL
        AND YEAR(d_o.actual_delivery_time) = 2021
    GROUP BY MONTH(d_o.actual_delivery_time), restaurant_id
    ORDER BY MONTH(d_o.actual_delivery_time), restaurant_id
    )
SELECT month, SUM(flag) / COUNT(restaurant_id) * 100 AS per_over_100
FROM cte
GROUP BY month
;
