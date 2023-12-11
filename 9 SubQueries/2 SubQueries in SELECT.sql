=> 
SELECT name, price, 
(
  SELECT COUNT(*) from products
) 
FROM products
WHERE price > 867;
-- for select we can put the sub query which returns a single value

-- you can also use query which returns a single row and single column:
=> 
SELECT name, price, 
(
  SELECT price from products WHERE id = 3
) AS id_3_price
FROM products
WHERE price > 867;
-- you can also use AS for subquery