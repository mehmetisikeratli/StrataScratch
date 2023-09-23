
/*

Player with Longest Streak
Difficulty: Hard

Question ID: ID 2059

Link to the question: https://platform.stratascratch.com/coding/2059-player-with-longest-streak

*/


WITH lagged AS (
    SELECT *
        , IF(match_result = 'W', 1, 0) AS did_win
        , LAG(IF(match_result = 'W', 1, 0), 1) OVER(PARTITION BY player_id ORDER BY match_date) AS did_win_before
    FROM players_results
    -- WHERE player_id = 402
    ) ,
    streak_change AS (
    SELECT *
        , (CASE WHEN did_win_before != did_win THEN 1 ELSE 0 END) AS streak_changed
    FROM lagged
    ) ,
    streak_identified AS (
    SELECT *
        , SUM(streak_changed) OVER(PARTITION BY player_id ORDER BY match_date) AS count_of_streaks
    FROM streak_change
    ) ,
    record_counts AS (
    SELECT *
        , ROW_NUMBER() OVER(PARTITION BY player_id, count_of_streaks ORDER BY match_date) AS row_count
    FROM streak_identified
    ) ,
    final_cte AS (
    SELECT player_id
        , MAX(row_count) AS max_win_streak
        , RANK() OVER(ORDER BY MAX(row_count) DESC) AS rnk
    FROM record_counts
    WHERE match_result = 'W'
    GROUP BY player_id
    )
SELECT player_id
    , max_win_streak
FROM final_cte
WHERE rnk = 1
;

