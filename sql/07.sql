WITH bacall_one AS (
    SELECT DISTINCT a2.actor_id
    FROM actor a1
    JOIN film_actor fa1 ON a1.actor_id = fa1.actor_id
    JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
    JOIN actor a2 ON a2.actor_id = fa2.actor_id
    WHERE a1.first_name = 'RUSSELL'
      AND a1.last_name = 'BACALL'
      AND a2.actor_id <> a1.actor_id
)
SELECT DISTINCT a3.first_name || ' ' || a3.last_name AS "Actor Name"
FROM bacall_one b1
JOIN film_actor fa1 ON b1.actor_id = fa1.actor_id
JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
JOIN actor a3 ON a3.actor_id = fa2.actor_id
WHERE a3.actor_id NOT IN (
    SELECT actor_id FROM bacall_one
    UNION
    SELECT actor_id
    FROM actor
    WHERE first_name = 'RUSSELL' AND last_name = 'BACALL'
)
ORDER BY "Actor Name";
