-- if your sub query returns a single value then you don't need from
=>
SELECT (
  SELECT MAX(price) FROM products;
)

-- but we cann't do this as this particualr sub query returns multiple value
=>
SELECT (
  SELECT price FROM products;
)

Q. Find the ratio of maximum price item to the average price item.
=>
SELECT (
  SELECT MAX(price) FROM products;
) / (
  SELECT AVG(price) FROM products;
)

Q. Find the maximum and minimum price item.
=>
SELECT (
  SELECT MAX(price) FROM products;
) , (
  SELECT MIN(price) FROM products;
)
