
/*

The Cheapest Airline Connection
Difficulty: Hard

Question ID: ID 2008

Link to the question: 
https://platform.stratascratch.com/coding/2008-the-cheapest-airline-connection

*/


WITH variations AS (
    SELECT u1.origin AS origin0
        , u1.destination AS destination0
        , u1.cost AS cost0
        , u2.origin AS origin1
        , u2.destination AS destination1
        , u2.cost AS cost1
        , u3.origin AS origin2
        , u3.destination AS destination2
        , u3.cost AS cost2
    FROM da_flights AS u1
    LEFT JOIN da_flights AS u2
        ON u1.destination = u2.origin
    LEFT JOIN da_flights AS u3
        ON u2.destination = u3.origin
    ) ,
allConnections AS (
    SELECT origin0 AS origin
        , destination0 AS destination
        , cost0 AS cost
        , 0 AS n_stops
    FROM variations 
    UNION ALL 
    SELECT origin0 AS origin
        , destination1 AS destination
        , cost0 + cost1 AS cost
        , 1 AS n_stops
    FROM variations
    WHERE origin1 IS NOT NULL
    UNION ALL 
    SELECT origin0 AS origin
        , destination2 AS destination
        , cost0 + cost1 + cost2 AS cost
        , 2 AS n_stops
    FROM variations
    WHERE origin2 IS NOT NULL
    )
SELECT origin, destination
    , MIN(cost) AS best_price_for_route
FROM allConnections
GROUP BY origin, destination
;
