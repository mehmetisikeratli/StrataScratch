
/*

Best Selling Item
Difficulty: Hard

Question ID: ID 10172

Link to the question: 
https://platform.stratascratch.com/coding/10172-best-selling-item

*/


SELECT DISTINCT
    date_format(invoicedate, '%m') AS sales_month,
    FIRST_VALUE(description) OVER (PARTITION BY MONTH(invoicedate) ORDER BY SUM(unitprice * quantity) DESC) AS best_selling_description,
    MAX(SUM(unitprice * quantity)) OVER (PARTITION BY MONTH(invoicedate)) AS total_amount
FROM
    online_retail
GROUP BY
    date_format(invoicedate, '%m'),
    description
;

