-- Provide a table for all web_events associated with the account name of `Walmart`.
-- There should be three columns
-- Include the `primary_poc`, time of the event, and the `channel` for each event.
-- Also assure only `Walmart` events were chosen
SELECT a.primary_poc, w.occurred_at, a.name FROM web_events w 
JOIN accounts a 
ON w.account_id = a.id 
WHERE a.name = 'Walmart';

-- Provide a table that provides the region for each sales_rep along with their associated accounts.
-- There should be three columns: the region name, the sales rep name, and the account name.
-- Sort the accounts alphabetically according to the account name.
SELECT r.name region, s.name rep, a.name account FROM sales_reps s 
JOIN region r 
ON s.region_id = r.id 
JOIN accounts a 
ON a.sales_rep_id = s.id 
ORDER BY a.name;

-- Provide the name for each region for every order, as well as the account name and the unit price they paid for the order.
-- There should be three columns: the region name, the account name, and the unit price.
-- To assure that division by zero isn't possible, add the total by 0.01 
SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price FROM region r 
JOIN sales_reps s 
ON s.region_id = r.id
JOIN accounts a 
ON a.sales_rep_id = s.id
JOIN orders o 
ON o.account_id = a.id;