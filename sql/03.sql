/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */

SELECT country.country,
       SUM(payment.amount) AS total_payments
FROM address
JOIN customer ON address.address_id = customer.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY country.country
ORDER BY total_payments DESC, country.country ASC;
