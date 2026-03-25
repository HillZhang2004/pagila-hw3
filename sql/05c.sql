SELECT f2.title
FROM film f1
JOIN film_actor fa1 ON (f1.film_id = fa1.film_id)
JOIN actor ON (fa1.actor_id = actor.actor_id)
JOIN film_actor fa2 ON (actor.actor_id = fa2.actor_id)
JOIN film f2 ON (fa2.film_id = f2.film_id)
WHERE f1.title = 'AMERICAN CIRCUS'
   OR f1.title = 'ACADEMY DINOSAUR'
   OR f1.title = 'AGENT TRUMAN'
GROUP BY f2.title
HAVING COUNT(*) > 2
ORDER BY f2.title;
