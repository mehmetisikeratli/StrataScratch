
/*

Viewers Turned Streamers
Difficulty: Hard

Link to the question: https://platform.stratascratch.com/coding/2012-viewers-turned-streamers

*/

WITH cte AS (
    SELECT user_id 
    FROM (
        SELECT user_id,
          session_type,
          rank() OVER (PARTITION BY user_id ORDER BY session_start) AS streams_order
        FROM twitch_sessions
        ) first_session
    WHERE session_type = 'viewer'
        AND streams_order = 1
    )
SELECT user_id, COUNT(session_id) AS n_sessions
FROM twitch_sessions
WHERE user_id IN (SELECT user_id FROM cte)
    AND session_type = 'streamer'
GROUP BY user_id
ORDER BY user_id ASC
;
