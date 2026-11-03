/*
 * Management also wants to create a "best sellers" list for each category.
 *
 * Write a SQL query that:
 * For each category, reports the five films that have been rented the most for each category.
 *
 * Note that in the last query, we were ranking films by the total amount of payments made,
 * but in this query, you are ranking by the total number of times the movie has been rented (and ignoring the price).
 */

SELECT name, title, total_rentals AS "total rentals"
FROM (
    SELECT
        category.name,
        film.title,
        COUNT(*) AS total_rentals,
        ROW_NUMBER() OVER (
            PARTITION BY category.name
            ORDER BY COUNT(*) DESC, film.title DESC
        ) AS rank
    FROM category
    JOIN film_category ON category.category_id = film_category.category_id
    JOIN film ON film_category.film_id = film.film_id
    JOIN inventory ON film.film_id = inventory.film_id
    JOIN rental ON inventory.inventory_id = rental.inventory_id
    GROUP BY category.name, film.title
) t
WHERE rank <= 5
ORDER BY name, total_rentals DESC, title;
