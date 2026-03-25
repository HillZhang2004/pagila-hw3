SELECT f2.title
FROM film f1
JOIN film_category fc1 ON f1.film_id = fc1.film_id
JOIN category ON fc1.category_id = category.category_id
JOIN film_category fc2 ON fc2.category_id = category.category_id
JOIN film f2 ON fc2.film_id = f2.film_id
WHERE f1.title = 'AMERICAN CIRCUS'
GROUP BY f2.title
HAVING COUNT(*) > 1
ORDER BY f2.title;
