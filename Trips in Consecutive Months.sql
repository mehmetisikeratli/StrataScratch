
/*

Average Time Between Steps
Difficulty: Hard

Question ID: ID 2076

Link to the question: 
https://platform.stratascratch.com/coding/2076-trips-in-consecutive-months

*/

SELECT DISTINCT t1.driver_id
FROM uber_trips AS t1
INNER JOIN uber_trips AS t2
    ON t1.driver_id = t2.driver_id
    AND DATE_FORMAT(t1.trip_date, '%Y-%m') = DATE_FORMAT(DATE_ADD(t2.trip_date, INTERVAL 1 MONTH) , '%Y-%m')
    AND t1.is_completed = 1
    AND t2.is_completed = 1
;

