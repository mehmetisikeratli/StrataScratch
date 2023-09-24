
/*

Find how the average male height changed between each Olympics from 1896 to 2016
Difficulty: Hard

Question ID: ID 9957

Link to the question: 
https://platform.stratascratch.com/coding/9957-find-how-the-average-male-height-changed-between-each-olympics-from-1896-to-2016

*/

SELECT year
    , AVG(height) AS avg_height
    , COALESCE(LAG(AVG(height)) OVER(ORDER BY year ASC) , 172.73) AS prev_year_avg
    , AVG(height) - COALESCE(LAG(AVG(height)) OVER(ORDER BY year ASC) , 172.73) AS avg_height_difference
FROM (SELECT DISTINCT id,sex, height, year
      FROM olympics_athletes_events) AS a
WHERE year BETWEEN 1896 AND 2016
    AND sex = 'M'
GROUP BY year
ORDER BY year
;
