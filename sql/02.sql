SELECT country
FROM customer
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
GROUP BY country
ORDER BY COUNT(*) DESC, country
LIMIT 1;
