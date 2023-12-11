=>
SELECT first_name
FROM users
JOIN (
  SELECT user_id
  FROM orders WHERE product_id = 3
) AS o
ON o.user_id = users.id;
-- Join should return the data which can then be used with ON
-- This was just an example as this query can also be written as:
=>
SELECT first_name
FROM users
JOIN orders
ON orders.user_id = users.id
WHERE orders.product_id = 3;

