
/*

Videos Removed on Latest Date
Difficulty: Hard

Question ID: ID 2105

Link to the question: 
https://platform.stratascratch.com/coding/2105-videos-removed-on-latest-date

*/


WITH latest_review AS (
    SELECT uf.user_firstname
        , uf.user_lastname
        , MAX(reviewed_date) AS latest_review_date
    FROM flag_review AS fr
    INNER JOIN user_flags AS uf
        USING(flag_id)
    WHERE fr.reviewed_by_yt = 1
    GROUP BY uf.user_firstname, uf.user_lastname
    ) , 
    removed_videos AS (
    SELECT reviewed_date
        , COUNT(DISTINCT uf.video_id) AS n_videos
    FROM flag_review AS fr
    LEFT JOIN user_flags AS uf
        USING(flag_id)
    WHERE reviewed_outcome = 'REMOVED'
    GROUP BY reviewed_date
    )
SELECT lr.user_firstname
    , lr.user_lastname
    , lr.latest_review_date
    , COALESCE(rv.n_videos,0) AS n_removed
FROM latest_review AS lr 
LEFT JOIN removed_videos AS rv
    ON lr.latest_review_date = rv.reviewed_date
;

