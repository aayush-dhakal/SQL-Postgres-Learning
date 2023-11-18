Q. Find the 4 products with the highest price and the 4 products with the highest price/weight ratio.
=>
(
 SELECT *
 FROM products
 ORDER BY price DESC
 LIMIT 4
)
UNION
(
  SELECT *
  FROM products
  ORDER BY price / weight DESC
  LIMIT 4
)
-- This will join the results of two sql queries. 
-- NOTE: that the duplicated rows will not be shown.
-- If you want to show all the rows even the duplicated one the use UNION ALL
=>
(
 SELECT *
 FROM products
 ORDER BY price DESC
 LIMIT 4
)
UNION ALL
(
  SELECT *
  FROM products
  ORDER BY price / weight DESC
  LIMIT 4
)
-- NOTE: We use parenthesis() for queries coz the sql might get confused on which query to apply ORDER BY and LIMIT. So we are making it clear for sql by parenthesis. For simple queries the brackets are not necessary.
-- NOTE: For UNION to work it must have similar data type columns to combine the data. Here we are selecting all columns with * so it works fine but:
=> 
SELECT name from products
UNION
SELECT price from products;
-- This will give an error as it cannot match the two columns data types as one is string and another is integer
-- But this works:
=> 
SELECT name from products
UNION
SELECT department from products;
-- Since both name and department have string datatype they are combined and result will contain first row with names and second row with department. So, it will create row for both name and department columns.

-- INTERSECT: finds common row
=>
(
 SELECT *
 FROM products
 ORDER BY price DESC
 LIMIT 4
)
INTERSECT
(
  SELECT *
  FROM products
  ORDER BY price / weight DESC
  LIMIT 4
)

-- EXCEPT: removes the matching rows and only gives the result from the first query. This also removes duplicates
=>
(
 SELECT *
 FROM products
 ORDER BY price DESC
 LIMIT 4
)
EXCEPT
(
  SELECT *
  FROM products
  ORDER BY price / weight DESC
  LIMIT 4
)