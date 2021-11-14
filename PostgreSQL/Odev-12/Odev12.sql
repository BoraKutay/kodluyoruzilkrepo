--film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT COUNT(*) FROM film
WHERE length > 
(
SELECT AVG(length) FROM film
);

--film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?

SELECT COUNT(*) FROM film
WHERE rental_rate = 
(
SELECT MAX(rental_rate) FROM film
);


--film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.

SELECT * FROM film
WHERE replacement_cost = 
(
SELECT MIN(replacement_cost) FROM film
)
AND rental_rate =
(
SELECT MIN(rental_rate) FROM film
)
ORDER BY title;


--payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.

SELECT DISTINCT(payment.customer_id),customer.first_name,customer.last_name FROM payment 
JOIN customer ON payment.customer_id = customer.customer_id
WHERE payment.customer_id = ANY 
( 
	SELECT COUNT(*) FROM payment GROUP BY customer_id 
);