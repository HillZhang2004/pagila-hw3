SELECT first_name, last_name, title, rental_date
FROM customer c
JOIN LATERAL (
    SELECT r.rental_date, r.inventory_id
    FROM rental r
    WHERE r.customer_id = c.customer_id
    ORDER BY r.rental_date DESC
    LIMIT 1
) r ON true
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
ORDER BY last_name, first_name;
