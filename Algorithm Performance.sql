
/*

Algorithm Performance
Difficulty: Hard

Question ID: ID 10350

Link to the question: 
https://platform.stratascratch.com/coding/10350-algorithm-performance

*/


SELECT search_id
    , rating
FROM (
    SELECT search_id
        , MIN(search_results_position) AS top_position
        , CASE 
            WHEN clicked = 0 THEN 1
            WHEN clicked = 1 AND search_results_position > 3 THEN 2
            WHEN clicked = 1 AND search_results_position <= 3 THEN 3
          END AS rating
    FROM fb_search_events
    GROUP BY search_id
    ) AS a
;
