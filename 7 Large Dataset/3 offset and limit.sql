-- Offest is used to skip the datas in result set
=> SELECT * FROM users OFFSET 3;
-- means skip the first 3 results and show the other remaining datas

-- Limit is used to restrict the number of results
=> SELECT * FROM users LIMIT 5;
-- Will show the first 5 numbers only
-- Note it there are few results than the LIMIT constraint then it will not throw any kind of error

=> SELECT * FROM products 
ORDER BY price DESC 
LIMIT 5 OFFSET 1;