-- Find the total amount of poster_qty paper ordered in the orders table.
SELECT SUM(poster_qty) AS total_poster_sales FROM orders;

-- Find the total amount of standard_qty paper ordered in the orders table.
SELECT SUM(standard_qty) AS total_standard_sales FROM orders;

-- Find the total dollar amount of sales using the total_amt_usd in the orders table.
SELECT SUM(total_amt_usd) AS total_dollar_sales FROM orders;

-- Find the total dollar amount for each individual order that was spent on standard and gloss paper in the orders table.
-- This should give a dollar amount for each order in the table.
SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss FROM orders;

-- Find the standard_amt_usd per unit of standard_qty paper.
SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit FROM orders;