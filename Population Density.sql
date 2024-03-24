
/*

Population Density
Difficulty: Hard

Question ID: ID 10368

Link to the question: 
https://platform.stratascratch.com/coding/10368-population-density?code_type=3

*/


WITH min_density AS (
    SELECT city
        , country
        , ROUND(population / area , 0 ) AS density
        , RANK() OVER(ORDER BY ROUND(population / area , 0 ) ASC) AS rnk_asc
    FROM cities_population
    WHERE area > 0
    ) ,
    max_density AS (
    SELECT city
        , country
        , ROUND(population / area , 0 ) AS density
        , RANK() OVER(ORDER BY ROUND(population / area , 0 ) DESC) AS rnk_desc
    FROM cities_population
    WHERE area > 0
    )
SELECT city, country, density
FROM min_density
WHERE rnk_asc = 1
UNION ALL 
SELECT city, country, density
FROM max_density
WHERE rnk_desc = 1
;

