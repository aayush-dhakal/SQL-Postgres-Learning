-- IN
Q. Show the id of orders that involve a product with a price/weight ratio greater than 50.
=>
SELECT id
FROM orders
WHERE product_id IN (
  SELECT id FROM products WHERE price / weight > 50
);

-- greater than >
Q. Show the name and price of all products with a price greater than the average product price:
=>
SELECT name, price
FROM products
WHERE price > (
  SELECT AVG(price) FROM products
);

-- NOT IN
Q. Show the name, price and department of all products that are not in the same department as products with a price less than 100.
=>
SELECT name, department, price
FROM products
WHERE department NOT IN (
  SELECT department FROM products WHERE price < 100
);

-- > ALL
Q. Show the name, department and price of products that are more expensive than all products in the 'Industrial' department.
=>
SELECT name, department, price
FROM products
WHERE price > ALL (
  SELECT price FROM products WHERE department = 'Industrial' -- this sub query returns a single column with as many rows which is accepted type for > ALL
);
-- you can also use this query
=>
SELECT name, department, price
FROM products
WHERE price > (
  SELECT MAX(price) FROM products WHERE department = 'Industrial'
);

-- SOME or ANY (but are same)
Q. Show the name of products that are more expensive than at least one product in the 'Industrial' department.
=>
SELECT name, price, department
FROM products
WHERE price > SOME (
  SELECT price FROM products WHERE department = 'Industrial' -- this sub query returns a single column with as many rows which is accepted type for > SOME
);
