SELECT DISTINCT a2.first_name || ' ' || a2.last_name AS "Actor Name"
FROM actor a1
JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
JOIN film ON fa1.film_id = film.film_id
JOIN film_actor fa2 ON fa2.film_id = film.film_id
JOIN actor a2 ON a2.actor_id = fa2.actor_id
WHERE a1.first_name = 'RUSSELL'
  AND a1.last_name = 'BACALL'
  AND NOT (a2.first_name = 'RUSSELL' AND a2.last_name = 'BACALL')
ORDER BY "Actor Name";
