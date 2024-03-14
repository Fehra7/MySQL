SELECT DISTINCT
    sakila.film.film_id,
    CONCAT(UCASE(SUBSTRING(first_name, 1, 1)),
            LOWER(SUBSTRING(first_name, 2)),
            ' ',
            UCASE(SUBSTRING(last_name, 1, 1)),
            LOWER(SUBSTRING(last_name, 2))) AS actors_full_name,
    title AS movie_name,
    CONCAT(ROUND(length / 60, 0),
            ' h ',
            ROUND(length % 60, 0),
            ' min') AS movie_length,
    category.name AS movie_category
FROM
    sakila.actor
        INNER JOIN
    sakila.film_actor ON sakila.actor.actor_id = sakila.film_actor.actor_id
        INNER JOIN
    sakila.film ON sakila.film_actor.film_id = sakila.film.film_id
        INNER JOIN
    sakila.film_category ON sakila.film.film_id = sakila.film_category.film_id
        INNER JOIN
    sakila.category ON sakila.film_category.category_id = sakila.category.category_id
ORDER BY sakila.film.film_id
LIMIT 200;