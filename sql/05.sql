/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies that share at least 1 actor with 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

select f2.title
from film f1
JOIN film_actor  fa1 on (f1.film_id = fa1.film_id)
JOIN actor on (fa1.actor_id = actor.actor_id)
JOIN film_actor fa2 on (actor.actor_id = fa2.actor_id)
JOIN film f2 on (fa2.film_id = f2.film_id)
WHERE f1.title = 'AMERICAN CIRCUS'
order by f2.title;
