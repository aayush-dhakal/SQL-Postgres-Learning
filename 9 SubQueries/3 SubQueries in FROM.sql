=> 
SELECT name, price_weight_ratio -- you cannot access other columns like if you select price then it will give error as price is not being returned from sub query
FROM (
  SELECT name, price / weight AS price_weight_ratio FROM products
) AS p -- subquery in FROM clause must have an alias applied to it (ie must have AS)
WHERE price_weight_ratio > 5; -- in where also we cannot check for columns which are not returned from sub query

=> 
SELECT * 
FROM (
  SELECT MAX(price)
  FROM products
) AS p;

Q. Find the average number of orders for all users: 
-- There is more than one way to solve this - we are going to solve it using a FROM subquery
=> 
SELECT AVG(order_count)
FROM (
  -- this sub query groups the data for every unique user and from there we are taking total rows for each user. So basically it gives the number of order made by each user
  SELECT user_id, COUNT(*) AS order_count
  FROM orders
  GROUP BY user_id
) AS p;

