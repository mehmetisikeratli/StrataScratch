
/*

Reviewed flags of top videos
Difficulty: Hard

Question ID: ID 2103

Link to the question: 
https://platform.stratascratch.com/coding/2103-reviewed-flags-of-top-videos


*/

WITH cte AS (
    SELECT video_id
        , COUNT(flag_id) AS n_flags
        , RANK() OVER(ORDER BY COUNT(flag_id) DESC) AS rnk
    FROM user_flags
    GROUP BY video_id
    )
SELECT cte.video_id, COUNT(uf.flag_id) AS n_reviewed
FROM user_flags AS uf
LEFT JOIN cte ON cte.video_id = uf.video_id
LEFT JOIN flag_review AS fr ON fr.flag_id = uf.flag_id
WHERE rnk = 1
    AND fr.reviewed_by_yt = 1
GROUP BY cte.video_id
;

