-- Provide a table that provides the region for each sales_rep along with their associated accounts, this time only for the `Midwest` region.
-- Your final table should include three columns: the region name, the sales rep name, and the account name.
-- Sort the accounts alphabetically according to the account name.
SELECT region.name AS Region_Name, sales_reps.name AS Sales_Rep_Name, accounts.name AS Account_Name FROM accounts
JOIN sales_reps
ON sales_reps.id = accounts.sales_rep_id
JOIN region
ON region.id = sales_reps.region_id
WHERE region.name = 'Midwest'
ORDER BY accounts.name;

-- Provide a table that provides the region for each sales_rep along with their associated accounts, this time only for accounts where the sales rep has a first name starting with `S` and in the `Midwest` region.
-- Your final table should include three columns: the region name, the sales rep name, and the account name.
-- Sort the accounts alphabetically according to the account name.

SELECT region.name AS region_name, sales_reps.name AS sales_reps_name, accounts.name AS accounts_name FROM accounts
JOIN sales_reps
ON sales_reps.id = accounts.sales_rep_id
JOIN region
ON region.id = sales_reps.region_id
WHERE sales_reps.name LIKE 'S%' AND region.name = 'Midwest'
ORDER BY accounts.name;

-- Provide a table that provides the region for each sales_rep along with their associated accounts, this time only for accounts where the sales rep has a last name starting with `K` and in the `Midwest` region.
-- Your final table should include three columns: the region name, the sales rep name, and the account name.
-- Sort the accounts alphabetically according to the account name.

SELECT region.name AS region_name, sales_reps.name AS sales_reps_name, accounts.name AS accounts_name FROM accounts
JOIN sales_reps
ON sales_reps.id = accounts.sales_rep_id
JOIN region
ON region.id = sales_reps.region_id
WHERE sales_reps.name LIKE '% K%' AND region.name = 'Midwest'
ORDER BY accounts.name;

-- Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order.
-- Only provide the results if the standard order quantity exceeds `100`.
-- Your final table should have 3 columns: region name, account name, and unit price.

SELECT r.name AS region_name, acct.name AS accounts_name, o.total_amt_usd/(o.total + 0.01) AS unit_price FROM accounts acct
JOIN orders o
ON o.account_id = acct.id
JOIN sales_reps s
ON s.id = acct.sales_rep_id
JOIN region r
ON r.id = s.region_id
WHERE o.standard_qty > 100;

-- Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order.
-- Only provide the results if the standard order quantity exceeds `100` and the poster order quantity exceeds `50`.
-- Your final table should have 3 columns: region name, account name, and unit price.
-- Sort for the smallest unit price first.

SELECT r.name AS region_name, acct.name AS accounts_name, o.total_amt_usd/(o.total + 0.01) AS unit_price FROM accounts acct
JOIN orders o
ON o.account_id = acct.id
JOIN sales_reps s
ON s.id = acct.sales_rep_id
JOIN region r
ON r.id = s.region_id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price;

-- Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order.
-- Only provide the results if the standard order quantity exceeds `100` and the poster order quantity exceeds `50`.
-- Your final table should have 3 columns: region name, account name, and unit price.
-- Sort for the largest unit price first.

SELECT r.name AS region_name, acct.name AS accounts_name, o.total_amt_usd/(o.total + 0.01) AS unit_price FROM accounts acct
JOIN orders o
ON o.account_id = acct.id
JOIN sales_reps s
ON s.id = acct.sales_rep_id
JOIN region r
ON r.id = s.region_id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price DESC;

-- What are the different channels used by account id `1001`?
-- Your final table should have only 2 columns: account name and the different channels.

SELECT DISTINCT w.channel, acct.id FROM web_events w 
JOIN accounts acct
ON acct.id = w.account_id
WHERE acct.id = '1001';

-- Find all the orders that occured in 2015.
-- Your final table should have 4 columns: `occurred_at`, account name, order total, and order total_amt_usd.

SELECT o.occurred_at, o.total AS order_total, o.total_amt_usd AS order_total_amt_usd, acct.name AS account_name FROM orders o
JOIN accounts acct
ON o.account_id = acct.id
WHERE o.occurred_at BETWEEN '2015-01-01' AND '2016-01-01';