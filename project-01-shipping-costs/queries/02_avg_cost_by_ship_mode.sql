-- Analyze average freight and brokerage costs per ship mode

SELECT 
  ship_mode,
  AVG(freight_charges) AS avg_freight,
  AVG(brokerage_charges) AS avg_brokerage,
  CASE
    WHEN AVG(weight) >= 100 THEN 'HEAVY'
    WHEN AVG(weight) >= 50 THEN 'MID'
    ELSE 'LIGHT'
  END AS weight_category
FROM shipping_costs
GROUP BY ship_mode;
