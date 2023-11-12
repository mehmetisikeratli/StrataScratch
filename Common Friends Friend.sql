
/*

Common Friends Friend
Difficulty: Hard

Question ID: ID 9821

Link to the question: 
https://platform.stratascratch.com/coding/9821-common-friends-friend/solutions

*/


WITH all_friend_pairs AS (
    SELECT user_id
        , friend_id
    FROM google_friends_network
    UNION ALL 
    SELECT friend_id AS user_id
        , user_id AS friend_id
    FROM google_friends_network
    ) , 
    friends_friends AS (
    SELECT f1.user_id
        , f1.friend_id
        , f2.friend_id AS friends_friends
    FROM all_friend_pairs AS f1
    INNER JOIN all_friend_pairs AS f2
        ON f1.friend_id = f2.user_id
    )
SELECT f1.user_id
    , COUNT(DISTINCT f2.friends_friends) AS n_friends_friends
FROM all_friend_pairs AS f1
INNER JOIN friends_friends AS f2
    ON f1.user_id = f2.user_id
    AND f1.friend_id = f2.friends_friends
-- WHERE f1.user_id = 0
GROUP BY f1.user_id
;
