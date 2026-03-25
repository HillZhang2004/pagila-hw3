SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
    SELECT actor_id
    FROM film_actor
    JOIN film_category USING (film_id)
    JOIN category USING (category_id)
    WHERE category.name = 'Children'

    EXCEPT

    SELECT actor_id
    FROM film_actor
    JOIN film_category USING (film_id)
    JOIN category USING (category_id)
    WHERE category.name = 'Horror'
)
ORDER BY last_name, first_name;
