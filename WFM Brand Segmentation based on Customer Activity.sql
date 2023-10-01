
/*

WFM Brand Segmentation based on Customer Activity
Difficulty: Hard

Question ID: ID 2038

Link to the question: 
https://platform.stratascratch.com/coding/2038-wfm-brand-segmentation-based-on-customer-activity

*/

WITH cte AS (
    SELECT s.store_brand
        , t.customer_id
        , SUM(t.sales) AS total_sales
        , COUNT(DISTINCT t.transaction_id) AS n_trx
        , SUM(t.sales) / COUNT(DISTINCT t.transaction_id) AS avg_basket_size
        , (CASE 
            WHEN SUM(t.sales) / COUNT(DISTINCT t.transaction_id) > 30 THEN 'High' 
            WHEN SUM(t.sales) / COUNT(DISTINCT t.transaction_id) BETWEEN 20 AND 30 THEN 'Medium' 
            WHEN SUM(t.sales) / COUNT(DISTINCT t.transaction_id) < 20 THEN 'Low'
          END) AS segment    
    FROM wfm_transactions AS t
    LEFT JOIN wfm_stores AS s
        ON t.store_id = s.store_id
    WHERE YEAR(t.transaction_date) = 2017
    GROUP BY s.store_brand , t.customer_id
    )
SELECT 
    store_brand
    , segment
    , COUNT(DISTINCT customer_id) AS n_customers
    , SUM(n_trx) AS n_trx
    , SUM(total_sales) AS total_sales
    , SUM(total_sales) / SUM(n_trx) AS avg_basket_size
FROM cte
GROUP BY store_brand , segment
;
