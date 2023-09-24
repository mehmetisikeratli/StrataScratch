
/*

Average Time Between Steps
Difficulty: Hard

Question ID: ID 9793

Link to the question: 
https://platform.stratascratch.com/coding/9793-average-time-between-steps

*/

WITH cte AS (
    SELECT *
        , LAG(timestamp) OVER(PARTITION BY feature_id, user_id ORDER BY step_reached ASC, timestamp ASC) AS prev_timestamp
        , TIMESTAMPDIFF(SECOND, LAG(timestamp) OVER(PARTITION BY feature_id, user_id ORDER BY step_reached ASC, timestamp ASC), timestamp) AS time_difference
    FROM facebook_product_features_realizations
    ) ,
    per_user AS (
    SELECT feature_id, AVG(time_difference) AS time_difference2
    FROM cte
    WHERE prev_timestamp IS NOT NULL
    GROUP BY feature_id, user_id
    )
SELECT feature_id, AVG(time_difference2) AS diff
FROM per_user
GROUP BY feature_id
;
