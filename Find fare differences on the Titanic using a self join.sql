
/*

Find fare differences on the Titanic using a self join
Difficulty: Hard

Question ID: ID 9603

Link to the question: 
https://platform.stratascratch.com/coding/9603-find-fare-differences-on-the-titanic-using-a-self-join

*/


WITH cte AS (
    SELECT t1.name
        , t1.passengerid
        , t1.pclass
        , t1.fare AS t1_fare
        , t2.fare AS t2_fare
        , ABS(t1.fare - t2.fare) AS diff
    FROM titanic AS t1
    INNER JOIN titanic AS t2
        ON t1.pclass = t2.pclass
        AND t1.passengerid != t2.passengerid
        AND t1.survived = 0
        AND t2.survived = 0
        AND ABS(t1.age - t2.age) <= 5
    ORDER BY t1.passengerid ASC
    )
SELECT name, ROUND(AVG(diff), 4)
FROM cte
GROUP BY name
;
