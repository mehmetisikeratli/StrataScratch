

/*

Top 5 States With 5 Star Businesses
Difficulty: Hard

Question ID: ID 10046

Link to the question: https://platform.stratascratch.com/coding/10046-top-5-states-with-5-star-businesses

*/

SELECT state, COUNT(business_id)
FROM yelp_business
WHERE stars = 5
GROUP BY state
ORDER BY COUNT(business_id) DESC
LIMIT 6
;
