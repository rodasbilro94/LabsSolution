-- 1.1
SELECT
    MAX(length) AS max_duration,
    MIN(length) AS min_duration
FROM film;

-- 1.2
SELECT
    CONCAT(
        FLOOR(AVG(length) / 60), ' hours and ',
        ROUND(AVG(length) % 60), ' minutes'
    ) AS avg_duration
FROM film;

-- 2.1
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS number_of_days_that_the_company_operating
FROM rental;

-- 2.2
SELECT *,
    MONTH(rental_date) AS rental_month,
    DAYNAME(rental_date) AS rental_weekday
FROM rental
LIMIT 20;

-- 2.3
SELECT *,
    CASE
        WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend'
        ELSE 'workday'
    END AS rental_day_type
FROM rental;

-- 3
SELECT
    title,
    COALESCE(CONCAT(length, ' minutes'), 'Not Available') AS rental_duration
FROM film
ORDER BY title ASC;

-- 4
SELECT
    CONCAT(first_name, ' ', last_name) AS full_name,
    LEFT(email, 3) AS email_prefix
FROM customer
ORDER BY last_name ASC
LIMIT 50;

-- CHALLENGE 2 ------ 1.1
SELECT COUNT(*) AS total_films_released
FROM film;

-- 1.2
SELECT rating, COUNT(*) AS num_films
FROM film
GROUP BY rating
ORDER BY num_films DESC;

-- 1.3
SELECT staff_id, COUNT(*) AS num_rentals_processed
FROM rental 
GROUP BY staff_id;

-- 3.1
SELECT rating,
    ROUND(AVG(length), 2) AS mean_duration
FROM film
GROUP BY rating
ORDER BY mean_duration DESC;

-- 3.2
SELECT rating,
    ROUND(AVG(length), 2) AS mean_duration
FROM film
GROUP BY rating
HAVING mean_duration > 120;

-- 4
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;
