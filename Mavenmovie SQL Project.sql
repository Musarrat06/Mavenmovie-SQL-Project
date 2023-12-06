/* Write a SQL query to count the number of characters except the spaces for each actor. Return first 10 actors name length along with their name*/
select first_name,length(first_name) from actor limit 10.

/* List all Oscar awardees(Actors who received Oscar award) with their full names and length of their names */
SELECT first_name,last_name,awards from actor_award WHERE awards = 'OSCAR'. 

/* Find the actors who have acted in the film ‘Frost Head’ */
select first_name,last_name,title
from actor a join film_actor fa 
on a.actor_id = fa.actor_id join
film f on f.film_id = fa.film_id and
title = 'frost head'.

/* Pull all the films acted by the actor ‘Will Wilson’. */
select first_name, last_name, title 
from actor a join film_actor fa 
on a.actor_id = fa.actor_id join
film f on f.film_id = fa.film_id and 
first_name = 'will';

/* Pull all the films which were rented and return in the month of May.*/
select rental_date,return_date
from payment p join rental r
on p.rental_id = r.rental_id
where month(return_date) = 5; 

 /* Pull all the films with ‘Comedy’ category. */
select * from category where name = 'comedy';

use mavenmovies;

/*
Separate counts of inventory items held at each of the two stores. 
*/ 
select * from inventory;
select store_id, count(inventory_id) as 'Total inventory'
from inventory
group by store_id;

/* A separate count of active customers for each of the stores.*/
select * from customer;
select store_id, count(customer_id) as 'Total active customers'
from customer 
where active = 1
group by store_id;

/*
A count of all customer email addresses stored in the database to
assess the liability of a data breach. 
*/
select count(email) from customer;

/*
A count of unique film titles held in the inventory list at each 
store and a count of the unique film categories of films to satisfy an 
interest in diversifying film offering as a means of understanding how likely 
to keep customers engaged in the future. 
*/
select store_id, count(distinct film_id) as NumberOfFilms
from inventory
group by store_id;

select count(distinct name) as countOfcategory
from category;

/*
Analysis of the replacement cost for the film that is least expensive to replace, 
the most expensive to replace, and the average of all films so as to understand
the replacement cost of all the films. 
*/
select * from film;
select min(replacement_cost) as Min_replacement_cost,
max(replacement_cost) as Maximum_replacement_cost,
avg(replacement_cost) as avg_replacement_cost
from film;

/*
The average payment processed, as well as the maximum payment processed in 
order to put in place payment monitoring systems and maximum payment 
processing restrictions to minimize the future risk of fraud by the store staff. 
*/
select * from payment;
select avg(amount) as Avg_Pymt_Processed,
max(amount) as Max_Pymt_Processed
from payment;

/*
A list of all customer identification values, with a count of all-time rentals 
made by them with the highest volume customers at the top of the list for better
understanding what the customer base looks like. 
*/
select customer_id, count(rental_id) as Total_rentals
from rental
group by customer_id
order by Total_rentals desc;