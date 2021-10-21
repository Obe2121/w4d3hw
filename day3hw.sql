-- Question 1
SELECT customer.customer_id, customer.first_name,customer.last_name, address.district 
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'Texas'

--Question 2
SELECT customer.customer_id,customer.first_name, customer.last_name,payment.amount,payment.customer_id
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount >= 6.99

--Question 3
SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
    ORDER BY SUM(amount) DESC
)

--Question 4
SELECT customer.customer_id, customer.first_name, customer.last_name
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
WHERE city.city = 'Nepal'

--Question 5 
Select staff.first_name, staff.last_name,COUNT(payment.staff_id)
FROM payment
JOIN staff
ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name
ORDER BY COUNT(payment.staff_id) DESC


--Question 6
SELECT film.rating,count(film.rating)
FROM film
GROUP BY film.rating
ORDER BY COUNT(film.rating) DESC



--Question 7
SELECT *
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id, payment.amount
    HAVING amount > 6.99
    ORDER BY amount DESC
)

--Question 8
SELECT COUNT(amount)
FROM payment
WHERE amount = 0
