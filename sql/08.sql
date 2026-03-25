WITH bucket_customers AS (
    SELECT DISTINCT r.customer_id
    FROM film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    WHERE f.title = 'BUCKET BROTHERHOOD'
),
customer_films AS (
    SELECT DISTINCT r.customer_id, f.title
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
)
SELECT title
FROM customer_films
JOIN bucket_customers USING (customer_id)
WHERE title != 'BUCKET BROTHERHOOD'
GROUP BY title
HAVING COUNT(*) >= 3
ORDER BY title;
