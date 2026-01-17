-- Identify lowest cost origin and shipping mode combinations

SELECT 
  origin,
  ship_mode,
  AVG(freight_charges + brokerage_charges) AS avg_total_cost
FROM shipping_costs
GROUP BY origin, ship_mode
ORDER BY avg_total_cost ASC
LIMIT 1;
