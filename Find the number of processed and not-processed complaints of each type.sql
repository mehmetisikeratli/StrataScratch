
/*

Find the number of processed and not-processed complaints of each type
Difficulty: Hard

Question ID: ID 9790

Link to the question: 
https://platform.stratascratch.com/coding/9790-find-the-number-of-processed-and-not-processed-complaints-of-each-type

*/

SELECT type
    , COUNT(CASE WHEN processed = 1 THEN complaint_id END) AS n_complaints_processed
    , COUNT(CASE WHEN processed = 0 THEN complaint_id END) AS n_complaints_not_processed
FROM facebook_complaints
GROUP BY type
;
