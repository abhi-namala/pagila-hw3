/*
 * Compute the country with the most customers in it. 
 */

SELECT country.country
FROM address
JOIN customer ON address.address_id = customer.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
GROUP BY country.country
ORDER BY COUNT(*) DESC
LIMIT 1;
