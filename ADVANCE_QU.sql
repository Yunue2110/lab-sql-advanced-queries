USE sakila;

##List each pair of actors that have worked together.
 SELECT* FROM actor;
 SELECT* FROM FILM_ACTOR;
 
CREATE VIEW actor_film1 AS
SELECT a1.actor_id , fi.film_id
FROM actor a1
JOIN film_actor fi 
ON a1.actor_id = fi.actor_id;
SELECT *FROM actor_film1;

CREATE VIEW actor_film2 AS
SELECT a1.actor_id , fi.film_id
FROM actor a1
JOIN film_actor fi 
ON a1.actor_id = fi.actor_id;
SELECT *FROM actor_film2;


SELECT * FROM actor_film1 AF1
JOIN actor_film2 af2
ON af1.film_id = af2.film_id
ORDER BY 3;

##For each film, list actor that has acted in more films.
SELECT * FROM FILM;
SELECT * FROM actor;
SELECT * FROM film_actor;

CREATE VIEW FILM_LIST2 AS
SELECT f.title , COUNT(fa.actor_id) as acted
FROM film f
JOIN film_actor fa
ON f.film_id =fa.film_id
GROUP BY f.film_id;

DROP view if exists acted_list;
CREATE VIEW  acted_list AS
SELECT concat(a.last_name ,'  ', a.first_name) as NAME_ACTOR , a.actor_id, COUNT(fa.film_id) AS FILMS_TOTAL
FROM actor a
JOIN film_actor fa
on a.actor_id = fa.actor_id
GROUP BY a.actor_id;

SELECT * FROM acted_list;


SELECT * FROM acted_list
CROSS JOIN FILM_LIST2
ORDER BY 1;

