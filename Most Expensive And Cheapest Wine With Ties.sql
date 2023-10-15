
/*

Most Expensive And Cheapest Wine With Ties
Difficulty: Hard

Question ID: ID 2147

Link to the question: 
https://platform.stratascratch.com/coding/2147-most-expensive-and-cheapest-wine-with-ties

*/


WITH cte AS (
    SELECT region_1 AS region
        , variety
        , price
    FROM winemag_pd
    UNION ALL
    SELECT region_2 AS region
        , variety
        , price
    FROM winemag_pd
    ) , 
cte2 AS (
    SELECT *
        , RANK() OVER(PARTITION BY region ORDER BY price DESC) AS rnk_desc
        , RANK() OVER(PARTITION BY region ORDER BY price ASC) AS rnk_asc
    FROM cte
    WHERE price IS NOT NULL
        AND region IS NOT NULL
    ) ,
exp AS (
    SELECT DISTINCT region
        , variety AS most_exp_variety
    FROM cte2
    WHERE rnk_desc = 1
    ) ,
cheap AS (
    SELECT DISTINCT region
        , variety AS least_exp_variety
    FROM cte2
    WHERE rnk_asc = 1
    )
SELECT exp.region
    , most_exp_variety
    , least_exp_variety
FROM exp
JOIN cheap
    USING(region)
ORDER BY region DESC
;
