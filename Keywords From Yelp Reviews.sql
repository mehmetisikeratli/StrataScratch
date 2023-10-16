
/*

Keywords From Yelp Reviews
Difficulty: Hard

Question ID: ID 9612

Link to the question: 
https://platform.stratascratch.com/coding/9612-keywords-from-yelp-reviews

*/


SELECT r.business_name
    , b.address
    , b.state
FROM yelp_business AS b
JOIN yelp_reviews AS r
    ON b.name = r.business_name
WHERE LOWER(review_text) LIKE '%food%'
    OR LOWER(review_text) LIKE '%pizza%'
    OR LOWER(review_text) LIKE '%sandwich%'
    OR LOWER(review_text) LIKE '%burger%'
    -- REGEXP '(food|pizza|sandwich|burger)'
;
