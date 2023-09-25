
/*

Top Teams In The Rio De Janeiro 2016 Olympics
Difficulty: Hard

Question ID: ID 9960

Link to the question: 
https://platform.stratascratch.com/coding/9960-top-teams-in-the-rio-de-janeiro-2016-olympics


*/

WITH cte AS (
    SELECT event
        , team
        , COUNT(medal) AS n_medals
        -- , id
        , ROW_NUMBER() OVER(PARTITION BY event ORDER BY COUNT(medal) DESC) AS rnk
    FROM olympics_athletes_events
    WHERE year = 2016
        AND medal IS NOT NULL
        AND city = 'Rio de Janeiro'
        -- AND event = "Basketball Women's Basketball"
    GROUP BY event, team
    ORDER BY event, team, n_medals
    )
SELECT event
    , COALESCE(MAX(CASE WHEN rnk = 1 THEN CONCAT(team,' with ', n_medals, ' medals')END), 'No Team') AS gold_team
    , COALESCE(MAX(CASE WHEN rnk = 2 THEN CONCAT(team,' with ', n_medals, ' medals') END), 'No Team' ) AS silver_team
    , COALESCE(MAX(CASE WHEN rnk = 3 THEN CONCAT(team,' with ', n_medals, ' medals') END), 'No Team' ) AS bronze_team
FROM cte
GROUP BY event
;
