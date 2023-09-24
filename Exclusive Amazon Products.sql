
/*

Exclusive Amazon Products
Difficulty: Hard

Question ID: ID 9608

Link to the question: 
https://platform.stratascratch.com/coding/9608-exclusive-amazon-products

*/

SELECT product_name
    , brand_name
    , price
    , rating
FROM innerwear_amazon_com
WHERE product_name NOT IN 
    (SELECT product_name
    FROM innerwear_macys_com
    UNION 
    SELECT product_name
    FROM innerwear_topshop_com)
;

