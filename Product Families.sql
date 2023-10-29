
/*

Product Families
Difficulty: Hard

Question ID: ID 2123

Link to the question: 
https://platform.stratascratch.com/coding/2123-product-families

*/

SELECT p.product_family
    , COALESCE( SUM(s.units_sold) , 0) AS total_units_sold
    , COALESCE( COALESCE( SUM((CASE WHEN sp.promotion_id IS NOT NULL THEN s.units_sold ELSE 0 END)) , 0 ) / SUM(s.units_sold) * 100 , 0) AS perc_with_valid_promotion
FROM facebook_products AS p
LEFT JOIN facebook_sales AS s
    ON p.product_id = s.product_id
LEFT JOIN facebook_sales_promotions AS sp
    ON s.promotion_id = sp.promotion_id
GROUP BY p.product_family
;
