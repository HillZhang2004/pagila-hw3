SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN LATERAL (
    SELECT i.film_id
    FROM rental r
    JOIN inventory i USING (inventory_id)
    WHERE r.customer_id = c.customer_id
    ORDER BY r.rental_date DESC
    LIMIT 5
) recent ON TRUE
JOIN film_category fc ON recent.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(CASE WHEN cat.name = 'Action' THEN 1 END) >= 4
ORDER BY c.customer_id;
