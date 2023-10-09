
/*

Find the fraction of rides for each weather and the hour
Difficulty: Hard

Question ID: ID 514

Link to the question: 
https://platform.stratascratch.com/coding/514-marketing-campaign-success-advanced

*/


SELECT weather
    , hour
    -- , COUNT(r.index) AS n_rides_spec
    -- , (SELECT COUNT(r.index) FROM lyft_rides AS r) AS total_rides
    , COUNT(r.index) / (SELECT COUNT(r.index) FROM lyft_rides AS r) AS frac
FROM lyft_rides AS r
GROUP BY weather, hour
ORDER BY weather, hour
;
