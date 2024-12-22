
/*

Capitalize First Letters
Difficulty: Hard

Question ID: ID 10546

Link to the question: 
https://platform.stratascratch.com/coding/10546-capitalize-first-letters

*/


WITH RECURSIVE new_table AS (
    SELECT content_id
        , customer_id
        , content_text
        , LENGTH(content_text) - LENGTH(REPLACE(content_text, ' ' , '')) + 1 AS n
        , 1 AS x
        , SUBSTRING_INDEX(content_text, " ", 1) AS content_text_words
    FROM user_content
    UNION 
    SELECT content_id
        , customer_id
        , content_text
        , n
        , 1 + x
       , SUBSTRING_INDEX(SUBSTRING_INDEX(content_text, ' ', x+1), ' ', -1) AS content_text_words
    FROM new_table
    WHERE x < n
) -- SELECT * FROM new_table WHERE content_id = 1;
, updated_context AS (
    SELECT *
        , CONCAT( UPPER(SUBSTRING(content_text_words, 1, 1)), LOWER(SUBSTRING(content_text_words, 2, LENGTH(content_text_words))) ) AS updated_content_text
    FROM new_table
) -- SELECT * FROM updated_context;
SELECT content_text
    , GROUP_CONCAT(updated_content_text ORDER BY x SEPARATOR ' ') AS updated_text
FROM updated_context
GROUP BY content_text
;
