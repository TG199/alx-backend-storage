-- List all bands with 'Glam rock' as their main style, ranked by thier longevity
SELECT
    band_name,                                      -- Band's name
    (2022 - formed) AS lifespan                     -- Calculate lifespan (in years until 2022)
FROM
    metal_bands                                     -- Table name
WHERE
    style = 'Glam rock'                             -- Filter bands with 'Glam rock' as their main style
ORDER BY
    lifespan DESC;                                  -- Order by lifespan in descending order
