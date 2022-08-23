-- When was the earliest order ever placed? Return the date
SELECT MIN(occurred_at) FROM orders;

-- Perform the same query as in question 1 w/o using an aggregation function.
SELECT occurred_at FROM orders 
ORDER BY occurred_at LIMIT 1;

-- When did the most recent (latest) web_event occur?
SELECT MAX(occurred_at) FROM orders;

-- Perform the same query w/o using an aggregation function.
SELECT occurred_at FROM orders 
ORDER BY occurred_at DESC
LIMIT 1;

-- Find the mean(AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper type purchased per order.
SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss, 
            AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd, 
            AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd 
FROM orders;

-- Calculate the median of the total_usd spent on all orders.
SELECT * 
FROM  (SELECT total_amt_usd FROM orders
	   ORDER BY total_amt_usd 
       LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;