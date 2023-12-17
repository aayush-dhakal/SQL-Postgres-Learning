-- correlated query basically refers to accessing outer row from some inner sub query
Q. Show the name, department, and price of the most expensive product in each department.
=> -- think of this as two nested for loops
SELECT name, department, price
FROM products AS p1 -- first we assign variable to outer loop for products
-- here we will only keep the outer row if its price matches to the max price of a particular department
WHERE p1.price = (
-- selecting max price of each similar department
  SELECT MAX(price)
  FROM products AS p2 -- second variable for inner nested loop
  WHERE p2.department = p1.department -- this ensures we are only calculating max price for the same particular department
)
-- Note: whole p2 row will be evaluated for each p1 row

-- you can achieve something similar with a combination of the ROW_NUMBER() window function and a common table expression (CTE) in SQL
=>
WITH RankedProducts AS (
  SELECT
    name,
    department,
    price,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY price DESC) AS rank
  FROM products
)
SELECT
  name,
  department,
  price
FROM RankedProducts
WHERE rank = 1;
-- RankedProducts is not a new table. It's a Common Table Expression (CTE), which is a temporary result set that you can reference within the context of a SELECT, INSERT, UPDATE, or DELETE statement. In this case, the RankedProducts CTE is used to calculate the row numbers for each product within its department based on the descending order of prices.
-- The CTE is then referenced in the subsequent SELECT statement to filter out only the rows where the rank is 1, indicating the most expensive product in each department. The ROW_NUMBER() function is a window function that assigns a unique rank to each row within a partition, which is defined by the PARTITION BY clause. In this query, the partition is based on the department column.
-- So, to clarify, RankedProducts is not a permanent table in your database; it's a temporary result set that exists only for the duration of the query execution.

Q. Without using a join or a group by, print the number of orders for each product.
=>
SELECT name, (
  -- for each row of p1 we will evalaute every row of o1
  SELECT COUNT(*)
  FROM orders AS o1
  WHERE o1.product_id = p1.id -- as FROM clause is first executes so we can access p1 before its declaration
)
FROM products AS p1;
