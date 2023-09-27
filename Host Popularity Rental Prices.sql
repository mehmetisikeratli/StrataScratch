
/*

Host Popularity Rental Prices
Difficulty: Hard

Question ID: ID 9632

Link to the question: 
https://platform.stratascratch.com/coding/9632-host-popularity-rental-prices


*/


WITH cte AS (
    SELECT CONCAT(price, room_type, host_since, zipcode, number_of_reviews) AS host_id
        , SUM(number_of_reviews) AS total_reviews
        , (CASE
            WHEN SUM(number_of_reviews) = 0 THEN 'New'
            WHEN SUM(number_of_reviews) BETWEEN 1 AND 5 THEN 'Rising'
            WHEN SUM(number_of_reviews) BETWEEN 6 AND 15 THEN 'Trending Up'
            WHEN SUM(number_of_reviews) BETWEEN 16 AND 40 THEN 'Popular'
            WHEN SUM(number_of_reviews) > 40 THEN 'Hot'
            END
            ) AS host_popularity
        , price
    FROM airbnb_host_searches
    GROUP BY host_id
    )
SELECT host_popularity
    , MIN(price) AS min_price
    , MAX(price) AS max_price
    , AVG(price) AS avg_price
FROM cte
GROUP BY host_popularity
;

