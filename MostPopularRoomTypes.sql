
/*

Most Popular Room Types
Difficulty: Hard

Question ID: ID 9763

Link to the question: 
https://platform.stratascratch.com/coding/9763-most-popular-room-types

*/

WITH RECURSIVE new_table AS (
    SELECT DISTINCT ds
        , id_user
        , n_searches
        , trimmed_types
        , LENGTH(trimmed_types) - LENGTH(REPLACE(filter_room_types, ',' , '')) + 1 AS n
        , 1 AS x
        , SUBSTRING_INDEX(SUBSTRING_INDEX(trimmed_types, ',', 1) , ',', -1) AS all_room_types
    FROM (SELECT *, TRIM(LEADING ',' FROM filter_room_types) AS trimmed_types FROM airbnb_searches) a
    UNION
    SELECT ds
        , id_user
        , n_searches
        , trimmed_types
        , n
        , 1 + x
        , SUBSTRING_INDEX(SUBSTRING_INDEX(trimmed_types, ',', x+1) , ',', -1) AS all_room_types
    FROM new_table
    WHERE x < n
) 
, distinct_searches AS ( -- as some searches might include multiple searches on the same room type
SELECT DISTINCT ds, id_user, n_searches, all_room_types 
FROM new_table 
-- WHERE id_user = "6cbb33d1-6ecc-4f74-8b6a-a43d07d484b6" 
    -- AND n_searches = 11
) -- SELECT * FROM distinct_searches;
SELECT all_room_types
    , SUM(n_searches) AS total_searches
FROM distinct_searches
GROUP BY all_room_types
;
