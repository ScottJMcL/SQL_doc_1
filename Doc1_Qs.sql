-- 1. How many actors are there with the last name ‘Wahlberg’?  -- 2
select COUNT(last_name) 
from actor
WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?   -- 0 (has payment DB been changed??)
select count(amount)
from payment
where amount between 3.99 and 5.99;

select *
from payment;

-- 3. What film does the store have the most of? (search in inventory)  -- 8 copies of many films.  See text file for list.

select count(distinct inventory_id) as count_inv, film_id 
from inventory
group by film_id
order by count_inv desc;

select *
from inventory;

-- 4. How many customers have the last name ‘William’? -- 0
select count(last_name)
from customer
where last_name like 'William';

select *
from customer;

-- 5. What store employee (get the id) sold the most rentals? -- Employee 2 (7,304)
select count(payment_id) as count_of_payments, staff_id
from payment
group by staff_id 
order by count_of_payments desc;

-- 6. How many different district names are there?	-- 378
select count(distinct district)
from address;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)	-- Film ID 508 w/ 15 actors
select count(distinct actor_id) as count_of_actors, film_id 
from film_actor
group by film_id 
order by count_of_actors desc;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)	-- store 1 (13)
select count(last_name) as count_of_last_names, store_id
from customer
where last_name like '%es'
group by store_id 
order by count_of_last_names desc;

select first_name, last_name, store_id 
from customer
where last_name like '%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--     with ids between 380 and 430? (use group by and having > 250)	-- 0
select count(distinct amount) as count_payments, customer_id 
from payment
where customer_id > 250
group by customer_id  
order by count_payments  desc;

-- 10. Within the film table, how many rating categories are there? And what rating has the most
--      movies total?	-- 5 rating categories, PG-13 (223 titles)
select count(distinct rating) 
from film;

select count(film_id) as count_of_films, rating 
from film
group by rating
order by count_of_films desc;