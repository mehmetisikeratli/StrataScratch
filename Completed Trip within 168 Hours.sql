
/*

Completed Trip within 168 Hours
Difficulty: Hard

Question ID: ID 2134

Link to the question: 
https://platform.stratascratch.com/coding/2134-completed-trip-within-168-hours

*/


WITH cte AS (
    SELECT rider_id
        , e.city_id
        , event_name
        , date(timestamp) AS date
        , COUNT(t.id) AS n_trips
    FROM signup_events AS e
    LEFT JOIN trip_details AS t
        ON e.rider_id = t.driver_id
    WHERE event_name = 'su_success'
        AND date(timestamp) BETWEEN '2022-01-01' AND '2022-01-07'
    GROUP BY rider_id
    )
SELECT city_id
    , date
    --  COUNT( CASE WHEN n_trips != 0 THEN rider_id END ) AS n_no_trips
    -- , COUNT(rider_id) AS n_all
    , COUNT( CASE WHEN n_trips != 0 THEN rider_id END ) / COUNT(rider_id) * 100 AS percentage
FROM cte
GROUP BY city_id, date
ORDER BY city_id, date
;
