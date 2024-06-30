-- Q6. Generate a report which contains the top 5 customers who received an average 
-- high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. 
-- The final output contains these fields: 
-- customer_code,
-- customer,
-- average_discount_percentage

SELECT 
	 dc.customer_code,
     dc.customer,
     ROUND(AVG(pi.pre_invoice_discount_pct),3) as Avrg_discnt
FROM gdb023.dim_customer dc
JOIN fact_pre_invoice_deductions pi
ON dc.customer_code = pi.customer_code
WHERE pi.fiscal_year = 2021 AND market = 'india'
GROUP BY dc.customer_code, dc.customer
ORDER BY Avrg_discnt DESC
LIMIT 5;  