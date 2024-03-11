SELECT DISTINCT
    name,
    ROUND(population / 1000000, 2) AS population_in_millions,
    population AS whole_number,
    CASE
        WHEN ROUND(population / 1000000, 2) < 5 THEN 'Small country'
        WHEN ROUND(population / 1000000, 2) >= 5 AND ROUND(population / 1000000, 2) < 10 THEN 'Mid country'
        ELSE 'Big country'
    END AS country_lvl
FROM
    world.country
INNER JOIN
    world.countrylanguage ON world.country.Code = world.countrylanguage.CountryCode
LIMIT 50;