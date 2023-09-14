SHOW TABLES;
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;
SELECT title FROM film;
SELECT name AS language FROM language;
SELECT first_name FROM staff;
SELECT DISTINCT release_year FROM film;
SELECT COUNT(*) FROM store;
SELECT COUNT(*) FROM staff;
-- Films available for rent
SELECT COUNT(*) FROM film;

-- Films that have been rented
SELECT COUNT(DISTINCT inventory_id) FROM rental;
SELECT COUNT(DISTINCT last_name) FROM actor;
SELECT title, length FROM film ORDER BY length DESC LIMIT 10;
SELECT * FROM actor WHERE first_name = 'SCARLETT';
SELECT * FROM film WHERE title LIKE '%ARMAGEDDON%' AND length > 100;
SELECT COUNT(*) FROM film WHERE special_features LIKE '%Behind the Scenes%';
