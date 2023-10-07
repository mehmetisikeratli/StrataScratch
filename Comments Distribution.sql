
/*

Comments Distribution
Difficulty: Hard

Question ID: ID 10297

Link to the question: 
https://platform.stratascratch.com/coding/10297-comments-distribution

*/


SELECT n_comments
    , COUNT(user_id) AS n_users
FROM (
    SELECT user_id
        , COUNT(body) AS n_comments
    FROM fb_comments AS c
    LEFT JOIN fb_users AS u
        ON u.id = c.user_id
    WHERE YEAR(c.created_at) = 2020
        AND MONTH(c.created_at) = 1
        AND u.joined_at BETWEEN '2018-01-01' AND '2019-12-31'
    GROUP BY user_id
    ) a
GROUP BY n_comments
ORDER BY n_comments
;
