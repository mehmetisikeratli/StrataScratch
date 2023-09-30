
/*

Olympic Medals By Chinese Athletes
Difficulty: Hard

Question ID: ID 9959

Link to the question: 
https://platform.stratascratch.com/coding/9959-olympic-medals-by-chinese-athletes

*/

SELECT medal
    , COALESCE(SUM(CASE WHEN year = 2000 THEN 1 END) , 0) AS medals_2000
    , COALESCE(SUM(CASE WHEN year = 2004 THEN 1 END) , 0) AS medals_2004
    , COALESCE(SUM(CASE WHEN year = 2008 THEN 1 END) , 0) AS medals_2008
    , COALESCE(SUM(CASE WHEN year = 2012 THEN 1 END) , 0) AS medals_2012
    , COALESCE(SUM(CASE WHEN year = 2016 THEN 1 END) , 0) AS medals_2016
    , COUNT(medal) AS total_medals
FROM olympics_athletes_events
WHERE team = 'China'
    AND year BETWEEN 2000 AND 2016
    AND season = 'Summer'
GROUP BY medal
;

