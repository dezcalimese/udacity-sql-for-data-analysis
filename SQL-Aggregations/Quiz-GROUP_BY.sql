-- Which account (by name) placed the earliest order?
-- Use account name and date of the order as columns. 
SELECT acct.name, o.occurred_at FROM orders o
JOIN accounts acct
ON o.account_id = acct.id
ORDER BY occurred_at 
LIMIT 1;

-- Find the total sales in usd for each account.
-- Use total sales for each company's orders and the company name as columns.
SELECT acct.name, SUM(o.total_amt_usd) total_usd_sales FROM orders o
JOIN accounts acct
ON o.account_id = acct.id
GROUP BY acct.name;

-- Via what channel did the most recent(latest) web_event occur, which account was associated with this event?
-- Return only three values -- the date, channel, and account name.
SELECT w.channel, w.occurred_at, acct.name from web_events w
JOIN accounts acct
ON w.account_id = acct.id
ORDER BY w.occurred_at DESC
LIMIT 1;

-- Find the total number of times each type of channel from the web_events was used.
-- Your final table should have two columns: the channel and the number of times the channel was used.
SELECT w.channel, COUNT(*) FROM web_events w
GROUP BY w.channel;

-- Who was the primary contact associated with the earliest web_event?
SELECT acct.primary_poc FROM web_events w
JOIN accounts acct
ON w.account_id = acct.id
ORDER BY w.occurred_at
LIMIT 1;

-- What was the smallest order placed by each account in terms of total usd?
-- Provide only two columns - the account name and the total usd.
-- Order from smallest dollar amounts to largest.
SELECT acct.name, MIN(o.total_amt_usd) total_usd FROM accounts acct
JOIN orders o
ON o.account_id = acct.id
GROUP BY acct.name
ORDER BY total_usd;

-- Find the number of sales reps in each region.
-- Your final table should have the columns: the region and the number of sales_reps.
-- Order from fewest reps to most reps.
SELECT r.name AS region, COUNT(s.name) sales_reps FROM region r
JOIN sales_reps s
ON r.id = s.region_id
GROUP BY r.name
ORDER BY sales_reps;