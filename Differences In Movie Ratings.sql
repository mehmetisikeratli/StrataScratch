
/*

Differences In Movie Ratings
Difficulty: Hard

Question ID: ID 9606

Link to the question: 
https://platform.stratascratch.com/coding/9606-differences-in-movie-ratings

*/

WITH lfr AS (
    SELECT name
        , AVG(rating) AS lifetime_rating
    FROM nominee_filmography
    WHERE rating IS NOT NULL
        AND role_type = 'Normal Acting'
        -- AND name = 'Robert Downey Jr.'
    GROUP BY name
    ) ,
    slr AS (
        SELECT name
            , id
            , movie_title
            , rating
            , RANK() OVER(PARTITION BY name ORDER BY id DESC) AS rnk
        FROM nominee_filmography
        WHERE rating IS NOT NULL
            AND role_type = 'Normal Acting'
            -- AND name = 'Robert Downey Jr.'
    ) , 
    cte3 AS (
    SELECT name, AVG(rating) AS second_last_rating
    FROM slr 
    WHERE rnk = 2
    GROUP BY name
    )
SELECT name
    , second_last_rating
    , lifetime_rating
    , ABS(lifetime_rating - second_last_rating) AS variance
FROM lfr
INNER JOIN cte3
    USING(name)
;
