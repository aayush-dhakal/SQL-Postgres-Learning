Q. List the name and price of all products that are more expensive than all products in the 'Toys' department.
-- we first have to find the product having max price for Toys department. Then we will take that max price and have it be used as a condition for finding products that are more expensive than it.
=> 
SELECT name, price
FROM products
WHERE price >
(
  SELECT MAX(price) FROM products WHERE department = 'Toys'
);
-- sql will first execute the second query inside () brackets
