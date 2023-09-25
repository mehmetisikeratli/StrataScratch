
/*

Revenue Over Time
Difficulty: Hard

Question ID: ID 10314

Link to the question: 
https://platform.stratascratch.com/coding/10314-revenue-over-time

*/


WITH cte AS (
    SELECT DATE_FORMAT(created_at, '%Y-%m') AS month_year
        , SUM(purchase_amt) AS total_purchase
    FROM amazon_purchases
    WHERE purchase_amt > 0
    GROUP BY month_year
    )
SELECT month_year
    , AVG(total_purchase) OVER(ORDER BY month_year ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS 3_month_rolling_avg
FROM cte
ORDER BY month_year
;

