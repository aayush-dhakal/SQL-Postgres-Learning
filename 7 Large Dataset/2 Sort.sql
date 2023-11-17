-- By default sql sorts by ascending
=> SELECT * FROM products ORDER BY price;
=> SELECT * FROM products ORDER BY price ASC;

--  for descending sort
=> SELECT * FROM products ORDER BY price DESC;

-- For string it sorts alphabetically
=> SELECT * FROM products ORDER BY name; -- sort from a to z

-- In sorting if there are two or more records with same value then you can provide another column sort condition to sort between matching datas
=> SELECT * FROM products ORDER BY price, weight;
-- here if there are two datas with same price then it will sort among them by weight both in ascending order
-- If you want to sort price in ascending and then weight by descending for matching datas then:
=> SELECT * FROM products ORDER BY price, weight DESC;
-- If both by descending then:
=> SELECT * FROM products ORDER BY price DESC, weight DESC;
-- If price by descending and weight by ascending then:
=> SELECT * FROM products ORDER BY price DESC, weight;
