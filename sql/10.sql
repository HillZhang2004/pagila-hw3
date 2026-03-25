SELECT *
FROM (
    SELECT
        customer.customer_id,
        first_name || ' ' || last_name AS name,
        SUM(amount) AS total_payment,
        NTILE(100) OVER (ORDER BY SUM(amount)) AS percentile
    FROM customer
    JOIN payment USING (customer_id)
    GROUP BY customer.customer_id, first_name, last_name
) c
WHERE percentile >= 90
ORDER BY name;
