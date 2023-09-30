
/*

Name to Medal Connection
Difficulty: Hard

Question ID: ID 9952

Link to the question: 
https://platform.stratascratch.com/coding/9952-name-to-medal-connection

*/

WITH cte AS (
    SELECT *
        , LENGTH(SUBSTRING_INDEX(name, ' ', 1) ) AS length_of_name
    FROM olympics_athletes_events
    )
SELECT length_of_name
    , COUNT(CASE WHEN medal IS NULL THEN 1 END) AS no_medals
    , COUNT(CASE WHEN medal = 'Gold' THEN 1 END) AS gold_medals
    , COUNT(CASE WHEN medal = 'Silver' THEN 1 END) AS silver_medals
    , COUNT(CASE WHEN medal = 'Bronze' THEN 1 END) AS bronze_medals
FROM cte
GROUP BY length_of_name
;
