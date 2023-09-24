
/*

Most Expensive And Cheapest Wine
Difficulty: Hard

Question ID: ID 10041

Link to the question: 
https://platform.stratascratch.com/coding/10041-most-expensive-and-cheapest-wine


*/


WITH all_regions AS (
    SELECT region_1 AS region, variety, price
    FROM winemag_p1
    WHERE region_1 IS NOT NULL
        AND price IS NOT NULL
    UNION
    SELECT region_2 AS region, variety, price
    FROM winemag_p1
    WHERE region_2 IS NOT NULL
        AND price IS NOT NULL
    ) ,
    cheap AS (
    SELECT *
        , DENSE_RANK() OVER(PARTITION BY region ORDER BY price ASC) AS for_cheap
    FROM all_regions
    ) ,
    exp AS (
    SELECT *
        , DENSE_RANK() OVER(PARTITION BY region ORDER BY price DESC) AS for_exp
    FROM all_regions
)
SELECT region, exp.variety AS exp_winery, cheap.variety AS cheap_winery
FROM cheap
JOIN exp
    USING(region)
WHERE for_cheap = 1
    AND for_exp = 1
;

