
/*

Norwegian Alpine Skiers
Difficulty: Hard

Question ID: ID 9955

Link to the question: 
https://platform.stratascratch.com/coding/9955-norwegian-alpine-skiers

*/

WITH cte AS (
    SELECT id, name
    FROM olympics_athletes_events
    WHERE team = 'Norway'
        AND year = 1992
        AND sport = 'Alpine Skiing'
        AND id NOT IN (SELECT id
                        FROM olympics_athletes_events
                        WHERE team = 'Norway'
                        AND year = 1994
                        AND sport = 'Alpine Skiing')
    )
SELECT DISTINCT name
FROM cte
;
