/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
 */

SELECT customer.customer_id, customer.first_name, customer.last_name
FROM customer
JOIN LATERAL (
    SELECT film.film_id
    FROM rental
    JOIN inventory ON rental.inventory_id = inventory.inventory_id
    JOIN film ON inventory.film_id = film.film_id
    WHERE rental.customer_id = customer.customer_id
    ORDER BY rental.rental_date DESC
    LIMIT 5
) rental ON TRUE
JOIN film_category  ON rental.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
HAVING SUM(CASE WHEN category.name = 'Action' THEN 1 ELSE 0 END) >= 4
ORDER BY customer.customer_id;
