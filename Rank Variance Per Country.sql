
/*

Rank Variance Per Country
Difficulty: Hard

Question ID: ID 2007

Link to the question: 
https://platform.stratascratch.com/coding/2007-rank-variance-per-country

*/

WITH cte AS (
    SELECT 
        u.country
        , SUM(number_of_comments) AS n_comments
        , DENSE_RANK() OVER(ORDER BY SUM(number_of_comments) DESC) AS rnk
    FROM fb_active_users AS u
    LEFT JOIN fb_comments_count AS c
        USING(user_id)
    WHERE u.country IS NOT NULL
        AND c.created_at BETWEEN '2019-12-01' AND '2019-12-31'
    GROUP BY u.country
    ) ,
    cte2 AS (
    SELECT 
        u.country
        , SUM(number_of_comments) AS n_comments
        , DENSE_RANK() OVER(ORDER BY SUM(number_of_comments) DESC) AS rnk
    FROM fb_active_users AS u
    LEFT JOIN fb_comments_count AS c
        USING(user_id)
    WHERE u.country IS NOT NULL
        AND c.created_at BETWEEN '2020-01-01' AND '2020-01-31'
    GROUP BY u.country
    )
SELECT cte2.country
FROM cte2
LEFT JOIN cte
    ON cte.country = cte2.country
WHERE (cte2.rnk < cte.rnk)
    OR cte.country IS NULL
;
