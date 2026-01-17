-- Compare cost efficiency using actual vs volumetric weight

SELECT 
  origin,
  ship_mode,
  AVG(
    freight_charges /
    CASE
      WHEN ship_mode = 'SEA' AND vol_weight > 0 THEN vol_weight
      WHEN ship_mode = 'AIR' AND weight > 0 THEN weight
      ELSE NULL
    END
  ) AS avg_freight_per_kg,
  AVG(
    brokerage_charges /
    CASE
      WHEN ship_mode = 'SEA' AND vol_weight > 0 THEN vol_weight
      WHEN ship_mode = 'AIR' AND weight > 0 THEN weight
      ELSE NULL
    END
  ) AS avg_brokerage_per_kg
FROM shipping_costs
WHERE 
  (ship_mode = 'SEA' AND vol_weight > 0)
  OR (ship_mode = 'AIR' AND weight > 0)
GROUP BY origin, ship_mode
ORDER BY origin, ship_mode;
