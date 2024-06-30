-- Q8. In which quarter of 2020, got the maximum total_sold_quantity? 
-- The final output contains these fields sorted by the 
-- total_sold_quantity,
-- Quarter,
-- total_sold_quantity 

SELECT 
	CASE
		WHEN MONTH(date) IN(9,10,11) THEN 'Q1'
        WHEN MONTH(date) IN(12,1,2) THEN 'Q2'
        WHEN MONTH(date) IN(3,4,5) THEN 'Q3'
        ELSE 'Q4'
	END AS quarters,
    SUM(sold_quantity) as total_quantity
FROM gdb023.fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY quarters
ORDER BY total_quantity DESC;