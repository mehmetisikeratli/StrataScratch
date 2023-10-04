
/*

Popular Posts
Difficulty: Hard

Question ID: ID 2073

Link to the question: 
https://platform.stratascratch.com/coding/2073-popular-posts

*/


WITH cte AS (
    SELECT session_id
        , UNIX_TIMESTAMP(session_endtime) - UNIX_TIMESTAMP(session_starttime) AS sec
    FROM user_sessions AS s
    )
SELECT 
    -- cte.session_id
    v.post_id
    -- , cte.sec
    -- , v.perc_viewed 
    , SUM( v.perc_viewed *  (cte.sec / 100) ) AS time_spent
FROM post_views AS v
LEFT JOIN cte
    USING(session_id)
GROUP BY v.post_id
HAVING time_spent > 5
;

