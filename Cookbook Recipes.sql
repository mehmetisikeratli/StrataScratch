
/*

Cookbook Recipes
Difficulty: Hard

Question ID: ID 2089

Link to the question: 
https://platform.stratascratch.com/coding/2089-cookbook-recipes

*/


WITH cte AS (
    SELECT *
        , (ROW_NUMBER() OVER(ORDER BY page_number) - 1) AS row_num
    FROM cookbook_titles
    )
SELECT cte.row_num * 2 AS left_page_number
    , cte2.title AS left_title
    , cte3.title AS right_title
FROM cte
LEFT JOIN cte AS cte2 ON cte2.page_number = cte.row_num*2
LEFT JOIN cte AS cte3 ON cte3.page_number = cte.row_num*2+1
;
