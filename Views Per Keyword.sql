/*

Views Per Keyword
Difficulty: Hard

Question ID: ID 9791

Link to the question: 
https://platform.stratascratch.com/coding/9791-views-per-keyword

*/

WITH recursive cte AS
    ( SELECT post_text
        , post_id
        , post_keywords
        , 1 AS x
        , LENGTH(post_keywords) - LENGTH(REPLACE(post_keywords, ',','')) + 1 AS n
        , SUBSTRING_INDEX(SUBSTRING_INDEX(REPLACE(REPLACE(post_keywords,']',''),'[',''), ",", 1), ',', -1) AS keywords
      FROM facebook_posts
    UNION
    SELECT post_text
        , post_id
        , post_keywords
        , 1 + x
        , n
        , SUBSTRING_INDEX(SUBSTRING_INDEX(REPLACE(REPLACE(post_keywords,']',''),'[',''), ",", x+1), ',', -1) AS keywords
    FROM cte
    WHERE x < n
    )
SELECT TRIM('#' from cte.keywords) AS keyword
    , COUNT(pv.viewer_id) AS total_views
FROM cte
LEFT JOIN facebook_post_views AS pv
    USING(post_id)
GROUP BY keyword
ORDER BY total_views DESC
;
