
/*

Lowest Revenue Generated Restaurants
Difficulty: Hard

Question ID: ID 2036

Link to the question: 
https://platform.stratascratch.com/coding/2036-lowest-revenue-generated-restaurants

*/

WITH cte AS (
    SELECT restaurant_id, SUM(order_total) AS total_orders
        , PERCENT_RANK() OVER(ORDER BY SUM(order_total) ASC ) AS percent
    FROM doordash_delivery
    WHERE date(customer_placed_order_datetime) BETWEEN '2020-05-01' AND '2020-05-31'
    GROUP BY restaurant_id
    ORDER BY total_orders ASC
    )
SELECT restaurant_id
    , total_orders
FROM cte
WHERE percent < 0.02
;
