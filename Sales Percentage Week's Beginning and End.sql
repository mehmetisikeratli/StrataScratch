
/*

Sales Percentage Week's Beginning and End
Difficulty: Hard

Question ID: ID 2165

Link to the question: 
https://platform.stratascratch.com/coding/2165-sales-percentage-weeks-beginning-and-end

*/

-- week_day being equal to sunday
WITH cte AS (
    SELECT invoiceno
        , invoicedate
        , str_to_date(invoicedate , '%d/%m/%Y') AS to_date
        , date_format(str_to_date(invoicedate , '%d/%m/%Y') , '%u') AS week_num
        , dayofweek(str_to_date(invoicedate , '%d/%m/%Y')) AS week_day
        , quantity * unitprice AS total_sales
    FROM early_sales
    )
SELECT 
    CAST(week_num AS SIGNED) AS week_num
    -- , SUM( CASE WHEN week_day = 2 THEN total_sales END ) AS first_day_sales
    -- , SUM(total_sales) AS weekly_sales
    , ROUND( SUM(CASE WHEN week_day = 2 THEN total_sales ELSE 0 END) / SUM(total_sales) * 100 ) AS first_pc -- monday
    , ROUND( SUM(CASE WHEN week_day = 1 THEN total_sales ELSE 0 END) / SUM(total_sales) * 100 ) AS last_pc -- sunday
FROM cte
GROUP BY week_num
ORDER BY week_num
;
