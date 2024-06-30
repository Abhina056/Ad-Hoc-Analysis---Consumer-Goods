-- Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month . 
-- This analysis helps to get an idea of low and high-performing months and take strategic decisions. 
-- The final report contains these columns: 
-- Month,
-- Year,
-- Gross sales

SELECT 
	MONTHNAME(fs.date) AS 'Months',
    fs.fiscal_year,
	ROUND(SUM(g.gross_price*fs.sold_quantity), 2) AS gross_sales	
FROM fact_sales_monthly fs
JOIN fact_gross_price g
ON fs.product_code = g.product_code
JOIN dim_customer c 
ON fs.customer_code = c.customer_code
WHERE c.customer = 'Atliq Exclusive' 
GROUP BY  Months, fs.fiscal_year 
ORDER BY fs.fiscal_year;
