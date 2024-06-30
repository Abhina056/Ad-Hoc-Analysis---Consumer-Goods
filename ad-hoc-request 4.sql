-- Q4. Which segment had the most increase in unique products in 2021 vs 2020? 
-- The final output contains these fields, 
-- segment 
-- product_count_2020 
-- product_count_2021 
-- difference

WITH prod_20 as (
	SELECT
		dp.segment,
		COUNT(DISTINCT(fs.product_code)) as product_count_2020
	FROM gdb023.dim_product dp
	JOIN fact_sales_monthly fs
	USING(product_code)
	WHERE fs.fiscal_year = 2020
	GROUP BY dp.segment
),
prod_21 as (
	SELECT
		dp.segment,
		COUNT(DISTINCT(fs.product_code)) as product_count_2021
	FROM gdb023.dim_product dp
	JOIN fact_sales_monthly fs
	USING(product_code)
	WHERE fs.fiscal_year = 2021
	GROUP BY dp.segment
    )

SELECT prod_20.segment, prod_20.product_count_2020, prod_21.product_count_2021, (prod_21.product_count_2021-prod_20.product_count_2020) as Difference
FROM prod_20 
JOIN prod_21
USING(segment)
