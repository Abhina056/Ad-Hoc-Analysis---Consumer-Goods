-- Q9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? 
-- The final output contains these fields:
-- channel,
-- gross_sales_mln,
-- percentage

WITH cte1 as (
	SELECT 
		dc.channel,
        SUM(gross_price * sold_quantity) as gross_sales
	FROM gdb023.fact_sales_monthly fs
	JOIN fact_gross_price fg
	ON fs.product_code = fg.product_code
	JOIN dim_customer dc
	ON dc.customer_code = fs.customer_code
	WHERE fs.fiscal_year = 2021
	GROUP BY dc.channel)

SELECT
	channel,
    ROUND(gross_sales,2) as gross_sales_mln,
	ROUND(gross_sales/SUM(gross_sales) OVER()*100,2) as percentage
FROM cte1
ORDER BY percentage DESC;
