SELECT c.name, films.title, "total rentals"
FROM category c
JOIN LATERAL (
    SELECT f.title, COUNT(rental_id) AS "total rentals"
    FROM film_category
    JOIN film f USING (film_id)
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    WHERE film_category.category_id = c.category_id
    GROUP BY f.title
    ORDER BY COUNT(rental_id) DESC, title DESC
    LIMIT 5
) films ON TRUE
ORDER BY c.name, "total rentals" DESC, title;
