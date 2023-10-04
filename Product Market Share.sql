
/*

Product Market Share
Difficulty: Hard

Question ID: ID 2112

Link to the question: 
https://platform.stratascratch.com/coding/2112-product-market-share

*/


WITH cte AS (
    SELECT s.*
        , t.territory_id
        , p.prod_brand
        , COUNT(s.order_date) OVER(PARTITION BY territory_id, p.prod_brand) AS n_brand_sold
        , COUNT(s.order_date) OVER(PARTITION BY territory_id) AS n_territory_sold
    FROM fct_customer_sales AS s
    LEFT JOIN map_customer_territory AS t
        ON s.cust_id = t.cust_id
    LEFT JOIN dim_product AS p
        ON s.prod_sku_id = p.prod_sku_id
    WHERE YEAR(order_date) = 2021
        AND QUARTER(order_date) = 4
    )
SELECT territory_id
    , prod_brand
    , n_brand_sold / n_territory_sold * 100 AS market_share
FROM cte
GROUP BY territory_id, prod_brand
;

