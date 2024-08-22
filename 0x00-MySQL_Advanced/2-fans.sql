-- Calculate the total number of fans for each country origin
-- and rank the origins by the total number of fans
SELECT
    origin,                                 -- Country of origin
    SUM(nb_fans) AS total_fans              -- Total number of fans for each country
FROM
    metal_bands                             -- Table name
GROUP BY
    origin                                  -- Group by country of origin
ORDER BY
    total_fans DESC                         -- Order by total number of fans in descending order
