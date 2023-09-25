
/*

Sales Growth per Territory
Difficulty: Hard

Question ID: ID 2111

Link to the question: 
https://platform.stratascratch.com/coding/2111-sales-growth-per-territory

*/


WITH cte AS (
    SELECT territory_id
        , QUARTER(order_date) AS Q
        , SUM(order_value) AS current_q_sales
        , LAG(SUM(order_value)) OVER(PARTITION BY territory_id ORDER BY QUARTER(order_date)) AS prev_q_sales
    FROM fct_customer_sales AS s
    LEFT JOIN map_customer_territory AS t
        USING(cust_id)
    WHERE QUARTER(order_date) IN (3,4)
        AND YEAR(order_date) = 2021
    GROUP BY territory_id, QUARTER(order_date)
    )
SELECT territory_id
    , (( (current_q_sales - prev_q_sales) / prev_q_sales ) * 100 ) AS sales_growth
FROM cte
WHERE prev_q_sales IS NOT NULL
;

