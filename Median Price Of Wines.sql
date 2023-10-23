
/*

Median Price Of Wines
Difficulty: Hard

Question ID: ID 10043

Link to the question: 
https://platform.stratascratch.com/coding/10043-median-price-of-wines

*/


WITH cte AS (
    SELECT price
        , variety
    FROM winemag_p1
    WHERE price IS NOT NULL
    UNION ALL 
    SELECT price
        , variety
    FROM winemag_p2
    WHERE price IS NOT NULL
    ) , 
    cte2 AS (
    SELECT DISTINCT variety
        , price
        , CAST(RANK() OVER(PARTITION BY variety ORDER BY price ASC) AS SIGNED) AS rnk_asc
        , CAST(RANK() OVER(PARTITION BY variety ORDER BY price DESC) AS SIGNED) AS rnk_desc
    FROM cte
    )
SELECT variety
    , AVG(price) AS median_price
FROM cte2
WHERE ABS(rnk_asc - rnk_desc) <= 1
GROUP BY variety
;
