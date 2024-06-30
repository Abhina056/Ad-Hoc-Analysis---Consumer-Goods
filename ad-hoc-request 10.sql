-- Q10. Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? 
-- The final output contains these fields: 
-- division,
-- product_code,
-- product,
-- total_sold_quantity,
-- rank_order

WITH totl_qty as (
	SELECT 
		 dp.division,
		 dp.product_code,
		 dp.product,
		 SUM(fs.sold_quantity) as total_sold_qty
	FROM gdb023.dim_product dp
	JOIN fact_sales_monthly fs
	ON dp.product_code = fs.product_code
	WHERE fiscal_year = 2021
	GROUP BY dp.division, dp.product, dp.product_code
	ORDER BY total_sold_qty DESC),

top_totl_qty as (
	SELECT 
		division,
        product_code,
        product,
        total_sold_qty,
        DENSE_RANK() OVER(PARTITION BY division ORDER BY total_sold_qty DESC) as rank_order
	FROM totl_qty
)
SELECT * FROM top_totl_qty
WHERE rank_order <= 3;
