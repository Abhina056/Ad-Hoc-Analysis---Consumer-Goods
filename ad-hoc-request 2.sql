-- Q2. What is the percentage of unique product increase in 2021 vs. 2020? 
-- The final output contains these fields, unique_products_2020 unique_products_2021 percentage_chg

SELECT g.uniqcProd2020, gp.uniqcProd2021, ROUND((uniqcProd2021 - uniqcProd2020)*100/uniqcProd2020,2) as percentage_chg
FROM (
	(SELECT 
		COUNT(DISTINCT product_code) as uniqcProd2020
	FROM fact_gross_price 
	WHERE fiscal_year = 2020) g,
	(SELECT 
		COUNT(DISTINCT product_code) as uniqcProd2021
	FROM fact_gross_price 
	WHERE fiscal_year = 2021) gp
)

