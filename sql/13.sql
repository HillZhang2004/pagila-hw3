SELECT
    actor_id,
    a.first_name,
    a.last_name,
    film_id,
    films.title,
    RANK() OVER (PARTITION BY actor_id ORDER BY revenue DESC, films.title) AS "rank",
    revenue
FROM actor a
JOIN LATERAL (
    SELECT
        film_id,
        film.title,
        SUM(payment.amount) AS revenue
    FROM film_actor
    JOIN film USING (film_id)
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN payment USING (rental_id)
    WHERE film_actor.actor_id = a.actor_id
    GROUP BY film_id, film.title
    ORDER BY SUM(payment.amount) DESC, film.title
    LIMIT 3
) films ON TRUE
ORDER BY actor_id, "rank", title;
