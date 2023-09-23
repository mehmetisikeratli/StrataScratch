

/*

Popularity Percentage
Difficulty: Hard

Question ID: ID 10284

Link to the question: https://platform.stratascratch.com/coding/10284-popularity-percentage

*/


WITH cte AS (
    SELECT user1 AS first_user, user2 AS secondary_user
    FROM facebook_friends
    UNION 
    SELECT user2 AS first_user, user1 AS secondary_user
    FROM facebook_friends
    )
SELECT first_user
    -- , COUNT(secondary_user) AS n_friends
    -- , (SELECT COUNT(user1) FROM facebook_friends) AS max_limit
    , COUNT(secondary_user) / (SELECT COUNT(user1) FROM facebook_friends) * 100 AS popularity_percentage
FROM cte
GROUP BY first_user
ORDER BY first_user ASC
;


