
/*

Find all wines from the winemag_p2 dataset which are produced in countries that have the highest sum of points in the winemag_p1 dataset
Difficulty: Hard

Question ID: ID 10040

Link to the question: 
https://platform.stratascratch.com/coding/10040-find-all-wines-from-the-winemag_p2-dataset-which-are-produced-in-countries-that-have-the-highest-sum-of-points-in-the-winemag_p1-dataset

*/

WITH cte AS (
    SELECT country
    FROM winemag_p1
    GROUP BY country
    ORDER BY SUM(points) DESC
    LIMIT 1
    )
SELECT *
FROM winemag_p2
INNER JOIN cte 
    USING(country)
WHERE winemag_p2.country = cte.country
;

