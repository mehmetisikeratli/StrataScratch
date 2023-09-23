
/*

City With Most Amenities
Difficulty: Hard

Question ID: ID 9633

Link to the question: https://platform.stratascratch.com/coding/9633-city-with-most-amenities

*/


SELECT city
FROM airbnb_search_details
GROUP BY city
ORDER BY SUM(LENGTH(amenities)) DESC
LIMIT 1
;


