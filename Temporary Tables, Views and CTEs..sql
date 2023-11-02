WITH rental_cte AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        c.email,
        COUNT(r.rental_id) AS rental_count
    FROM
        customer c
    LEFT JOIN
        rental r ON c.customer_id = r.customer_id
    GROUP BY
        c.customer_id, c.email
),

payment_cte AS (
    SELECT
        r.customer_id,
        SUM(p.amount) AS total_paid
    FROM
        rental r
    JOIN
        payment p ON r.customer_id = p.customer_id
    GROUP BY
        r.customer_id
)

SELECT
    rc.customer_name,
    rc.email,
    rc.rental_count,
    pc.total_paid,
    CASE
        WHEN rc.rental_count = 0 THEN 0
        ELSE pc.total_paid / rc.rental_count
    END AS average_payment_per_rental
FROM
    rental_cte rc
LEFT JOIN
    payment_cte pc ON rc.customer_id = pc.customer_id;
