
/*

Delivering and Placing Orders
Difficulty: Hard

Question ID: ID 2037

Link to the question: 
https://platform.stratascratch.com/coding/2037-delivering-and-placing-orders

*/

--  Pearson's correlation coefficient
--  p = E[XY] - E[X]E[Y]
--   --------------------------------------------
--    SQRT(E[X^2] - E[X]^2)* SQRT(E[Y^2] - E[Y]^2)
--  https://en.wikipedia.org/wiki/Pearson_correlation_coefficient

WITH cte AS (
    SELECT restaurant_id
        , AVG(order_total) AS avg_order_total
        , AVG(TIMESTAMPDIFF(minute, customer_placed_order_datetime, delivered_to_consumer_datetime) ) AS avg_time
        -- order_total - discount_amount - refunded_amount AS net_order_total
    FROM delivery_details
    GROUP BY restaurant_id
    )
SELECT (AVG(avg_order_total * avg_time) - AVG(avg_order_total) * AVG(avg_time) ) / (
    SQRT( AVG(POW(avg_order_total,2)) - POW( AVG(avg_order_total),2 ) )  * SQRT( AVG(POW(avg_time,2)) - POW( AVG(avg_time),2 ) )
    ) AS correlation
FROM cte
;
