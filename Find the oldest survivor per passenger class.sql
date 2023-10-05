
/*

Find the oldest survivor per passenger class
Difficulty: Hard

Question ID: ID 9883

Link to the question: 
https://platform.stratascratch.com/coding/9883-find-the-oldest-survivor-per-passenger-class

*/


WITH cte AS (
    SELECT pclass
        , name
        , age
        , RANK() OVER(PARTITION BY pclass ORDER BY age DESC) AS rnk
    FROM titanic
    WHERE survived = 1
    )
SELECT pclass
    , name
    , age
FROM cte
WHERE rnk = 1
ORDER BY pclass ASC
;

