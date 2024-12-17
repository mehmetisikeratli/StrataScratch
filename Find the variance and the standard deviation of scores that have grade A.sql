
/*

Find the variance and the standard deviation of scores that have grade A
Difficulty: Hard

Question ID: ID 9708

Link to the question: 
https://platform.stratascratch.com/coding/9708-find-the-variance-and-the-standard-deviation-of-scores-that-have-grade-a

*/


SELECT AVG(sqr) AS variance
    , POWER(AVG(sqr), 0.5) AS std_deviation
FROM (
SELECT serial_number
    , score
    , POWER(score - (SELECT AVG(score) AS avg_score
        FROM los_angeles_restaurant_health_inspections
        WHERE grade = 'A')
      , 2 ) AS sqr
FROM los_angeles_restaurant_health_inspections
WHERE grade = 'A'
) a
;
