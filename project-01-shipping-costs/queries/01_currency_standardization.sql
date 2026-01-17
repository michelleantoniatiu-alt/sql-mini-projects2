-- Standardize invoice values to USD for analysis

SELECT *,
  CASE 
    WHEN currency = 'USD' THEN invoice_value
    WHEN currency = 'EUR' THEN invoice_value * 1.1
    WHEN currency = 'GBP' THEN invoice_value * 1.35
    ELSE NULL
  END AS invoice_value_usd
FROM shipping_costs;
