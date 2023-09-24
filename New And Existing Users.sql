
/*

New And Existing Users
Difficulty: Hard

Question ID: ID 2028

Link to the question: 
https://platform.stratascratch.com/coding/2028-new-and-existing-users

*/

WITH new_users AS (
    SELECT MONTH(new_user_start) AS month,  COUNT(DISTINCT user_id) AS new_users
    FROM (SELECT user_id
            , MIN(time_id) AS new_user_start
          FROM fact_events
          GROUP BY user_id) AS a
    GROUP BY month
    ) ,
    all_users AS (
        SELECT MONTH(time_id) AS month
            , COUNT(DISTINCT user_id) AS all_users
        FROM fact_events
        GROUP BY MONTH(time_id)
    )
SELECT all_users.month
    , new_users.new_users / all_users.all_users AS new_user_percentage
    , 1 - (new_users.new_users / all_users.all_users) AS old_user_percentage
FROM all_users 
JOIN new_users USING(month)
;
