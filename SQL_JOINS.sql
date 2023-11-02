-- 1
SELECT c.name AS category, COUNT(film_id) AS number_of_films
FROM category AS c
JOIN film_category AS fc ON c.category_id = fc.category_id
GROUP BY c.name;
-- 2
SELECT s.store_id, a.district, co.country
FROM store AS s
JOIN address AS a ON s.address_id = a.address_id
JOIN city AS ci ON a.city_id = ci.city_id
JOIN country AS co ON ci.country_id = co.country_id;
-- 3
SELECT s.store_id, SUM(p.amount) AS total_revenue
FROM store AS s
JOIN staff AS st ON s.manager_staff_id = st.staff_id
JOIN payment AS p ON st.staff_id = p.staff_id
GROUP BY s.store_id;
-- 4
SELECT c.name AS category, AVG(f.length) AS avg_running_time
FROM category AS c
JOIN film_category AS fc ON c.category_id = fc.category_id
JOIN film AS f ON fc.film_id = f.film_id
GROUP BY c.name;
-- 5
SELECT category, avg_running_time
FROM (
    SELECT c.name AS category, AVG(f.length) AS avg_running_time
    FROM category AS c
    JOIN film_category AS fc ON c.category_id = fc.category_id
    JOIN film AS f ON fc.film_id = f.film_id
    GROUP BY c.name
    ORDER BY avg_running_time DESC
) AS subquery
LIMIT 1;
-- 6
SELECT f.title, COUNT(r.inventory_id) AS rental_count
FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 10;
-- 7
SELECT
    CASE
        WHEN (
            SELECT inventory_id
            FROM film AS f
            JOIN inventory AS i ON f.film_id = i.film_id
            JOIN store AS s ON i.store_id = s.store_id
            WHERE f.title = 'Academy Dinosaur' AND s.store_id = 1
        ) IS NOT NULL THEN 'Available'
        ELSE 'NOT Available'
    END AS availability_status;
    
-- 8
SELECT
    film.title AS film_title,
    CASE
        WHEN IFNULL(inventory.inventory_id, 0) > 0 THEN 'Available'
        ELSE 'NOT available'
    END AS status
FROM
    film
 JOIN
    inventory ON film.film_id = inventory.film_id;





    















