
/*

Find the average number of friends a user has
Difficulty: Hard

Question ID: ID 9822

Link to the question: 
https://platform.stratascratch.com/coding/9822-find-the-average-number-of-friends-a-user-has

*/


WITH cte AS (
    SELECT user_id, friend_id
    FROM google_friends_network
    UNION
    SELECT friend_id AS user_id, user_id AS friend_id
    FROM google_friends_network
    ) , 
    cte2 AS (
    SELECT user_id, COUNT(friend_id) AS n_friends
    FROM cte
    GROUP BY user_id
    )
SELECT AVG(n_friends) AS avg_friends
FROM cte2
;
