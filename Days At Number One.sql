
/*

Days At Number One
Difficulty: Hard

Question ID: ID 10173

Link to the question: 
https://platform.stratascratch.com/coding/10173-days-at-number-one

*/


WITH cte1 AS (
    SELECT position
        , trackname
        , date
    FROM spotify_daily_rankings_2017_us
    WHERE position = 1
    ORDER BY date ASC
    ) ,
    cte2 AS (
    SELECT position
    , trackname
    , date
    , region
    FROM spotify_worldwide_daily_song_ranking
    WHERE position = 1
    ORDER BY date ASC
    )
SELECT cte1.trackname
    , COUNT(cte1.trackname) AS n_days
FROM cte1
INNER JOIN cte2
    ON cte1.position = cte2.position
    AND cte1.trackname = cte2.trackname
    AND cte1.date = cte2.date
GROUP BY cte1.trackname
;
